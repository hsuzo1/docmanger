object FrmLogin: TFrmLogin
  Left = 269
  Top = 264
  BorderStyle = bsDialog
  Caption = #20844#25991#31649#29702#36719#20214'  V20200108'
  ClientHeight = 332
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object BtnExit: TBitBtn
    Left = 207
    Top = 117
    Width = 75
    Height = 25
    Caption = #36864#20986
    DoubleBuffered = True
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BtnExitClick
  end
  object BtnLogin: TBitBtn
    Left = 118
    Top = 117
    Width = 75
    Height = 25
    Caption = #30331#24405
    DoubleBuffered = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    NumGlyphs = 2
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    OnClick = BtnLoginClick
  end
  object BitBtn1: TBitBtn
    Left = 29
    Top = 117
    Width = 75
    Height = 25
    Hint = #35774#32622#25253#34920#26381#21153#22120#26377#20851#21442#25968
    Caption = #35774#32622
    DoubleBuffered = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object Panel1: TPanel
    Left = 29
    Top = 8
    Width = 253
    Height = 103
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 44
      Width = 36
      Height = 12
      Caption = #29992#25143#21517
      Transparent = True
    end
    object Label2: TLabel
      Left = 40
      Top = 70
      Width = 36
      Height = 12
      Caption = #23494'  '#30721
      Transparent = True
    end
    object lbl_dpt: TLabel
      Left = 40
      Top = 18
      Width = 36
      Height = 12
      Caption = #37096'  '#38376
    end
    object ComboEmpl: TComboBox
      Left = 82
      Top = 41
      Width = 131
      Height = 20
      Style = csDropDownList
      DropDownCount = 20
      TabOrder = 1
      OnCloseUp = ComboEmplCloseUp
      OnDropDown = ComboEmplDropDown
      OnKeyDown = ComboEmplKeyDown
    end
    object EdtPass: TEdit
      Left = 82
      Top = 67
      Width = 131
      Height = 20
      PasswordChar = '*'
      TabOrder = 2
      OnKeyDown = EdtPassKeyDown
    end
    object cbb_dpt: TComboBox
      Left = 82
      Top = 15
      Width = 131
      Height = 20
      Style = csDropDownList
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 10
    Top = 170
    Width = 291
    Height = 153
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 5
    object Label4: TLabel
      Left = 39
      Top = 44
      Width = 36
      Height = 12
      Caption = #29992#25143#21517
    end
    object Label5: TLabel
      Left = 27
      Top = 70
      Width = 48
      Height = 12
      Caption = #29992#25143#23494#30721
    end
    object Label6: TLabel
      Left = 15
      Top = 18
      Width = 60
      Height = 12
      Caption = #26381#21153#22120#22320#22336
    end
    object lbl1: TLabel
      Left = 27
      Top = 96
      Width = 48
      Height = 12
      Caption = #25968#25454#21517#31216
    end
    object Edit1: TEdit
      Left = 82
      Top = 15
      Width = 193
      Height = 20
      Hint = ' IP'#22320#22336#26684#24335#20026#65306'xxx.xxx.xxx.xxx '#13#10' '#20363#22914#65306'192.168.1.1 '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 82
      Top = 41
      Width = 193
      Height = 20
      TabOrder = 1
    end
    object Button1: TButton
      Left = 108
      Top = 119
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 4
      OnClick = Button1Click
    end
    object Edit3: TMaskEdit
      Left = 82
      Top = 67
      Width = 193
      Height = 20
      PasswordChar = '*'
      TabOrder = 2
    end
    object edt_dbname: TEdit
      Left = 82
      Top = 93
      Width = 193
      Height = 20
      TabOrder = 3
    end
  end
  object ProgressBar1: TProgressBar
    Left = 12
    Top = 147
    Width = 286
    Height = 11
    TabOrder = 4
    Visible = False
  end
  object ADOQuery: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 72
    Top = 240
  end
  object idhttp1: TIdHTTP
    OnWork = idhttp1Work
    OnWorkBegin = idhttp1WorkBegin
    OnWorkEnd = idhttp1WorkEnd
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 150
    Top = 239
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 227
    Top = 239
  end
  object ADOCheck: TADOConnection
    ConnectionTimeout = 1
    Left = 120
    Top = 176
  end
  object tmr1: TTimer
    Interval = 300
    OnTimer = tmr1Timer
    Left = 8
    Top = 8
  end
end
