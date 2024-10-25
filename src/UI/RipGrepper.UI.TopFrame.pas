unit RipGrepper.UI.TopFrame;

interface

uses
	Winapi.Windows,
	Winapi.Messages,
	System.Variants,
	System.Classes,
	Vcl.Graphics,
	Vcl.Controls,
	Vcl.Forms,
	Vcl.Dialogs,
	Vcl.ComCtrls,
	Vcl.ToolWin,
	System.ImageList,
	Vcl.ImgList,
	System.Actions,
	Vcl.ActnList,
	RipGrepper.UI.MiddleFrame,
	RipGrepper.UI.DpiScaler,
	Vcl.StdCtrls,
	Vcl.WinXCtrls,
	VirtualTrees,
	Vcl.ExtCtrls,
	Vcl.Menus,
	RipGrepper.Settings.RipGrepperSettings,
	RipGrepper.Common.Interfaces,
	RipGrepper.Common.SimpleTypes,
	RipGrepper.Tools.FileUtils;

type

	TRipGrepperTopFrame = class(TFrame)
		ImageListButtons : TImageList;
		ActionList : TActionList;
		ActionSearch : TAction;
		ActionConfig : TAction;
		ActionSwitchView : TAction;
		ActionShowRelativePath : TAction;
		ActionCmdLineCopy : TAction;
		ActionShowSearchForm : TAction;
		ActionShowFileIcons : TAction;
		ActionAlternateRowColors : TAction;
		ActionAbortSearch : TAction;
		ActionRefreshSearch : TAction;
		ActionIndentLine : TAction;
		tbarSearch : TToolBar;
		tbView : TToolButton;
		tbShowSearchForm : TToolButton;
		tbRefreshSearch : TToolButton;
		ToolButton3 : TToolButton;
		tbAbortSearch : TToolButton;
		ToolButton1 : TToolButton;
		tbCopyCmdLine : TToolButton;
		tbAlternateRowColors : TToolButton;
		tbShowFileIcon : TToolButton;
		tbShowRelativePath : TToolButton;
		tbIndentLines : TToolButton;
		ToolButton4 : TToolButton;
		tbOpenWith : TToolButton;
		ToolButton6 : TToolButton;
		tbConfigure : TToolButton;
		tbExpandCollapse : TToolButton;
		ActionExpandCollapse : TAction;
		ToolButton7 : TToolButton;
		tbarResult : TToolBar;
		tbarConfig : TToolBar;
		PopupMenu1 : TPopupMenu;
		AlignToolbar1 : TMenuItem;
		ToolButton2 : TToolButton;
		ToolButton5 : TToolButton;
		ToolButton8 : TToolButton;
		ActionSearchInResult : TAction;
		edtFilter : TButtonedEdit;
		edtReplace : TButtonedEdit;
		ToolButton9 : TToolButton;
		tbSaveReplacement : TToolButton;
		ActionSaveReplacement : TAction;
		ActionSaveAllReplacement : TAction;
		procedure ActionAbortSearchExecute(Sender : TObject);
		procedure ActionAbortSearchUpdate(Sender : TObject);
		procedure ActionAlignToolbarsExecute(Sender : TObject);
		procedure ActionSaveAllReplacementExecute(Sender : TObject);
		procedure ActionAlternateRowColorsExecute(Sender : TObject);
		procedure ActionAlternateRowColorsUpdate(Sender : TObject);
		procedure ActionCancelExecute(Sender : TObject);
		procedure ActionCmdLineCopyExecute(Sender : TObject);
		procedure ActionCmdLineCopyUpdate(Sender : TObject);
		procedure ActionConfigExecute(Sender : TObject);
		procedure ActionCopyFileNameExecute(Sender : TObject);
		procedure ActionCopyPathToClipboardExecute(Sender : TObject);
		procedure ActionExpandCollapseExecute(Sender : TObject);
		procedure ActionExpandCollapseUpdate(Sender : TObject);
		procedure ActionIndentLineExecute(Sender : TObject);
		procedure ActionIndentLineUpdate(Sender : TObject);
		procedure ActionOpenWithExecute(Sender : TObject);
		procedure ActionRefreshSearchExecute(Sender : TObject);
		procedure ActionRefreshSearchUpdate(Sender : TObject);
		procedure ActionSaveReplacementExecute(Sender : TObject);
		procedure ActionSaveReplacementUpdate(Sender : TObject);
		procedure ActionSearchExecute(Sender : TObject);
		procedure ActionSearchInResultExecute(Sender : TObject);
		procedure ActionShowFileIconsExecute(Sender : TObject);
		procedure ActionShowFileIconsUpdate(Sender : TObject);
		procedure ActionShowRelativePathExecute(Sender : TObject);
		procedure ActionShowRelativePathUpdate(Sender : TObject);
		procedure ActionShowSearchFormExecute(Sender : TObject);
		procedure ActionShowSearchFormUpdate(Sender : TObject);
		procedure ActionSwitchViewExecute(Sender : TObject);
		procedure ActionSwitchViewUpdate(Sender : TObject);
		procedure edtFilterChange(Sender : TObject);
		procedure edtFilterRightButtonClick(Sender : TObject);
		procedure edtReplaceChange(Sender : TObject);
		procedure edtReplaceRightButtonClick(Sender : TObject);
		procedure SearchBox1Change(Sender : TObject);

		private
			FDpiScaler : TRipGrepperDpiScaler;
			FGuiReplaceModes : TGuiReplaceModes;
			FHistItemObj : IHistoryItemObject;
			FPrevFoundNode : PVirtualNode;
			FSettings : TRipGrepperSettings;
			FSkipReplaceChange : Boolean;
			FViewStyleIndex : integer;
			procedure GetCheckedReplaceList(var replaceList : TReplaceList);
			function GetIsGuiReplaceMode : Boolean;
			function GetSettings : TRipGrepperSettings;
			function GetToolBarWidth(_tb : TToolBar) : Integer;
			function IsFilterOn : Boolean;
			procedure SaveSelectedReplacements;
			procedure SelectNextFoundNode(const _prevFoundNode : PVirtualNode; const _searchPattern : string);
			procedure SetGuiReplaceModes(const _bOn : Boolean = True);
			procedure SetReplaceModeOnGui;
			procedure SetReplaceModeOnToolBar;
			procedure SetReplaceTextInSettings(const _sReplText : string);
			procedure StartNewSearch;
			property Settings : TRipGrepperSettings read GetSettings write FSettings;

		public
			constructor Create(AOwner : TComponent); override;
			destructor Destroy; override;
			procedure AlignToolBars(iTbResultLeft, iSearchMaxWidth, iResultMinWidth : integer);
			function GetNextViewStyleIdx : integer;
			procedure Init;
			function IsRgReplaceMode : Boolean;
			procedure SearchForText(Sender : TBaseVirtualTree; Node : PVirtualNode; Data : Pointer; var Abort : Boolean);
			procedure SetFilter(const _bOn : Boolean = True);
			procedure SetGuiReplaceMode(const _modes : TGuiReplaceModes; const _sReplaceText : string = '');
			procedure ReplaceLineInFile(const fileName : string; lineNum : Integer; const replaceLine : string);
			property IsGuiReplaceMode : Boolean read GetIsGuiReplaceMode;
			property HistItemObj : IHistoryItemObject read FHistItemObj;

	end;

