object frmTaskList: TfrmTaskList
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'frmTaskList'
  ClientHeight = 718
  ClientWidth = 1486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1486
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1486
      137)
    object btn1: TButton
      Left = 1335
      Top = 22
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #36864#20986'(&C)'
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 879
      Top = 22
      Width = 75
      Height = 25
      Hint = #26032#22686#24037#20316#20219#21153
      Caption = #28155#21152#20219#21153
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 999
      Top = 22
      Width = 75
      Height = 25
      Hint = #21024#38500#20219#21153#65292#35831#35880#24910#25805#20316#65281
      Caption = #21024#38500#20219#21153
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btn3Click
    end
    object btn4: TButton
      Left = 879
      Top = 84
      Width = 75
      Height = 25
      Hint = #19978#25253#26368#26032#30340#20219#21153#23436#25104#24773#20917
      Caption = #36827#24230#26356#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btn4Click
    end
    object grp1: TGroupBox
      Left = 16
      Top = 11
      Width = 841
      Height = 115
      Caption = #20219#21153#26597#35810
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 4
      object lbl_TaskLev: TLabel
        Left = 20
        Top = 24
        Width = 72
        Height = 13
        Caption = #20219#21153#21457#24067#37096#38376
      end
      object lbl1: TLabel
        Left = 517
        Top = 24
        Width = 48
        Height = 13
        Caption = #25991#20214#23383#21495
      end
      object lbl2: TLabel
        Left = 44
        Top = 51
        Width = 48
        Height = 13
        Caption = #26159#21542#20027#21150
      end
      object lbl3: TLabel
        Left = 277
        Top = 51
        Width = 84
        Height = 13
        Caption = #20219#21153#20869#23481#20851#38190#23383
      end
      object lbl4: TLabel
        Left = 517
        Top = 51
        Width = 48
        Height = 13
        Caption = #20998#31649#39046#23548
      end
      object lbl5: TLabel
        Left = 44
        Top = 78
        Width = 48
        Height = 13
        Caption = #20027#21150#20154#21592
      end
      object lbl7: TLabel
        Left = 289
        Top = 78
        Width = 72
        Height = 13
        Caption = #35201#27714#23436#25104#26085#26399
      end
      object lbl8: TLabel
        Left = 289
        Top = 24
        Width = 72
        Height = 13
        Caption = #20219#21153#25152#23646#24180#24230
      end
      object Label1: TLabel
        Left = 517
        Top = 78
        Width = 48
        Height = 13
        Caption = #20219#21153#29366#24577
      end
      object cbb1: TComboBox
        Left = 98
        Top = 21
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        Items.Strings = (
          #25152#26377#37096#38376
          #20013#22830
          #33258#27835#21306
          #24066#22996#25919#24220
          #26412#23616#26426#20851
          #20854#20182#21333#20301
          #39046#23548#20132#21150)
      end
      object edt_filenum: TEdit
        Left = 571
        Top = 21
        Width = 145
        Height = 21
        TabOrder = 1
      end
      object cbb_zhuban: TComboBox
        Left = 98
        Top = 48
        Width = 99
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        Items.Strings = (
          #20840#37096
          #20027#21150
          #21327#21150)
      end
      object cbb_Controller: TComboBox
        Left = 571
        Top = 48
        Width = 99
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnDropDown = cbb_ControllerDropDown
      end
      object cbb_Operater: TComboBox
        Left = 98
        Top = 75
        Width = 99
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        OnDropDown = cbb_OperaterDropDown
      end
      object cbb_Year: TComboBox
        Left = 367
        Top = 21
        Width = 114
        Height = 21
        Style = csDropDownList
        TabOrder = 5
        Items.Strings = (
          #25152#26377#24180#24230
          '2013'#24180
          '2014'#24180
          '2015'#24180
          '2016'#24180
          '2017'#24180)
      end
      object edt_Content: TEdit
        Left = 367
        Top = 48
        Width = 114
        Height = 21
        TabOrder = 6
      end
      object cbb_isEnd: TComboBox
        Left = 571
        Top = 75
        Width = 99
        Height = 21
        Style = csDropDownList
        TabOrder = 7
        Items.Strings = (
          #32487#32493#36827#34892
          #20219#21153#23436#25104)
      end
      object btn_Query: TButton
        Left = 744
        Top = 46
        Width = 75
        Height = 25
        Hint = #26681#25454#35774#23450#30340#26465#20214#26597#30475#20219#21153
        Caption = #26597#35810'(&Q)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = btn_QueryClick
      end
      object cbb_Month: TComboBox
        Left = 367
        Top = 75
        Width = 114
        Height = 21
        Style = csDropDownList
        DropDownCount = 13
        ItemIndex = 0
        TabOrder = 9
        Text = #20840#37096#26102#38388#27573
        Items.Strings = (
          #20840#37096#26102#38388#27573
          '1'#26376
          '2'#26376
          '3'#26376
          '4'#26376
          '5'#26376
          '6'#26376
          '7'#26376
          '8'#26376
          '9'#26376
          '10'#26376
          '11'#26376
          '12'#26376)
      end
    end
    object btn_Export: TBitBtn
      Left = 999
      Top = 84
      Width = 75
      Height = 25
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
      TabOrder = 5
      OnClick = btn_ExportClick
    end
    object btn_AddFile: TBitBtn
      Left = 1112
      Top = 84
      Width = 75
      Height = 25
      Caption = #20256#38468#20214
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002B2B2B002B2B2B002B2B2B002B2B
        2B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF002B2B2B005353FF008D8BFF008D8BFF003334
        CB002B2B2B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF002B2B2B00ACABFF004545FF004142E600ACAB
        FF002B2B2B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF002B2B2B00ACABFF004545FF003D3EF300ACAB
        FF002B2B2B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF002B2B2B00323232003232320032323200ACABFF004A49FF004444F200ACAB
        FF00323232002B2B2B002B2B2B002B2B2B00FFFFFF00FFFFFF00FFFFFF003232
        3200C5C5FF00C5C5FF00ACABFF008885FF005D5DFF004444F2004142E6004545
        FF00ACABFF00ACABFF00ACABFF008D8BFF002B2B2B00FFFFFF00FFFFFF003232
        3200DEDEFF008D8BFF006B6BFF006363FF005353FF004948ED004142E6004142
        E6004444F2003D3EF3004142E600ACABFF002B2B2B00FFFFFF00FFFFFF003232
        3200ECECFF009494FF007474FF006B6BFF005353FF004D4DF4004948ED004444
        F2004A49FF004545FF004545FF00ACABFF002B2B2B00FFFFFF00FFFFFF003232
        3200DEDEFF00ECECFF00D0D0FF00ACABFF007474FF005353FF005353FF005D5D
        FF00ACABFF00ACABFF00ACABFF008D8BFF002B2B2B00FFFFFF00FFFFFF00FFFF
        FF003232320032323200323232003B3B3B00ACABFF006B6BFF006363FF008D8B
        FF00323232002B2B2B002B2B2B002B2B2B00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0032323200D0D0FF007474FF007474FF00ACAB
        FF0032323200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0032323200ECECFF009494FF009494FF00CBCB
        FF0032323200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0032323200E5E3FF00ECECFF00E5E3FF00CBCB
        FF0032323200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003232320032323200323232003232
        3200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = btn_AddFileClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 137
    Width = 1486
    Height = 581
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbgrdh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 1486
      Height = 581
      Align = alClient
      AllowedOperations = []
      AutoFitColWidths = True
      Ctl3D = True
      DataGrouping.GroupLevels = <>
      DataSource = ds1
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      OptionsEh = [dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
      ParentCtl3D = False
      ReadOnly = True
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      TitleHeight = 18
      OnDblClick = dbgrdh1DblClick
      Columns = <
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = #20219#21153#19979#36798#37096#38376
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = #20219#21153#24180#24230
          Footers = <>
          Title.Alignment = taCenter
          Width = 54
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = #25991#21495
          Footers = <>
          Title.Alignment = taCenter
          Width = 97
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = #20027#21150#31867#22411
          Footers = <>
          Title.Alignment = taCenter
          Width = 52
        end
        item
          EditButtons = <>
          FieldName = #20219#21153#20869#23481
          Footers = <>
          Title.Alignment = taCenter
          Width = 600
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = #36127#36131#39046#23548
          Footers = <>
          Title.Alignment = taCenter
          Width = 60
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = #20027#21150#20154
          Footers = <>
          Title.Alignment = taCenter
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = #21327#21150#20154
          Footers = <>
          Title.Alignment = taCenter
          Width = 59
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = #21040#26399#26085#26399
          Footers = <>
          Title.Alignment = taCenter
          Width = 66
        end
        item
          EditButtons = <>
          FieldName = #38468#20214#21517
          Footers = <>
          Title.Alignment = taCenter
          Width = 162
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = #26159#21542#23436#32467
          Footers = <>
          Title.Alignment = taCenter
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = #26368#26032#36827#23637
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = #36827#24230#35777#26126#26448#26009
          Footers = <>
          Title.Alignment = taCenter
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ds1: TDataSource
    DataSet = qry_Main
    Left = 384
    Top = 432
  end
  object qry_Main: TADOQuery
    Connection = DataModule2.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ''
      
        'Select a.TaskID As '#24207#21495', a.XDBM AS '#20219#21153#19979#36798#37096#38376',a.sYear AS '#20219#21153#24180#24230' , a.WJBH' +
        ' AS '#25991#21495', a.ZBLX AS '#20027#21150#31867#22411','
      
        'a.TaskContent AS '#20219#21153#20869#23481', a.Admin AS '#36127#36131#39046#23548', a.Operter AS '#20027#21150#20154', a.Vice' +
        'Operter AS '#21327#21150#20154', a.EndDate AS '#21040#26399#26085#26399','
      
        ' a.sFileName AS '#38468#20214#21517', a.isEnd AS '#26159#21542#23436#32467',(select Top 1 b.Detail from' +
        ' TaskProgress AS b where b.TaskID=a.TaskID Order by b.NewDate De' +
        'sc) As '#26368#26032#36827#23637' ,'
      
        '(select Top 1 b.sFileName from TaskProgress AS b where b.TaskID=' +
        'a.TaskID Order by b.NewDate Desc)  As '#36827#24230#35777#26126#26448#26009'  '
      'From TaskList AS a Order by a.TaskID ASC')
    Left = 384
    Top = 352
  end
  object qry2: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 456
    Top = 352
  end
  object dlgSave1: TSaveDialog
    DefaultExt = '*.xls'
    Filter = 'Microsoft Excel File(*.xls;*.xlsx)|*.xls;*.xlsx'
    Left = 592
    Top = 352
  end
end
