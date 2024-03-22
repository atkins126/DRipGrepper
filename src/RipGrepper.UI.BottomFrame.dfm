object RipGrepperBottomFrame: TRipGrepperBottomFrame
  Left = 0
  Top = 0
  Width = 800
  Height = 30
  Margins.Left = 8
  Margins.Top = 8
  Margins.Right = 8
  Margins.Bottom = 8
  Align = alBottom
  TabOrder = 0
  object pnlBottom: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 30
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      800
      30)
    object StatusBar1: TStatusBar
      Left = 0
      Top = 0
      Width = 800
      Height = 30
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 80
      Margins.Bottom = 8
      Action = ActionStatusBar
      Align = alClient
      Panels = <
        item
          Width = 300
        end
        item
          Alignment = taCenter
          Text = 'READY'
          Width = 175
        end
        item
          Alignment = taRightJustify
          Text = 'RipGrepper v1.0.0      '
          Width = 375
        end>
    end
    object ActivityIndicator1: TActivityIndicator
      Left = 735
      Top = 0
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Anchors = [akRight, akBottom]
      IndicatorSize = aisSmall
    end
  end
  object ActionList: TActionList
    Left = 227
    Top = 65531
    object ActionStatusBar: TAction
      OnUpdate = ActionStatusBarUpdate
    end
  end
end
