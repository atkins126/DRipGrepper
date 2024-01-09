unit RipGrepperMatches;

interface

uses
	System.Generics.Collections,
	System.Classes;

type
	TRipGrepMatch = record
		FileName : string;
		Row : integer;
		Col : integer;
		Text : string;
		GroupId : integer;

		private
			IsError : Boolean;
			procedure SetError(const _sLine : string);

		public
			procedure ParseLine(const _sLine : string);
			class operator Initialize(out Dest : TRipGrepMatch);
	end;

	TRipGrepperMatchCollection = TList<TRipGrepMatch>;

	TRipGrepperMatches = class
		Matches : TRipGrepperMatchCollection;
		MatchFiles : TStringList;

		private
			function GetCount : Integer;

		public
			constructor Create;
			destructor Destroy; override;
			procedure Clear;
			procedure SortByFiles(_bDescending : Boolean = False);
			property Count : Integer read GetCount;
	end;

implementation

uses
	System.SysUtils,
	System.Generics.Defaults;

procedure TRipGrepMatch.ParseLine(const _sLine : string);
var
	iPosMatch : integer;
	iPosRow : integer;
	iPosCol : integer;
begin
	iPosRow := Pos(':', _sLine, 3);
	if iPosRow <> 0 then begin
		// TDebugUtils.DebugMessage(_sLine);
		FileName := _sLine.Substring(0, iPosRow - 1);
		iPosCol := Pos(':', _sLine, iPosRow + 1);
		Row := StrToIntDef(_sLine.Substring(iPosRow, iPosCol - iPosRow - 1), 0);
		if Row = 0 then begin
			SetError(_sLine);
			exit;
		end;
		iPosMatch := Pos(':', _sLine, iPosCol + 1);
		Col := StrToIntDef(_sLine.Substring(iPosCol, iPosMatch - iPosCol - 1), 0);
		if Col = 0 then begin
			SetError(_sLine);
			exit;
		end;
		Text := _sLine.Substring(iPosMatch);
		IsError := False;
	end else begin
		SetError(_sLine);
	end;
end;

procedure TRipGrepMatch.SetError(const _sLine : string);
begin
	FileName := '';
	Text := _sLine;
	IsError := True;
end;

class operator TRipGrepMatch.Initialize(out Dest : TRipGrepMatch);
begin
	Dest.FileName := '';
	Dest.Row := -1;
	Dest.Col := -1;
	Dest.IsError := True;
	Dest.GroupId := -1;
end;

constructor TRipGrepperMatches.Create;
begin
	inherited;
	MatchFiles := TStringList.Create(TDuplicates.dupIgnore, True, True);
	Matches := TRipGrepperMatchCollection.Create;
end;

destructor TRipGrepperMatches.Destroy;
begin
	inherited;
	MatchFiles.Free;
	Matches.Free;
end;

procedure TRipGrepperMatches.Clear;
begin
	Matches.Clear;
	MatchFiles.Clear;
end;

function TRipGrepperMatches.GetCount : Integer;
begin
	Result := Matches.Count;
end;

procedure TRipGrepperMatches.SortByFiles(_bDescending : Boolean = False);
begin
	Matches.Sort(TComparer<TRipGrepMatch>.Construct(
		function(const Left, Right : TRipGrepMatch) : Integer
		begin
			if _bDescending then begin
				Result := -CompareStr(Left.FileName, Right.FileName);
			end else begin
				Result := CompareStr(Left.FileName, Right.FileName);
			end;
		end));
end;

end.
