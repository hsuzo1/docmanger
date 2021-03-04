object Form4: TForm4
  Left = 600
  Top = 263
  BorderStyle = bsDialog
  Caption = #36719#20214#21457#24067
  ClientHeight = 287
  ClientWidth = 485
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 28
    Top = 13
    Width = 429
    Height = 266
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object btn1: TSpeedButton
      Left = 387
      Top = 118
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btn1Click
    end
    object lbl_down: TLabel
      Left = 10
      Top = 94
      Width = 48
      Height = 13
      Caption = #19979#36733#22320#22336
    end
    object lbl_path: TLabel
      Left = 10
      Top = 67
      Width = 48
      Height = 13
      Caption = #21457#24067#36335#24452
    end
    object lbl1: TLabel
      Left = 16
      Top = 40
      Width = 42
      Height = 13
      Caption = 'FTP'#29992#25143
    end
    object lbl2: TLabel
      Left = 221
      Top = 40
      Width = 42
      Height = 13
      Caption = 'FTP'#23494#30721
    end
    object lbl3: TLabel
      Left = 221
      Top = 13
      Width = 42
      Height = 13
      Caption = 'FTP'#31471#21475
    end
    object lbl4: TLabel
      Left = 10
      Top = 121
      Width = 48
      Height = 13
      Caption = #36873#25321#25991#20214
    end
    object lbl5: TLabel
      Left = 16
      Top = 13
      Width = 42
      Height = 13
      Caption = 'FTP'#22320#22336
    end
    object lbl6: TLabel
      Left = 215
      Top = 148
      Width = 48
      Height = 13
      Caption = #21457#24067#21517#31216
    end
    object lbl7: TLabel
      Left = 10
      Top = 148
      Width = 48
      Height = 13
      Caption = #36719#20214#29256#26412
    end
    object lbl8: TLabel
      Left = 10
      Top = 175
      Width = 48
      Height = 13
      Caption = #21151#33021#35828#26126
    end
    object btn2: TButton
      Left = 110
      Top = 220
      Width = 75
      Height = 25
      Caption = #21457#24067
      TabOrder = 11
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 228
      Top = 220
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 12
      OnClick = btn3Click
    end
    object edt_downpath: TEdit
      Left = 64
      Top = 91
      Width = 321
      Height = 21
      Hint = #22914#65306'http://10.56.96.19/download/zxztbs/'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Text = 'http://10.56.96.241/download/zxztbs/'
    end
    object edt_path: TEdit
      Left = 64
      Top = 64
      Width = 321
      Height = 21
      Hint = #35831#36755#20837#23384#25918#36335#24452#65292#22914#65306'download/ZxzTBS/'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Text = 'zxztbs/'
    end
    object edt1: TEdit
      Left = 64
      Top = 118
      Width = 321
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
    object edt2: TEdit
      Left = 64
      Top = 37
      Width = 121
      Height = 21
      TabOrder = 2
      OnKeyDown = edt2KeyDown
    end
    object edt3: TEdit
      Left = 64
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '10.56.96.241'
    end
    object edt4: TEdit
      Left = 269
      Top = 10
      Width = 34
      Height = 21
      TabOrder = 1
      Text = '2121'
    end
    object edt5: TEdit
      Left = 269
      Top = 145
      Width = 116
      Height = 21
      TabOrder = 8
      Text = 'xcsoft.msi'
    end
    object edt6: TEdit
      Left = 64
      Top = 145
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object edt7: TEdit
      Left = 64
      Top = 172
      Width = 321
      Height = 21
      TabOrder = 9
    end
    object medt1: TMaskEdit
      Left = 269
      Top = 37
      Width = 116
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
    object pb1: TProgressBar
      Left = 28
      Top = 200
      Width = 369
      Height = 12
      TabOrder = 10
      Visible = False
    end
  end
  object dlgOpen1: TOpenDialog
    Filter = 'MSI'#25991#20214'|*.msi|EXE'#25991#20214'|*.exe|ZIP'#21387#32553#25991#20214'|*.zip|RAR'#21387#32553#25991#20214'|*.rar|7z'#21387#32553#25991#20214'|*.7z'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofNoTestFileCreate, ofEnableSizing, ofDontAddToRecent]
    Title = #36873#25321#24453#21457#24067#31243#24207
    Left = 48
    Top = 224
  end
  object idftp2: TIdFTP
    OnStatus = idftp2Status
    OnWork = idftp2Work
    OnWorkBegin = idftp2WorkBegin
    IPVersion = Id_IPv4
    AutoLogin = True
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 360
    Top = 232
  end
  object qry1: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 400
    Top = 232
  end
end
