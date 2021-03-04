object frm_BKMX: Tfrm_BKMX
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'frm_BKMX'
  ClientHeight = 722
  ClientWidth = 1360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1360
    722)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_title: TLabel
    Left = 545
    Top = 14
    Width = 270
    Height = 27
    Anchors = [akTop]
    Caption = #19987#39033#36164#37329#22522#26412#20449#24687#31649#29702
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl_year: TLabel
    Left = 48
    Top = 120
    Width = 48
    Height = 13
    Caption = #39044#31639#24180#24230
  end
  object lbl_item: TLabel
    Left = 328
    Top = 120
    Width = 72
    Height = 13
    Caption = #19987#39033#36164#37329#21517#31216
  end
  object lbl_skdw: TLabel
    Left = 696
    Top = 200
    Width = 48
    Height = 13
    Caption = #25910#27454#21333#20301
  end
  object lbl_account: TLabel
    Left = 696
    Top = 227
    Width = 48
    Height = 13
    Caption = #25910#27454#36134#21495
  end
  object lbl_bank: TLabel
    Left = 696
    Top = 254
    Width = 48
    Height = 13
    Caption = #24320#25143#38134#34892
  end
  object lbl_yongtu: TLabel
    Left = 64
    Top = 296
    Width = 24
    Height = 13
    Caption = #29992#36884
  end
  object lbl_memo: TLabel
    Left = 696
    Top = 308
    Width = 48
    Height = 13
    Caption = #22791'        '#27880
  end
  object lbl_money: TLabel
    Left = 696
    Top = 281
    Width = 48
    Height = 13
    Caption = #37329'        '#39069
  end
  object lbl_date: TLabel
    Left = 48
    Top = 152
    Width = 48
    Height = 13
    Caption = #25320#27454#26085#26399
  end
  object lbl_zjly: TLabel
    Left = 48
    Top = 216
    Width = 48
    Height = 13
    Caption = #36164#37329#26469#28304
  end
  object lbl_availabe: TLabel
    Left = 224
    Top = 216
    Width = 48
    Height = 13
    Caption = #21487#29992#20313#39069
  end
  object lbl_daxie: TLabel
    Left = 989
    Top = 281
    Width = 48
    Height = 13
    Caption = #22823#20889#37329#39069
  end
  object lbl_DX: TLabel
    Left = 1043
    Top = 278
    Width = 60
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Caption = 'lbl_DX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 905
    Top = 281
    Width = 36
    Height = 13
    Caption = #65288#20803#65289
  end
  object btn_close: TButton
    Left = 1253
    Top = 24
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #20851#38381'(&C)'
    TabOrder = 0
    OnClick = btn_closeClick
  end
  object cbb_year: TComboBox
    Left = 102
    Top = 117
    Width = 91
    Height = 21
    TabOrder = 1
  end
  object edt_yongtu: TEdit
    Left = 94
    Top = 293
    Width = 475
    Height = 21
    TabOrder = 8
  end
  object edt_money: TEdit
    Left = 750
    Top = 278
    Width = 153
    Height = 21
    Alignment = taRightJustify
    TabOrder = 7
    Text = '0'
    OnChange = edt_moneyChange
    OnEnter = edt_moneyEnter
    OnExit = edt_moneyExit
    OnKeyPress = edt_moneyKeyPress
  end
  object dtp1: TDateTimePicker
    Left = 102
    Top = 144
    Width = 91
    Height = 21
    Date = 42811.475220266210000000
    Time = 42811.475220266210000000
    TabOrder = 3
  end
  object tv1: TTreeView
    Left = 64
    Top = 408
    Width = 239
    Height = 185
    Indent = 19
    TabOrder = 10
    Items.NodeData = {
      03060000001E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000100000001001E0000000000000000000000FFFFFFFFFFFFFFFF0000000000
      0000000100000001001E0000000000000000000000FFFFFFFFFFFFFFFF000000
      00000000000000000001001E0000000000000000000000FFFFFFFFFFFFFFFF00
      000000000000000000000001001E0000000000000000000000FFFFFFFFFFFFFF
      FF00000000000000000000000001001E0000000000000000000000FFFFFFFFFF
      FFFFFF00000000000000000000000001001E0000000000000000000000FFFFFF
      FFFFFFFFFF00000000000000000000000001001E0000000000000000000000FF
      FFFFFFFFFFFFFF0000000000000000000000000100}
  end
  object cbb_item: TComboBox
    Left = 406
    Top = 117
    Width = 395
    Height = 21
    TabOrder = 2
  end
  object cbb_unit: TComboBox
    Left = 750
    Top = 197
    Width = 313
    Height = 21
    TabOrder = 4
  end
  object cbb_account: TComboBox
    Left = 750
    Top = 224
    Width = 249
    Height = 21
    TabOrder = 5
  end
  object cbb_bank: TComboBox
    Left = 750
    Top = 251
    Width = 249
    Height = 21
    TabOrder = 6
  end
  object mmo1: TMemo
    Left = 750
    Top = 305
    Width = 313
    Height = 144
    TabOrder = 9
  end
  object Button1: TButton
    Left = 784
    Top = 504
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 11
  end
  object Button2: TButton
    Left = 905
    Top = 504
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 12
  end
end
