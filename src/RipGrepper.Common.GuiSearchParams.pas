unit RipGrepper.Common.GuiSearchParams;

interface

uses
	RipGrepper.Common.Constants,
	RipGrepper.Helper.Types,
	ArrayEx,
	System.Classes,
	RipGrepper.Common.Settings.Persistable,
	System.IniFiles;

type
	TSearchOptionSet = set of EGuiOption;

	TGuiSearchTextParams = class(TPersistableSettings)
		private
			FSearchText : string;
			FEscapedSearchText : string;
			FWordBoundedSearchText : string;
			FRgOptions : string;
			FIsRgExeOptionSet : Boolean;
			FRgAdditionalOptions : string;

			function GetEscapedSearchText : string;
			function GetSearchText : string;
			function GetWordBoundedSearchText : string;
			procedure LoadSearchOptionsFromDict(const _bDefault : Boolean);
			function ResetRgOption(const _sParamRegex : string; const _bReset : Boolean = False) : string;
			procedure SetRgOptions(const Value : string);
			class procedure ValidateOptions(listOptions : TStringList); static;

		protected
			procedure Init; override;

		public
			SearchOptions : TSearchOptionSet;

			constructor Create(const _ini : TMemIniFile; const _iniSection : string); overload;
			constructor Create(const _sText : string; const _bMC, _bMW, _bUR : Boolean); overload;
			constructor Create(const _iniSection : string); overload;
			destructor Destroy; override;
			procedure Clear;
			procedure Copy(const _other : TGuiSearchTextParams); reintroduce;

			class function AddRgExeOptions(const _sOptions, _sParamRegex : string) : string; static;
			class function RemoveRgExeOptions(const _sOptions, _sParamRegex : string) : string; static;
			class function AddRgExeOptionWithValue(const _sOptions, _sParamRegex, _sValue : string; const _bUnique : Boolean = False)
				: string; static;
			procedure CopyDefaultsToValues; override;
			procedure CopyValuesToDefaults; override;
			function GetNext(const _newOption : EGuiOption) : TGuiSearchTextParams;
			function IsSet(_options : TArray<EGuiOption>) : Boolean;

			class function GetAsSearchOptionSet(const _bMC, _bMW, _bUR : Boolean) : TSearchOptionSet; static;
			procedure ResetOption(const _searchOption : EGuiOption);
			function SearchOptionsAsBitField : TBitField;
			procedure SetOption(const _searchOption : EGuiOption);
			procedure SetOrReset(const _newOption : EGuiOption); overload;
			function SetRgOption(const _sParamRegex : string; const _bReset : Boolean = False) : string;
			function SetRgOptionWithValue(const _sParamRegex, _sValue : string; const _bUnique : Boolean = False) : string;
			procedure StoreAsDefaultsToDict; override;
			function GetAsString(const _bGuiOptionsOnly : Boolean = False) : string;
			procedure LoadDefaultsFromDict; override;
			procedure LoadFromDict(); override;
			function ToLogString : string; override;

			property EscapedSearchText : string read GetEscapedSearchText;
			property IsRgExeOptionSet : Boolean read FIsRgExeOptionSet write FIsRgExeOptionSet;
			property RgAdditionalOptions : string read FRgAdditionalOptions write FRgAdditionalOptions;
			property RgOptions : string read FRgOptions write SetRgOptions;
			property SearchText : string read GetSearchText write FSearchText;
			property WordBoundedSearchText : string read GetWordBoundedSearchText;
	end;

implementation

uses
	System.SysUtils,
	System.RegularExpressions,
	RipGrepper.CommandLine.OptionHelper,
	RipGrepper.Tools.DebugUtils;

class function TGuiSearchTextParams.AddRgExeOptions(const _sOptions, _sParamRegex : string) : string;
var
	listOptions : TStringList;
begin
	listOptions := TStringList.Create(dupIgnore, False, True);
	listOptions.Delimiter := ' ';
	try
		listOptions.AddStrings(_sOptions.Split([' '], TStringSplitOptions.ExcludeEmpty));
		TOptionsHelper.AddParamToList(listOptions, _sParamRegex);
		ValidateOptions(listOptions);
		Result := listOptions.DelimitedText;
	finally
		listOptions.Free;
	end;
end;

