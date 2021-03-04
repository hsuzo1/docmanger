object Frm_Edit: TFrm_Edit
  Left = 380
  Top = 83
  BorderStyle = bsDialog
  Caption = #25968#25454#20462#25913
  ClientHeight = 302
  ClientWidth = 599
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
  object btn1: TButton
    Left = 154
    Top = 260
    Width = 75
    Height = 25
    Hint = #20445#23384#20462#25913#21518#30340#25968#25454
    Caption = #20445#23384'(&S)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 262
    Top = 260
    Width = 75
    Height = 25
    Hint = #25918#24323#20462#25913
    Caption = #21462#28040'(&C)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btn2Click
  end
  object pnl1: TPanel
    Left = 14
    Top = 11
    Width = 572
    Height = 230
    Align = alCustom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 28
      Top = 29
      Width = 48
      Height = 13
      Caption = #25991#20214#32534#21495
    end
    object lbl1: TLabel
      Left = 28
      Top = 56
      Width = 48
      Height = 13
      Caption = #20844#25991#25991#21495
    end
    object lbl9: TLabel
      Left = 397
      Top = 56
      Width = 48
      Height = 13
      Caption = #23494'        '#32423
    end
    object lbl3: TLabel
      Left = 28
      Top = 83
      Width = 48
      Height = 13
      Caption = #20844#25991#26631#39064
    end
    object lbl6: TLabel
      Left = 28
      Top = 112
      Width = 48
      Height = 13
      Caption = #20027#36865#21333#20301
    end
    object lbl4: TLabel
      Left = 28
      Top = 137
      Width = 48
      Height = 13
      Caption = #25311'  '#31295'  '#20154
    end
    object lbl8: TLabel
      Left = 28
      Top = 164
      Width = 48
      Height = 13
      Caption = #22791#27880#20107#39033
    end
    object lbl7: TLabel
      Left = 397
      Top = 112
      Width = 48
      Height = 13
      Caption = #25991#31181#31867#21035
    end
    object lbl5: TLabel
      Left = 397
      Top = 137
      Width = 48
      Height = 13
      Caption = #21360#21457#26085#26399
    end
    object lbl_xxgk: TLabel
      Left = 28
      Top = 191
      Width = 48
      Height = 13
      Caption = #20844#24320#36873#39033
    end
    object edt1: TEdit
      Left = 82
      Top = 26
      Width = 91
      Height = 21
      Alignment = taCenter
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object cbb_Secure: TComboBox
      Left = 451
      Top = 53
      Width = 89
      Height = 21
      TabOrder = 2
      OnChange = cbb_SecureChange
      OnKeyPress = cbb_SecureKeyPress
      Items.Strings = (
        ''
        #32477#23494
        #26426#23494
        #31192#23494)
    end
    object edt_Title: TEdit
      Left = 82
      Top = 80
      Width = 458
      Height = 21
      TabOrder = 3
    end
    object cbb_Send: TComboBox
      Left = 82
      Top = 107
      Width = 275
      Height = 21
      DropDownCount = 40
      TabOrder = 4
      OnDropDown = cbb_SendDropDown
    end
    object cbb_Creater: TComboBox
      Left = 82
      Top = 134
      Width = 163
      Height = 21
      Hint = #35831#36755#20837#25311#31295#20154#22995#21517#65292#22914#19981#26159#26412#31185#21457#25991#25110#26080#27861#30830#23450#25311#31295#20154#30340#65292#35831#29992#21457#25991#21333#20301#31616#31216#20195#26367#12290
      DropDownCount = 18
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnDropDown = cbb_CreaterDropDown
    end
    object edt_Memo: TEdit
      Left = 82
      Top = 161
      Width = 458
      Height = 21
      TabOrder = 8
    end
    object cbb_Type: TComboBox
      Left = 451
      Top = 107
      Width = 89
      Height = 21
      Hint = #22914#19981#33021#30830#23450#31867#22411#65292#35831#36873#25321#8220#20854#20182#26410#30693#8221
      DropDownCount = 20
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnKeyPress = cbb_TypeKeyPress
      Items.Strings = (
        ''
        #36890#30693
        #35831#31034
        #24847#35265
        #25253#21578
        #20989
        #25209#22797
        #32426#35201
        #20915#35758
        #20915#23450
        #21629#20196#65288#20196#65289
        #20844#25253
        #20844#21578
        #36890#21578
        #36890#25253
        #35758#26696
        #20854#20182#26410#30693
        #39046#23548#25209#25991)
    end
    object dtp1: TDateTimePicker
      Left = 451
      Top = 134
      Width = 89
      Height = 21
      Date = 36601.000000000000000000
      Time = 36601.000000000000000000
      MaxDate = 47118.000000000000000000
      MinDate = 36526.000000000000000000
      TabOrder = 7
    end
    object edt_Name: TEdit
      Left = 82
      Top = 53
      Width = 163
      Height = 21
      TabOrder = 1
    end
    object cbb_xxgk: TComboBox
      Left = 82
      Top = 188
      Width = 163
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 9
      Text = #20027#21160#20844#24320
      Items.Strings = (
        #20027#21160#20844#24320
        #20381#30003#35831#20844#24320
        #19981#20104#20844#24320)
    end
  end
  object btn3: TButton
    Left = 370
    Top = 260
    Width = 75
    Height = 25
    Hint = #20851#38381#24403#21069#31383#21475#65292#36820#22238#20027#31243#24207#12290
    Caption = #20851#38381'(&Q)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btn3Click
  end
  object qry_Edit: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 16
    Top = 232
  end
end