var
	TopFrame : TRipGrepperTopFrame;

implementation

{$R *.dfm}

uses
	RipGrepper.UI.MainForm,
	RipGrepper.UI.ParentFrame,
	Vcl.Clipbrd,
	RipGrepper.Common.Constants,
	RipGrepper.OpenWith.ConfigForm,
	RipGrepper.OpenWith.Params,
	RipGrepper.OpenWith,
	RipGrepper.Helper.UI,
	RipGrepper.UI.SearchForm,
	System.Math,
	System.StrUtils,
	RipGrepper.Settings.RipGrepParameterSettings,
	RipGrepper.Tools.DebugUtils,
	RipGrepper.UI.RipGrepOptionsForm,
	RipGrepper.Common.ParsedObject,
	RipGrepper.Common.IOTAUtils,
	RipGrepper.Common.NodeData,
	System.IOUtils,
	RipGrepper.Helper.Types,
	System.SysUtils,
	RipGrepper.UI.ConfigForm,
	System.RegularExpressions;

constructor TRipGrepperTopFrame.Create(AOwner : TComponent);
begin
	inherited Create(AOwner);
	FDpiScaler := TRipGrepperDpiScaler.Create(self);
	TopFrame := self;
	FGuiReplaceModes := []; // [EGuiReplaceMode.grmEditEnabled];