class function TGuiSearchTextParams.RemoveRgExeOptions(const _sOptions, _sParamRegex : string) : string;
var
	listOptions : TStringList;
begin
	listOptions := TStringList.Create(dupIgnore, False, True);
	listOptions.Delimiter := ' ';
	try
		listOptions.AddStrings(_sOptions.Split([' '], TStringSplitOptions.ExcludeEmpty));
		TOptionsHelper.RemoveParamFromList(listOptions, _sParamRegex);
		Result := listOptions.DelimitedText;
	finally
		listOptions.Free;
	end;
end;

class function TGuiSearchTextParams.AddRgExeOptionWithValue(const _sOptions, _sParamRegex, _sValue : string;
	const _bUnique : Boolean = False) : string;
var
	listOptions : TStringList;
begin
	listOptions := TStringList.Create(dupIgnore, False, True);
	listOptions.Delimiter := ' ';
	try
		listOptions.AddStrings(_sOptions.Split([' '], TStringSplitOptions.ExcludeEmpty));
		TOptionsHelper.AddParamToList(listOptions, _sParamRegex, _sValue, _bUnique);
		ValidateOptions(listOptions);
		Result := listOptions.DelimitedText;
	finally
		listOptions.Free;
	end;
end;

// for UnitTests...
constructor TGuiSearchTextParams.Create(const _sText : string; const _bMC, _bMW, _bUR : Boolean);
begin
	Create();
	SearchText := _sText;
	SearchOptions := GetAsSearchOptionSet(_bMC, _bMW, _bUR);
end;

function TGuiSearchTextParams.GetNext(const _newOption : EGuiOption) : TGuiSearchTextParams;
begin
	Result := self;
	case _newOption of
		EGuiOption.soMatchCase : begin
			Result.SetOrReset(EGuiOption.soMatchCase);
		end;

		EGuiOption.soMatchWord : begin
			Result.SetOrReset(EGuiOption.soMatchWord);
		end;

		EGuiOption.soUseRegex : begin
			Result.SetOrReset(EGuiOption.soUseRegex);
		end;
	end;
end;

function TGuiSearchTextParams.IsSet(_options : TArray<EGuiOption>) : Boolean;
begin
	Result := True;
	for var o in _options do begin
		if not(o in SearchOptions) then begin
			Result := False;
			break
		end;
	end;
end;

procedure TGuiSearchTextParams.Clear;
begin
	SearchText := '';
	FEscapedSearchText := '';
	FIsRgExeOptionSet := False;
	SearchOptions := [EGuiOption.soNotSet];
end;

function TGuiSearchTextParams.GetEscapedSearchText : string;
begin
	Result := TRegEx.Escape(FSearchText);
end;

class function TGuiSearchTextParams.GetAsSearchOptionSet(const _bMC, _bMW, _bUR : Boolean) : TSearchOptionSet;
begin
	Result := [eGuiOption.soNotSet];
	if _bMC then
		Include(Result, EGuiOption.soMatchCase);
	if _bMW then
		Include(Result, EGuiOption.soMatchWord);
	if _bUR then
		Include(Result, EGuiOption.soUseRegex);

	if Result <> [EGuiOption.soNotSet] then begin
		Exclude(Result, EGuiOption.soNotSet);
	end;
end;

function TGuiSearchTextParams.GetSearchText : string;
begin
	Result := FSearchText;

	// if IsSet([EGuiOption.soUseRegex]) then begin
	// Result := EscapedSearchText;
	// end;

	if IsSet([EGuiOption.soMatchWord]) then begin
		Result := WordBoundedSearchText;
	end;
end;

function TGuiSearchTextParams.GetWordBoundedSearchText : string;
begin
	FWordBoundedSearchText := FSearchText;
	TOptionsHelper.PutBetweenWordBoundaries(FWordBoundedSearchText);
	Result := FWordBoundedSearchText;
end;

procedure TGuiSearchTextParams.ResetOption(const _searchOption : EGuiOption);
var
	searchOption : EGuiOption;
