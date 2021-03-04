object frm_DWXX: Tfrm_DWXX
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'frm_DWXX'
  ClientHeight = 628
  ClientWidth = 1360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    1360
    628)
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitle: TLabel
    Left = 599
    Top = 12
    Width = 162
    Height = 27
    Anchors = [akTop]
    Caption = #21333#20301#20449#24687#31649#29702
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object pgc2: TPageControl
    Left = 8
    Top = 251
    Width = 1344
    Height = 369
    ActivePage = ts3
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object ts3: TTabSheet
      Caption = #21333#20301#26126#32454#25968#25454
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 1336
        Height = 341
        Align = alClient
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object ts4: TTabSheet
      Caption = #38134#34892#36134#21495#21015#34920
      ImageIndex = 1
      object dbgrd2: TDBGrid
        Left = 0
        Top = 0
        Width = 1336
        Height = 341
        Align = alClient
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object pgc1: TPageControl
    Left = 8
    Top = 56
    Width = 1344
    Height = 193
    ActivePage = ts1
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    OnChange = pgc1Change
    object ts1: TTabSheet
      Caption = #21333#20301#22522#26412#20449#24687
      object lbl_name: TLabel
        Left = 27
        Top = 14
        Width = 48
        Height = 13
        Caption = #21333#20301#21517#31216
      end
      object lbl_zone: TLabel
        Left = 632
        Top = 14
        Width = 48
        Height = 13
        Caption = #25152#22312#22320#21306
      end
      object lbl_type: TLabel
        Left = 996
        Top = 14
        Width = 48
        Height = 13
        Caption = #21333#20301#31867#21035
      end
      object lbl_address: TLabel
        Left = 27
        Top = 41
        Width = 48
        Height = 13
        Caption = #27880#20876#22320#22336
      end
      object lbl_zzjgdm: TLabel
        Left = 608
        Top = 41
        Width = 72
        Height = 13
        Caption = #32452#32455#26426#26500#20195#30721
      end
      object lbl_gsdjhm: TLabel
        Left = 872
        Top = 41
        Width = 172
        Height = 13
        Caption = #24037#21830#30331#35760#21495#30721'/'#32479#19968#31038#20250#20449#29992#20195#30721
      end
      object lbl_tax: TLabel
        Left = 15
        Top = 68
        Width = 60
        Height = 13
        Caption = #32435#31246#35782#21035#21495
      end
      object lbl_fr: TLabel
        Left = 632
        Top = 68
        Width = 48
        Height = 13
        Caption = #27861#20154#20195#34920
      end
      object lbl_frID: TLabel
        Left = 984
        Top = 68
        Width = 60
        Height = 13
        Caption = #36523#20221#35777#20214#21495
      end
      object lbl_lxr1: TLabel
        Left = 33
        Top = 95
        Width = 42
        Height = 13
        Caption = #32852#31995#20154'1'
      end
      object lbl_phone1: TLabel
        Left = 210
        Top = 95
        Width = 54
        Height = 13
        Caption = #32852#31995#30005#35805'1'
      end
      object lbl1: TLabel
        Left = 33
        Top = 122
        Width = 42
        Height = 13
        Caption = #32852#31995#20154'2'
      end
      object lbl2: TLabel
        Left = 210
        Top = 122
        Width = 54
        Height = 13
        Caption = #32852#31995#30005#35805'2'
      end
      object lbl_memo: TLabel
        Left = 632
        Top = 95
        Width = 48
        Height = 13
        Caption = #22791#27880#20869#23481
      end
      object lbl3: TLabel
        Left = 567
        Top = 14
        Width = 7
        Height = 13
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_name: TEdit
        Left = 81
        Top = 11
        Width = 480
        Height = 21
        MaxLength = 80
        TabOrder = 0
      end
      object cbb_diqu: TComboBox
        Left = 686
        Top = 11
        Width = 121
        Height = 21
        Style = csDropDownList
        DropDownCount = 18
        TabOrder = 1
        Items.Strings = (
          #38738#31168#21306
          #20852#23425#21306
          #35199#20065#22616#21306
          #27743#21335#21306
          #37013#23425#21306
          #33391#24198#21306
          #27494#40483#21306
          #39640#26032#21306
          #32463#24320#21306
          #19996#30431#32463#24320#21306
          #38738#31168#23665#39118#26223#21306
          #27178#21439
          #23486#38451#21439
          #19978#26519#21439
          #39532#23665#21439
          #38534#23433#21439)
      end
      object rb_company: TRadioButton
        Left = 1050
        Top = 13
        Width = 49
        Height = 17
        Caption = #26426#26500
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object rb_person: TRadioButton
        Left = 1112
        Top = 13
        Width = 58
        Height = 17
        Caption = #20010#20307
        TabOrder = 3
      end
      object edt_address: TEdit
        Left = 81
        Top = 38
        Width = 480
        Height = 21
        TabOrder = 4
      end
      object edt_zzjgdm: TEdit
        Left = 686
        Top = 38
        Width = 121
        Height = 21
        MaxLength = 30
        TabOrder = 5
      end
      object edt_gsdjhm: TEdit
        Left = 1050
        Top = 38
        Width = 199
        Height = 21
        MaxLength = 30
        TabOrder = 6
      end
      object edt_tax: TEdit
        Left = 81
        Top = 65
        Width = 168
        Height = 21
        MaxLength = 25
        NumbersOnly = True
        TabOrder = 7
      end
      object edt_fr: TEdit
        Left = 686
        Top = 65
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 8
      end
      object edt_frID: TEdit
        Left = 1050
        Top = 65
        Width = 199
        Height = 21
        MaxLength = 18
        TabOrder = 9
      end
      object edt_lxr1: TEdit
        Left = 81
        Top = 92
        Width = 96
        Height = 21
        TabOrder = 10
      end
      object edt_phone1: TEdit
        Left = 270
        Top = 92
        Width = 121
        Height = 21
        MaxLength = 15
        NumbersOnly = True
        TabOrder = 11
      end
      object edt_lxr2: TEdit
        Left = 81
        Top = 119
        Width = 96
        Height = 21
        TabOrder = 16
      end
      object edt_phone2: TEdit
        Left = 270
        Top = 119
        Width = 121
        Height = 21
        MaxLength = 15
        NumbersOnly = True
        TabOrder = 17
      end
      object mmo1: TMemo
        Left = 686
        Top = 92
        Width = 299
        Height = 70
        MaxLength = 500
        TabOrder = 12
      end
      object btn_addCompany: TButton
        Left = 996
        Top = 108
        Width = 75
        Height = 25
        Caption = #26032#22686
        TabOrder = 13
      end
      object btn_delCom: TButton
        Left = 1095
        Top = 108
        Width = 75
        Height = 25
        Caption = #20572#29992
        TabOrder = 14
      end
      object btn_modiCom: TButton
        Left = 1191
        Top = 108
        Width = 75
        Height = 25
        Caption = #20462#25913
        TabOrder = 15
      end
    end
    object ts2: TTabSheet
      Caption = #38134#34892#36134#21495#20449#24687
      ImageIndex = 1
      object lbl_BKname: TLabel
        Left = 27
        Top = 41
        Width = 48
        Height = 13
        Caption = #36134#25143#21517#31216
      end
      object lbl_khh: TLabel
        Left = 27
        Top = 68
        Width = 48
        Height = 13
        Caption = #24320#25143#38134#34892
      end
      object lbl_acc: TLabel
        Left = 27
        Top = 95
        Width = 48
        Height = 13
        Caption = #36134'        '#21495
      end
      object lbl_state: TLabel
        Left = 27
        Top = 120
        Width = 48
        Height = 13
        Caption = #29366'        '#24577
      end
      object lbl_ssdw: TLabel
        Left = 27
        Top = 14
        Width = 48
        Height = 13
        Caption = #25152#23646#21333#20301
      end
      object edt_AccountBank: TEdit
        Left = 81
        Top = 65
        Width = 488
        Height = 21
        TabOrder = 2
      end
      object cbb_accOnwer: TComboBox
        Left = 81
        Top = 11
        Width = 571
        Height = 21
        TabOrder = 0
      end
      object cbb_AccountName: TComboBox
        Left = 81
        Top = 38
        Width = 488
        Height = 21
        TabOrder = 1
      end
      object btn1: TButton
        Left = 996
        Top = 108
        Width = 75
        Height = 25
        Caption = #26032#22686
        TabOrder = 4
      end
      object btn2: TButton
        Left = 1191
        Top = 108
        Width = 75
        Height = 25
        Caption = #20462#25913
        TabOrder = 6
      end
      object btn3: TButton
        Left = 1095
        Top = 108
        Width = 75
        Height = 25
        Caption = #20572#29992
        TabOrder = 5
      end
      object chk_Accstate: TCheckBox
        Left = 81
        Top = 119
        Width = 58
        Height = 17
        Caption = #21551#29992
        TabOrder = 7
      end
      object edt_Account: TEdit
        Left = 81
        Top = 92
        Width = 272
        Height = 21
        MaxLength = 30
        NumbersOnly = True
        TabOrder = 3
      end
    end
  end
  object c: TButton
    Left = 1253
    Top = 16
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #20851#38381'(&C)'
    TabOrder = 0
    OnClick = cClick
  end
end
