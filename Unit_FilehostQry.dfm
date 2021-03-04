object frmFilehostQry: TfrmFilehostQry
  Left = 206
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'frmFilehostQry'
  ClientHeight = 839
  ClientWidth = 1486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 165
    Width = 1486
    Height = 4
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    ExplicitTop = 217
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1486
    Height = 165
    Align = alTop
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 0
    DesignSize = (
      1486
      165)
    object btn1: TButton
      Left = 1335
      Top = 22
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #36864#20986'(&C)'
      TabOrder = 2
      OnClick = btn1Click
    end
    object grp1: TGroupBox
      Left = 11
      Top = 14
      Width = 822
      Height = 145
      Hint = 'Tips'#65306#22914#38656#26597#35810#25991#26723#65292#24744#21487#20197#36890#36807#20197#19978#35201#32032#36827#34892#21333#19968#25110#32452#21512#26597#35810#12290
      Align = alCustom
      Caption = #25991#26723#26597#35810#65288#25903#25345#27169#31946#26597#35810#65289
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object lbl12: TLabel
        Left = 375
        Top = 25
        Width = 48
        Height = 13
        Caption = #25991#21495#26597#35810
      end
      object lbl13: TLabel
        Left = 47
        Top = 25
        Width = 48
        Height = 13
        Caption = #26631#39064#26597#35810
      end
      object lbl14: TLabel
        Left = 23
        Top = 52
        Width = 72
        Height = 13
        Caption = #20027#36865#21333#20301#26597#35810
      end
      object lbl15: TLabel
        Left = 375
        Top = 79
        Width = 48
        Height = 13
        Caption = #25991#31181#31867#21035
      end
      object lbl16: TLabel
        Left = 35
        Top = 79
        Width = 60
        Height = 13
        Caption = #25311#31295#20154#26597#35810
      end
      object lbl17: TLabel
        Left = 375
        Top = 52
        Width = 48
        Height = 13
        Caption = #21360#21457#26085#26399
      end
      object lbl18: TLabel
        Left = 546
        Top = 52
        Width = 12
        Height = 13
        Caption = #33267
      end
      object lbl23: TLabel
        Left = 546
        Top = 79
        Width = 60
        Height = 13
        Caption = #26377#26080#30005#23376#26723
      end
      object lbl19: TLabel
        Left = 549
        Top = 25
        Width = 144
        Height = 13
        Caption = #12308'                      '#12309'              '#21495
      end
      object lbl1_memo: TLabel
        Left = 23
        Top = 106
        Width = 72
        Height = 13
        Caption = #22791#27880#20869#23481#26597#35810
      end
      object lbl_xxgk: TLabel
        Left = 375
        Top = 106
        Width = 48
        Height = 13
        Caption = #20844#24320#36873#39033
      end
      object q_wenzhong: TComboBox
        Left = 428
        Top = 76
        Width = 95
        Height = 21
        Hint = #36873#25321#24744#35201#26597#35810#30340#25991#20214#30340#31867#21035
        Style = csDropDownList
        DropDownCount = 20
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
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
      object q_zhusong: TComboBox
        Left = 101
        Top = 49
        Width = 232
        Height = 21
        Hint = #21487#20197#36873#25321#20027#36865#21333#20301#25110#36755#20837#20027#36865#21333#20301#21517#31216#20013#30340#20851#38190#23383#26597#35810
        DropDownCount = 26
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDropDown = q_zhusongDropDown
      end
      object q_creater: TComboBox
        Left = 101
        Top = 76
        Width = 168
        Height = 21
        Hint = #21487#20197#36890#36807#36873#25321#25311#31295#20154#36827#34892#26597#35810
        DropDownCount = 20
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnDropDown = q_createrDropDown
      end
      object q_dtp1: TDateTimePicker
        Left = 428
        Top = 49
        Width = 112
        Height = 21
        Hint = #36873#25321#36215#22987#26102#38388
        Date = 41305.435218460650000000
        Time = 41305.435218460650000000
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object q_dtp2: TDateTimePicker
        Left = 564
        Top = 49
        Width = 115
        Height = 21
        Hint = #36873#25321#32467#26463#26102#38388
        Date = 41305.435218460650000000
        Time = 41305.435218460650000000
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
      end
      object q_title: TEdit
        Left = 101
        Top = 22
        Width = 232
        Height = 21
        Hint = #24744#21487#20197#36890#36807#36755#20837#25991#20214#26631#39064#20013#30340#20851#38190#35789#35821#36827#34892#26597#35810
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object q_wenhao_head: TComboBox
        Left = 428
        Top = 22
        Width = 112
        Height = 21
        Hint = #36873#25321#38656#35201#26597#35810#30340#25991#21495
        DropDownCount = 26
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDropDown = q_wenhao_headDropDown
      end
      object q_wenhao_year: TComboBox
        Left = 564
        Top = 22
        Width = 59
        Height = 21
        Hint = #36873#25321#24180#23383#21495
        DropDownCount = 26
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Items.Strings = (
          ''
          '2008'
          '2009'
          '2010'
          '2011'
          '2012'
          '2013'
          '2014'
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
          '2026'
          '2027'
          '2028'
          '2029'
          '2030')
      end
      object q_wenhao_num: TEdit
        Left = 635
        Top = 22
        Width = 44
        Height = 21
        Hint = #35831#36755#20837#20855#20307#30340#25991#21495
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnChange = q_wenhao_numChange
      end
      object btn4: TButton
        Left = 730
        Top = 57
        Width = 75
        Height = 25
        Hint = #28857#20987#21518#23558#25353#29031#24744#25152#25552#20379#30340#20449#24687#36827#34892#32452#21512#26597#35810
        Caption = #26597#35810'(&Q)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = btn4Click
      end
      object cbb_file: TComboBox
        Left = 612
        Top = 76
        Width = 67
        Height = 21
        Hint = #21487#20197#35774#23450#26159#21542#26377#30005#23376#25991#26723#36827#34892#26597#35810
        Style = csDropDownList
        ItemIndex = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        Items.Strings = (
          ''
          #26377#25991#26723
          #26080#25991#26723)
      end
      object q_Memo: TEdit
        Left = 101
        Top = 103
        Width = 168
        Height = 21
        Hint = #36890#36807#22791#27880#26639#20013#30340#20449#24687#36827#34892#26597#35810
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
      end
      object cbb_xxgk: TComboBox
        Left = 428
        Top = 103
        Width = 112
        Height = 21
        Style = csDropDownList
        TabOrder = 12
        Items.Strings = (
          ''
          #20027#21160#20844#24320
          #20381#30003#35831#20844#24320
          #19981#20104#20844#24320)
      end
    end
    object grp_manager: TGroupBox
      Left = 839
      Top = 8
      Width = 390
      Height = 145
      Align = alCustom
      Caption = #25968#25454#31649#29702
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      object lbl22: TLabel
        Left = 24
        Top = 21
        Width = 342
        Height = 30
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object btn_Dele: TBitBtn
        Left = 203
        Top = 63
        Width = 75
        Height = 25
        Hint = #28857#20987#21024#38500#24403#21069#35760#24405
        Caption = #21024#38500
        DoubleBuffered = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333FFFFF333333000033333388888833333333333F888888FFF333
          000033338811111188333333338833FFF388FF33000033381119999111833333
          38F338888F338FF30000339119933331111833338F388333383338F300003391
          13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
          33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
          33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
          000039183811193333918338F8F833F83333838F000039118111933339118338
          F3833F83333833830000339111193333391833338F33F8333FF838F300003391
          11833338111833338F338FFFF883F83300003339111888811183333338FF3888
          83FF83330000333399111111993333333388FFFFFF8833330000333333999999
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btn_DeleClick
      end
      object btn_export: TBitBtn
        Left = 295
        Top = 63
        Width = 75
        Height = 25
        Hint = #23558#26597#35810#20986#26469#30340#34920#26684#23548#20986#25991'Excel'#26684#24335#25991#20214
        Caption = #23548#20986
        DoubleBuffered = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
          0000008484000084840000000000000000000000000000000000000000000000
          0000C6C6C600C6C6C600000000000084840000000000FFFFFF00FFFFFF000000
          0000008484000084840000000000000000000000000000000000000000000000
          0000C6C6C600C6C6C600000000000084840000000000FFFFFF00FFFFFF000000
          0000008484000084840000000000000000000000000000000000000000000000
          0000C6C6C600C6C6C600000000000084840000000000FFFFFF00FFFFFF000000
          0000008484000084840000000000000000000000000000000000000000000000
          00000000000000000000000000000084840000000000FFFFFF00FFFFFF000000
          0000008484000084840000848400008484000084840000848400008484000084
          84000084840000848400008484000084840000000000FFFFFF00FFFFFF000000
          0000008484000084840000000000000000000000000000000000000000000000
          00000000000000000000008484000084840000000000FFFFFF00FFFFFF000000
          00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600000000000084840000000000FFFFFF00FFFFFF000000
          00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600000000000084840000000000FFFFFF00FFFFFF000000
          00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600000000000084840000000000FFFFFF00FFFFFF000000
          00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600000000000084840000000000FFFFFF00FFFFFF000000
          00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFFFF000000
          00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C60000000000C6C6C60000000000FFFFFF00FFFFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btn_exportClick
      end
      object btn_Modi: TButton
        Left = 112
        Top = 63
        Width = 75
        Height = 25
        Caption = #20462#25913
        TabOrder = 1
        OnClick = btn_ModiClick
      end
      object btn_dict: TButton
        Left = 20
        Top = 63
        Width = 75
        Height = 25
        Caption = #23383#20856#32500#25252
        TabOrder = 0
        OnClick = btn_dictClick
      end
      object btn_uploadMain: TButton
        Left = 20
        Top = 99
        Width = 75
        Height = 25
        Caption = #20256#27491#25991'(&U)'
        Enabled = False
        TabOrder = 4
        OnClick = btn_uploadMainClick
      end
      object btn_uploadAttach: TButton
        Left = 112
        Top = 99
        Width = 75
        Height = 25
        Caption = #20256#38468#20214'(&A)'
        Enabled = False
        TabOrder = 5
        OnClick = btn_uploadAttachClick
      end
      object btn_DownMain: TButton
        Left = 203
        Top = 99
        Width = 75
        Height = 25
        Caption = #19979#36733#27491#25991
        Enabled = False
        TabOrder = 6
        OnClick = btn_DownMainClick
      end
      object btn_downAttach: TButton
        Left = 295
        Top = 99
        Width = 75
        Height = 25
        Caption = #19979#36733#38468#20214
        Enabled = False
        TabOrder = 7
        OnClick = btn_downAttachClick
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 169
    Width = 1486
    Height = 670
    Hint = #21452#20987#8220#27491#25991#25991#26723#8221#25110#8220#38468#20214#25991#26723#8221#26639#23545#24212#30340#21333#20803#26684#65292#21487#21363#26102#26597#30475#30456#24212#30340#30005#23376#26723#26696#12290#21491#38190#33756#21333#21487#20197#34917#20256#27491#25991#25110#38468#20214#12290
    Align = alClient
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    object dbgrdh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 1486
      Height = 670
      Hint = #21452#20987#8220#27491#25991#25991#26723#8221#25110#8220#38468#20214#25991#26723#8221#26639#23545#24212#30340#21333#20803#26684#65292#21487#21363#26102#26597#30475#30456#24212#30340#30005#23376#26723#26696#12290#21491#38190#33756#21333#21487#20197#34917#20256#27491#25991#25110#38468#20214#12290
      Align = alClient
      AutoFitColWidths = True
      ColumnDefValues.Title.Alignment = taCenter
      ColumnDefValues.Title.TitleButton = True
      Ctl3D = True
      DataSource = ds1
      DynProps = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterRowCount = 1
      FooterParams.Color = 16768185
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      HorzScrollBar.Tracking = False
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize]
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      PopupMenu = pm1
      ReadOnly = True
      RowHeight = 18
      ShowHint = True
      STFilter.InstantApply = False
      SumList.Active = True
      TabOrder = 0
      TitleParams.RowHeight = 20
      VertScrollBar.Tracking = False
      OnDblClick = dbgrdh1DblClick
      OnTitleBtnClick = dbgrdh1TitleBtnClick
      Columns = <
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #32534#21495
          Footer.FieldName = #32534#21495
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 82
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = #21457#25991#23383#21495
          Footers = <>
          STFilter.ListSource = ds1
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 123
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #23494#32423
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 45
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = #25991#20214#26631#39064
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 418
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = #20027#36865#21333#20301
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 250
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #25311#31295#20154
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 191
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #21360#21457#26085#26399
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 67
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = #20844#24320#36873#39033
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 68
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #27491#25991#25991#26723
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #38468#20214#25991#26723
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#27880
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 159
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object dlgOpen1: TOpenDialog
    Filter = 
      'Office Document File(*.doc;*.xls;*.docx;*.xlsx;*.pdf;*.txt;)|*.d' +
      'oc;*.xls;*.docx;*.xlsx;*.pdf;*.txt;|Image File(*.jpg;*.jpeg;*.bm' +
      'p;*.gif;)|*.jpg;*.jpeg;*.bmp;*.gif;|'#21387#32553#25991#20214#21253'(*.zip;*.rar;*.7z;*.tar' +
      ')|*.zip;*.rar;*.7z;*.tar'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofNoTestFileCreate, ofEnableSizing]
    Title = #36873#25321#25991#20214
    Left = 1344
    Top = 368
  end
  object con1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=spring5908;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=test;Data Source=10.56.96.241'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 976
    Top = 472
  end
  object ds1: TDataSource
    DataSet = qry2
    Left = 1008
    Top = 568
  end
  object qry2: TADOQuery
    Connection = DataModule2.ADOConnection1
    CursorType = ctStatic
    AfterOpen = qry2AfterOpen
    Parameters = <>
    SQL.Strings = (
      
        'select top 200  fileid as '#32534#21495', filenumber as '#21457#25991#23383#21495',miji as '#23494#32423',titl' +
        'e as '#25991#20214#26631#39064',sendto as '#20027#36865#21333#20301',creater as '#25311#31295#20154',crtime as '#21360#21457#26085#26399',xxgk as '#20844 +
        #24320#36873#39033',mainfile as '#27491#25991#25991#26723', mainfile1 as '#38468#20214#25991#26723',memo1 as '#22791#27880' from Maininf' +
        'o')
    Left = 1008
    Top = 520
  end
  object pm1: TPopupMenu
    Left = 1392
    Top = 368
    object N1: TMenuItem
      Caption = #19978#20256#27491#25991
      Hint = #28857#20987#19978#20256#30005#23376#29256#27491#25991#25991#20214#25110#20854#20182#21387#32553#21253
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #19978#20256#38468#20214
      Hint = #19978#20256#25991#20214#38468#20214#25110#20854#20182#34917#20805#31867#36164#26009
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #19979#36733#27491#25991
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #19979#36733#38468#20214
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #28165#38500#27491#25991
      Hint = #29992#20110#28165#38500#35823#19978#20256#30340#27491#25991
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #28165#38500#38468#20214
      Hint = #28165#38500#19981#38656#35201#30340#38468#20214#30005#23376#25991#20214
      OnClick = N9Click
    end
  end
  object dlgSave1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 1296
    Top = 368
  end
  object qry1: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 952
    Top = 520
  end
end
