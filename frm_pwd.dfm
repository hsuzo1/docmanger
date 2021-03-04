object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #20462#25913#29992#25143#23494#30721
  ClientHeight = 172
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 23
    Top = 16
    Width = 268
    Height = 105
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 51
      Top = 16
      Width = 48
      Height = 13
      Caption = #21407#23494#30721#65306
    end
    object Label2: TLabel
      Left = 51
      Top = 43
      Width = 48
      Height = 13
      Caption = #26032#23494#30721#65306
    end
    object Label3: TLabel
      Left = 27
      Top = 70
      Width = 72
      Height = 13
      Caption = #30830#35748#26032#23494#30721#65306
    end
    object MaskEdit1: TMaskEdit
      Left = 105
      Top = 13
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
    end
    object MaskEdit2: TMaskEdit
      Left = 105
      Top = 40
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object MaskEdit3: TMaskEdit
      Left = 105
      Top = 67
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
      OnKeyDown = MaskEdit3KeyDown
    end
  end
  object BitBtn1: TBitBtn
    Left = 61
    Top = 135
    Width = 75
    Height = 25
    Caption = #30830#23450'(&O)'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object Button1: TButton
    Left = 179
    Top = 135
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 2
    OnClick = Button1Click
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 8
    Top = 8
  end
end
