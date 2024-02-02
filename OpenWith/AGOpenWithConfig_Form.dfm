object AGOpenWithConfigForm: TAGOpenWithConfigForm
  Left = 756
  Top = 291
  Caption = 'Open With... Settings '
  ClientHeight = 306
  ClientWidth = 486
  Color = clBtnFace
  Constraints.MinHeight = 284
  Constraints.MinWidth = 330
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object pnlBottom: TPanel
    Left = 0
    Top = 265
    Width = 486
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      486
      41)
    object btn_Save: TButton
      AlignWithMargins = True
      Left = 321
      Top = 8
      Width = 75
      Height = 25
      Action = ActionOk
      Anchors = [akRight, akBottom]
      TabOrder = 0
    end
    object btn_Cancel: TButton
      AlignWithMargins = True
      Left = 402
      Top = 8
      Width = 75
      Height = 25
      Action = ActionCancel
      Anchors = [akRight, akBottom]
      TabOrder = 1
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 486
    Height = 265
    Align = alClient
    Caption = 'pnlMain'
    TabOrder = 1
    DesignSize = (
      486
      265)
    object Label1: TLabel
      AlignWithMargins = True
      Left = 21
      Top = 214
      Width = 461
      Height = 15
      Margins.Left = 20
      Margins.Top = 6
      Align = alTop
      Caption = 'Command:'
    end
    object btnAdd: TButton
      Left = 451
      Top = 11
      Width = 26
      Height = 24
      Action = ActionAdd
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      Images = ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btnModify: TButton
      Left = 447
      Top = 235
      Width = 26
      Height = 24
      Action = ActionModify
      Anchors = [akRight, akBottom]
      ImageAlignment = iaCenter
      Images = ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnMoveDown: TButton
      Left = 451
      Top = 101
      Width = 26
      Height = 24
      Action = ActionMoveDown
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      Images = ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object btnMoveUp: TButton
      Left = 451
      Top = 71
      Width = 26
      Height = 24
      Action = ActionMoveUp
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      Images = ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object btnRemove: TButton
      Left = 451
      Top = 41
      Width = 26
      Height = 24
      Action = ActionRemove
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      Images = ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object btnTest: TButton
      Left = 451
      Top = 131
      Width = 26
      Height = 24
      Action = ActionTest
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      Images = ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object Button1: TButton
      Left = 415
      Top = 235
      Width = 26
      Height = 24
      Margins.Left = 1
      Action = ActionOpenFileDlg
      Align = alCustom
      Anchors = [akRight, akBottom]
      ImageAlignment = iaCenter
      Images = ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object edt_OpenWithCmd: TEdit
      AlignWithMargins = True
      Left = 21
      Top = 237
      Width = 389
      Height = 21
      Margins.Left = 20
      Margins.Right = 75
      Margins.Bottom = 6
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnKeyPress = edt_OpenWithCmdKeyPress
    end
    object lbCommands: TCheckListBox
      AlignWithMargins = True
      Left = 21
      Top = 11
      Width = 414
      Height = 194
      Hint = 
        '|Examples:'#13#10'nvim-qt.exe "<FILE>" -- -c "+normal <LINE>G<COL>l"'#13#10 +
        'code.exe --reuse-window "<DIR>" --goto "<FILE>:<LINE>:<COL>"'#13#10'no' +
        'tepad++.exe "<FILE>" -n<LINE> -c<COL>'
      Margins.Left = 20
      Margins.Top = 10
      Margins.Right = 50
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoComplete = False
      Color = clHighlightText
      ItemHeight = 15
      Items.Strings = (
        'nvim-qt.exe "<FILE>" -- -c "+normal <LINE>G<COL>l"'
        'code.exe --reuse-window "<DIR>" --goto "<FILE>:<LINE>:<COL>"'
        'notepad++.exe "<FILE>" -n<LINE> -c<COL>')
      ParentShowHint = False
      ShowHint = True
      StyleName = 'Windows'
      TabOrder = 8
      OnClick = lbCommandsClick
      OnDblClick = lbCommandsDblClick
    end
  end
  object ActionListConfig: TActionList
    Images = ImageList1
    Left = 342
    Top = 74
    object ActionOpenFileDlg: TAction
      Hint = 'Explore...'
      ImageIndex = 6
      OnExecute = ActionOpenFileDlgExecute
    end
    object ActionModify: TAction
      Hint = 'Modify Entry'
      ImageIndex = 0
      OnExecute = ActionModifyExecute
      OnUpdate = ActionModifyUpdate
    end
    object ActionAdd: TAction
      Hint = 'Add Entry'
      ImageIndex = 4
      OnExecute = ActionAddExecute
      OnUpdate = ActionAddUpdate
    end
    object ActionRemove: TAction
      Hint = 'Remove Entry'
      ImageIndex = 5
      OnExecute = ActionRemoveExecute
      OnUpdate = ActionRemoveUpdate
    end
    object ActionTest: TAction
      Hint = 'Test'
      ImageIndex = 3
      OnExecute = ActionTestExecute
      OnUpdate = ActionTestUpdate
    end
    object ActionMoveDown: TAction
      Hint = 'Move Entry Down'
      ImageIndex = 2
      OnExecute = ActionMoveDownExecute
      OnUpdate = ActionMoveDownUpdate
    end
    object ActionMoveUp: TAction
      Hint = 'Move Entry Up'
      ImageIndex = 1
      OnExecute = ActionMoveUpExecute
      OnUpdate = ActionMoveUpUpdate
    end
    object ActionOk: TAction
      Caption = 'Ok'
      OnExecute = ActionOkExecute
    end
    object ActionCancel: TAction
      Caption = 'Cancel'
      OnExecute = ActionCancelExecute
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 280
    Top = 75
  end
  object ImageList1: TImageList
    Left = 165
    Top = 140
    Bitmap = {
      494C010107000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B0B0B0007676760076767600B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000006060600010101000000000007070700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0B0B000A9A9A900A9A9A900A9A9
      A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9
      A900B7B7B700000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001010100010101000101010000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006969690000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009D9D9D00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001010100010101000101010001010100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DADADA0006060600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000021212100000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001010100010101000101010001010100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009292920069696900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009B9B9B00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000010101000101010001010100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018181800DCDCDC00080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001E1E1E00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3B3B30006060600000000000000
      0000000000000000000000000000000000000101010001010100010101000101
      0100010101000000000006060600B4B4B400B3B3B30006060600000000000000
      0000000000000000000000000000000000000101010001010100010101000101
      0100010101000000000006060600B4B4B40000000000929292006A6A6A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009B9B9B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000001010100010101000101
      01000101010001010100000000007E7E7E007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000001010100010101000101
      01000101010001010100000000007E7E7E00000000001A1A1A00DBDBDB000606
      0600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000252525000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000000000000010101000101
      01000101010001010100010101007E7E7E007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000000000000010101000101
      01000101010001010100010101007E7E7E0000000000000000008E8E8E009191
      9100333333003232320032323200323232003232320032323200323232003232
      32003232320032323200323232006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2B2B20006060600000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      0100010101000101010006060600AFAFAF00B2B2B20006060600000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      0100010101000101010006060600AFAFAF000000000000000000050505007B7B
      7B00A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9
      A900A9A9A900000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A9A9A900000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000001010100D0D0D000000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000101010082828200A9A9A900A9A9A900A9A9A900A9A9
      A900CFCFCF00000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004949490000000000000000000000
      000000000000010101009A9A9A00000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000006060600000000000000000006060600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFDCDCDC00DCDC
      DC00DCDCDC00000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B2B2B2008787870087878700B3B3B300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE00CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B2B2B20075757500767676007676760076767600B5B5B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B4B4B400B4B4B40000000000000000000000
      000000000000000000000000000000000000000000008E8E8E00D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE000F0F0F000F0F0F00CECECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000606060001010100010101000000000000000000070707000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008B8B8B0000000000000000008E8E8E00000000000000
      0000000000000000000000000000000000008585850000000000020202005C5C
      5C00D4D5D5000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE000F0F0F0000000000000000001F1F1F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000101010001010100010101000101010000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009496960000000000010101000101010000000000909090000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      00000101010052525200D4D4D400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE000F0F
      0F0000000000000000000F0F0F00CECECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000101010001010100010101000101010001010100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000989898000000000001010100010101000101010001010100000000009090
      9000000000000000000000000000000000007E7E7E0000000000000000000000
      000000000000010101000101010052525200D4D4D40000000000000000000000
      00000000000000000000000000000000000000000000CECECE000F0F0F000000
      0000000000001F1F1F00CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001010100010101000101010001010100010101000000
      0000000000000000000000000000000000000000000000000000000000009898
      9800000000000000000001010100010101000101010001010100010101000000
      0000919191000000000000000000000000007E7E7E0000000000000000000000
      0000000000000000000001010100010101000101010052525200D4D4D4000000
      000000000000000000000000000000000000CECECE000F0F0F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000010101000101010001010100010101000000
      0000000000000000000000000000000000000000000000000000969696000000
      0000000000000000000000000000010101000101010001010100010101000101
      0100000000009696960000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000010101000101010001010100010101005353
      5300D7D7D7000000000000000000000000001F1F1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000101010001010100010101000000
      00000000000000000000000000000000000000000000000000000D0D0D000000
      0000000000000000000000000000000000000101010001010100010101000101
      0100010101000E0E0E0000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000000000000101010001010100010101000101
      01000101010054545400D7D7D70000000000CECECE000F0F0F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010100010101000000
      0000000000000000000000000000000000000000000000000000B2B2B2008787
      8700878787000000000000000000000000000000000001010100010101008484
      840084848400AFAFAF0000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000001010100010101000101
      0100010101000101010004040400B9B9B90000000000CECECE000F0F0F000000
      0000000000000F0F0F00CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B3007676
      7600767676000000000000000000000000000000000000000000010101007576
      760075767600B2B2B20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000000000000010101000101
      0100010101000101010004040400B8B8B8000000000000000000CECECE000F0F
      0F0000000000000000000F0F0F00CECECE000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000D0D0D000000
      0000000000000000000000000000000000000000000000000000000000000101
      0100010101000E0E0E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      01000101010052525200D4D4D40000000000000000000000000000000000CECE
      CE000F0F0F0000000000000000001F1F1F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000969696000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009395950000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000000000000010101005454
      5400D4D4D4000000000000000000000000000000000000000000000000000000
      0000CECECE000F0F0F000F0F0F00CECECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009898
      9800000000000000000000000000000000000000000000000000000000000000
      0000909090000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000000000000101010054545400D7D7D7000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE00CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000979797000000000000000000000000000000000000000000000000009090
      9000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      000000000000000000000101010054545400D7D7D70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F8F8F0000000000000000000000000000000000878787000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      00000101010054545400D7D7D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008E8E8E0000000000000000008E8E8E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000606060000000000000000000000000000000000060606000000
      0000000000000000000000000000000000008383830000000000020202005D5D
      5D00D9D9D9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B4B4B400B4B4B40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B2B2B20087878700878787008787870087878700B3B3B3000000
      0000000000000000000000000000000000000000000090909000D9D9D9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FC3FFFFFFFFF0000FC3FFFFF00070000
      FC3FFFFF00030000FC3FFFFF00030000FC3FFFFF00010000FC3FFFFF00010000
      0000000000000000000000000000000000000000000000000000000000070000
      FC3FFFFF00030000FC3FFFFF00030000FC3FFFFF00070000FC3FFFFF01FF0000
      FC3FFFFFC7FF0000FC3FFFFFFFFF0000F9FFF81FFE7F9FFFF0FFF81FFC3F07FF
      E0FFF81FF81F01FFC0FFF81FF00F007F81FFF81FE007001F0000F81FC0030007
      0000F81FC00300010000F81FC003000081F8C003F81F0000C0F8C003F81F0001
      E0F8C003F81F0007F0F8E007F81F001FF9F8F00FF81F007FFFF8F81FF81F01FF
      FFF8FC3FF81F07FFFFFFFE7FF81F9FFF00000000000000000000000000000000
      000000000000}
  end
end
