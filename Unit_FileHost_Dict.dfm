object Frm_Dict: TFrm_Dict
  Left = 480
  Top = 104
  BorderStyle = bsDialog
  Caption = #23383#20856#32500#25252
  ClientHeight = 413
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tbc1: TTabControl
    Left = 0
    Top = 0
    Width = 598
    Height = 365
    Align = alTop
    MultiLine = True
    TabHeight = 25
    TabOrder = 0
    Tabs.Strings = (
      #25991#21495
      #20027#36865#21333#20301
      #25311#31295#21333#20301)
    TabIndex = 0
    OnChange = tbc1Change
    object dbgrd1: TDBGrid
      Left = 4
      Top = 31
      Width = 590
      Height = 330
      Align = alClient
      Ctl3D = False
      DataSource = ds1
      DrawingStyle = gdsClassic
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnl1: TPanel
    Left = 5
    Top = 367
    Width = 588
    Height = 41
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object dbnvgr1: TDBNavigator
      Left = 34
      Top = 6
      Width = 234
      Height = 25
      DataSource = ds1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Hints.Strings = (
        #24320#22987
        #21069#19968#26465
        #19979#19968#26465
        #26368#21518
        #25554#20837
        #21024#38500
        #20462#25913
        #25552#20132
        #21462#28040
        #21047#26032)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btn_Close: TButton
      Left = 394
      Top = 6
      Width = 75
      Height = 25
      Caption = #20851#38381'(&C)'
      TabOrder = 1
      OnClick = btn_CloseClick
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 272
    Top = 104
  end
  object qry1: TADOQuery
    Connection = frmFilehostQry.con1
    Parameters = <>
    Left = 208
    Top = 104
  end
end
