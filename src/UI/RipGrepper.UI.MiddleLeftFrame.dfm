object MiddleLeftFrame: TMiddleLeftFrame
  Left = 0
  Top = 0
  Width = 609
  Height = 211
  TabOrder = 0
  object VstHistory: TVirtualStringTree
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 603
    Height = 205
    Align = alClient
    Colors.BorderColor = 15987699
    Colors.DisabledColor = clGray
    Colors.DropMarkColor = 15385233
    Colors.DropTargetColor = 15385233
    Colors.DropTargetBorderColor = 15385233
    Colors.FocusedSelectionColor = 15385233
    Colors.FocusedSelectionBorderColor = 15385233
    Colors.GridLineColor = 15987699
    Colors.HeaderHotColor = clBlack
    Colors.HotColor = clBlack
    Colors.SelectionRectangleBlendColor = 15385233
    Colors.SelectionRectangleBorderColor = 15385233
    Colors.SelectionTextColor = clBlack
    Colors.TreeLineColor = 9471874
    Colors.UnfocusedColor = clGray
    Colors.UnfocusedSelectionColor = clWhite
    Colors.UnfocusedSelectionBorderColor = clWhite
    Header.AutoSizeIndex = 0
    Header.Options = [hoAutoResize, hoColumnResize, hoDblClickResize, hoDrag, hoShowSortGlyphs, hoVisible, hoFullRepaintOnResize, hoHeaderClickAutoSort, hoAutoResizeInclCaption]
    HintMode = hmHint
    ParentShowHint = False
    PopupMenu = PopupMenuHistory
    ShowHint = True
    TabOrder = 0
    TreeOptions.PaintOptions = [toShowBackground, toShowButtons, toShowDropmark, toShowTreeLines, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toFullRowSelect, toSiblingSelectConstraint]
    OnBeforeCellPaint = VstHistoryBeforeCellPaint
    OnFreeNode = VstHistoryFreeNode
    OnGetText = VstHistoryGetText
    OnPaintText = VstHistoryPaintText
    OnGetHintKind = VstHistoryGetHintKind
    OnGetHint = VstHistoryGetHint
    OnNodeClick = VstHistoryNodeClick
    OnNodeDblClick = VstHistoryNodeDblClick
    Touch.InteractiveGestures = [igPan, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    Columns = <
      item
        Position = 0
        Text = 'Search'
        Width = 603
      end
      item
        Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coSmartResize, coAllowFocus, coEditable, coStyleColor]
        Position = 1
        Text = 'Replace'
        Width = 519
      end>
    DefaultText = ''
  end
  object ActionList: TActionList
    Images = ImageList1
    Left = 251
    Top = 30
    object ActionHistoryDelete: TAction
      Caption = 'Delete'
      Hint = 'Delete Selected Item'
      ImageIndex = 2
      ShortCut = 46
      OnExecute = ActionHistoryDeleteExecute
      OnUpdate = ActionHistoryDeleteUpdate
    end
    object ActionHistoryDeleteAll: TAction
      Caption = 'Delete All'
      ImageIndex = 3
      ShortCut = 8238
      OnExecute = ActionHistoryDeleteAllExecute
      OnUpdate = ActionHistoryDeleteAllUpdate
    end
    object ActionCopyCmdLineToClipboard: TAction
      Caption = 'Copy Command Line'
      ImageIndex = 0
      OnExecute = ActionCopyCmdLineToClipboardExecute
    end
    object ActionOpenSearchForm: TAction
      Caption = 'Open Search Form...'
      ImageIndex = 0
      OnExecute = ActionOpenSearchFormExecute
    end
  end
  object PopupMenuHistory: TPopupMenu
    Images = ImageList1
    Left = 255
    Top = 113
    object pmOpenSearchForm: TMenuItem
      Action = ActionOpenSearchForm
      Default = True
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object pmCopyCommandLine: TMenuItem
      Action = ActionCopyCmdLineToClipboard
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object pmHistoryDelete: TMenuItem
      Action = ActionHistoryDelete
    end
    object pmHistoryDeleteAll: TMenuItem
      Action = ActionHistoryDeleteAll
    end
  end
  object ImageList1: TImageList
    Left = 422
    Top = 88
    Bitmap = {
      494C010108001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000DBDBDB00979797006868680052525200525252006969690099999900DFDF
      DF00000000000000000000000000000000000000000000000000000000000000
      0000DBDDF300979DE9006871E000525CDF00525DE0006972E40099A0ED00E0E1
      F800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      94004A4A4A00646464009C9C9C00B8B8B800BABABA009D9D9D00656565004B4B
      4B0097979700000000000000000000000000000000000000000000000000949B
      E8004A56DB004F5ADB007E85E400979DE900999EEC008086E900505BE0004B57
      DF00989DEC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000797979005353
      5300B9B9B900000000000000000000000000000000000000000000000000BCBC
      BC005454540079797900000000000000000000000000000000007980E8004A55
      DE00979DE900000000000000000000000000000000000000000000000000989D
      EC004B56DF007A82E800000000000000000000000000B6D3F8003688EF004291
      F1004290EE004290ED004290ED004290ED004290EE004291F1004392F2004392
      F2004392F2003689EF00B3D2F800000000000000000000000000000000000000
      000000000000CFDBBD00E2E8D700000000000000000000000000000000000000
      000000000000000000000000000000000000000000009696960054545400DEDE
      DE00000000000000000000000000C9CACA00CACACA0000000000000000000000
      0000DEDEDE0054545400979797000000000000000000959BEC004B56DF00BCC0
      F300000000000000000000000000C7CAF000C7CAF00000000000000000000000
      0000BBBFF2004B56DF00989DEC0000000000000000005199F100E8F0F900FAFA
      FA00F9F9F900F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F9F9F900FAFA
      FA00FAFAFA00E6EEF9005099F100000000000000000000000000000000000000
      0000D1DDBD0086A853008DAD5D00E2E8D7000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE004B4B4B00BEBEBE000000
      0000000000000000000000000000818181008181810000000000000000000000
      000000000000BCBCBC004B4B4B00E0E0E000DEE0F8004B57DF00999FED000000
      0000000000000000000000000000545EDD00545EDD0000000000000000000000
      000000000000989DEC004B57DF00E0E1F8000000000095C0F6008ABAF500FAFA
      FA00FAFAFA00F9F9F900F5F5F5004993EE004792EE00F5F5F500F5F5F500F9F9
      F900FAFAFA0086B8F50097C1F70000000000000000000000000000000000D1DE
      BE0088AA540088AB540087A954008CAB5D00E0E7D50000000000000000000000
      0000000000000000000000000000000000009898980067676700000000000000
      0000000000000000000000000000838383008181810000000000000000000000
      000000000000000000006565650099999900989EED00505CE000000000000000
      0000000000000000000000000000C5C9F000C5C9EF0000000000000000000000
      00000000000000000000505BE000999FED000000000000000000368AEF00E3ED
      F900FAFAFA00FAFAFA00F9F9F90075ADF10070AAEF00F5F5F500F5F5F500F5F5
      F500E3ECF8003589F00000000000000000000000000000000000D2DFBF0087AB
      550089AC5500B1C89100B3C9930087A954008DAD5D00E1E8D700000000000000
      00000000000000000000000000000000000067676700A1A1A100000000000000
      0000000000000000000000000000838383008383830000000000000000000000
      000000000000000000009F9F9F00696969006771E5007F88E900000000000000
      0000000000000000000000000000C3C7F300C2C5F00000000000000000000000
      000000000000000000008086E9006972E4000000000000000000BBD7F90067A7
      F400FAFAFA00FAFAFA00FAFAFA00AFCFF500A7C9F200F5F5F500F5F5F500F5F5
      F50062A1EF00B7D4F800000000000000000000000000D5E1C40089AA560089AC
      5500B0C78F000000000000000000B6CB970087A954008CAC5C00E0E7D5000000
      00000000000000000000000000000000000052525200B9B9B90000000000CECE
      CE008787870087878700878787005E5E5E005D5D5D0085858500858585008585
      8500CBCBCB0000000000B8B8B80054545400525EE0009CA1ED00000000000000
      00000000000000000000000000004B55DF004A55DE0000000000000000000000
      00000000000000000000999FEC00525EE0000000000000000000000000004B95
      F200CDE0F800FAFAFA00FAFAFA0081B5F4007CB2F300F5F5F500F5F5F500C8DC
      F3004F96ED00000000000000000000000000D6E2C50089AA560089AC5500B0C7
      8E0000000000000000000000000000000000B6CB970087A954008CAC5C00E0E7
      D5000000000000000000000000000000000052525200BABABA0000000000CECE
      CE008787870087878700878787005E5E5E005E5E5E0085858500858585008585
      8500CBCBCB0000000000B5B5B50051515100525DE0009BA1ED00000000000000
      00000000000000000000000000004C57E2004C57E20000000000000000000000
      00000000000000000000979FE900515DDF00000000000000000000000000D8E7
      FB004391EF00FAFAFA00FAFAFA004B96F2004694F200F9F9F900F5F5F5004490
      EA00D4E4F600000000000000000000000000B2C8900089AC5500B4CA94000000
      00000000000000000000000000000000000000000000B3C9930087A954008CAB
      5D00E1E8D70000000000000000000000000067676700A1A1A100000000000000
      0000000000000000000000000000858585008585850000000000000000000000
      000000000000000000009B9B9B00686868006771E5007F88E900000000000000
      00000000000000000000000000004C57E2004C57E20000000000000000000000
      000000000000000000007E85E4006871E0000000000000000000000000000000
      000070ABF400AECFF700FAFAFA002480F0001B7BF000FAFAFA00A8CBF60071A9
      F0000000000000000000000000000000000000000000D0DDBC00000000000000
      0000000000000000000000000000000000000000000000000000B3C9930087A9
      54008CAB5D00E0E7D50000000000000000009898980067676700000000000000
      0000000000000000000000000000858585008585850000000000000000000000
      000000000000000000006464640097979700989EED00505CE000000000000000
      00000000000000000000000000004C57E2004C57E20000000000000000000000
      000000000000000000004F5ADB00979DE9000000000000000000000000000000
      0000000000003187EF00F3F6FA008EBDF50088B9F500F4F7FA003489EE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B6CB
      970087A954008CAC5C00E0E7D40000000000DEDEDE004B4B4B00BFBFBF000000
      0000000000000000000000000000858585008585850000000000000000000000
      000000000000B9B9B9004A4A4A00DBDBDB00DEDFF8004B55DF009CA1ED000000
      00000000000000000000000000004B55DF004B55DF0000000000000000000000
      000000000000989DE9004A56DB00DBDDF3000000000000000000000000000000
      00000000000094C0F60089BAF500FAFAFA00FAFAFA0084B7F40096C1F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B6CB970087A954008CAC5C00E0E7D400000000009494940056565600DEDE
      DE00000000000000000000000000CECECE00CECECE0000000000000000000000
      0000DEDEDE0053535300949494000000000000000000929AEB004B56DF00BEC1
      F300000000000000000000000000C6C8F400C6CAF40000000000000000000000
      0000BCC0F3004A55DE00949BE800000000000000000000000000000000000000
      000000000000000000003589F100E2ECF800E4EDF9003389F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B3C9930087A95400A4BC81000000000000000000797979005656
      5600BFBFBF00000000000000000000000000000000000000000000000000BFBF
      BF005454540079797900000000000000000000000000000000007980E6004B56
      DF009CA1ED00000000000000000000000000000000000000000000000000999F
      ED004B56DF007980E70000000000000000000000000000000000000000000000
      00000000000000000000BFD9F9003388EE003489EE00C0D9F900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C4D4AC00000000000000000000000000000000009494
      94004B4B4B00676767009F9F9F00BABABA00BABABA009F9F9F00676767004B4B
      4B0096969600000000000000000000000000000000000000000000000000959A
      EC004B55DF00505CE0008188E90099A0ED00999FED008188E900505CE0004B57
      DF00959BEC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEDEDE00989898006868680052525200525252006868680098989800DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      0000DEDFF800989DEC006870E500525BE000525BE0006870E500989EED00DEE0
      F800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000747474000404
      0400000000000000000000000000000000000000000000000000000000000000
      000000000000020202005F5F5F00000000000000000000000000000000000000
      000000000000000000000000000000000000D5D5D50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007070
      7000545454005454540054545400545454005454540054545400545454005454
      5400717171000000000000000000000000000000000000000000707070005454
      540054545400545454005454540054545400545454005454540054545400A9A9
      A900000000000000000000000000000000000000000000000000040404004949
      4900878787008787870087878700878787008787870087878700878787008787
      8700878787005656560000000000000000000000000000000000000000000000
      000000000000000000000000000000000000434343002B2B2B00D9D9D9000000
      00000000000000000000000000000000000000000000000000003C3C3C002020
      2000545454005454540054545400545454005454540054545400545454005454
      5400202020003D3D3D000000000000000000000000003C3C3C00202020005454
      540054545400545454005454540054545400545454005454540054545400A9A9
      A900000000000000000000000000000000000000000000000000000000008A8A
      8A00000000000000000000000000000000000000000000000000000000000000
      000000000000A1A1A10000000000000000000000000000000000272727002C2C
      2C0062626200D4D5D50000000000000000006666660079797900262626000000
      000000000000000000000000000000000000000000000000000002020200A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000A5A5A5000202020000000000000000000000000002020200A5A5A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008A8A
      8A00000000000000000000000000000000000000000000000000000000000000
      000000000000A1A1A10000000000000000000000000000000000222222000000
      0000ABABAB0026262600D1D1D100000000006D6D6D00ACACAC008D8D8D007878
      780000000000000000000000000000000000000000000000000000000000A8A8
      A800000000009898980097979700000000000000000098989800989898000000
      0000A8A8A8000000000000000000000000000000000000000000A8A8A8000000
      000000000000000000000000000000000000B2B2B20098989800989898009898
      98009B9B9B000000000000000000000000000000000000000000000000008A8A
      8A00000000000000000000000000000000000000000000000000000000000000
      000000000000A1A1A1000000000000000000000000000000000042424200D1D1
      D1000000000099999900818181000000000030313100D4D5D500D4D4D4003E3E
      3E0000000000000000000000000000000000000000000000000000000000A8A8
      A8000000000097979700000000008C8C8C008C8C8C0000000000989898000000
      0000A8A8A8000000000000000000000000000000000000000000A8A8A8000000
      0000000000000000000000000000000000002F2F2F0010101000101010001010
      100014141400C9C9C90000000000000000000000000000000000000000008A8A
      8A00000000000000000000000000000000000000000000000000000000000000
      000000000000A1A1A10000000000000000000000000000000000B2B2B2003434
      3400B3B3B30041414100B3B3B3007373730012121200A3A3A300B7B7B7005757
      570000000000000000000000000000000000000000000000000000000000A8A8
      A80000000000000000008C8C8C0000000000000000008C8C8C00000000000000
      0000A8A8A8000000000000000000000000000000000000000000A8A8A8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008A8A
      8A00000000000000000000000000000000000000000000000000000000000000
      000000000000A1A1A1000000000000000000000000000000000000000000B4B4
      B40065656500A3A3A300767676004D4D4D00BBBBBB00707171000D0D0D006969
      690000000000000000000000000000000000000000000000000000000000A8A8
      A80000000000000000008C8C8C0000000000000000008C8C8C00000000000000
      0000A8A8A8000000000000000000000000000000000000000000A8A8A8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008A8A
      8A00000000000000000000000000000000000000000000000000000000000000
      000000000000A1A1A10000000000000000000000000000000000000000000000
      000000000000767676004D4D4D00000000000000000000000000000000004A4A
      4A005E5E5E00000000000000000000000000000000000000000000000000A8A8
      A8000000000097979700000000008C8C8C008C8C8C0000000000989898000000
      0000A8A8A8000000000000000000000000000000000000000000A8A8A8000000
      0000000000000000000000000000000000001818180000000000000000000000
      0000000000000000000000000000C1C1C1000000000000000000000000008A8A
      8A00000000000000000000000000000000000000000000000000000000000000
      000000000000A1A1A1000000000000000000CACACA0061616100848484008484
      84003D3D3D0006060600DBDBDB000000000000000000D3D3D300A8A8A8000000
      000064646400686868000000000000000000000000000000000000000000A8A8
      A800000000009898980097979700000000000000000098989800989898000000
      0000A8A8A8000000000000000000000000000000000000000000A8A8A8000000
      000000000000000000000000000000000000D0D0D000BABABA00BABABA00BABA
      BA00BABABA00BABABA00BDBDBD00000000000000000000000000000000008A8A
      8A00000000000000000000000000000000000000000000000000000000000000
      000000000000A1A1A100000000000000000000000000131313007E7E7E009999
      9900C9C9C900848484009595950000000000C8C8C80024242400606060004040
      40000000000037373700B5B5B50000000000000000000000000000000000A8A8
      A800000000000000000000000000000000000000000000000000000000000000
      0000A8A8A8000000000000000000000000000000000000000000A8A8A8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008A8A
      8A00000000000000000000000000000000000000000000000000000000000000
      000000000000A1A1A100000000000000000000000000B6B6B60026262600B2B2
      B20000000000B8B8B80023232300000000008F8F8F0080808000000000001616
      160000000000C0C0C00042424200000000000000000000000000000000001616
      1600212121002121210021212100212121002121210021212100212121002121
      2100161616000000000000000000000000000000000000000000161616002121
      2100212121002121210021212100212121002121210021212100212121002121
      2100444444000000000000000000000000000000000000000000000000008A8A
      8A00000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00A1A1A10000000000000000000000000000000000D3D3D3005353
      5300222222003838380046464600787878000000000023232300232323007474
      74000000000000000000141414000000000000000000000000009E9E9E008787
      8700878787008787870087878700878787008787870087878700878787008787
      8700878787009E9E9E000000000000000000000000009E9E9E00878787008787
      8700878787008787870087878700878787008787870087878700878787008787
      87009E9E9E000000000000000000000000000000000000000000000000008A8A
      8A00000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00A1A1A10000000000000000000000000000000000000000000000
      0000000000000000000000000000363636009595950000000000000000000000
      0000ABABAB002222220016161600CFD1D10000000000DEDEDE00A9A9A900A9A9
      A900A9A9A900C1C1C10000000000000000000000000000000000C1C1C100A9A9
      A900A9A9A900A9A9A900DEDEDE0000000000DEDEDE00A9A9A900A9A9A900A9A9
      A900C1C1C10000000000000000000000000000000000C1C1C100A9A9A900A9A9
      A900A9A9A900DEDEDE00000000000000000000000000000000001B1B1B000808
      08000E0E0E00000000000000000011111100CECECE0022222200000000000000
      00000D0D0D000A0A0A000C0C0C00000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3F005E5E5E00000000000000
      0000262626000000000044444400D1D1D1000000000074747400000000000000
      0000000000000101010000000000000000000000000000000000010101000000
      0000000000000000000074747400000000007474740000000000000000000000
      0000010101000000000000000000000000000000000001010100000000000000
      0000000000007474740000000000000000000000000000000000CFCFCF007A7A
      7A0076767600767676004949490003030300727272000B0B0B003E3E3E007676
      76007676760078787800C5C5C500000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F8F8F001F1F1F002121
      2100272727005B5B5B0017171700000000000000000000000000000000000000
      0000000000001717170035353500545454005454540035353500171717000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000171717003535350054545400545454003535350017171700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004D4D4D000808080041414100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6D6
      D600BABABA00BABABA00DADADA00000000000000000000000000000000000000
      000000000000C2C2C2005B5B5B0054545400545454005B5B5B00C3C3C3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C2C2C2005B5B5B0054545400545454005B5B5B00C3C3C300000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F00FF00FFFFFFFFFE007E007FFFFFFFF
      C7E3C7E38001F9FF8E718E718001F0FF1E781E788001E07F3E7C3E7CC003C03F
      3E7C3E7CC003861F20043E7CE0070F0F20043E7CE0071F873E7C3E7CF00FBFC3
      3E7C3E7CF81FFFE11E781E78F81FFFF08E718E71FC3FFFF8C7E3C7E3FC3FFFFD
      E007E007FFFFFFFFF00FF00FFFFFFFFFC001FF7FE007C00FC001FF1FC003800F
      CFF9C31FCFF39FFFCFF9D10FC9939F07CFF9C90FC8139F03CFF9C00FCC339FFF
      CFF9E00FCC339FFFCFF9F9E7C8139F00CFF90193C9939F01CFF98109CFF39FFF
      CFF98929C0038007C801C08DC0038007C801FE7083C10783C001FF3483C10783
      C001FF81F81FF03FFE3FFFE1F81FF03F00000000000000000000000000000000
      000000000000}
  end
end
