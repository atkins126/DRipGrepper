unit u_DelphiVersions;

interface

uses
	Windows,
	SysUtils,
	Classes,
	u_dzTranslator,
	u_dzFileUtils,
	u_dzQuickSort,
	ArrayEx;

type
	TDelphiVersion = class
		private
			FName : string;
			FRegPath : string;
			FBds : string;
			FBplSuffix : string;

		public
			property name : string read FName;
			property BDS : string read FBds;
			property RegPath : string read FRegPath;
			property BplSuffix : string read FBplSuffix;
			function GetBplDir : string; virtual; abstract;
			function GetRootDir : string;
			procedure GetKnownPackages(_List : TStringList);
			procedure AddKnownPackage(const _Package, _Description : string);
			procedure RemoveKnownPackage(const _Package : string);
			function IsKnownPackage(const _Package : string; out _Description : string) : Boolean;
			function TryApplyBplSuffix(var _Package : TFilename) : Boolean;
			procedure CheckInstalled;
	end;

type
	_LIST_ANCESTOR_ = TObject;
	_ITEM_TYPE_ = TDelphiVersion;
	_KEY_TYPE_ = string;

type
	{ : List for storing TDelphiVersion items sorted by string }
	TDelphiVersions = class
		strict private
		private
			Items : TArrayEx<TDelphiVersion>;

		protected
			// {: return the key of an item for comparison }
			// function KeyOf(const _Item: TDelphiVersion): string;
			// {: compare the keys of two items, must return a value
			// < 0 if Key1 < Key2, = 0 if Key1 = Key2 and > 0 if Key1 > Key2 }
			// function Compare(const _Key1, _Key2: string): Integer;
		public
			constructor Create;
			function Find(const _sVersion: string; var _dv: TDelphiVersion): Boolean;
			function FindSuffix(const _Suffix : string; out _Item : TDelphiVersion) : Boolean;
	end;

implementation

uses
	Registry,
	StrUtils,
	u_dzClassUtils,
	System.IOUtils
	// , u_dzShellApiUtils
		;

type
	TDelphiBorland = class(TDelphiVersion)
		private
		public
			constructor Create(const _Name : string);
			function GetBplDir : string; override;
	end;

	{ TDelphiBorland }

constructor TDelphiBorland.Create(const _Name : string);
begin
	inherited Create;
	FName := _Name;
	FBds := _Name + '.0';
	FRegPath := 'Borland\Delphi\' + FBds;
	FBplSuffix := _Name + '0';
end;

function TDelphiBorland.GetBplDir : string;
const
	BPL_OUTPUT = '$(DELPHI)\Projects\Bpl';
var
	Delphi : string;
	BplOutput : string;
	Path : string;
begin
	// c:\program files\borland\delphi6\projects\bpl
	// c:\program files\borland\delphi7\projects\bpl
	Path := 'SOFTWARE\' + RegPath + '\Environment Variables';
	if TRegistry_KeyExists(Path, HKEY_CURRENT_USER) then
		if TRegistry_TryReadString(Path, 'DELPHI', Delphi, HKEY_CURRENT_USER) then
			raise Exception.CreateFmt(_('Environment variable DELPHI has been changed to "%s", this is not supported.'), [Delphi]);

	Path := 'SOFTWARE\' + RegPath + '\Library';
	BplOutput := TRegistry_ReadString(Path, 'Package DPL Output', BPL_OUTPUT, HKEY_CURRENT_USER);
	if not SameText(BplOutput, BPL_OUTPUT) then
		raise Exception.CreateFmt(_('Package output directory has been changed to "%s". This is not supported.'), [BplOutput]);

	Result := itpd(GetRootDir) + 'Projects\Bpl';
end;

type
	TBdsBorland = class(TDelphiVersion)
		private
		public
			constructor Create(const _Name : string; const _BDS : string; const _BplSuffix : string);
			function GetBplDir : string; override;
	end;

	{ TBdsBorland }

