object frm_iteminfo: Tfrm_iteminfo
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'frm_iteminfo'
  ClientHeight = 676
  ClientWidth = 1360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1360
    676)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_title: TLabel
    Left = 545
    Top = 12
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
  object pgc1: TPageControl
    Left = 8
    Top = 55
    Width = 1344
    Height = 138
    ActivePage = ts1
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    OnChange = pgc1Change
    object ts1: TTabSheet
      Caption = #19987#39033#36164#37329#32500#25252
      object lbl_zxdm: TLabel
        Left = 12
        Top = 18
        Width = 72
        Height = 13
        Caption = #19987#39033#36164#37329#20195#30721
      end
      object lbl_year: TLabel
        Left = 260
        Top = 18
        Width = 48
        Height = 13
        Caption = #36130#25919#24180#24230
      end
      object lbl_name: TLabel
        Left = 444
        Top = 18
        Width = 72
        Height = 13
        Caption = #19987#39033#36164#37329#21517#31216
      end
      object lbl_type: TLabel
        Left = 876
        Top = 18
        Width = 48
        Height = 13
        Caption = #19987#39033#31867#22411
      end
      object lbl_mode: TLabel
        Left = 12
        Top = 45
        Width = 72
        Height = 13
        Caption = #36164#37329#31649#29702#27169#24335
      end
      object lbl_kmdm: TLabel
        Left = 260
        Top = 45
        Width = 48
        Height = 13
        Caption = #21151#33021#31185#30446
      end
      object lbl_jici: TLabel
        Left = 444
        Top = 45
        Width = 72
        Height = 13
        Caption = #19987#39033#36164#37329#32423#27425
      end
      object lbl_statyear: TLabel
        Left = 876
        Top = 45
        Width = 48
        Height = 13
        Caption = #36215#22987#24180#24230
      end
      object lbl_endyear: TLabel
        Left = 1025
        Top = 45
        Width = 48
        Height = 13
        Caption = #32467#26463#24180#24230
      end
      object lbl_zgbm: TLabel
        Left = 36
        Top = 72
        Width = 48
        Height = 13
        Caption = #20027#31649#37096#38376
      end
      object lbl_keshi: TLabel
        Left = 260
        Top = 72
        Width = 48
        Height = 13
        Caption = #25152#23646#31185#23460
      end
      object edt_zxdm: TEdit
        Left = 90
        Top = 15
        Width = 121
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object edt_name: TEdit
        Left = 522
        Top = 15
        Width = 251
        Height = 21
        TabOrder = 2
      end
      object cbb_year: TComboBox
        Left = 314
        Top = 15
        Width = 73
        Height = 21
        Style = csDropDownList
        DropDownCount = 16
        TabOrder = 1
        Items.Strings = (
          '2015'
          '2016'
          '2017'
          '2018'
          '2019'
          '2020'
          '2021'
          '2022'
          '2023'
          '2024'
          '2025'
          '2026')
      end
      object cbb_type: TComboBox
        Left = 930
        Top = 15
        Width = 115
        Height = 21
        TabOrder = 3
      end
      object edt_chargeDept: TEdit
        Left = 90
        Top = 69
        Width = 121
        Height = 21
        TabOrder = 9
      end
      object cbb_mode: TComboBox
        Left = 90
        Top = 42
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object cbb_level: TComboBox
        Left = 522
        Top = 42
        Width = 155
        Height = 21
        Style = csDropDownList
        ItemIndex = 2
        TabOrder = 6
        Text = #24066#26412#32423#19987#39033
        Items.Strings = (
          #20013#22830#32423#19987#39033
          #33258#27835#21306#32423#19987#39033
          #24066#26412#32423#19987#39033)
      end
      object cbb_stat: TComboBox
        Left = 930
        Top = 42
        Width = 70
        Height = 21
        Style = csDropDownList
        DropDownCount = 16
        TabOrder = 7
        Items.Strings = (
          '2015'
          '2016'
          '2017'
          '2018'
          '2019'
          '2020'
          '2021'
          '2022'
          '2023'
          '2024'
          '2025'
          '2026')
      end
      object cbb_end: TComboBox
        Left = 1079
        Top = 42
        Width = 70
        Height = 21
        Style = csDropDownList
        DropDownCount = 16
        TabOrder = 8
        Items.Strings = (
          '2015'
          '2016'
          '2017'
          '2018'
          '2019'
          '2020'
          '2021'
          '2022'
          '2023'
          '2024'
          '2025'
          '2026')
      end
      object cbb_keshi: TComboBox
        Left = 314
        Top = 69
        Width = 105
        Height = 21
        TabOrder = 10
      end
      object cbb_kmdm: TComboBox
        Left = 314
        Top = 42
        Width = 73
        Height = 21
        TabOrder = 5
      end
    end
    object ts2: TTabSheet
      Caption = #39033#30446#36164#37329#23433#25490
      ImageIndex = 1
      object shp1: TShape
        Left = 3
        Top = 45
        Width = 109
        Height = 30
      end
      object lbl_zxmc: TLabel
        Left = 12
        Top = 18
        Width = 72
        Height = 13
        Caption = #19987#39033#36164#37329#21517#31216
      end
      object lbl_zj_year: TLabel
        Left = 33
        Top = 54
        Width = 48
        Height = 13
        Caption = #39044#31639#24180#24230
      end
      object shp2: TShape
        Left = 111
        Top = 45
        Width = 105
        Height = 30
      end
      object lbl_km: TLabel
        Left = 137
        Top = 54
        Width = 48
        Height = 13
        Caption = #21151#33021#31185#30446
      end
      object shp3: TShape
        Left = 215
        Top = 45
        Width = 90
        Height = 30
      end
      object shp4: TShape
        Left = 304
        Top = 45
        Width = 90
        Height = 30
      end
      object shp5: TShape
        Left = 393
        Top = 45
        Width = 90
        Height = 30
      end
      object shp6: TShape
        Left = 482
        Top = 45
        Width = 90
        Height = 30
      end
      object shp7: TShape
        Left = 571
        Top = 45
        Width = 90
        Height = 30
      end
      object shp8: TShape
        Left = 660
        Top = 45
        Width = 90
        Height = 30
      end
      object shp9: TShape
        Left = 749
        Top = 45
        Width = 90
        Height = 30
      end
      object shp10: TShape
        Left = 838
        Top = 45
        Width = 90
        Height = 30
      end
      object shp11: TShape
        Left = 927
        Top = 45
        Width = 90
        Height = 30
      end
      object lbl1: TLabel
        Left = 222
        Top = 54
        Width = 78
        Height = 13
        Caption = #21512#35745#65288#19975#20803#65289
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 325
        Top = 54
        Width = 48
        Height = 13
        Caption = #20013#22830#36164#37329
      end
      object Label2: TLabel
        Left = 410
        Top = 54
        Width = 60
        Height = 13
        Caption = #33258#27835#21306#36164#37329
      end
      object Label3: TLabel
        Left = 485
        Top = 54
        Width = 84
        Height = 13
        Caption = #24066#26412#32423#20844#20849#39044#31639
      end
      object Label4: TLabel
        Left = 575
        Top = 54
        Width = 84
        Height = 13
        Caption = #24066#26412#32423#22522#37329#39044#31639
      end
      object Label5: TLabel
        Left = 664
        Top = 54
        Width = 84
        Height = 13
        Caption = #24066#26412#32423#22269#36164#39044#31639
      end
      object Label6: TLabel
        Left = 753
        Top = 54
        Width = 84
        Height = 13
        Caption = #24066#26412#32423#31038#20445#22522#37329
      end
      object Label7: TLabel
        Left = 858
        Top = 54
        Width = 48
        Height = 13
        Caption = #25919#24220#20538#21048
      end
      object Label8: TLabel
        Left = 949
        Top = 54
        Width = 48
        Height = 13
        Caption = #20854#20182#36164#37329
      end
      object shp12: TShape
        Left = 1016
        Top = 45
        Width = 97
        Height = 29
      end
      object lbl2: TLabel
        Left = 1036
        Top = 54
        Width = 60
        Height = 13
        Caption = #36164#37329#25991#20214#21495
      end
      object Shape1: TShape
        Left = 1112
        Top = 45
        Width = 214
        Height = 29
      end
      object Label9: TLabel
        Left = 1205
        Top = 54
        Width = 24
        Height = 13
        Caption = #22791#27880
      end
      object cbb_zxmc: TComboBox
        Left = 90
        Top = 15
        Width = 287
        Height = 21
        TabOrder = 3
      end
      object cbb_zj_year: TComboBox
        Left = 3
        Top = 73
        Width = 109
        Height = 21
        Style = csDropDownList
        DropDownCount = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 4
        Items.Strings = (
          '2015'
          '2016'
          '2017'
          '2018'
          '2019'
          '2020'
          '2021'
          '2022'
          '2023'
          '2024'
          '2025'
          '2026')
      end
      object cbb_km: TComboBox
        Left = 111
        Top = 73
        Width = 105
        Height = 21
        DropDownCount = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edt_total: TEdit
        Left = 215
        Top = 73
        Width = 90
        Height = 21
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 6
        Text = '0'
        OnChange = edt_totalChange
      end
      object edt_zy: TEdit
        Left = 304
        Top = 73
        Width = 90
        Height = 21
        Alignment = taRightJustify
        TabOrder = 7
        Text = '0'
        OnChange = edt_zyChange
        OnExit = edt_zyExit
        OnKeyDown = edt_zyKeyDown
        OnKeyPress = edt_zyKeyPress
      end
      object edt_sheng: TEdit
        Left = 393
        Top = 73
        Width = 90
        Height = 21
        Alignment = taRightJustify
        TabOrder = 8
        Text = '0'
        OnChange = edt_zyChange
        OnExit = edt_zyExit
        OnKeyDown = edt_zyKeyDown
        OnKeyPress = edt_zyKeyPress
      end
      object edt_shiYS: TEdit
        Left = 482
        Top = 73
        Width = 90
        Height = 21
        Alignment = taRightJustify
        TabOrder = 9
        Text = '0'
        OnChange = edt_zyChange
        OnExit = edt_zyExit
        OnKeyDown = edt_zyKeyDown
        OnKeyPress = edt_zyKeyPress
      end
      object edt_shiJJ: TEdit
        Left = 571
        Top = 73
        Width = 90
        Height = 21
        Alignment = taRightJustify
        TabOrder = 10
        Text = '0'
        OnChange = edt_zyChange
        OnExit = edt_zyExit
        OnKeyDown = edt_zyKeyDown
        OnKeyPress = edt_zyKeyPress
      end
      object edt_shiGZ: TEdit
        Left = 660
        Top = 73
        Width = 90
        Height = 21
        Alignment = taRightJustify
        TabOrder = 11
        Text = '0'
        OnChange = edt_zyChange
        OnExit = edt_zyExit
        OnKeyDown = edt_zyKeyDown
        OnKeyPress = edt_zyKeyPress
      end
      object edt_shiSB: TEdit
        Left = 749
        Top = 73
        Width = 90
        Height = 21
        Alignment = taRightJustify
        TabOrder = 12
        Text = '0'
        OnChange = edt_zyChange
        OnExit = edt_zyExit
        OnKeyDown = edt_zyKeyDown
        OnKeyPress = edt_zyKeyPress
      end
      object edt_shiZQ: TEdit
        Left = 838
        Top = 73
        Width = 90
        Height = 21
        Alignment = taRightJustify
        TabOrder = 13
        Text = '0'
        OnChange = edt_zyChange
        OnExit = edt_zyExit
        OnKeyDown = edt_zyKeyDown
        OnKeyPress = edt_zyKeyPress
      end
      object edt_shiOther: TEdit
        Left = 927
        Top = 73
        Width = 90
        Height = 21
        Alignment = taRightJustify
        TabOrder = 14
        Text = '0'
        OnChange = edt_zyChange
        OnExit = edt_zyExit
        OnKeyDown = edt_zyKeyDown
        OnKeyPress = edt_zyKeyPress
      end
      object edt_file: TEdit
        Left = 1016
        Top = 73
        Width = 97
        Height = 21
        Alignment = taRightJustify
        TabOrder = 15
        OnKeyDown = edt_zyKeyDown
      end
      object edt_mmo: TEdit
        Left = 1112
        Top = 73
        Width = 214
        Height = 21
        Alignment = taRightJustify
        TabOrder = 16
      end
      object btn_addMoney: TButton
        Left = 1082
        Top = 13
        Width = 75
        Height = 25
        Caption = #20445#23384
        Enabled = False
        TabOrder = 0
        OnClick = btn_addMoneyClick
      end
      object btn_modi: TButton
        Left = 1167
        Top = 13
        Width = 75
        Height = 25
        Caption = #20462#25913
        TabOrder = 1
      end
      object btn_delezj: TButton
        Left = 1252
        Top = 13
        Width = 75
        Height = 25
        Caption = #21024#38500
        TabOrder = 2
      end
    end
  end
  object btn_close: TButton
    Left = 1253
    Top = 20
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #20851#38381'(&C)'
    TabOrder = 0
    OnClick = btn_closeClick
  end
  object pgc2: TPageControl
    Left = 0
    Top = 195
    Width = 1360
    Height = 481
    ActivePage = ts3
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object ts3: TTabSheet
      Caption = #19987#39033#26126#32454
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 1352
        Height = 453
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
      Caption = #36164#37329#23433#25490#26126#32454
      ImageIndex = 1
      object dbgrd2: TDBGrid
        Left = 0
        Top = 0
        Width = 1352
        Height = 453
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
end