end;

destructor TRipGrepperTopFrame.Destroy;
begin
	FDpiScaler.Free;
	inherited Destroy;
end;

procedure TRipGrepperTopFrame.ActionAbortSearchExecute(Sender : TObject);
begin
	if MainFrame.IsSearchRunning then begin
		MainFrame.RipGrepTask.Cancel;
	end;
	MainFrame.AbortSearch := True;
end;

procedure TRipGrepperTopFrame.ActionAbortSearchUpdate(Sender : TObject);
begin
	ActionAbortSearch.Enabled := MainFrame.IsSearchRunning;
end;

procedure TRipGrepperTopFrame.ActionAlignToolbarsExecute(Sender : TObject);
begin
	MainFrame.AlignToolBars;
end;

procedure TRipGrepperTopFrame.ActionSaveAllReplacementExecute(Sender : TObject);
begin
	//
end;

procedure TRipGrepperTopFrame.ActionAlternateRowColorsExecute(Sender : TObject);
begin
	Settings.NodeLookSettings.AlternateRowColors := (not Settings.NodeLookSettings.AlternateRowColors);
	Settings.StoreViewSettings('AlternateRowColors');
	MainFrame.VstResult.Repaint();
end;

procedure TRipGrepperTopFrame.ActionAlternateRowColorsUpdate(Sender : TObject);
begin
	tbAlternateRowColors.Down := Settings.NodeLookSettings.AlternateRowColors;
end;

procedure TRipGrepperTopFrame.ActionCancelExecute(Sender : TObject);
begin
	// ModalResult := mrCancel;
	// Close();
end;

procedure TRipGrepperTopFrame.ActionCmdLineCopyExecute(Sender : TObject);
begin
	ClipBoard.AsText := Settings.RipGrepParameters.GetCommandLine;
end;

procedure TRipGrepperTopFrame.ActionCmdLineCopyUpdate(Sender : TObject);
begin
	ActionCmdLineCopy.Hint := 'Copy Command Line:' + CRLF + Settings.RipGrepParameters.GetCommandLine;
end;

