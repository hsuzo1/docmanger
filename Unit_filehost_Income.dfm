object frmIncome: TfrmIncome
  Left = 206
  Top = 231
  Align = alClient
  BorderStyle = bsNone
  Caption = 'frmIncome'
  ClientHeight = 726
  ClientWidth = 1291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    1291
    726)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 33
    Width = 1291
    Height = 693
    ActivePage = tsShangji
    Align = alClient
    MultiLine = True
    PopupMenu = pmMain
    Style = tsButtons
    TabHeight = 25
    TabOrder = 1
    TabWidth = 110
    OnChange = pgc1Change
    object tsShangji: TTabSheet
      Caption = #19978#32423#36861#21152#25991#26126#32454
      object lbl1: TLabel
        Left = 3
        Top = 7
        Width = 48
        Height = 13
        Caption = #36130#25919#24180#24230
      end
      object lbl3: TLabel
        Left = 152
        Top = 7
        Width = 24
        Height = 13
        Caption = #25991#21495
      end
      object lbl4: TLabel
        Left = 323
        Top = 7
        Width = 48
        Height = 13
        Caption = #25991#20214#26631#39064
      end
      object lbl6: TLabel
        Left = 323
        Top = 34
        Width = 48
        Height = 13
        Caption = #19979#36798#24773#20917
      end
      object lbl9: TLabel
        Left = 3
        Top = 34
        Width = 48
        Height = 13
        Caption = #31185#30446#20195#30721
      end
      object lbl12: TLabel
        Left = 152
        Top = 34
        Width = 24
        Height = 13
        Caption = #31185#23460
      end
      object btn5: TButton
        Left = 731
        Top = 1
        Width = 75
        Height = 25
        Hint = #35774#32622#34920#26684#20869#23481#26159#21542#33021#20462#25913#65292#25353#38062#26174#31034#8220#38145#23450#8221#21017#34920#31034#23545#25968#25454#36827#34892#38145#23450#65292#25968#25454#22788#20110#21482#35835#29366#24577#12290
        Caption = #20462#25913
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btn5Click
      end
      object btn11: TButton
        Left = 827
        Top = 1
        Width = 75
        Height = 25
        Caption = #20445#23384
        Enabled = False
        TabOrder = 1
        OnClick = btn11Click
      end
      object pnl1: TPanel
        Left = 0
        Top = 57
        Width = 1283
        Height = 601
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        TabOrder = 10
        object spl1: TSplitter
          Left = 0
          Top = 449
          Width = 1283
          Height = 4
          Cursor = crVSplit
          Align = alTop
        end
        object dbgrd1: TDBGrid
          Left = 0
          Top = 0
          Width = 1283
          Height = 449
          Align = alTop
          Ctl3D = False
          DataSource = ds1
          DrawingStyle = gdsClassic
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbgrd1CellClick
          OnDblClick = dbgrd1DblClick
          OnKeyDown = dbgrd1KeyDown
          OnKeyPress = dbgrd1KeyPress
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = #30331#35760#26085#26399
              Title.Alignment = taCenter
              Width = 137
              Visible = True
            end
            item
              DropDownRows = 8
              Expanded = False
              FieldName = #36164#37329#26469#28304
              PickList.Strings = (
                #19987#39033#36716#31227#25903#20184#65288#20013#22830#36164#37329#65289
                #19987#39033#36716#31227#25903#20184#65288#33258#27835#21306#36164#37329#65289
                #19968#33324#24615#36716#31227#25903#20184#65288#20013#22830#36164#37329#65289
                #19968#33324#24615#36716#31227#25903#20184#65288#33258#27835#21306#36164#37329#65289
                #24180#32456#32467#31639#34917#21161#22522#25968#65288#33258#27835#21306#23545#24066#65289
                #19987#39033#36716#31227#25903#20184#65288#24066#26412#32423#36164#37329#65289
                #19968#33324#24615#36716#31227#25903#20184#65288#24066#26412#32423#36164#37329#65289
                #24180#32456#32467#31639#34917#21161#22522#25968#65288#24066#23545#19979#65289)
              Title.Alignment = taCenter
              Width = 150
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = #36164#37329#31867#22411
              PickList.Strings = (
                #19968#33324#20844#20849#39044#31639
                #22522#37329#39044#31639#36164#37329
                #22269#26377#36164#26412#32463#33829#39044#31639
                #31038#20250#20445#38505#22522#37329#39044#31639
                #39044#31639#31649#29702#36164#37329
                #20854#20182#36164#37329)
              Title.Alignment = taCenter
              Width = 92
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = #31283#22686#38271
              PickList.Strings = (
                'Y'
                'N')
              Title.Alignment = taCenter
              Width = 39
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = #25552#21069#19979#36798
              PickList.Strings = (
                'Y'
                'N')
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = #39033#30446#21517#31216
              Title.Alignment = taCenter
              Width = 143
              Visible = True
            end
            item
              Expanded = False
              FieldName = #25991#20214#26631#39064
              Title.Alignment = taCenter
              Width = 380
              Visible = True
            end
            item
              Expanded = False
              FieldName = #25991#21495
              Title.Alignment = taCenter
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = #26412#32423#19979#36798#25991#21495
              Title.Alignment = taCenter
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = #25910#20837#31185#30446
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = #21151#33021#31185#30446
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = #32463#27982#31185#30446
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = #23494
              PickList.Strings = (
                ''
                #31192
                #26426
                #32477)
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = #21457#25991#26085#26399
              Title.Alignment = taCenter
              Width = 58
              Visible = True
            end
            item
              DropDownRows = 38
              Expanded = False
              FieldName = #20027#31649#31185#23460
              PickList.Strings = (
                #23616#39046#23548
                #21150#20844#23460
                #32508#21512#31185
                #26080
                #22269#24211#31185
                #34892#25919#25919#27861#31185
                #39044#31639#31185
                #32463#24314#31185
                #31038#20445#31185
                #20892#19994#31185
                #20892#26449#36130#25919#36130#21153#31649#29702#31185
                #20892#21457#21150
                #20225#19994#31185
                #21830#31918#36152#31185
                #22269#38469#37329#34701#21512#20316#31185
                #20250#35745#31649#29702#31185
                #27861#35268#25919#31574#31185
                #25919#24220#37319#36141#30417#30563#21150
                #34892#25919#20107#19994#21333#20301#22269#26377#36164#20135#31649#29702#31185
                #30417#30563#26816#26597#21150
                #25237#34701#36164#31649#29702#31185
                #37329#34701#24037#20316#31185
                #20154#20107#31185
                #20826#21150
                #32426#26816#30417#23519#23460
                #31185#30740#25152
                #38750#31246#23616#38750#31246#31185
                #27665#26063#36164#37329#31649#29702#23616
                #32602#27809#22788
                #22269#24211#25903#20184#20013#24515
                #36130#25919#25237#36164#35780#23457#20013#24515
                #31293#26597#22823#38431
                #20250#35745#20844#21496
                #27880#20876#20250#35745#24072#31649#29702#20013#24515
                #36130#25919#20449#24687#20013#24515
                #38750#31246#23616#19987#39033#31185
                #22320#26041#37329#34701#31185
                #25945#31185#25991#31185)
              Title.Alignment = taCenter
              Width = 81
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #24635#37329#39069
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #24066#26412#32423
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #20852#23425#21306
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #38738#31168#21306
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #35199#20065#22616#21306
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #27743#21335#21306
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #37013#23425#21306
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #33391#24198#21306
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #27494#40483#21306
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #39640#26032#21306
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #32463#24320#21306
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #19996#30431#21306
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #38738#31168#23665
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #27178#21439
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #23486#38451#21439
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #19978#26519#21439
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #39532#23665#21439
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = #38534#23433#21439
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = #27491#25991
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = #38468#34920
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = #22791#27880
              Title.Alignment = taCenter
              Width = 142
              Visible = True
            end>
        end
        object dbDetail: TDBGridEh
          Left = 0
          Top = 453
          Width = 1283
          Height = 148
          Align = alClient
          DataSource = dsDetail
          DynProps = <>
          FooterRowCount = 1
          ReadOnly = True
          SumList.Active = True
          TabOrder = 1
          Visible = False
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'sID'
              Footer.Value = #35760#24405#24635#25968
              Footer.ValueType = fvtStaticText
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #24207#21495
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #30331#35760#26085#26399
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Alignment = taCenter
              Width = 62
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #36164#37329#26469#28304
              Footers = <>
              Title.Alignment = taCenter
              Width = 114
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #36164#37329#31867#22411
              Footers = <>
              Title.Alignment = taCenter
              Width = 81
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = #31283#22686#38271
              Footers = <>
              Title.Alignment = taCenter
              Width = 37
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = #25552#21069#19979#36798
              Footers = <>
              Title.Alignment = taCenter
              Width = 44
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #39033#30446#21517#31216
              Footers = <>
              Title.Alignment = taCenter
              Width = 71
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #25991#20214#26631#39064
              Footers = <>
              Title.Alignment = taCenter
              Width = 164
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #25991#21495
              Footers = <>
              Title.Alignment = taCenter
              Width = 101
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #19978#32423#25991#21495
              Footers = <>
              Title.Alignment = taCenter
              Width = 99
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #21151#33021#31185#30446
              Footers = <>
              Title.Alignment = taCenter
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #25903#20986#21151#33021#31185#30446
              Footers = <>
              Title.Alignment = taCenter
              Width = 78
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #32463#27982#31185#30446
              Footers = <>
              Title.Alignment = taCenter
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #23494
              Footers = <>
              Title.Alignment = taCenter
              Width = 20
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = #21457#25991#26085#26399
              Footers = <>
              Title.Alignment = taCenter
              Width = 74
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #20027#31649#31185#23460
              Footer.Alignment = taCenter
              Footer.Value = #26126#32454#21512#35745
              Footer.ValueType = fvtStaticText
              Footers = <>
              Title.Alignment = taCenter
              Width = 71
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #24635#37329#39069
              Footer.FieldName = #24635#37329#39069
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 47
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #24066#26412#32423
              Footer.FieldName = #24066#26412#32423
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 47
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #20852#23425#21306
              Footer.FieldName = #20852#23425#21306
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 43
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #38738#31168#21306
              Footer.FieldName = #38738#31168#21306
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 44
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #35199#20065#22616#21306
              Footer.FieldName = #35199#20065#22616#21306
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 52
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #27743#21335#21306
              Footer.FieldName = #27743#21335#21306
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 45
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #37013#23425#21306
              Footer.FieldName = #37013#23425#21306
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 45
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #33391#24198#21306
              Footer.FieldName = #33391#24198#21306
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 47
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #27494#40483#21306
              Footer.FieldName = #27494#40483#21306
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 44
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #39640#26032#21306
              Footer.FieldName = #39640#26032#21306
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 40
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #32463#24320#21306
              Footer.FieldName = #32463#24320#21306
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 39
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #19996#30431#21306
              Footer.FieldName = #19996#30431#21306
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 45
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #38738#31168#23665
              Footer.FieldName = #38738#31168#23665
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 42
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #27178#21439
              Footer.FieldName = #27178#21439
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 38
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #23486#38451#21439
              Footer.FieldName = #23486#38451#21439
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 44
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #19978#26519#21439
              Footer.FieldName = #19978#26519#21439
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 43
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #39532#23665#21439
              Footer.FieldName = #39532#23665#21439
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 42
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = #38534#23433#21439
              Footer.FieldName = #38534#23433#21439
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Alignment = taCenter
              Width = 46
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = #27491#25991
              Footers = <>
              Title.Alignment = taCenter
              Width = 38
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = #38468#34920
              Footers = <>
              Title.Alignment = taCenter
              Width = 37
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #22791#27880
              Footers = <>
              Title.Alignment = taCenter
              Width = 200
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object chkDetail: TCheckBox
        Left = 508
        Top = 34
        Width = 105
        Height = 17
        Caption = #20851#32852#26126#32454#34920#26597#30475
        TabOrder = 9
        OnClick = chkDetailClick
      end
      object btnCancel: TButton
        Left = 923
        Top = 1
        Width = 75
        Height = 25
        Caption = #21462#28040
        Enabled = False
        TabOrder = 2
        OnClick = btnCancelClick
      end
      object cbb_keshi: TComboBox
        Left = 182
        Top = 30
        Width = 121
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 7
        Text = #25152#26377#31185#23460
        OnChange = cbb_keshiChange
        OnDropDown = cbb_keshiDropDown
        Items.Strings = (
          #25152#26377#31185#23460)
      end
      object cbb_wenhao: TComboBox
        Left = 182
        Top = 3
        Width = 119
        Height = 21
        TabOrder = 4
        OnChange = cbb_wenhaoChange
      end
      object cbb_year: TComboBox
        Left = 57
        Top = 3
        Width = 65
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 3
        Text = '2016'
        Items.Strings = (
          '2015'
          '2016'
          '2017'
          '2018'
          '2019'
          '2020'
          '2021'
          '2022')
      end
      object cbb_yixiada: TComboBox
        Left = 377
        Top = 30
        Width = 65
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 8
        Text = #20840#37096
        OnChange = cbb_yixiadaChange
        Items.Strings = (
          #20840#37096
          #24050#19979#36798
          #26410#19979#36798)
      end
      object edt_KMDM: TEdit
        Left = 57
        Top = 30
        Width = 65
        Height = 21
        MaxLength = 11
        NumbersOnly = True
        TabOrder = 6
        OnChange = edt_KMDMChange
      end
      object edt_title: TEdit
        Left = 377
        Top = 3
        Width = 236
        Height = 21
        TabOrder = 5
        OnChange = edt_titleChange
      end
    end
    object tsBenji: TTabSheet
      Caption = #26412#32423#19979#36798#25991#26126#32454
      ImageIndex = 1
      object lbl5: TLabel
        Left = 323
        Top = 7
        Width = 48
        Height = 13
        Caption = #25991#20214#26631#39064
      end
      object lbl7: TLabel
        Left = 323
        Top = 34
        Width = 48
        Height = 13
        Caption = #26412#32423#36130#21147
      end
      object lbl8: TLabel
        Left = 3
        Top = 34
        Width = 48
        Height = 13
        Caption = #31185#30446#20195#30721
      end
      object lbl10: TLabel
        Left = 152
        Top = 7
        Width = 24
        Height = 13
        Caption = #25991#21495
      end
      object lbl2: TLabel
        Left = 3
        Top = 7
        Width = 48
        Height = 13
        Caption = #36130#25919#24180#24230
      end
      object lbl11: TLabel
        Left = 152
        Top = 34
        Width = 24
        Height = 13
        Caption = #31185#23460
      end
      object dbgrd_sbj: TDBGrid
        Left = 0
        Top = 57
        Width = 1283
        Height = 601
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Ctl3D = False
        DataSource = ds2
        DrawingStyle = gdsClassic
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgrd_sbjDblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #30331#35760#26085#26399
            Title.Alignment = taCenter
            Width = 59
            Visible = True
          end
          item
            DropDownRows = 8
            Expanded = False
            FieldName = #36164#37329#26469#28304
            PickList.Strings = (
              #19987#39033#36716#31227#25903#20184#65288#20013#22830#36164#37329#65289
              #19987#39033#36716#31227#25903#20184#65288#33258#27835#21306#36164#37329#65289
              #19968#33324#24615#36716#31227#25903#20184#65288#20013#22830#36164#37329#65289
              #19968#33324#24615#36716#31227#25903#20184#65288#33258#27835#21306#36164#37329#65289
              #24180#32456#32467#31639#34917#21161#22522#25968#65288#33258#27835#21306#23545#24066#65289
              #19987#39033#36716#31227#25903#20184#65288#24066#26412#32423#36164#37329#65289
              #19968#33324#24615#36716#31227#25903#20184#65288#24066#26412#32423#36164#37329#65289
              #24180#32456#32467#31639#34917#21161#22522#25968#65288#24066#23545#19979#65289)
            Title.Alignment = taCenter
            Width = 179
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #36164#37329#31867#22411
            PickList.Strings = (
              #19968#33324#20844#20849#39044#31639
              #22522#37329#39044#31639#36164#37329
              #22269#26377#36164#26412#32463#33829#39044#31639
              #31038#20250#20445#38505#22522#37329#39044#31639
              #39044#31639#31649#29702#36164#37329
              #20854#20182#36164#37329)
            Title.Alignment = taCenter
            Width = 92
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #31283#22686#38271
            PickList.Strings = (
              'Y'
              'N')
            Title.Alignment = taCenter
            Width = 39
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #25552#21069#19979#36798
            PickList.Strings = (
              'Y'
              'N')
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = #39033#30446#21517#31216
            Title.Alignment = taCenter
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = #25991#20214#26631#39064
            Title.Alignment = taCenter
            Width = 380
            Visible = True
          end
          item
            Expanded = False
            FieldName = #25991#21495
            Title.Alignment = taCenter
            Width = 133
            Visible = True
          end
          item
            Expanded = False
            FieldName = #19978#32423#25991#21495
            Title.Alignment = taCenter
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = #21151#33021#31185#30446
            Title.Alignment = taCenter
            Title.Caption = #25910#20837#31185#30446
            Visible = True
          end
          item
            Expanded = False
            FieldName = #25903#20986#21151#33021#31185#30446
            Title.Caption = #21151#33021#31185#30446
            Visible = True
          end
          item
            Expanded = False
            FieldName = #32463#27982#31185#30446
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #23494
            PickList.Strings = (
              ''
              #31192
              #26426
              #32477)
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = #21457#25991#26085#26399
            Title.Alignment = taCenter
            Width = 58
            Visible = True
          end
          item
            DropDownRows = 38
            Expanded = False
            FieldName = #20027#31649#31185#23460
            PickList.Strings = (
              ''
              #23616#39046#23548
              #21150#20844#23460
              #32508#21512#31185
              #26080
              #22269#24211#31185
              #34892#25919#25919#27861#31185
              #39044#31639#31185
              #32463#24314#31185
              #31038#20445#31185
              #20892#19994#31185
              #20892#26449#36130#25919#36130#21153#31649#29702#31185
              #20892#21457#21150
              #20225#19994#31185
              #21830#31918#36152#31185
              #22269#38469#37329#34701#21512#20316#31185
              #20250#35745#31649#29702#31185
              #27861#35268#25919#31574#31185
              #25919#24220#37319#36141#30417#30563#21150
              #34892#25919#20107#19994#21333#20301#22269#26377#36164#20135#31649#29702#31185
              #30417#30563#26816#26597#21150
              #25237#34701#36164#31649#29702#31185
              #37329#34701#24037#20316#31185
              #20154#20107#31185
              #20826#21150
              #32426#26816#30417#23519#23460
              #31185#30740#25152
              #38750#31246#23616#38750#31246#31185
              #27665#26063#36164#37329#31649#29702#23616
              #32602#27809#22788
              #22269#24211#25903#20184#20013#24515
              #36130#25919#25237#36164#35780#23457#20013#24515
              #31293#26597#22823#38431
              #20250#35745#20844#21496
              #27880#20876#20250#35745#24072#31649#29702#20013#24515
              #36130#25919#20449#24687#20013#24515
              #38750#31246#23616#19987#39033#31185
              #22320#26041#37329#34701#31185
              #25945#31185#25991#31185)
            Title.Alignment = taCenter
            Width = 81
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #24635#37329#39069
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #24066#26412#32423
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #20852#23425#21306
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #38738#31168#21306
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #35199#20065#22616#21306
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #27743#21335#21306
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #37013#23425#21306
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #33391#24198#21306
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #27494#40483#21306
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #39640#26032#21306
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #32463#24320#21306
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #19996#30431#21306
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #38738#31168#23665
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #27178#21439
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #23486#38451#21439
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #19978#26519#21439
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #39532#23665#21439
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = #38534#23433#21439
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #27491#25991
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #38468#34920
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = #22791#27880
            Title.Alignment = taCenter
            Width = 142
            Visible = True
          end>
      end
      object btn2: TButton
        Left = 731
        Top = 1
        Width = 75
        Height = 25
        Caption = #20462#25913
        Enabled = False
        TabOrder = 0
        OnClick = btn2Click
      end
      object btn12: TButton
        Left = 827
        Top = 1
        Width = 75
        Height = 25
        Caption = #20445#23384
        Enabled = False
        TabOrder = 1
        OnClick = btn12Click
      end
      object btnCancel2: TButton
        Left = 923
        Top = 1
        Width = 75
        Height = 25
        Caption = #21462#28040
        Enabled = False
        TabOrder = 2
        OnClick = btnCancel2Click
      end
      object cbbYearSBJ: TComboBox
        Left = 57
        Top = 3
        Width = 65
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 3
        Text = '2016'
        Items.Strings = (
          '2015'
          '2016'
          '2017'
          '2018'
          '2019'
          '2020'
          '2021'
          '2022')
      end
      object edtKMDMSBJ: TEdit
        Left = 57
        Top = 30
        Width = 65
        Height = 21
        MaxLength = 11
        NumbersOnly = True
        TabOrder = 6
        OnChange = edtKMDMSBJChange
      end
      object cbbKeshiSBJ: TComboBox
        Left = 182
        Top = 30
        Width = 121
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 7
        Text = #25152#26377#31185#23460
        OnChange = cbbKeshiSBJChange
        OnDropDown = cbbKeshiSBJDropDown
        Items.Strings = (
          #25152#26377#31185#23460)
      end
      object cbbWenhaoSBJ: TComboBox
        Left = 182
        Top = 3
        Width = 119
        Height = 21
        TabOrder = 4
        OnChange = cbbWenhaoSBJChange
      end
      object cbbXiadaSBJ: TComboBox
        Left = 377
        Top = 30
        Width = 128
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 8
        Text = #20840#37096
        OnChange = cbbXiadaSBJChange
        Items.Strings = (
          #20840#37096
          #20998#35299#19979#36798#33258#27835#21306
          #26412#32423#36130#21147#19979#36798)
      end
      object edtTitleSBJ: TEdit
        Left = 377
        Top = 3
        Width = 236
        Height = 21
        TabOrder = 5
        OnChange = edtTitleSBJChange
      end
    end
  end
  object btnExport: TBitBtn
    Left = 1022
    Top = 65
    Width = 75
    Height = 25
    Caption = #23548#20986#34920#26684
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = btnExportClick
  end
  object btn_Query: TButton
    Left = 640
    Top = 65
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 2
    OnClick = btn_QueryClick
  end
  object ctrlbr1: TControlBar
    Left = 0
    Top = 0
    Width = 1291
    Height = 33
    Align = alTop
    TabOrder = 0
    object tlb1: TToolBar
      Left = 11
      Top = 2
      Width = 582
      Height = 22
      Align = alNone
      ButtonWidth = 51
      Caption = 'tlb1'
      Images = il1
      List = True
      ShowCaptions = True
      AllowTextButtons = True
      TabOrder = 0
      object btn6: TToolButton
        Left = 0
        Top = 0
        Caption = #30331#35760
        ImageIndex = 1
        Style = tbsTextButton
        OnClick = btn6Click
      end
      object ToolButton1: TToolButton
        Left = 55
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object btn8: TToolButton
        Left = 63
        Top = 0
        Caption = #20445#23384
        ImageIndex = 3
        Style = tbsTextButton
        OnClick = btn8Click
      end
      object btn9: TToolButton
        Left = 118
        Top = 0
        Hint = #23558#24403#21069#34920#26684#23548#20986#20026'excel'#34920
        Caption = #23548#20986
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        Style = tbsTextButton
        OnClick = btnExportClick
      end
      object btn7: TToolButton
        Left = 173
        Top = 0
        Caption = #21024#38500
        ImageIndex = 2
        Style = tbsTextButton
        OnClick = btn7Click
      end
      object btn10: TToolButton
        Left = 228
        Top = 0
        Width = 8
        Caption = 'btn10'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object btnConfig: TToolButton
        Left = 236
        Top = 0
        Hint = #31649#29702#39044#31639#31185#30446
        Caption = #35774#32622
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        Style = tbsTextButton
        OnClick = btnConfigClick
      end
    end
  end
  object btn1: TButton
    Left = 1199
    Top = 65
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #20851#38381'(&C)'
    TabOrder = 4
    OnClick = btn1Click
  end
  object qry_shangji: TADOQuery
    AutoCalcFields = False
    Connection = DataModule2.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'select AddDate as '#30331#35760#26085#26399',YSLY as '#36164#37329#26469#28304',ZJLX as '#36164#37329#31867#22411',isWZZ as '#31283#22686#38271',is' +
        'Prior as '#25552#21069#19979#36798','
      
        '           ItemNumber as '#39033#30446#21517#31216',WJBT as '#25991#20214#26631#39064',wenhao as '#25991#21495',DetailWe' +
        'nhao as '#26412#32423#19979#36798#25991#21495',KMDM as '#25910#20837#31185#30446','
      'KMDM1 as '#21151#33021#31185#30446',KMDM2 as '#32463#27982#31185#30446',MIJI as '#23494',FileDate as '#21457#25991#26085#26399','
      '            ZGkeshi as '#20027#31649#31185#23460',YSZJ as '#24635#37329#39069',SBJ as '#24066#26412#32423',CQ_XN as '#20852#23425#21306','
      '      CQ_qx as '#38738#31168#21306',CQ_xxt as '#35199#20065#22616#21306',CQ_jn as '#27743#21335#21306' ,CQ_yn as '#37013#23425#21306','
      
        '            CQ_lq as '#33391#24198#21306',CQ_wm as '#27494#40483#21306',K_gx as '#39640#26032#21306',K_jk as '#32463#24320#21306',K_' +
        'dm as '#19996#30431#21306','
      
        '            K_qxs as '#38738#31168#23665',X_hx as '#27178#21439',X_by as '#23486#38451#21439',X_sl as '#19978#26519#21439',X_ms' +
        ' as '#39532#23665#21439','
      
        '           X_la as '#38534#23433#21439',file1 as '#27491#25991',file2 as '#38468#34920',Memo as '#22791#27880' from z' +
        'huijia_shangji')
    Left = 96
    Top = 440
  end
  object ds1: TDataSource
    DataSet = qry_shangji
    Left = 96
    Top = 496
  end
  object qry_temp: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 416
    Top = 440
  end
  object il1: TImageList
    Left = 96
    Top = 352
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      00000000000000000000000000000000000034803700347D3200337A2E003377
      29003273250032702000316C1C00306A17003066130030630F002F600B002F5D
      08002F5C05002E5A03002E5800002E5800000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000035833A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002E5800000000000000000000000000000000
      0000000000000080800000000000000000000000000000808000000000000000
      0000000000000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000036863E00FFFFFF00D3EAD200CFE8
      CE00CAE7C800C4E6C300BEE4BB00B8E3B600B2E1AF00ADE1A900A8DFA400A4DF
      A000A2DF9F00A4DFA000FFFFFF002E5902000000000080808000808080008080
      8000008080000080800000000000008080000080800000808000000000000000
      0000008080000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000368A4200FFFFFF00D3E9D20073C3
      95001EA16400219B5800238D3F00277C2200548D3900EEF7F1006BC0870042A9
      5F005CB16D00F9FAF800F9FAF7002F5B05000000000080808000FFFFFF00FFFF
      FF0000808000FFFFFF00008080000080800000000000FFFFFF00C0C0C0000000
      00000080800000808000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000378C4600FFFFFF00D3EAD200CFE9
      CD002F965100238C3E0025822D002C791B006A98490090D6AF0041B670003FAF
      6700B9DFC400F9FBF900FCFDFC002F5D07000000000080808000FFFFFF00C0C0
      C0000080800000808000FFFFFF0000808000C0C0C000FFFFFF00C0C0C000C0C0
      C00000808000FFFFFF0000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000378E4900FFFFFF00D4E9D300CFE9
      CF00A7D1A800287A1C002A7713003E7A1100C9ECDA0043C3840042BD7C0080CF
      A100F9FDFB00F1F9F200FFFFFF002F600A000000000080808000FFFFFF00C0C0
      C000008080000000000000808000C0C0C000C0C0C0000080800000808000C0C0
      C000C0C0C0000080800000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000037904C00FFFFFF00D5E9D400D1E9
      CF00CDE8CB006BA1530032610000345C03004FC9910045C98D005BCA9400ECF8
      F200F9FDFB00ACE1A900FFFFFF0030610D000000000080808000FFFFFF00C0C0
      C00000000000C0C0C000C0C0C000C0C0C00000808000C0C0C000008080000080
      8000C0C0C000C0C0C000FFFFFF00008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000037934E00FFFFFF00D6EAD500D2E9
      D200CEE8CD00CAE7C800456618003F9E5B0047D19A0046CC9200B3E7CF00FAFE
      FC00CDECCC00B2E1AF00FFFFFF00316410000000000080808000FFFFFF00C0C0
      C000C0C0C00000808000008080000080800000808000C0C0C000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000038945000FFFFFF00D7EAD600D5E9
      D400D1E9CF00CDE8CC0083C18E0045C98E0045CC92004CAD7600FAFDFC00F9FB
      F900B7E3B400B8E3B500FFFFFF00306715000000000080808000FFFFFF00C0C0
      C000C0C0C00000808000FFFFFF000080800000808000C0C0C000008080000080
      800000808000FFFFFF0000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000038955200FFFFFF00D7EAD700D6EA
      D500D3E9D200CCE8CD0054C3870044C3840044BE8000466633009AA98E00F8F9
      F700F5F8F400BEE5BC00FFFFFF00316A18000000000080808000FFFFFF00C0C0
      C0008080800000000000000000008080800000808000C0C0C000008080000080
      8000000000000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000358F4E00FEFEFE00DDEEDD00D7EA
      D700D5EAD50078C6910041B6710041BA780049844E004A6331004B643300E4E7
      E000F8F9F700DAEED900FFFFFF00316D1D000000000080808000FFFFFF00C0C0
      C0000000000080808000808080008080800000808000FFFFFF00FFFFFF000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002E7B4400EFF7F100EAF4EA00D7EA
      D700AED6B3003DA85B003EAD64007FCA9A00D7DED3004B6433004B643300657A
      5000F8F9F700F8F9F700FEFEFE00327021000000000080808000FFFFFF00C0C0
      C00000000000FFFFFF00FFFFFF0080808000C0C0C00000808000008080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000020552F00C0DEC900F7FBF700D7EA
      D7003B9A46003B9F4E0040A65900ECF4EC00F9FAF800859E77004B6433004B64
      3300899A7A00F8F9F700FAFBF900327425000000000080808000FFFFFF00C0C0
      C00000000000FFFFFF00FFFFFF0080808000C0C0C000C0C0C000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000102A17005E9F7000EDF5EF00F7FB
      F700EAF4EA00DDEEDD00D7EAD700D7EAD600D6EAD500D5EAD500D4E9D300D3E9
      D300D3EAD200D3E9D200FFFFFF00337729000000000080808000FFFFFF00C0C0
      C00000000000000000000000000080808000C0C0C000FFFFFF00C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000122F1A005E9F7000C0DE
      C900EFF7F100FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00347A2D000000000080808000FFFFFF00C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000102A17002055
      2F002E7B4400358F4E003894510038934F0037914D00378F4A00378D4600368A
      420035873E0035843A0035803600347C31000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7A29300634935006349
      3500634935006349350063493500634935006349350063493500634935006349
      35006349350063493500634935000000000000000000000B0000000006000801
      00000500080000010000000600000000030006040000000004000F0500000004
      0600070000000701020000000100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3646500AA55
      5600A45253009F4F50009A4D4D00944A4A008F4747008944440083414100783B
      3C00783B3C00723939006E3637000000000000000000B7A29300D9CBC200CEBD
      B100CBB9AD00C8B5A900C5B2A500C2AEA100BFAC9E00BDA89A00BBA69700B9A4
      9500B7A29300B7A2930063493500000000000000000009000000FFFAFF0023DA
      F400FEF9FF0019DBF900FFFFF8002FD3FE00F7F7FF001EDAFD00000100000000
      0F00FBFDF7002CE5F90008060000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000018020000FFFFF7000000000000000000CF6B6C00F38E8F00E680
      8100AA44240047322100C3B4AB00C6BBB300CAC1BC00CEC8C400564D48009E3E
      33009C3D360098393100723939000000000000000000B7A29300FEFEFE00FEFE
      FE00FDFBFA00CBB9AD00FCF2ED00FBEDE400FAE7DC00BFAB9D00F7DBCA00F6D5
      C000F5CFB700B7A293006349350000000000000000000000140036DFFE00FAFF
      FF0018D7FF00F6FFFB0023DDFC00FBFFF80025DEFA00FFFBFF0000000B00DDC6
      CA0000020000FDFFFC0007000000000000000000000000000000000000000E03
      0000FFFBEF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D16F7000FF999A00EC86
      8700E6808100715B4B00473C34008D786800EDE0D800F1E7E0008F7F7300A341
      3500A2423C009C3D3500783B3C000000000000000000B7A29300FEFEFE00FEFE
      FE00FEFEFE00CEBCB000FDF7F300FCF2EC00FBEDE500C2AEA100F9E1D300F7DB
      CA00F5D5C000B9A4950063493500000000000000000000070000FFFFF2001ADD
      F900FFFFF1002CDAFF00F0FFF40027D7FF00FCFFEF002EDBF500000501002CDC
      ED00B3C6D500000016000D020C000000000000000000000000000B0400000005
      000000020100FFFCF90000000000000000000000000000000000000000000000
      000014050000FFFFF200000000000000000000000000D4757600FF9FA000F590
      9100EC868700715B4B0000000000473C3400E9D9CE00ECDDD40085746700AE4B
      4300AA494400A3423C007D3E3E000000000000000000B7A29300E0D3CA00D7C6
      BC00D4C3B800D1C0B500CEBDB100CBB9AC00C8B6A900C5B2A500C2AFA100BFAC
      9D00BDA99A00BAA697006349350000000000000000000700120016DEF100FFFE
      FF002BD0F700FFFBFF0029E3ED00F7F9FF0019E3FA00FFFAFF0000000A000004
      03000700070000000A000C0200000000000000000000000000000A0700000002
      000000000300FDFFFF0000000000000000000000000000000000000000000900
      0000FFFEFE0000000000000000000000000000000000D77B7C00FFA9AA00FB9F
      A000F5939400715B4B00715B4B00715B4B00715B4B00766252007D6A5B00BA56
      5400B24F4C00AA494400834141000000000000000000BAA59600FEFEFE00FEFE
      FE00FEFEFE00D5C4B900FEFEFE00FDFBFA00FCF7F400C8B6A900FBEEE400FAE7
      DC00F9E2D300BDA89A0063493500000000000000000011000700F8FBFF008F8D
      A10018DCFF00F7F8FF0020DAFC00FFF8FF0022D9FF0031DCFF00FFF9F9001DD6
      F800FFFEFF001FD7FB0000000600000000000000000000000000000000000702
      00000007040002000000FFFFF900000000000000000000000000070200000003
      0400FFFFFC0000000000000000000000000000000000DB838400FFB3B400FFAD
      AE00FCA3A400F48E8F00EC868700E6808100DF797A00D7717200D16B6C00C15D
      5C00BA565400B2504C00894444000000000000000000BEA99A00FEFEFE00FEFE
      FE00FEFEFE00D7C7BB00FEFEFE00FEFEFE00FDFBFA00CBB9AC00FBF3ED00FAED
      E500FAE7DC00BFAB9D0063493500000000009198950044DFE80015D8F400958D
      A400F4FFF5001EDEEF008E989F0025D0FC00FBFEFF00FFF9FF001FE5EB00F1FA
      FF0014E3F200FFFFF70000040A00000000000000000000000000000000000000
      00000B0200000704000004010000FFFFF500000000000903000005080000FFFF
      F7000000000000000000000000000000000000000000DF8A8B00FFBBBC00FFB6
      B700C9636000C45E5600BE584B00B8523F00B34D3400AD472800A7411C00A13B
      1100C15D5C00BA5654008F4747000000000000000000C3AE9E00E4D8D000DDCE
      C500DCCCC100D9C9BF00D7C7BC00D4C4B800D1C0B400CEBDB100CBB9AC00C8B5
      A900C5B2A500C2AEA0006349350000000000000000008D959400FFF9FF009792
      910026D9F600909C960021DDFA00FFFBFF0020D5FF002ADFF400F1FEFF003CDB
      F500EEFAFF003AD9F50000030300000000000000000000000000000000000000
      00000000000007010000050100000A0300000004000000040500FFFFF8000000
      00000000000000000000000000000000000000000000E2919200FFBDBE00CC66
      6700FFFFFF00FFFFFF00FBF8F600F6EEEA00F0E5DE00EADBD200E5D1C600E1CA
      BD00A13B1100C25D5C00944A4A000000000000000000C8B2A300FEFEFE00FEFE
      FE00FEFEFE00DBCCC100FEFEFE00FEFEFE00FEFEFE00D1C0B400FDFBF900FDF7
      F400FCF3ED00C5B2A500634935000000000090939700949291008D939800FAFF
      FE0098968C00FFFFF7001FDCFD00F3FFF90034DBF600FAFFFF002ADCF500EBF7
      FF0040E8E200FEF9FF000E000300000000000000000000000000000000000000
      000000000000000000000B0003000000040000070700F2FBFF00000000000000
      00000000000000000000000000000000000000000000E5979800FFBDBE00D36D
      6E00FFFFFF00FFFFFF00FFFFFF00FBF8F600F6EEEA00F0E5DE00EADBD200E5D1
      C600A7411C00CC6767009A4D4D000000000000000000CCB6A700FEFEFE00FEFE
      FE00FEFEFE00DDCEC500FEFEFE00FEFEFE00FEFEFE00D4C4B800FEFEFE00FDFB
      FA00FDF7F300C8B5A8006349350000000000000000002FE1F8008F97960019D9
      FF00F4FDFF008B8E92008497A60093929B008595940000020000000001000000
      0300000705000500000012000000000000000000000000000000000000000000
      0000000000000B00000006020100030400000003000000010400FFFEFD000000
      00000000000000000000000000000000000000000000E99E9F00FFBDBE00DC76
      7700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF8F600F6EEEA00F0E5DE00EADB
      D200AD472800D77172009F4F50000000000000000000EAAA8B00EAAA8B00EAAA
      8B00E9A58400E99F7A00E7976E00E68E6200E5865600E37D4A00E3764000E272
      3900E2723900E2723900C8622F0000000000000000009399940020DAF9009090
      9C002CE1F1009397980020DBF700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D0702000400000006010000FFFDF6000000000003010000FFFFFB000000
      00000000000000000000000000000000000000000000EDA6A700FFBDBE00E680
      8100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF8F600F6EEEA00F0E5
      DE00B34D3400DF797A00A45253000000000000000000EAAA8B00FFC2A200FEC0
      9F00FDBD9A00FCB99600FBB59000FAB08B00F9AB8400F8A77D00F6A27700F59D
      7100F5996A00F3956500CD6531000000000093989B0020D7F100000000009889
      9700FFFCFF000000000095968C0021DDF5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000090800000002
      00000002000003050000FFFFF900000000000000000000000000100400000C01
      0000FFFFF70000000000000000000000000000000000F0ACAD00FFBDBE00EF89
      8A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF8F600F6EE
      EA00B8523F0067333300AA5556000000000000000000EAAA8B00EAAA8B00EAAA
      8B00EAAA8B00EAA68600E9A17F00E89B7600E7946C00E68E6200E5875800E481
      4E00E47B4600E3763E00E27239000000000027EAE70000000000000000009F94
      97001FE3EF000000000000000000999C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000007070100000100000203
      000005050000FFFEF70000000000000000000000000000000000000000000C03
      000005010000FFFFFB00000000000000000000000000F3B2B300FFBDBE00F892
      9300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF8
      F600BE584B00B0585900B0585900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007896
      9B00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000500000009000000FFFE
      FA00000000000000000000000000000000000000000000000000000000000000
      00000502000004010000FFFFF6000000000000000000F5B6B700F5B6B700F3B2
      B300F1ADAE00EEA7A800EAA1A200E79A9B00E4939400E08E8F00DD878800DA80
      8100D67A7B00D3747500D16F7000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF000000FF9F000000000000F99900000000
      0000800100000000000080000000000000008000000000000000800000000000
      0000800000000000000080010000000000008001000000000000800900000000
      0000800F000000000000800F000000000000800F000000000000800F00000000
      8000800F00000000C000800F00000000FFFFFFFFFFFFFFFF80018001FFFFC001
      80018001FFF9800180018001E7FF800180018001C3F3800180018001C3E78001
      80018001E1C7800180010001F08F800180018001F81F800180010001FC3F8001
      80018001F81F8001800181FFF09F8001800124FFC1C78001800166FF83E38001
      FFFFEFFF8FF18001FFFFFFFFFFFFFFFF}
  end
  object qry_sbj: TADOQuery
    Connection = DataModule2.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'select sID,AddDate as '#30331#35760#26085#26399',YSLY as '#36164#37329#26469#28304',ZJLX as '#36164#37329#31867#22411',isWZZ as '#31283#22686 +
        #38271',isPrior as '#25552#21069#19979#36798',ItemNumber as '#39033#30446#21517#31216',WJBT as '#25991#20214#26631#39064',Wenhao as '#25991#21495',D' +
        'etailWenhao as '#19978#32423#25991#21495','
      
        '            KMDM as '#21151#33021#31185#30446',KMDM1 as '#25903#20986#21151#33021#31185#30446',KMDM2 as '#32463#27982#31185#30446',MIJI as '#23494 +
        ',FileDate as '#21457#25991#26085#26399','
      '            ZGkeshi as '#20027#31649#31185#23460',YSZJ as '#24635#37329#39069',SBJ as '#24066#26412#32423',CQ_XN as '#20852#23425#21306','
      
        '            CQ_qx as '#38738#31168#21306',CQ_xxt as '#35199#20065#22616#21306',CQ_jn as '#27743#21335#21306' ,CQ_yn as '#37013 +
        #23425#21306','
      
        '            CQ_lq as '#33391#24198#21306',CQ_wm as '#27494#40483#21306',K_gx as '#39640#26032#21306',K_jk as '#32463#24320#21306',K_' +
        'dm as '#19996#30431#21306','
      
        '            K_qxs as '#38738#31168#23665',X_hx as '#27178#21439',X_by as '#23486#38451#21439',X_sl as '#19978#26519#21439',X_ms' +
        ' as '#39532#23665#21439','
      
        '            X_la as '#38534#23433#21439',file1 as '#27491#25991',file2 as '#38468#34920',Memo as '#22791#27880' from ' +
        'zhuijia_shi_tan')
    Left = 152
    Top = 440
  end
  object ds2: TDataSource
    DataSet = qry_sbj
    Left = 152
    Top = 496
  end
  object pmMain: TPopupMenu
    Left = 952
    Top = 296
    object N3: TMenuItem
      Caption = #19978#20256#27491#25991
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #19978#20256#38468#20214
      OnClick = N4Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Excel1: TMenuItem
      Caption = #23548#20986'Excel'#34920#26684
      Hint = #23558#26597#35810#32467#26524#23548#20986#20026#30005#23376#34920#26684
      OnClick = btnExportClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #21024#38500#27491#25991
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #21024#38500#38468#34920
      OnClick = N7Click
    end
    object N1: TMenuItem
      Caption = #21024#38500#24403#21069#35760#24405
      Hint = #21024#38500#24403#21069#25968#25454#35760#24405
      OnClick = N1Click
    end
  end
  object qryDetail: TADOQuery
    Connection = DataModule2.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'select sID,AddDate as '#30331#35760#26085#26399',YSLY as '#36164#37329#26469#28304',ZJLX as '#36164#37329#31867#22411',isWZZ as '#31283#22686 +
        #38271',isPrior as '#25552#21069#19979#36798',ItemNumber as '#39033#30446#21517#31216',WJBT as '#25991#20214#26631#39064',Wenhao as '#25991#21495',D' +
        'etailWenhao as '#19978#32423#25991#21495','
      
        '            KMDM as '#21151#33021#31185#30446',KMDM1 as '#25903#20986#21151#33021#31185#30446',KMDM2 as '#32463#27982#31185#30446',MIJI as '#23494 +
        ',FileDate as '#21457#25991#26085#26399','
      '            ZGkeshi as '#20027#31649#31185#23460',YSZJ as '#24635#37329#39069',SBJ as '#24066#26412#32423',CQ_XN as '#20852#23425#21306','
      
        '            CQ_qx as '#38738#31168#21306',CQ_xxt as '#35199#20065#22616#21306',CQ_jn as '#27743#21335#21306' ,CQ_yn as '#37013 +
        #23425#21306','
      
        '            CQ_lq as '#33391#24198#21306',CQ_wm as '#27494#40483#21306',K_gx as '#39640#26032#21306',K_jk as '#32463#24320#21306',K_' +
        'dm as '#19996#30431#21306','
      
        '            K_qxs as '#38738#31168#23665',X_hx as '#27178#21439',X_by as '#23486#38451#21439',X_sl as '#19978#26519#21439',X_ms' +
        ' as '#39532#23665#21439','
      
        '            X_la as '#38534#23433#21439',file1 as '#27491#25991',file2 as '#38468#34920',Memo as '#22791#27880' from ' +
        'zhuijia_shi_tan')
    Left = 288
    Top = 440
  end
  object dsDetail: TDataSource
    AutoEdit = False
    DataSet = qryDetail
    Left = 288
    Top = 504
  end
  object dlgSave1: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Excel files|*.xls;*.xlsx'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 1008
    Top = 296
  end
  object dbgrd2xcl1: TDBGrid2Excel
    DBGrid = dbgrd1
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clNone
    HeaderFont.Height = -13
    HeaderFont.Name = 'Arial'
    HeaderFont.Style = [fsBold]
    DetailFont.Charset = DEFAULT_CHARSET
    DetailFont.Color = clNone
    DetailFont.Height = -13
    DetailFont.Name = 'Arial'
    DetailFont.Style = []
    GroupFont.Charset = DEFAULT_CHARSET
    GroupFont.Color = clNone
    GroupFont.Height = -16
    GroupFont.Name = 'Arial'
    GroupFont.Style = [fsBold]
    HeaderColor = clNone
    DetailColor = clNone
    GroupColor = clNone
    OriginalHeaderFont = False
    OriginalDetailFont = True
    OriginalHeaderColor = True
    OriginalDetailColor = True
    StartRow = 0
    StartCol = 0
    HeaderBorderStyle = BorderStyleSingleThin
    DetailBorderStyle = BorderStyleSingleThin
    GroupBorderStyle = BorderStyleNone
    HeaderBorderColor = clNone
    DetailBorderColor = clNone
    GroupBorderColor = clNone
    RowsPerSheet = 10000
    SetColumnsWidth = True
    ExportHeader = True
    Left = 152
    Top = 352
  end
  object dlgOpen1: TOpenDialog
    Filter = 
      'Office Document File(*.doc;*.xls;*.docx;*.xlsx;*.pdf;*.txt;)|*.d' +
      'oc;*.xls;*.docx;*.xlsx;*.pdf;*.txt;|Image File(*.jpg;*.jpeg;*.bm' +
      'p;*.gif;)|*.jpg;*.jpeg;*.bmp;*.gif;|'#21387#32553#25991#20214#21253'(*.zip;*.rar;*.7z;*.tar' +
      ')|*.zip;*.rar;*.7z;*.tar'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofNoTestFileCreate, ofEnableSizing]
    Title = #36873#25321#25991#20214
    Left = 176
    Top = 787
  end
end