begin
	searchOption := _searchOption;
	Exclude(SearchOptions, searchOption);

	if (SearchOptions = []) or
	{ } (not(EGuiOption.soUseRegex in SearchOptions)) and
	{ } (not(EGuiOption.soMatchWord in SearchOptions)) then begin
		SetRgOption(RG_PARAM_REGEX_FIXED_STRINGS);
	end;

	case searchOption of
		EGuiOption.soNotSet :
		{ };
		EGuiOption.soMatchCase : begin
			ResetRgOption(RG_PARAM_REGEX_CASE_SENSITIVE);
			SetRgOption(RG_PARAM_REGEX_IGNORE_CASE);
		end;
		EGuiOption.soMatchWord, EGuiOption.soUseRegex :
		if not( //
			(SearchOptions = [EGuiOption.soNotSet]) or //
			(SearchOptions = [EGuiOption.soMatchCase]) or //
			(SearchOptions = [])) then begin
			SetRgOption(RG_PARAM_REGEX_FIXED_STRINGS, True);
		end;
	end;

end;

function TGuiSearchTextParams.SearchOptionsAsBitField : TBitField;
begin
	for var i in GUI_SEARCH_PARAMS do begin
		if i in SearchOptions then begin
			Result.SetBit(Integer(i));
		end;
	end;
end;

function TGuiSearchTextParams.SetRgOption(const _sParamRegex : string; const _bReset : Boolean = False) : string;
begin
	if _bReset then begin
		RgOptions := TGuiSearchTextParams.RemoveRgExeOptions(RgOptions, _sParamRegex);
	end else begin
		RgOptions := TGuiSearchTextParams.AddRgExeOptions(RgOptions, _sParamRegex);
	end;
end;

function TGuiSearchTextParams.ResetRgOption(const _sParamRegex : string; const _bReset : Boolean = False) : string;
begin
	if _bReset then begin
		RgOptions := TGuiSearchTextParams.AddRgExeOptions(RgOptions, _sParamRegex);
	end else begin
		RgOptions := TGuiSearchTextParams.RemoveRgExeOptions(RgOptions, _sParamRegex);
	end;
end;

procedure TGuiSearchTextParams.SetOption(const _searchOption : EGuiOption);
begin
	Include(SearchOptions, _searchOption);

	if _searchOption <> EGuiOption.soNotSet then begin
		Exclude(SearchOptions, EGuiOption.soNotSet);
	end;

	case _searchOption of
		EGuiOption.soNotSet : begin
			// ignore case by default
			ResetRgOption(RG_PARAM_REGEX_CASE_SENSITIVE);
			SetRgOption(RG_PARAM_REGEX_IGNORE_CASE);
			SetRgOption(RG_PARAM_REGEX_FIXED_STRINGS);
		end;
		EGuiOption.soMatchCase : begin
			ResetRgOption(RG_PARAM_REGEX_IGNORE_CASE);
			SetRgOption(RG_PARAM_REGEX_CASE_SENSITIVE);
		end;
		EGuiOption.soMatchWord :
		{ } ResetRgOption(RG_PARAM_REGEX_FIXED_STRINGS);
		EGuiOption.soUseRegex :
		{ } ResetRgOption(RG_PARAM_REGEX_FIXED_STRINGS);
	end;
end;

procedure TGuiSearchTextParams.SetOrReset(const _newOption : EGuiOption);
begin
	if IsSet([_newOption]) then begin
		ResetOption(_newOption);
	end else begin
		SetOption(_newOption);
	end;
end;

function TGuiSearchTextParams.SetRgOptionWithValue(const _sParamRegex, _sValue : string; const _bUnique : Boolean = False) : string;
begin
	RgOptions := TGuiSearchTextParams.AddRgExeOptionWithValue(RgOptions, _sParamRegex, _sValue, _bUnique);
end;

procedure TGuiSearchTextParams.StoreAsDefaultsToDict;
begin
	SettingsDict.StoreDefaultSetting('SearchParams', GetAsString(True));
	inherited StoreAsDefaultsToDict;
end;

function TGuiSearchTextParams.GetAsString(const _bGuiOptionsOnly : Boolean = False) : string;
var
	arr : TArrayEx<string>;
