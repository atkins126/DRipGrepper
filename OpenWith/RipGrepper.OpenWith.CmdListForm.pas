// __ready4Postgres__
{ **-----------------------------------------------------------------------------
  @file RipGrepper.OpenWith.CmdListForm.pas

  TODO: -- Add description --

  (c) 2023, Agenda Informationssysteme GmbH & Co. KG, Rosenheim

  Projekt:
  @date    12.12.2023
  @author  mattiassich


  -------------------------------------------------------------------------------- }

unit RipGrepper.OpenWith.CmdListForm;

interface

uses
	Winapi.Windows,
	Winapi.Messages,
	System.SysUtils,
	System.Variants,
	System.Classes,
	Vcl.Graphics,
	Vcl.Controls,
	Vcl.Forms,
	Vcl.Dialogs,
	Vcl.StdCtrls,
	Vcl.ExtCtrls,
	System.Actions,
	Vcl.ActnList,
	Vcl.ComCtrls,
	System.ImageList,
	Vcl.ImgList,
	RipGrepper.Common.Settings;

type
	TOpenWithCmdList = class(TForm)
		lbCommands : TListView;
		pnl_Bottom : TPanel;
		btn_Save : TButton;
		btn_Cancel : TButton;
		alActions : TActionList;
		a_Ok : TAction;
		a_Cancel : TAction;
		ImageListListViewIcons : TImageList;
		btnView : TButton;
		a_SwitchView : TAction;
		btnConfig : TButton;
		a_Config : TAction;
		ImageListButtons : TImageList;
    pnlMain: TPanel;
		procedure a_CancelExecute(Sender : TObject);
		procedure a_ConfigExecute(Sender : TObject);
		procedure a_OkExecute(Sender : TObject);
		procedure a_SwitchViewExecute(Sender : TObject);
		procedure a_SwitchViewUpdate(Sender : TObject);
		procedure FormShow(Sender : TObject);

		private
			FSettings : TRipGrepperOpenWithSettings;
			FViewStyleIndex : Integer;
			class function GetEnabledCmds(const _settings : TRipGrepperOpenWithSettings) : TArray<string>;
			function GetViewStyleIndex : Integer;
			class procedure LoadEnbledCmds(_form : TOpenWithCmdList; const _settings : TRipGrepperOpenWithSettings);
			property ViewStyleIndex : Integer read GetViewStyleIndex;

		public
			constructor Create(AOwner : TComponent; const ASettings : TRipGrepperOpenWithSettings); reintroduce;
			destructor Destroy(); override;
			class function CreateAndShow(const _settings : TRipGrepperOpenWithSettings) : string;
	end;

const
	LISTVIEW_TYPES : TArray<TViewStyle> = [vsList, vsIcon, vsReport, vsSmallIcon];
	LISTVIEW_TYPE_TEXTS : TArray<string> = ['List', 'Icon', 'Report', 'SmallIcon'];

implementation

uses
	Winapi.ShellAPI,
	System.IOUtils,
	RipGrepper.OpenWith.ConfigForm,
	System.Math,
	RipGrepper.OpenWith.SimpleTypes, RipGrepper.Tools.DebugTools;

{$R *.dfm}

constructor TOpenWithCmdList.Create(AOwner : TComponent; const ASettings : TRipGrepperOpenWithSettings);
begin
	inherited Create(AOwner);

	lbCommands.items.Clear;
	lbCommands.SmallImages := ImageListListViewIcons;
	lbCommands.LargeImages := ImageListListViewIcons;
	ImageListListViewIcons.ColorDepth := TColorDepth.cd32Bit;
	FViewStyleIndex := 0;
	FSettings := ASettings;
end;

destructor TOpenWithCmdList.Destroy();
begin
	inherited Destroy();
end;

procedure TOpenWithCmdList.a_CancelExecute(Sender : TObject);
begin
	ModalResult := mrCancel;
end;

procedure TOpenWithCmdList.a_ConfigExecute(Sender : TObject);
begin
	TOpenWithConfigForm.CreateAndShow(FSettings);
	LoadEnbledCmds(self, FSettings);
end;

procedure TOpenWithCmdList.a_OkExecute(Sender : TObject);
begin
    FSettings.Store;
	ModalResult := mrOk;
end;

