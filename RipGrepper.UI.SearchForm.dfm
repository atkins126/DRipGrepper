object RipGrepperSearchDialogForm: TRipGrepperSearchDialogForm
  Left = 0
  Top = 0
  Caption = 'RipGrepper Search...'
  ClientHeight = 174
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object pnlSearch: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 684
    Height = 168
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -180
    ExplicitTop = 0
    ExplicitWidth = 779
    ExplicitHeight = 159
    DesignSize = (
      684
      168)
    object gbSearch: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 678
      Height = 162
      Align = alClient
      Caption = 'Search'
      TabOrder = 2
      ExplicitWidth = 773
      ExplicitHeight = 153
      DesignSize = (
        678
        162)
      object lblParams: TLabel
        AlignWithMargins = True
        Left = 16
        Top = 85
        Width = 62
        Height = 15
        Caption = 'Parameters:'
      end
      object lblPaths: TLabel
        AlignWithMargins = True
        Left = 16
        Top = 30
        Width = 40
        Height = 15
        Caption = 'Path(s):'
      end
      object lblText: TLabel
        AlignWithMargins = True
        Left = 16
        Top = 56
        Width = 24
        Height = 15
        Caption = 'Text:'
      end
      object cmbParameters: TComboBox
        Left = 84
        Top = 82
        Width = 543
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'cmbSearchDir'
      end
      object cmbSearchDir: TComboBox
        Left = 84
        Top = 24
        Width = 543
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Text = 'cmbSearchDir'
      end
      object cmbSearchText: TComboBox
        Left = 84
        Top = 53
        Width = 543
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Text = 'cmbSearchDir'
      end
    end
    object btnConfig: TButton
      AlignWithMargins = True
      Left = 636
      Top = 85
      Width = 26
      Height = 24
      Action = ActionConfig
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      Images = ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitLeft = 731
    end
    object btnSearch: TButton
      AlignWithMargins = True
      Left = 513
      Top = 122
      Width = 75
      Height = 21
      Action = ActionSearch
      Anchors = [akTop, akRight]
      Default = True
      TabOrder = 1
      ExplicitLeft = 608
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 594
      Top = 122
      Width = 75
      Height = 21
      Action = ActionCancel
      Anchors = [akTop, akRight]
      Cancel = True
      TabOrder = 3
      ExplicitLeft = 689
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 328
    Top = 120
  end
  object ImageList1: TImageList
    Left = 424
    Top = 120
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFB3B3B3006E6E6E004E4E4E004D4D4D006D6D6D00B2B2B2000000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FFB9B9
      B9002728280010101000585858007E7E7E00808080005C5C5C00121212002323
      2300B4B4B400000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF989898000606
      06007D7D7D00000000FF000000FF000000FF000000FF000000FF000000FF8585
      8500060606008B8B8B00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFB9B9B90006060600B2B2
      B200000000FF000000FF000000FFD8D8D800D1D1D100000000FF000000FF0000
      00FFBCBCBC0006060600ADADAD00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF24242400828282000000
      00FF000000FF000000FF000000FF5F5F5F004E4E4E00000000FF000000FF0000
      00FF000000FF8D8D8D001B1B1B00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AFAFAF0014141400000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF1C1C1C00A1A1A1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006666660061616100000000FF0000
      00FF000000FF000000FF000000FF7272720072727200000000FF000000FF0000
      00FF000000FF000000FF6D6D6D00585858000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004646460088888800000000FF0000
      00FF000000FF000000FF000000FF6767670049494900000000FF000000FF0000
      00FF000000FF000000FF95959500383838000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000434343008C8C8C00000000FF0000
      00FF000000FF000000FF000000FFB1B1B1001D1D1D0035353500000000FF0000
      00FF000000FF000000FF99999900343434000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006060600069696900000000FF0000
      00FF000000FF000000FFA0A0A000000000FF000000FF09090900BEBEBE000000
      00FF000000FF000000FF75767600505050000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A4A4001D1D1D00000000FF0000
      00FF000000FFC8C8C80009090900000000FF000000FF0F0F0F00BDBDBD000000
      00FF000000FF000000FF28292900939595000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF17171700989898000000
      00FF000000FF000000FF4B4B4B000D0D0D00101010003C3C3C00000000FF0000
      00FF000000FFA4A4A40010101000000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFA2A2A2000A0A0A00CBCB
      CB00000000FF000000FF000000FFBCBCBC00B9B9B900000000FF000000FF0000
      00FFD4D4D4000F0F0F0092929200000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF787878000C0C
      0C00A1A1A100000000FF000000FF000000FF000000FF000000FF000000FFAAAA
      AA00101010006A6A6A00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF9B9B
      9B0011111100292929007C7C7C00A1A1A100A2A2A2007F7F7F002E2E2E000E0E
      0E0092929200000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF949494004D4D4D002C2C2C002B2B2B004A4A4A008F8F8F000000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F81F000000000000E007000000000000
      C7E30000000000008E710000000000009E790000000000003FFC000000000000
      3E7C0000000000003E7C0000000000003E3C0000000000003D9C000000000000
      399C0000000000009C390000000000008E71000000000000C7E3000000000000
      E007000000000000F81F00000000000000000000000000000000000000000000
      000000000000}
  end
  object ActionList: TActionList
    Images = ImageList1
    Left = 120
    Top = 130
    object ActionSearch: TAction
      Caption = 'Search'
      ImageIndex = 10
      ShortCut = 16467
      OnExecute = ActionSearchExecute
    end
    object ActionCancel: TAction
      Caption = 'Cancel'
      Hint = 'Cancel'
      ShortCut = 16465
    end
    object ActionConfig: TAction
      Caption = 'ActionConfig'
      Hint = 'Config'
      ImageIndex = 0
    end
  end
end