begin
	Result := '';
	for var i in GUI_SEARCH_PARAMS do begin
		if i in SearchOptions then begin
			case i of
				EGuiOption.soMatchCase :
				arr.Add('MatchCase');
				EGuiOption.soMatchWord :
				arr.Add('MatchWord');
				EGuiOption.soUseRegex :
				arr.Add('UseRegex');
			end;
		end;
	end;
	Result := '[' + string.Join(',', arr.Items) + ']';
	if not _bGuiOptionsOnly then begin
		Result := SearchText + ' ' + Result + ' IsRgOpSet:' + BoolToStr(IsRgExeOptionSet, True) + CRLF + RgOptions;
	end;
end;

class procedure TGuiSearchTextParams.ValidateOptions(listOptions : TStringList);
begin
	var
	arr := listOptions.IndexOfAllMatch(TOptionsHelper.GetBoundedParamRegex(RG_PARAM_END));
	Assert(Length(arr) <= 1, listOptions.DelimitedText + CRLF + 'Option list is corrupt. -- should appear only once!');
end;

constructor TGuiSearchTextParams.Create(const _ini : TMemIniFile; const _iniSection : string);
begin
	IniSectionName := _iniSection;
	inherited Create(_ini);
	TDebugUtils.DebugMessage('TGuiSearchTextParams.Create: ' + FIniFile.FileName + '[' + IniSectionName + ']');
	Create();
end;

constructor TGuiSearchTextParams.Create(const _iniSection : string);
begin
	IniSectionName := _iniSection;
	inherited Create();
	Clear();
end;

destructor TGuiSearchTextParams.Destroy;
begin
	inherited Destroy(); // ok
end;

procedure TGuiSearchTextParams.Copy(const _other : TGuiSearchTextParams);
begin
	SearchOptions := _other.SearchOptions;
	FSearchText := _other.SearchText;

	FEscapedSearchText := _other.EscapedSearchText;
	FWordBoundedSearchText := _other.WordBoundedSearchText;
	FRgOptions := _other.RgOptions;
	FIsRgExeOptionSet := _other.IsRgExeOptionSet;
	FRgAdditionalOptions := _other.RgAdditionalOptions;

	// inherited Copy(_other as TPersistableSettings);
end;

procedure TGuiSearchTextParams.CopyDefaultsToValues;
begin
	inherited CopyDefaultsToValues;
end;

procedure TGuiSearchTextParams.CopyValuesToDefaults;
begin
	inherited CopyValuesToDefaults;
end;

procedure TGuiSearchTextParams.Init;
begin
	SettingsDict.CreateDefaultRelevantSetting('SearchParams', varString, '');
end;

procedure TGuiSearchTextParams.LoadDefaultsFromDict;
begin
	var
	dbgMsg := TDebugMsgBeginEnd.New('TGuiSearchTextParams.LoadDefaultsFromDict');
	LoadSearchOptionsFromDict(True);
end;

procedure TGuiSearchTextParams.LoadFromDict();
begin
	var
	dbgMsg := TDebugMsgBeginEnd.New('TGuiSearchTextParams.LoadFromDict');
	LoadSearchOptionsFromDict(False);
end;

procedure TGuiSearchTextParams.LoadSearchOptionsFromDict(const _bDefault : Boolean);
var
	sParams : string;
begin
	var
	dbgMsg := TDebugMsgBeginEnd.New('TGuiSearchTextParams.LoadSearchOptionsFromDict Default=' + BoolToStr(_bDefault));
	sParams := SettingsDict.GetSetting('SearchParams', _bDefault);
	dbgMsg.Msg(RgOptions);
	SearchOptions := GetAsSearchOptionSet(
		{ } sParams.Contains('MatchCase'),
		{ } sParams.Contains('MatchWord'),
		{ } sParams.Contains('UseRegex'));
	if SearchOptions = [] then begin
		SetOption(EGuiOption.soNotSet);
	end else begin
		for var so in SearchOptions do begin
			SetOption(so);
		end;
	end;
	dbgMsg.Msg(RgOptions);
end;

procedure TGuiSearchTextParams.SetRgOptions(const Value : string);
begin
	FRgOptions := Value;
	{$IFDEF DEBUG}
	if Value.IndexOf('--ignore-case') > 0 then begin
		if Value.IndexOf('--case-sensitive') > 0 then begin
			Assert(True, '--case-sensitive and --ignore-case shouldn''t be there at the same time');
		end;
	end;
	{$ENDIF}
end;

function TGuiSearchTextParams.ToLogString : string;
begin
	Result := GetAsString();
end;

end.
