object RipGrepperMainFrame: TRipGrepperMainFrame
  Left = 0
  Top = 0
  Width = 435
  Height = 266
  Margins.Left = 8
  Margins.Top = 8
  Margins.Right = 8
  Margins.Bottom = 8
  TabOrder = 0
  OnResize = FrameResize
  object panelMain: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 429
    Height = 260
    Align = alClient
    BevelOuter = bvNone
    Caption = 'panelMain'
    TabOrder = 0
    object ImageFileIcon: TImage
      Left = 1528
      Top = 753
      Width = 112
      Height = 152
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
    end
    object SplitView1: TSplitView
      Left = 0
      Top = 0
      Width = 794
      Height = 260
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      BevelEdges = [beLeft, beRight, beBottom]
      CompactWidth = 125
      OpenedWidth = 794
      Placement = svpLeft
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 191
        Top = 0
        Height = 260
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alRight
      end
      object PanelHistory: TPanel
        Left = 0
        Top = 0
        Width = 191
        Height = 260
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alClient
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'PanelHistory'
        TabOrder = 0
        object ListBoxSearchHistory: TListBox
          AlignWithMargins = True
          Left = 9
          Top = 9
          Width = 173
          Height = 242
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          Style = lbVirtualOwnerDraw
          Align = alClient
          ItemHeight = 30
          TabOrder = 0
          OnClick = ListBoxSearchHistoryClick
          OnData = ListBoxSearchHistoryData
          OnDblClick = ListBoxSearchHistoryDblClick
          OnDrawItem = ListBoxSearchHistoryDrawItem
        end
      end
      object PanelResult: TPanel
        Left = 194
        Top = 0
        Width = 600
        Height = 260
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alRight
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'PanelResult'
        TabOrder = 1
        object ListViewResult: TListView
          AlignWithMargins = True
          Left = 9
          Top = 9
          Width = 582
          Height = 242
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          Align = alClient
          Color = clHighlightText
          Columns = <
            item
              Caption = 'File'
              ImageIndex = 3
              Width = -1
              WidthType = (
                -1)
            end
            item
              Caption = 'Row'
              ImageIndex = 3
              Width = -1
              WidthType = (
                -1)
            end
            item
              Caption = 'Col'
              Width = -1
              WidthType = (
                -1)
            end
            item
              Caption = 'Match'
              Width = -1
              WidthType = (
                -1)
            end>
          Groups = <
            item
              Header = 'Group Header'
              GroupID = 0
              State = [lgsNormal, lgsCollapsible]
              HeaderAlign = taLeftJustify
              FooterAlign = taLeftJustify
              Subtitle = 'Subtitle'
              TitleImage = -1
            end>
          StyleName = 'Windows'
          OwnerData = True
          OwnerDraw = True
          GroupView = True
          ReadOnly = True
          RowSelect = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ViewStyle = vsReport
          OnColumnClick = ListViewResultColumnClick
          OnData = ListViewResultData
          OnDblClick = ListViewResultDblClick
          OnDrawItem = ListViewResultDrawItem
        end
      end
    end
  end
  object ActionList: TActionList
    Left = 251
    Top = 30
    object ActionSearch: TAction
      Caption = 'Search'
      ImageIndex = 10
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
    object ActionSwitchView: TAction
      Caption = 'ActionSwitchView'
      ImageIndex = 1
    end
    object ActionSortByFile: TAction
      Caption = 'ActionSortByFile'
      Hint = 'Sort by File'
      ImageIndex = 2
      OnExecute = ActionSortByFileExecute
      OnUpdate = ActionSortByFileUpdate
    end
    object ActionShowRelativePath: TAction
      Caption = 'ActionShowRelativePath'
      Hint = 'Show full or relative path'
      ImageIndex = 12
    end
    object ActionCmdLineCopy: TAction
      Caption = 'ActionCmdLineCopy'
      Hint = 'Copy rg.exe command line to clipboard'
      ImageIndex = 10
      ShortCut = 16451
    end
    object ActionSortByRow: TAction
      Caption = 'ActionSortByRow'
      Hint = 'Sort'
      ImageIndex = 2
      OnExecute = ActionSortByRowExecute
      OnUpdate = ActionSortByRowUpdate
    end
    object ActionCopyFileName: TAction
      Caption = 'Copy Name to Clipboard'
      Hint = 'Sort'
      OnExecute = ActionCopyFileNameExecute
    end
    object ActionCopyPathToClipboard: TAction
      Caption = 'Copy Path to Clipboard'
      OnExecute = ActionCopyPathToClipboardExecute
    end
    object ActionShowSearchForm: TAction
      Caption = 'Search...'
      Hint = 'Search...'
      ImageIndex = 8
      ShortCut = 16467
    end
    object ActionShowFileIcons: TAction
      Caption = 'Show File  Icons'
      Hint = 'Show file  icons'
      ImageIndex = 16
    end
    object ActionAlternateRowColors: TAction
      Caption = 'Action1'
      Hint = 'Alternate row colors'
      ImageIndex = 13
    end
    object ActionAbortSearch: TAction
      Caption = 'Abort'
      Hint = 'Abort running search'
      ImageIndex = 18
      ShortCut = 16411
    end
    object ActionRefreshSearch: TAction
      Caption = 'Refresh'
      ImageIndex = 15
      ShortCut = 116
    end
    object ActionIndentLine: TAction
      Caption = 'ActionIndentLine'
      ImageIndex = 17
    end
    object ActionStatusBar: TAction
      Caption = 'Action1'
    end
    object ActionOpenWith: TAction
      Caption = 'Open with...'
      Hint = 'Open with...'
      ImageIndex = 19
      OnExecute = ActionOpenWithExecute
      OnUpdate = ActionOpenWithUpdate
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 125
    Top = 19
    object Openwith1: TMenuItem
      Action = ActionOpenWith
      Default = True
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CopyFileNameToClipboard: TMenuItem
      Action = ActionCopyFileName
    end
    object CopyPathToClipboard: TMenuItem
      Action = ActionCopyPathToClipboard
    end
  end
  object ImageListListView: TImageList
    Left = 454
    Top = 34
    Bitmap = {
      494C010106000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000404040004040400000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003D3D3D00000000000000000038383800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000040404000000000000000000000000000000000003B3B3B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000004444
      4400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005353
      5300000000000000000000000000000000000000000000000000000000000000
      0000535353000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002F2F
      2F00000000000000000000000000000000000000000000000000000000000000
      0000313131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003030
      3000000000000000000000000000000000000000000000000000000000000000
      0000323232000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005353
      5300000000000000000000000000000000000000000000000000000000000000
      0000535353000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000004444
      4400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000040404000000000000000000000000000000000003A3A3A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003D3D3D00000000000000000038383800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000414141004040400000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E5EEDC00D5E7C100D6E8C200E9F2DF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2E3F500C0C4EB00C0C4EB00E2E3F500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F4EDE200E9D9C000E9D9C000F4EDE200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C2DCA70082BA480072B32D0072B32D0073B52D0074B62D0086BC4900C5E0
      A900000000000000000000000000000000000000000000000000000000000000
      0000BDC1EA004C58CE003341D2003544D8003544D8003342D2004D59CE00BFC2
      EA00000000000000000000000000000000000000000000000000000000000000
      0000E8D7BD00C8954A00C98B2E00CF8F2F00CF8F2F00C88B2E00C5954A00E8D8
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000414141004040400000000000000000000000
      00000000000000000000000000000000000000000000000000000000000097C6
      630072B32D0072B32D0072B32D0072B32D0072B32D0073B52D0074B62D0074B6
      2D0099C86400000000000000000000000000000000000000000000000000848D
      DB003645DA003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4BE7003645
      D900888FDC00000000000000000000000000000000000000000000000000D7B6
      8400CF903000DB973400DB983400DB983400DB983400DB983400DA983400CE90
      3000D8B787000000000000000000000000000000000000000000000000000000
      000000000000000000003D3D3D00000000000000000038383800000000000000
      000000000000000000000000000000000000000000000000000097C7630074B6
      2D0073B52D0072B32D0072B32D0072B32D0072B32D0072B32D0073B52D0074B6
      2D0074B62D0099C86400000000000000000000000000000000009EA5E4003949
      E0003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4C
      E7003948E000A0A7E40000000000000000000000000000000000E0C59D00D594
      3200DB983400DB983400C4882C00C4882C00C4882C00C4882C00DB983400DB98
      3400D4943200E0C69F0000000000000000000000000000000000000000000000
      00000000000040404000000000000000000000000000000000003B3B3B000000
      00000000000000000000000000000000000000000000C4DFA70074B62D0074B6
      2D0074B62D0073B52D0099C7680090C25B0072B32D0072B32D0072B32D0073B5
      2D0074B62D0074B62D00C6E0AA000000000000000000000000003847D7003C4C
      E7003B4BE5003F4CD0003949E0003C4CE7003C4CE7003949E0003F4CD0003B4B
      E5003C4CE7003947D90000000000000000000000000000000000CE8E3200DB98
      3400DB983400DB983400EAD3AE00EDE5D700EDE5D700EAD3AE00DB983400DB98
      3400DB983400CD91330000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000004444
      4400000000000000000000000000000000000000000084BD480074B62D0074B6
      2D0074B62D009BCB6800FCFDFB00F6F8F4009CC86B0072B32D0072B32D0072B3
      2D0073B52D0074B62D0086BC4900000000000000000099A0E5003C4CE7003C4C
      E7004D5AE600E3E3E9007F87D4003949E0003949E1007F87D500E2E3E9004C5A
      E5003C4CE7003C4BE7009AA2E5000000000000000000E0C39600DB973400DB98
      3400DB983400DB983400DB983400E2CDAC00E2CDAC00DB983400DB983400DB98
      3400DB983400DA983400E1C49900000000000000000000000000000000005353
      5300000000000000000000000000000000000000000000000000000000000000
      000053535300000000000000000000000000E8F2DE0074B62D0074B62D0074B6
      2D008EC45500F8FBF400CAE3AF00C0DEA100F7F8F5009CC96C0072B32D0072B3
      2D0072B32D0073B52D0074B62D00E8F2DE0000000000606BDD003C4CE7003C4C
      E7003C4CE7008E95E800F0EFEC008289D5007C84D300F0EFEC00939BE9003C4C
      E7003C4CE7003C4CE700606CDF000000000000000000D7A45B00DB983400DB98
      3400DB983400DB983400DB983400E2CDAC00E2CDAC00DB983400DB983400DB98
      3400DB983400DB983400D7A55B00000000000000000000000000000000002F2F
      2F00000000000000000000000000000000000000000000000000000000000000
      000031313100000000000000000000000000D6E8C20074B62D0074B62D0074B6
      2D00B4D88E00D2E8BB0077B7310074B62D00BEDD9E00F7F9F6009FCA710072B3
      2D0072B32D0072B32D0073B52D00D6E9C40000000000505EDF003C4CE7003C4C
      E7003C4CE7003C4CE7008B93E500F0EFEC00F0EFEC008B93E5003C4CE7003C4C
      E7003C4CE7003C4CE700515EDF000000000000000000D59D4B00DB983400DB98
      3400DB983400DB983400DB983400E2CDAC00E2CDAC00DB983400DB983400DB98
      3400DB983400DB983400D49F4C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5E8C10074B62D0074B62D0074B6
      2D0074B62D0074B62D0074B62D0074B62D0074B62D00BADA9700F8F9F800A5CD
      790072B32D0072B32D0072B32D00D5E7C200000000005965E1003C4CE7003C4C
      E7003C4CE7003949E0008189D500F1F0EC00F1F0EC00888ED6003949E0003C4C
      E7003C4CE7003C4CE7005965E1000000000000000000D8A35200DB983400DB98
      3400DB983400DB983400D6A96400E7D9C200E5CFAD00DB983400DB983400DB98
      3400DB983400DB983400D8A35400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7F2DD0074B62D0074B62D0074B6
      2D0074B62D0074B62D0074B62D0074B62D0074B62D0074B62D00BADA9700F9F9
      F8008DC0540072B32D0072B32D00E5EEDC00000000008189E8003C4CE7003C4C
      E7003B4AE3007F87D500F0EFEC00959DE900959DE900F0EFEC007F87D5003B4A
      E3003C4CE7003C4CE700828CE9000000000000000000E1B97C00DB983400DB98
      3400DB983400DB983400DFA75200E2B57200E0AC5D00DB983400DB983400DB98
      3400DB983400DB983400E2BB7F00000000000000000000000000000000003030
      3000000000000000000000000000000000000000000000000000000000000000
      0000323232000000000000000000000000000000000086BE470074B62D0074B6
      2D0074B62D0074B62D0074B62D0074B62D0074B62D0074B62D0074B62D0099C9
      650077B6350072B32D0082BA48000000000000000000DBDEF8003C4CE7003C4C
      E7004D5BE700E8E8EB00939CE9003C4CE7003C4CE700939CE900E8E8EB004D5B
      E7003C4CE7003C4CE700DDDEF8000000000000000000F6EBD900DB973400DB98
      3400DB983400DB983400DB983400CEA05700CEA05700DB983400DB983400DB98
      3400DB983400DB973400F6EBD900000000000000000000000000000000005353
      5300000000000000000000000000000000000000000000000000000000000000
      00005353530000000000000000000000000000000000C3DEA50074B62D0074B6
      2D0074B62D0074B62D0074B62D0074B62D0074B62D0074B62D0074B62D0074B6
      2D0073B52D0072B32D00C2DCA7000000000000000000000000006F7AE9003C4C
      E7003C4CE7004F5EE8003C4CE7003C4CE7003C4CE7003C4CE7004F5EE8003C4C
      E7003C4CE700707CE80000000000000000000000000000000000E1B16A00DB98
      3400DB983400DB983400DB983400E7D1AD00E7D1AD00DB983400DB983400DB98
      3400DB983400E0B16B0000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000004444
      440000000000000000000000000000000000000000000000000096C7620074B6
      2D0074B62D0074B62D0074B62D0074B62D0074B62D0074B62D0074B62D0074B6
      2D0074B62D0097C6630000000000000000000000000000000000000000005360
      E4003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4CE7003C4C
      E7005361E500000000000000000000000000000000000000000000000000DCA2
      4C00DB983400DB983400DB983400DB983400DB983400DB983400DB983400DB98
      3400DBA34D000000000000000000000000000000000000000000000000000000
      00000000000040404000000000000000000000000000000000003A3A3A000000
      00000000000000000000000000000000000000000000000000000000000096C7
      620074B62D0074B62D0074B62D0074B62D0074B62D0074B62D0074B62D0074B6
      2D0097C763000000000000000000000000000000000000000000000000000000
      00007983EB003B4BE4003C4CE7003C4CE7003C4CE7003C4CE7003B4BE4007B85
      EB00000000000000000000000000000000000000000000000000000000000000
      0000E3B77300D8953300DB983400DB983400DB983400DB983400D8953300E4B7
      7500000000000000000000000000000000000000000000000000000000000000
      000000000000000000003D3D3D00000000000000000038383800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C4DFA70086BE470074B62D0074B62D0074B62D0074B62D0084BD4800C4DF
      A700000000000000000000000000000000000000000000000000000000000000
      000000000000DEE0F900A0A8F200838DED00838DED00A0A8F200DEE1F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7ECDD00ECCC9E00E7BD7E00E7BD7E00ECCC9E00F7ECDD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000414141004040400000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E8F2DE00D5E8C100D5E8C100E8F2DE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FE7FFFFF00000000
      FC3FFFFF00000000F81FFFFF00000000F00FFFFF00000000E007FFFF00000000
      E007FFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFE00700000000
      FFFFE00700000000FFFFF00F00000000FFFFF81F00000000FFFFFC3F00000000
      FFFFFE7F00000000FFFFFFFF00000000FC3FFC3FFC3FFFFFF00FF00FF00FFE7F
      E007E007E007FC3FC003C003C003F81F8001C003C003F00F800180018001E007
      000080018001E007000080018001FFFF000080018001FFFF000080018001E007
      800180018001E0078001C003C003F00FC003E007E007F81FE007F00FF00FFC3F
      F00FF81FF81FFE7FFC3FFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
