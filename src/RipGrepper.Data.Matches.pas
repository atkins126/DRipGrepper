unit RipGrepper.Data.Matches;

interface

uses
	System.Generics.Collections,
	System.Classes,
	RipGrepper.Common.Types,
	RipGrepper.Common.Interfaces,
	System.RegularExpressions,
	Vcl.ComCtrls,
	ArrayHelper,
	System.Generics.Defaults,
	RipGrepper.Common.Sorter,
	RipGrepper.Data.HistoryItemObject, RipGrepper.Common.ParsedObject;

type

	TRipGrepperData = class
		MatchFiles : TStringList;
		SortedBy : TSortTypeDirectionList;

		private
			FErrorCount : Integer;
			FHistObject : THistoryItemObject;
			function GetTotalMatchCount : Integer;
			function GetFileCount : Integer;
			function GetComparer(const _sbt : TSortByType): IComparer<IParsedObjectRow>;
			function GetErrorCount : Integer;
			function GetHistObject : THistoryItemObject;
			function GetListItemCount : Integer;
			procedure SetHistObject(const Value : THistoryItemObject);
			procedure SortMultiColumns(const _st : TSortDirectionType);

		public
			constructor Create;
			destructor Destroy; override;
			procedure Add(_item: IParsedObjectRow);
			procedure ClearMatchFiles;
			procedure DataToGrid(const _index : Integer; _lv : TListView; _item : TListItem);
			procedure SortBy(const _sbt : TSortByType; const _st : TSortDirectionType);
			property ErrorCount : Integer read GetErrorCount;
			property TotalMatchCount : Integer read GetTotalMatchCount;
			property FileCount : Integer read GetFileCount;
			property HistObject : THistoryItemObject read GetHistObject write SetHistObject;
			property ListItemCount : Integer read GetListItemCount;
	end;

implementation

uses
	System.SysUtils,
	System.IOUtils,
	Vcl.Dialogs,
	RipGrepper.Tools.DebugTools,
	RipGrepper.Helper.Types;

constructor TRipGrepperData.Create;
begin
	inherited;
	MatchFiles := TStringList.Create(TDuplicates.dupIgnore, True, True);
	FErrorCount := 0;
end;

destructor TRipGrepperData.Destroy;
begin
	MatchFiles.Free;
	inherited;
end;

procedure TRipGrepperData.Add(_item: IParsedObjectRow);
begin
	HistObject.Matches.Items.Add(_item);
	if (_item.IsError) then begin
		Inc(FErrorCount);
	end else begin
		MatchFiles.Add(_item.Columns[0].Text);
	end;
end;

procedure TRipGrepperData.ClearMatchFiles;
begin
	MatchFiles.Clear;
	FErrorCount := 0;
end;

procedure TRipGrepperData.DataToGrid(const _index : Integer; _lv : TListView; _item : TListItem);
var
	fn : string;
begin
	// (_index, _lv, _item);
	fn := HistObject.Matches.Items[_index].Columns[0].Text;
	if HistObject.Matches.Items[_index].IsError then begin
		_item.Caption := ' ' + fn;
		_item.ImageIndex := LV_IMAGE_IDX_ERROR;
	end else begin
		_item.Caption := fn;
		_item.ImageIndex := LV_IMAGE_IDX_OK;
	end;
	_item.SubItems.Add(HistObject.Matches.Items[_index].Columns[1].Text);
	_item.SubItems.Add(HistObject.Matches.Items[_index].Columns[2].Text);
	_item.SubItems.Add(HistObject.Matches.Items[_index].Columns[3].Text);
end;

function TRipGrepperData.GetTotalMatchCount : Integer;
begin
	Result := HistObject.Matches.Items.Count;
end;

function TRipGrepperData.GetFileCount : Integer;
begin
	Result := MatchFiles.Count;
end;

procedure TRipGrepperData.SortBy(const _sbt : TSortByType; const _st : TSortDirectionType);
begin
	if _st <> stUnsorted then begin
		SortedBy.MoveToStart(_sbt, _st);
		SortMultiColumns(_st);
	end else begin
		SortedBy.Delete(_sbt);
		SortMultiColumns(_st);
	end;
end;

function TRipGrepperData.GetComparer(const _sbt : TSortByType) : IComparer<IParsedObjectRow>;
begin
	case _sbt of
		sbtFile, sbtRow, sbtCol, sbtText : begin
			Result := TComparer<IParsedObjectRow>.Construct(
				function(const Left, Right : IParsedObjectRow) : Integer
				begin
					var idx := Integer(_sbt);
					Result := TComparer<string>.Default.Compare(Left.Columns[idx].Text, Right.Columns[idx].Text);
				end);
		end;
		sbtLineNr : begin
			Result := TComparer<IParsedObjectRow>.Construct(
				function(const Left, Right : IParsedObjectRow) : Integer
				begin
					Result := TComparer<integer>.Default.Compare(Left.RowNr, Right.RowNr);
				end);
		end;
	end;
end;

function TRipGrepperData.GetErrorCount : Integer;
begin
	Result := FErrorCount;
end;

function TRipGrepperData.GetHistObject : THistoryItemObject;
begin
	Result := FHistObject;
end;

function TRipGrepperData.GetListItemCount : Integer;
begin
	Result := TotalMatchCount + ErrorCount;
end;

procedure TRipGrepperData.SetHistObject(const Value : THistoryItemObject);
begin
	FHistObject := Value;
end;

procedure TRipGrepperData.SortMultiColumns(const _st : TSortDirectionType);
var
	criterion : TSortCriterion<IParsedObjectRow>;
	lineComparer : TSortCriteriaComparer<IParsedObjectRow>;
begin
	lineComparer := TSortCriteriaComparer<IParsedObjectRow>.Create;
	try
		if (SortedBy.Items.Count > 0) then begin
			for var i := 0 to SortedBy.Items.Count - 1 do begin
				criterion := TSortCriterion<IParsedObjectRow>.Create;
				criterion.Ascending := _st = stAscending;
				criterion.Comparer := GetComparer(SortedBy.Items[i].Column);
				lineComparer.AddCriterion(criterion);
			end;
		end else begin
			criterion := TSortCriterion<IParsedObjectRow>.Create;
			criterion.Ascending := _st = stAscending;
			criterion.Comparer := GetComparer(sbtLineNr);
			lineComparer.AddCriterion(criterion);
		end;
		HistObject.Matches.Items.Sort(lineComparer);
	finally
		lineComparer.Free;
	end;
end;

end.