constructor TBdsBorland.Create(const _Name : string; const _BDS : string; const _BplSuffix : string);
begin
	inherited Create;
	FName := _Name;
	FBds := _BDS;
	FRegPath := 'Borland\BDS\' + FBds;
	FBplSuffix := _BplSuffix;
end;

function TBdsBorland.GetBplDir : string;
const
	BPL_OUTPUT = '$(BDSPROJECTSDIR)\Bpl';
var
	mdd : string;
	BdsProjectsDir : string;
	BplOutput : string;
	Path : string;
begin
	// Delphi 2005 and Delphi 2006 store their BPLs in the same directory:
	// C:\Users\<username>\Documents\Borland Studio Projects\Bpl
	// They also store the .dcp files there. How could this ever work? .dcp files do not have a version suffix!
	Path := 'SOFTWARE\' + RegPath + '\Environment Variables';
	if TRegistry_KeyExists(Path, HKEY_CURRENT_USER) then
		if TRegistry_TryReadString(Path, 'BDSPROJECTSDIR', BdsProjectsDir, HKEY_CURRENT_USER) then
			raise Exception.CreateFmt(_('Environment variable BDSPROJECTSDIR has been changed to "%s", this is not supported.'),
				[BdsProjectsDir]);

	Path := 'SOFTWARE\' + RegPath + '\Library';
	BplOutput := TRegistry_ReadString(Path, 'Package DPL Output', BPL_OUTPUT, HKEY_CURRENT_USER);
	if not SameText(BplOutput, BPL_OUTPUT) then
		raise Exception.CreateFmt(_('Package output directory has been changed to "%s". This is not supported.'), [BplOutput]);

	mdd := TPath.GetDocumentsPath;
	Result := TPath.Combine(mdd, 'Borland Studio Projects\Bpl');
end;

type
	TDelphi2007 = class(TDelphiVersion)
		private
		public
			constructor Create;
			function GetBplDir : string; override;
	end;

	{ TDelphi2007 }

constructor TDelphi2007.Create;
begin
	inherited Create;
	FName := '2007';
	FBds := '5.0';
	FRegPath := 'Borland\BDS\5.0';
	FBplSuffix := '110';
end;

function TDelphi2007.GetBplDir : string;
const
	BPL_OUTPUT = '$(BDSCOMMONDIR)\Bpl';
var
	cdd : string;
	BdsCommonDir : string;
	BplOutput : string;
	Path : string;