procedure TRipGrepperTopFrame.ActionConfigExecute(Sender : TObject);
begin
	var
	dbgMsg := TDebugMsgBeginEnd.New('TRipGrepperTopFrame.ActionConfigExecute');
	var
	owSettings := Settings.OpenWithSettings;
	owSettings.TestFile := MainFrame.GetOpenWithParamsFromSelected();
	dbgMsg.Msg('TestFile: ' + owSettings.TestFile.DirPath + '\' + owSettings.TestFile.FileName);

	// TOpenWithConfigForm.CreateAndShow(Settings);
	var
	owForm := TConfigForm.Create(Settings);
	try
		owForm.ShowModal;
	finally
		owForm.Free;
	end;

	owSettings.TestFile := default (TOpenWithParams);
	owSettings.Reload();
end;

procedure TRipGrepperTopFrame.ActionCopyFileNameExecute(Sender : TObject);
begin
	MainFrame.CopyToClipboardFileOfSelected();
end;

procedure TRipGrepperTopFrame.ActionCopyPathToClipboardExecute(Sender : TObject);
begin
	MainFrame.CopyToClipboardPathOfSelected();
end;

procedure TRipGrepperTopFrame.ActionExpandCollapseExecute(Sender : TObject);
begin
	Settings.NodeLookSettings.ExpandNodes := not Settings.NodeLookSettings.ExpandNodes;
	Settings.StoreViewSettings('ExpandNodes');

	if Settings.NodeLookSettings.ExpandNodes then begin
		MainFrame.VstResult.FullExpand();
	end else begin
		MainFrame.VstResult.FullCollapse();
	end;
end;

procedure TRipGrepperTopFrame.ActionExpandCollapseUpdate(Sender : TObject);
begin
	ActionExpandCollapse.ImageIndex := IfThen(Settings.NodeLookSettings.ExpandNodes, 23, 22);
	ActionExpandCollapse.Hint := IfThen(Settings.NodeLookSettings.ExpandNodes, 'Collapse Nodes', 'Expand Nodes');
end;

procedure TRipGrepperTopFrame.ActionIndentLineExecute(Sender : TObject);
begin
	Settings.NodeLookSettings.IndentLines := not Settings.NodeLookSettings.IndentLines;
	Settings.StoreViewSettings('IndentLines');
	MainFrame.VstResult.Repaint();
end;

procedure TRipGrepperTopFrame.ActionIndentLineUpdate(Sender : TObject);
begin
	tbIndentLines.Down := Settings.NodeLookSettings.IndentLines;
end;

procedure TRipGrepperTopFrame.ActionOpenWithExecute(Sender : TObject);
begin
	MainFrame.ActionOpenWithExecute(Sender);
end;

procedure TRipGrepperTopFrame.ActionRefreshSearchExecute(Sender : TObject);
var
	cursor : TCursorSaver;
begin
	cursor.SetHourGlassCursor;
	MainFrame.RefreshSearch();
end;

procedure TRipGrepperTopFrame.ActionRefreshSearchUpdate(Sender : TObject);
begin
	ActionRefreshSearch.Enabled := // Settings.IsAlreadyRead and
	{ } (not MainFrame.IsSearchRunning)
	{ } and Assigned(MainFrame.HistItemObject);
end;

procedure TRipGrepperTopFrame.ActionSaveReplacementExecute(Sender : TObject);
begin
	SaveSelectedReplacements;
	ActionRefreshSearchExecute(self);
	if IsRGReplaceMode then begin
		// nothing to do?
	end else if IsGuiReplaceMode then begin
		SetGuiReplaceMode([EGuiReplaceMode.grmEditEnabled], '');
	end;
end;

procedure TRipGrepperTopFrame.ActionSaveReplacementUpdate(Sender : TObject);
begin
	ActionSaveReplacement.Enabled := (EGuiReplaceMode.grmSaveEnabled in FGuiReplaceModes)
	{ } and (MainFrame.VstResult.CheckedCount > 0);
end;

procedure TRipGrepperTopFrame.ReplaceLineInFile(const fileName : string; lineNum : Integer; const replaceLine : string);
begin

end;

procedure TRipGrepperTopFrame.ActionSearchExecute(Sender : TObject);
var
	cursor : TCursorSaver;
begin
	cursor.SetHourGlassCursor;
	MainFrame.PrepareAndDoSearch();
end;

procedure TRipGrepperTopFrame.ActionSearchInResultExecute(Sender : TObject);
begin
	SelectNextFoundNode(FPrevFoundNode, edtFilter.Text);
end;

procedure TRipGrepperTopFrame.ActionShowFileIconsExecute(Sender : TObject);
begin
	Settings.NodeLookSettings.ShowFileIcon := not Settings.NodeLookSettings.ShowFileIcon;
	Settings.StoreViewSettings('ShowFileIcon');
	MainFrame.VstResult.Repaint();
end;

procedure TRipGrepperTopFrame.ActionShowFileIconsUpdate(Sender : TObject);
begin
	tbShowFileIcon.Down := Settings.NodeLookSettings.ShowFileIcon;
	// ActionShowFileIcons.ImageIndex := Ifthen(Settings.ShowFileIcon, IMG_IDX_SHOW_FILE_ICON_TRUE, IMG_IDX_SHOW_FILE_ICON_FALSE);
end;

procedure TRipGrepperTopFrame.ActionShowRelativePathExecute(Sender : TObject);
const
	PARSER_TYPES : TArray<TFileNameType> = [ftAbsolute, ftRelative];
begin
	Settings.NodeLookSettings.ShowRelativePath := not Settings.NodeLookSettings.ShowRelativePath;
	var
	idx := integer(Settings.NodeLookSettings.ShowRelativePath);
	MainFrame.FileNameType := PARSER_TYPES[idx mod Length(PARSER_TYPES)];

	Settings.StoreViewSettings('ShowRelativePath');
	MainFrame.VstResult.Repaint;
end;

procedure TRipGrepperTopFrame.ActionShowRelativePathUpdate(Sender : TObject);
begin
	tbShowRelativePath.Down := Settings.NodeLookSettings.ShowRelativePath;
	// ActionShowRelativePath.ImageIndex := Ifthen(Settings.ShowRelativePath, IMG_IDX_SHOW_RELATIVE_PATH, IMG_IDX_SHOW_ABS_PATH);
end;

procedure TRipGrepperTopFrame.ActionShowSearchFormExecute(Sender : TObject);
begin
	TDebugUtils.DebugMessage('TRipGrepperTopFrame.ActionShowSearchFormExecute');
	SetFilter(False);
	StartNewSearch;
end;

procedure TRipGrepperTopFrame.ActionShowSearchFormUpdate(Sender : TObject);
begin
	ActionShowSearchForm.Enabled := Settings.IsEmpty or (not MainFrame.IsSearchRunning);
end;

procedure TRipGrepperTopFrame.ActionSwitchViewExecute(Sender : TObject);
var
	idx : integer;
begin
	idx := GetNextViewStyleIdx;
	// MainFrame.VstResult.ViewStyle := LISTVIEW_TYPES[idx];
	FViewStyleIndex := idx;
end;

procedure TRipGrepperTopFrame.ActionSwitchViewUpdate(Sender : TObject);
begin
	var
	next := GetNextViewStyleIdx();
	var
	idx := IfThen(next <= (Length(LISTVIEW_TYPES) - 1), next, 0);
	// ActionSwitchView.ImageIndex := idx + 2;
	ActionSwitchView.Hint := 'Change View ' + LISTVIEW_TYPE_TEXTS[idx];
end;

procedure TRipGrepperTopFrame.AlignToolBars(iTbResultLeft, iSearchMaxWidth, iResultMinWidth : integer);
begin
	tbarSearch.Top := tbarSearch.Margins.Top;
	tbarResult.Top := tbarResult.Margins.Top;
	tbarConfig.Top := tbarConfig.Margins.Top;
	tbarSearch.Width := GetToolBarWidth(tbarSearch);
	tbarResult.Width := GetToolBarWidth(tbarResult);
	tbarConfig.Width := GetToolBarWidth(tbarConfig);

	tbarSearch.Left := tbarSearch.Margins.Left;
	if iSearchMaxWidth >= tbarSearch.Width then begin
		tbarResult.Left := iTbResultLeft;
	end else begin
		tbarResult.Left := tbarSearch.Width + 2 * tbarSearch.Margins.Right;
	end;

	if iResultMinWidth <= (tbarResult.Width + tbarConfig.Width + 2 * tbarConfig.Margins.Left) then begin
		tbarResult.Left := tbarConfig.Left - tbarResult.Width - 2 * tbarConfig.Margins.Left;
	end;
end;

procedure TRipGrepperTopFrame.edtFilterChange(Sender : TObject);
begin
	if IsFilterOn then begin
		MainFrame.FilterNodes(edtFilter.Text);
	end;
end;

procedure TRipGrepperTopFrame.edtFilterRightButtonClick(Sender : TObject);
begin
	if IsFilterOn then begin
		MainFrame.ClearFilter(True);
		SetFilter(False);
	end else begin
		MainFrame.FilterNodes(edtFilter.Text);
		SetFilter();
	end;
end;

procedure TRipGrepperTopFrame.edtReplaceChange(Sender : TObject);
begin
	if FSkipReplaceChange then begin
		Exit;
	end;
	if IsGuiReplaceMode then begin
		SetReplaceTextInSettings(edtReplace.Text);
	end else begin
		if not string(edtReplace.Text).IsEmpty then begin
			edtReplaceRightButtonClick(self);
		end;
	end;
end;

procedure TRipGrepperTopFrame.edtReplaceRightButtonClick(Sender : TObject);
begin
	if IsGuiReplaceMode then begin
		SetReplaceTextInSettings('');
		SetGuiReplaceModes(False);
	end else begin
		SetGuiReplaceModes(True);
		SetReplaceTextInSettings(edtReplace.Text);
	end;
	SetReplaceModeOnGui();
end;

procedure TRipGrepperTopFrame.GetCheckedReplaceList(var replaceList : TReplaceList);
var
	node : PVirtualNode;
	data : PVSFileNodeData;
	parentData : PVSFileNodeData;
	replaceLine : string;
	fileName : string;
	lineNum : integer;
begin
	node := MainFrame.VstResult.GetFirstChecked();
	while Assigned(node) do begin
		if node.Parent <> MainFrame.VstResult.RootNode then begin
			data := MainFrame.VstResult.GetNodeData(node);
			parentData := MainFrame.VstResult.GetNodeData(node.Parent);
			fileName := parentData.FilePath;
			lineNum := data.MatchData.Row;
			if IsRgReplaceMode then begin
				replaceLine := data.MatchData.LineText;
			end else if IsGuiReplaceMode then begin
				replaceLine := TRegEx.Replace(data.MatchData.LineText, Settings.LastSearchText, Settings.RipGrepParameters.ReplaceText,
					[roIgnoreCase]);
			end;
			replaceList.Add(fileName, lineNum, replaceLine);
		end;
		node := MainFrame.VstResult.GetNextChecked(Node);
	end;
end;

function TRipGrepperTopFrame.GetIsGuiReplaceMode : Boolean;
begin
	Result := EGuiReplaceMode.grmActive in FGuiReplaceModes;
end;

function TRipGrepperTopFrame.GetNextViewStyleIdx : integer;
begin
	Result := IfThen(FViewStyleIndex < Length(LISTVIEW_TYPES) - 1, FViewStyleIndex + 1, 0);
	Result := (Result mod Length(LISTVIEW_TYPES));
end;

function TRipGrepperTopFrame.GetSettings : TRipGrepperSettings;
begin
	if not Assigned(FSettings) then begin
		FSettings := ParentFrame.Settings;;
	end;
	Result := FSettings;
end;

function TRipGrepperTopFrame.GetToolBarWidth(_tb : TToolBar) : Integer;
begin
	Result := 0;
	TDebugUtils.DebugMessage(Format('TRipGrepperTopFrame.GetToolBarWidth %s Width: %d BtnCnt:%d ', [_tb.Name, _tb.Width, _tb.ButtonCount]));

	for var i : integer := 0 to _tb.ButtonCount - 1 do begin
		Result := Result + _tb.Buttons[i].Width;
	end;
	TDebugUtils.DebugMessage(Format('TRipGrepperTopFrame.GetToolBarWidth %s Width: %d', [_tb.Name, Result, _tb.ButtonCount]));
end;

procedure TRipGrepperTopFrame.Init;
begin
	if not IOTAUTils.IsStandAlone then begin
		// edtFilter.BorderStyle := bsNone;
		// Height := Height - 2;
	end;
end;

function TRipGrepperTopFrame.IsFilterOn : Boolean;
begin
	Result := edtFilter.RightButton.ImageIndex = IMG_IDX_FILTER_ON;
end;

function TRipGrepperTopFrame.IsRgReplaceMode : Boolean;
begin
	Result := EGuiReplaceMode.grmRGReplace in FGuiReplaceModes;
end;

procedure TRipGrepperTopFrame.SaveSelectedReplacements;
var
	replaceList : TReplaceList;
begin
	replaceList := TReplaceList.Create();
	try
		GetCheckedReplaceList(replaceList);
		TEncodedStringList.ReplaceLineInFiles(replaceList);
	finally
		replaceList.Free;
	end;
end;

procedure TRipGrepperTopFrame.SearchBox1Change(Sender : TObject);
begin
	inherited; // OnChange(Sender);
	FPrevFoundNode := nil;
	// SelectNextFoundNode(FPrevFoundNode);
	MainFrame.FilterNodes(edtFilter.Text);
end;

procedure TRipGrepperTopFrame.SearchForText(Sender : TBaseVirtualTree; Node : PVirtualNode; Data : Pointer; var Abort : Boolean);
var
	dataStr : string;
	NodeData : PVSFileNodeData;
begin
	NodeData := Sender.GetNodeData(Node);
	dataStr := NodeData.FilePath + ' ' + NodeData.MatchData.LineText;
	Abort := ContainsText(dataStr, string(Data));
	// abort the search if a node with the text is found.
	TDebugUtils.DebugMessage(Format('Search ''%s'' in %s', [string(Data), dataStr]));
end;

procedure TRipGrepperTopFrame.SelectNextFoundNode(const _prevFoundNode : PVirtualNode; const _searchPattern : string);
var
	bLast : Boolean;
	nextNode, lastNode, foundNode : PVirtualNode;
begin
	if _searchPattern.IsEmpty then begin
		Exit;
	end;
	lastNode := MainFrame.VstResult.GetLast(nil, true);
	nextNode := _prevFoundNode;
	repeat
		if not Assigned(nextNode) then begin
			nextNode := MainFrame.VstResult.GetFirst;
		end else begin
			nextNode := MainFrame.VstResult.GetNext(nextNode, true);
		end;
		bLast := (nextNode = lastNode);
		Assert(nextNode <> MainFrame.VstResult.RootNode);
		// first param is your starting point. nil starts at top of tree. if you want to implement findnext
		// functionality you will need to supply the previous found node to continue from that point.
		// be sure to set the IncrementalSearchTimeout to allow users to type a few characters before starting a search.
		foundNode := MainFrame.VstResult.IterateSubtree(nextNode, SearchForText, Pointer(_searchPattern));
	until Assigned(foundNode) or bLast;

	if Assigned(foundNode) then begin
		MainFrame.VstResult.FocusedNode := foundNode;
		MainFrame.VstResult.Selected[foundNode] := True;
		FPrevFoundNode := foundNode;
	end;
	if bLast then begin
		FPrevFoundNode := nil;
	end;
end;

procedure TRipGrepperTopFrame.SetFilter(const _bOn : Boolean = True);
begin
	edtFilter.RightButton.ImageIndex :=
	{ } IfThen(_bOn and (edtFilter.Text <> ''), IMG_IDX_FILTER_ON, IMG_IDX_FILTER_OFF);
end;

procedure TRipGrepperTopFrame.SetGuiReplaceMode(const _modes : TGuiReplaceModes; const _sReplaceText : string = '');
begin
	FGuiReplaceModes := _modes;
	edtReplace.Text := _sReplaceText;
	SetReplaceModeOnGui();
end;

procedure TRipGrepperTopFrame.SetGuiReplaceModes(const _bOn : Boolean = True);
begin
	if _bOn then begin
		Include(FGuiReplaceModes, EGuiReplaceMode.grmActive);
		Include(FGuiReplaceModes, EGuiReplaceMode.grmSaveEnabled);
	end else begin
		Exclude(FGuiReplaceModes, EGuiReplaceMode.grmActive);
		Exclude(FGuiReplaceModes, EGuiReplaceMode.grmSaveEnabled);
	end;
end;

procedure TRipGrepperTopFrame.SetReplaceModeOnGui();
begin
	SetReplaceModeOnToolBar();
	ParentFrame.MainFrame.SetReplaceModeOnGrid(EGuiReplaceMode.grmActive in FGuiReplaceModes);
end;

procedure TRipGrepperTopFrame.SetReplaceModeOnToolBar;

begin
	ActionSaveReplacement.Enabled := EGuiReplaceMode.grmSaveEnabled in FGuiReplaceModes;
	// ActionSaveAllReplacement.Enabled := EGuiReplaceMode.grmSaveEnabled in FGuiReplaceModes;

	edtReplace.Enabled := EGuiReplaceMode.grmEditEnabled in FGuiReplaceModes;
	edtReplace.RightButton.ImageIndex := IfThen(
		{ } (EGuiReplaceMode.grmActive in FGuiReplaceModes), IMG_IDX_REPLACE_ON, IMG_IDX_REPLACE_OFF);

	if (not edtReplace.Enabled) and (edtReplace.Text = '') then begin
		FSkipReplaceChange := True;
		edtReplace.Text := edtReplace.TextHint;
		FSkipReplaceChange := False;
	end;
end;

procedure TRipGrepperTopFrame.SetReplaceTextInSettings(const _sReplText : string);
begin
	if Assigned(FSettings) then begin
		FSettings.RipGrepParameters.ReplaceText := _sReplText;
		MainFrame.VstResult.Repaint;
	end;
end;

procedure TRipGrepperTopFrame.StartNewSearch;
var
	formResult : Integer;
begin
	var
	dbgMsg := TDebugMsgBeginEnd.New('TRipGrepperTopFrame.StartNewSearch');
	FHistItemObj := MainFrame.CreateNewHistObject;
	formResult := TRipGrepperSearchDialogForm.ShowSearchForm(self, Settings, FHistItemObj);
	if (mrOk = formResult) then begin
		dbgMsg.Msg('after showmodal gui params: ' + Settings.RipGrepParameters.GuiSearchTextParams.ToLogString);
		dbgMsg.Msg('after showmodal cmdline: ' + Settings.RipGrepParameters.GetCommandLine);
		ActionSearchExecute(self);
	end else begin
		ParentFrame.MainFrame.MiddleLeftFrame1.DeleteCurrentHistoryItemFromList;
		FHistItemObj := nil;
	end;
	ParentFrame.MainFrame.MiddleLeftFrame1.SetReplaceMode();
end;

end.
