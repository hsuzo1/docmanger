object frmKM: TfrmKM
  Left = 274
  Top = 231
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #39044#31639#31185#30446#32500#25252
  ClientHeight = 613
  ClientWidth = 1053
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 667
    Top = 170
    Width = 48
    Height = 13
    Caption = #39044#31639#24180#24230
  end
  object Label1: TLabel
    Left = 667
    Top = 197
    Width = 48
    Height = 13
    Caption = #31185#30446#20195#30721
  end
  object lbl2: TLabel
    Left = 667
    Top = 224
    Width = 48
    Height = 13
    Caption = #31185#30446#21517#31216
  end
  object lbl3: TLabel
    Left = 667
    Top = 251
    Width = 48
    Height = 13
    Caption = #25910#25903#31867#22411
  end
  object lbl4: TLabel
    Left = 667
    Top = 292
    Width = 48
    Height = 13
    Caption = #31185#30446#32423#27425
  end
  object lbl5: TLabel
    Left = 667
    Top = 319
    Width = 48
    Height = 13
    Caption = #26159#21542#22312#29992
  end
  object lbl6: TLabel
    Left = 667
    Top = 346
    Width = 48
    Height = 13
    Caption = #22791'        '#27880
  end
  object lbl9: TLabel
    Left = 789
    Top = 319
    Width = 71
    Height = 13
    Caption = '0:'#20572#29992' 1:'#22312#29992
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl10: TLabel
    Left = 789
    Top = 292
    Width = 97
    Height = 13
    Caption = '1:'#31867' 2:'#27454' 3:'#39033' 4:'#30446
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl11: TLabel
    Left = 789
    Top = 251
    Width = 234
    Height = 26
    Caption = '10:'#20844#20849#39044#31639#25910#20837' 11:'#22522#37329#39044#31639#25910#20837' 20:'#20844#20849#39044#31639#25903#20986' 21:'#22522#37329#25903#20986' 30:'#32463#27982#31185#30446
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 0
    Width = 641
    Height = 613
    Align = alLeft
    DataSource = ds1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sYear'
        Title.Alignment = taCenter
        Title.Caption = #39044#31639#24180#24230
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KMDM'
        Title.Alignment = taCenter
        Title.Caption = #31185#30446#20195#30721
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KMMC'
        Title.Alignment = taCenter
        Title.Caption = #31185#30446#21517#31216
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SZLX'
        Title.Alignment = taCenter
        Title.Caption = #25910#25903#31867#22411
        Width = 56
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'JC'
        Title.Alignment = taCenter
        Title.Caption = #31185#30446#32423#27425
        Width = 56
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'inUse'
        Title.Alignment = taCenter
        Title.Caption = #26159#21542#22833#25928
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memo1'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Width = 108
        Visible = True
      end>
  end
  object grp1: TGroupBox
    Left = 658
    Top = 32
    Width = 366
    Height = 121
    Caption = #31185#30446#31579#36873
    TabOrder = 1
    object lbl7: TLabel
      Left = 15
      Top = 80
      Width = 24
      Height = 13
      Caption = #24180#24230
    end
    object lblKMDM: TLabel
      Left = 135
      Top = 80
      Width = 24
      Height = 13
      Caption = #20195#30721
    end
    object lbl8: TLabel
      Left = 24
      Top = 36
      Width = 313
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnQuery: TButton
      Left = 276
      Top = 75
      Width = 75
      Height = 25
      Caption = #25171#24320
      TabOrder = 0
      OnClick = btnQueryClick
    end
    object edtKMDM: TEdit
      Left = 165
      Top = 77
      Width = 89
      Height = 21
      MaxLength = 11
      NumbersOnly = True
      TabOrder = 2
      OnChange = edtKMDMChange
    end
    object cbbYear: TComboBox
      Left = 45
      Top = 77
      Width = 59
      Height = 21
      Style = csDropDownList
      DropDownCount = 10
      ItemIndex = 0
      TabOrder = 1
      Text = '2016'
      OnChange = cbbYearChange
      Items.Strings = (
        '2016'
        '2017'
        '2018'
        '2019'
        '2020'
        '2021'
        '2022'
        '2023')
    end
  end
  object dbtYear: TDBEdit
    Left = 721
    Top = 167
    Width = 51
    Height = 21
    DataField = 'sYear'
    DataSource = ds1
    Enabled = False
    TabOrder = 2
  end
  object dbtKMDM: TDBEdit
    Left = 721
    Top = 194
    Width = 91
    Height = 21
    DataField = 'KMDM'
    DataSource = ds1
    Enabled = False
    TabOrder = 3
  end
  object dbtKMMC: TDBEdit
    Left = 721
    Top = 221
    Width = 303
    Height = 21
    DataField = 'KMMC'
    DataSource = ds1
    Enabled = False
    TabOrder = 4
  end
  object cbbSZLX: TDBComboBox
    Left = 721
    Top = 248
    Width = 51
    Height = 21
    Style = csDropDownList
    DataField = 'SZLX'
    DataSource = ds1
    Enabled = False
    Items.Strings = (
      '10'
      '11'
      '20'
      '21'
      '30')
    TabOrder = 5
  end
  object cbbKMJC: TDBComboBox
    Left = 721
    Top = 289
    Width = 51
    Height = 21
    Style = csDropDownList
    DataField = 'JC'
    DataSource = ds1
    Enabled = False
    Items.Strings = (
      '1'
      '2'
      '3'
      '4')
    TabOrder = 6
  end
  object cbbUse: TDBComboBox
    Left = 721
    Top = 316
    Width = 51
    Height = 21
    Style = csDropDownList
    DataField = 'inUse'
    DataSource = ds1
    Enabled = False
    Items.Strings = (
      '0'
      '1')
    TabOrder = 7
  end
  object dbmmo: TDBMemo
    Left = 721
    Top = 343
    Width = 302
    Height = 66
    DataField = 'Memo1'
    DataSource = ds1
    Enabled = False
    TabOrder = 8
  end
  object btnModify: TButton
    Left = 715
    Top = 444
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 9
    OnClick = btnModifyClick
  end
  object btnCancel: TButton
    Left = 914
    Top = 444
    Width = 75
    Height = 25
    Caption = #21462#28040
    Enabled = False
    TabOrder = 11
    OnClick = btnCancelClick
  end
  object btnDel: TButton
    Left = 817
    Top = 484
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 13
    OnClick = btnDelClick
  end
  object btnInsert: TButton
    Left = 817
    Top = 444
    Width = 75
    Height = 25
    Caption = #26032#22686#31185#30446
    TabOrder = 10
    OnClick = btnInsertClick
  end
  object btnSave: TButton
    Left = 715
    Top = 484
    Width = 75
    Height = 25
    Caption = #20445#23384
    Enabled = False
    TabOrder = 12
    OnClick = btnSaveClick
  end
  object btnClsoe: TButton
    Left = 914
    Top = 484
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 14
    OnClick = btnClsoeClick
  end
  object btnGenNewYear: TButton
    Left = 715
    Top = 537
    Width = 274
    Height = 25
    Caption = #29983#25104#26032#24180#24230#31185#30446
    TabOrder = 15
    OnClick = btnGenNewYearClick
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 400
    Top = 88
  end
  object qry1: TADOQuery
    Connection = DataModule2.ADOConnection1
    CursorType = ctStatic
    AfterOpen = qry1AfterOpen
    Parameters = <>
    SQL.Strings = (
      'select * from zhuijia_kmdm')
    Left = 440
    Top = 88
  end
  object qry_tmp: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 424
    Top = 184
  end
end