begin
	// C:\Users\Public\Documents\RAD Studio\5.0\Bpl

	Path := 'SOFTWARE\' + RegPath + '\Environment Variables';
	if TRegistry_KeyExists(Path, HKEY_CURRENT_USER) then
		if TRegistry_TryReadString(Path, 'BDSCOMMONDIR', BdsCommonDir, HKEY_CURRENT_USER) then
			raise Exception.CreateFmt(_('Environment variable BDSCOMMONDIR has been changed to "%s", this is not supported.'),
				[BdsCommonDir]);

	Path := 'SOFTWARE\' + RegPath + '\Library';
	BplOutput := TRegistry_ReadString(Path, 'Package DPL Output', BPL_OUTPUT, HKEY_CURRENT_USER);
	if not SameText(BplOutput, BPL_OUTPUT) then
		raise Exception.CreateFmt(_('Package output directory has been changed to "%s". This is not supported.'), [BplOutput]);

	cdd := TPath.GetSharedDocumentsPath;
	Result := TPath.Combine(cdd, 'RAD Studio\' + FBds + '\Bpl');
end;

type
	TDelphiCodegear = class(TDelphiVersion)
		public
			constructor Create(const _Name : string; const _BDS : string; const _BplSuffix : string);
			function GetBplDir : string; override;
	end;

	{ TDelphiCodegear }

constructor TDelphiCodegear.Create(const _Name : string; const _BDS : string; const _BplSuffix : string);
begin
	inherited Create;
	FName := _Name;
	FBds := _BDS;
	FRegPath := 'CodeGear\BDS\' + FBds;
	FBplSuffix := _BplSuffix;
end;

function TDelphiCodegear.GetBplDir : string;
var
	cdd : string;
begin
	// C:\Users\Public\Documents\RAD Studio\6.0\Bpl
	cdd := TPath.GetSharedDocumentsPath;
	Result := TPath.Combine(cdd, 'RAD Studio\' + FBds + '\Bpl');
end;

type
	TDelphiXETo5 = class(TDelphiVersion)
		public
			constructor Create(const _Name : string; const _BDS : string; const _BplSuffix : string);
			function GetBplDir : string; override;
	end;

constructor TDelphiXETo5.Create(const _Name : string; const _BDS : string; const _BplSuffix : string);
begin
	inherited Create;
	FName := _Name;
	FBds := _BDS;
	FRegPath := 'Embarcadero\BDS\' + FBds;
	FBplSuffix := _BplSuffix;
end;

function TDelphiXETo5.GetBplDir : string;
var
	cdd : string;
begin
	// C:\Users\Public\Documents\RAD Studio\9.0\Bpl
	cdd := TPath.GetSharedDocumentsPath;
	Result := TPath.Combine(cdd, 'RAD Studio\' + FBds + '\Bpl');
end;

type
	TDelphiXE6Up = class(TDelphiVersion)
		public
			constructor Create(const _Name : string; const _BDS : string; const _BplSuffix : string);
			function GetBplDir : string; override;
	end;

constructor TDelphiXE6Up.Create(const _Name : string; const _BDS : string; const _BplSuffix : string);
begin
	inherited Create;
	FName := _Name;
	FBds := _BDS;
	FRegPath := 'Embarcadero\BDS\' + FBds;
	FBplSuffix := _BplSuffix;
end;

function TDelphiXE6Up.GetBplDir : string;
var
	cdd : string;
begin
	// C:\Users\Public\Documents\RAD Studio\9.0\Bpl
	cdd := TPath.GetSharedDocumentsPath;
	Result := TPath.Combine(cdd, 'RAD Studio\' + FBds + '\Bpl');
end;

{ TDelphiVersions }

constructor TDelphiVersions.Create;
begin
	inherited;
	Items.Add(TDelphiBorland.Create('6'));
	Items.Add(TDelphiBorland.Create('7'));
	Items.Add(TBdsBorland.Create('2005', '3.0', '90'));
	Items.Add(TBdsBorland.Create('2006', '4.0', '100'));
	Items.Add(TDelphi2007.Create);
	Items.Add(TDelphiCodegear.Create('2009', '6.0', '120'));
	Items.Add(TDelphiCodegear.Create('2010', '7.0', '140'));
	Items.Add(TDelphiXETo5.Create('XE', '8.0', '150'));
	Items.Add(TDelphiXETo5.Create('XE2', '9.0', '160'));
	Items.Add(TDelphiXETo5.Create('XE3', '10.0', '170'));
	Items.Add(TDelphiXETo5.Create('XE4', '11.0', '180'));
	Items.Add(TDelphiXETo5.Create('XE5', '12.0', '190'));
	Items.Add(TDelphiXE6Up.Create('XE6', '14.0', '200'));
	Items.Add(TDelphiXE6Up.Create('XE7', '15.0', '210'));
	Items.Add(TDelphiXE6Up.Create('XE8', '16.0', '220'));
	Items.Add(TDelphiXE6Up.Create('10.0', '17.0', '230'));
	Items.Add(TDelphiXE6Up.Create('10.1', '18.0', '240'));
	Items.Add(TDelphiXE6Up.Create('10.2', '19.0', '250'));
	Items.Add(TDelphiXE6Up.Create('10.3', '20.0', '260'));
	Items.Add(TDelphiXE6Up.Create('10.4', '21.0', '270'));
	Items.Add(TDelphiXE6Up.Create('11', '22.0', '280'));
	Items.Add(TDelphiXE6Up.Create('12', '23.0', '290'));
end;

function TDelphiVersions.Find(const _sVersion: string; var _dv: TDelphiVersion): Boolean;
begin
	Result := True;
	// TODO -cMM: TDelphiVersions.Find default body inserted
end;

function TDelphiVersions.FindSuffix(const _Suffix : string; out _Item : TDelphiVersion) : Boolean;
var
	i : Integer;
begin
	Result := True;
	for i := 0 to Items.Count - 1 do begin
		if SameText(Items[i].BplSuffix, _Suffix) then begin
			_Item := Items[i];
			Exit;
		end;
	end;
	Result := False;
end;

// function TDelphiVersions.KeyOf(const _Item: TDelphiVersion): string;
// begin
// Result := _Item.Name;
// end;

// function TDelphiVersions.Compare(const _Key1, _Key2: string): Integer;
// begin
// Result := CompareText(_Key1, _Key2);
// end;

{ TDelphiVersion }

// constructor TDelphiVersion.Create(const _Name: string; const _Bds: string; const _RegPath: string;
// const _BplDir: string);
// begin
// inherited Create;
// FName := _Name;
// FBds := _Bds;
// FRegPath := _RegPath;
// FBplDir := _BplDir;
// end;

function TDelphiVersion.TryApplyBplSuffix(var _Package : TFilename) : Boolean;
var
	fno : string;
begin
	fno := _Package.FilenameOnly;
	if EndsText(BplSuffix, fno) then begin
		Result := False;
	end else begin
		_Package.ReplaceFilenameOnly(fno + BplSuffix);
		Result := True;
	end;
end;

procedure TDelphiVersion.CheckInstalled;
var
	Path : string;
begin
	Path := 'SOFTWARE\' + RegPath;
	if not TRegistry_KeyExists(Path, HKEY_CURRENT_USER) then
		raise Exception.CreateFmt('HKCU\%s does not exist in registry. Is Delphi %s installed on this computer?', [Path, FName]);
end;

procedure TDelphiVersion.GetKnownPackages(_List : TStringList);
var
	RegKey : string;
begin
	RegKey := 'Software\' + RegPath + '\Known Packages';
	if not TRegistry_TryReadStringValues(RegKey, _List, HKEY_CURRENT_USER) then
		raise Exception.CreateFmt(_('Could not read "HKEY_CURRENT_USER\%s\Known Packages" from registry.'), [RegKey]);
end;

procedure TDelphiVersion.AddKnownPackage(const _Package : string; const _Description : string);
var
	RegKey : string;
begin
	RegKey := 'Software\' + RegPath + '\Known Packages';
	TRegistry_WriteString(RegKey, _Package, _Description, HKEY_CURRENT_USER);
end;

function TDelphiVersion.IsKnownPackage(const _Package : string; out _Description : string) : Boolean;
var
	RegKey : string;
begin
	RegKey := 'Software\' + RegPath + '\Known Packages';
	Result := TRegistry_TryReadString(RegKey, _Package, _Description, HKEY_CURRENT_USER);
end;

procedure TDelphiVersion.RemoveKnownPackage(const _Package : string);
var
	RegKey : string;
begin
	RegKey := 'Software\' + RegPath + '\Known Packages';
	TRegistry_DeleteValue(RegKey, _Package, HKEY_CURRENT_USER);
end;

function TDelphiVersion.GetRootDir : string;
var
	RegKey : string;
begin
	RegKey := 'Software\' + RegPath;
	if not TRegistry_TryReadString(RegKey, 'RootDir', Result) then
		raise Exception.CreateFmt(_('Could not read "HKEY_CURRENT_USER\%s\RootDir" from registry.'), [RegKey]);
end;

end.
