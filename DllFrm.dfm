object DllForm: TDllForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = #25968#25454#36681#21462
  ClientHeight = 348
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DLLPanel1: TPanel
    Left = 0
    Top = 305
    Width = 556
    Height = 43
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      556
      43)
    object Button2: TButton
      Left = 369
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 0
    Width = 556
    Height = 305
    Align = alClient
    AutoFitColWidths = True
    DataGrouping.GroupLevels = <>
    DataSource = DS1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    ReadOnly = True
    RowDetailPanel.Color = clBtnFace
    RowHeight = 20
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object DS1: TDataSource
    Left = 32
    Top = 48
  end
end