procedure TOpenWithCmdList.a_SwitchViewExecute(Sender : TObject);
begin
	lbCommands.ViewStyle := LISTVIEW_TYPES[ViewStyleIndex];
end;

procedure TOpenWithCmdList.a_SwitchViewUpdate(Sender : TObject);
begin
	var
	idx := IfThen((FViewStyleIndex + 1) <= (Length(LISTVIEW_TYPES) - 1), FViewStyleIndex + 1, 0);
	a_SwitchView.ImageIndex := idx + 2;
	a_SwitchView.Hint := 'Change View ' + LISTVIEW_TYPE_TEXTS[idx];
end;

class function TOpenWithCmdList.CreateAndShow(const _settings : TRipGrepperOpenWithSettings) : string;
begin
	var
	form := TOpenWithCmdList.Create(nil, _settings);

	try
		LoadEnbledCmds(form, _settings);

		if (mrOk = form.ShowModal()) then begin
			Result := form.lbCommands.Items[form.lbCommands.ItemIndex].SubItems[0];
		end;

	finally
		form.Free;
	end;

end;

procedure TOpenWithCmdList.FormShow(Sender : TObject);
begin
	if lbCommands.GetCount > 0 then begin
		lbCommands.ItemIndex := 0;
	end;
end;

class function TOpenWithCmdList.GetEnabledCmds(const _settings : TRipGrepperOpenWithSettings) : TArray<string>;
var
	arrCmd : TArray<string>;
	i : Integer;
	sCmds : string;
begin
	Result := [];

	i := 0;
	repeat
		sCmds := _settings.Command[i];
		TDebugUtils.DebugMessage((Format('OpenWithFunc.GetSelectedCmd %d: "%s" ', [i, sCmds])));

		if sCmds = '' then begin
			break
		end;

		arrCmd := [''];
		arrCmd := sCmds.Split([SEPARATOR]);
		if (arrCmd[0].ToUpper() = 'TRUE') then begin
			Result := Result + [arrCmd[1]];
		end;

		inc(i);
	until (i = MAX_COMMAND_NUM);

end;

function TOpenWithCmdList.GetViewStyleIndex : Integer;
begin
	FViewStyleIndex := IfThen(FViewStyleIndex < Length(LISTVIEW_TYPES) - 1, FViewStyleIndex + 1);
	// skip report
	FViewStyleIndex := IfThen(FViewStyleIndex = 2, FViewStyleIndex + 1, FViewStyleIndex);
	Result := (FViewStyleIndex mod Length(LISTVIEW_TYPES));
end;

class procedure TOpenWithCmdList.LoadEnbledCmds(_form : TOpenWithCmdList; const _settings : TRipGrepperOpenWithSettings);
var
	sfi : TSHFileInfo;
	icon : TIcon;
	item : TListItem;
	iPos : integer;
	sFileName : string;
	sPath : string;
begin

	icon := TIcon.Create;
	try
		_form.lbCommands.Items.Clear();
		for var itemText in GetEnabledCmds(_settings) do begin
			iPos := Pos('.EXE', AnsiUppercase(itemText));
			sFileName := Copy(itemText, 1, iPos + 3);
			sPath := ExtractFileDir(sFileName);
			if sPath.IsEmpty then begin
				TOpenWithConfigForm.GetExePath(sFileName, sPath);
				if not sPath.IsEmpty then begin
					sFileName := sPath;
				end else begin
                    continue
				end;
			end;

			item := _form.lbCommands.Items.Add();

			SHGetFileInfo(PChar(sFileName), 0, sfi, SizeOf(sfi), SHGFI_DISPLAYNAME);
			item.Caption := sfi.szDisplayName;

			SHGetFileInfo(PChar(sFileName), 0, sfi, SizeOf(TSHFileInfo), SHGFI_SMALLICON or SHGFI_ICON);
			icon.Handle := sfi.hIcon;

			item.ImageIndex := _form.ImageListListViewIcons.AddIcon(icon);
			item.Subitems.Add(itemText);

			TDebugUtils.DebugMessage((Format('TOpenWithCmdList.LoadEnbledCmds cmd: %d %s ', [item.ImageIndex, sFileName])));
			DestroyIcon(sfi.hIcon);
		end;
	finally
		icon.Free;
	end;
end;

end.
