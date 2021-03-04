object frmLog: TfrmLog
  Left = 540
  Top = 131
  BorderStyle = bsSingle
  Caption = #26085#24535#19982#20844#21578
  ClientHeight = 347
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnShow = FormShow
  DesignSize = (
    631
    347)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 207
    Align = alTop
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 0
    object ListBox1: TListBox
      Left = 0
      Top = 0
      Width = 627
      Height = 203
      Align = alClient
      BevelInner = bvNone
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderStyle = bsNone
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 399
    Top = 307
    Width = 75
    Height = 25
    Anchors = [akTop]
    Caption = #20851#38381
    DoubleBuffered = True
    Kind = bkClose
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object btn2: TButton
    Left = 158
    Top = 307
    Width = 75
    Height = 25
    Hint = #26597#30475#24050#21457#24067#30340#31995#32479#28040#24687
    Anchors = [akTop]
    Caption = #21382#21490#28040#24687
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btn2Click
  end
  object pnl1: TPanel
    Left = 12
    Top = 217
    Width = 608
    Height = 78
    Anchors = [akLeft, akTop, akRight]
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      604
      74)
    object lbl1: TLabel
      Left = 21
      Top = 14
      Width = 96
      Height = 13
      Caption = #36755#20837#35201#21457#24067#30340#20449#24687
    end
    object edt1: TEdit
      Left = 25
      Top = 33
      Width = 465
      Height = 21
      Hint = #22312#27492#36755#20837#24744#35201#21457#24067#32473#21508#21439#21306#30340#28040#24687#25991#23383#12290
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btn1: TButton
      Left = 496
      Top = 31
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #21457#24067
      TabOrder = 1
      OnClick = btn1Click
    end
  end
  object btn3: TButton
    Left = 277
    Top = 307
    Width = 75
    Height = 25
    Anchors = [akTop]
    Caption = #28165#31354#26085#24535
    TabOrder = 4
    OnClick = btn3Click
  end
  object AQuery1: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 513
    Top = 108
  end
end
