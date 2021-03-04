object frmSoftuser: TfrmSoftuser
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #31995#32479#21442#25968#31649#29702
  ClientHeight = 387
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 8
    Top = 24
    Width = 591
    Height = 353
    ActivePage = ts_user
    Align = alCustom
    MultiLine = True
    TabOrder = 1
    object ts_user: TTabSheet
      Caption = #29992#25143#31649#29702
      OnShow = ts_userShow
      ExplicitHeight = 366
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 583
        Height = 144
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        ExplicitHeight = 113
        object lbl1: TLabel
          Left = 38
          Top = 31
          Width = 36
          Height = 13
          Caption = #29992#25143#21517
        end
        object lbl2: TLabel
          Left = 202
          Top = 32
          Width = 24
          Height = 13
          Caption = #23494#30721
        end
        object lblDpt: TLabel
          Left = 396
          Top = 32
          Width = 48
          Height = 13
          Caption = #38582#23646#37096#38376
        end
        object btn_Add: TButton
          Left = 55
          Top = 68
          Width = 75
          Height = 25
          Caption = #28155#21152'(&A)'
          TabOrder = 3
          OnClick = btn_AddClick
        end
        object btn_cancel: TButton
          Left = 452
          Top = 68
          Width = 75
          Height = 25
          Caption = #21462#28040'(&C)'
          TabOrder = 7
          OnClick = btn_cancelClick
        end
        object btn_dele: TButton
          Left = 254
          Top = 68
          Width = 75
          Height = 25
          Caption = #21024#38500'(&D)'
          TabOrder = 5
          OnClick = btn_deleClick
        end
        object btn_modi: TButton
          Left = 154
          Top = 68
          Width = 75
          Height = 25
          Caption = #20462#25913'(&M)'
          TabOrder = 4
          OnClick = btn_modiClick
        end
        object btn_save: TButton
          Left = 353
          Top = 68
          Width = 75
          Height = 25
          Caption = #20445#23384'(&S)'
          TabOrder = 6
          OnClick = btn_saveClick
        end
        object cbb1: TComboBox
          Left = 450
          Top = 28
          Width = 111
          Height = 21
          DropDownCount = 15
          TabOrder = 2
          Items.Strings = (
            #23616#39046#23548
            #22269#24211#31185
            #39044#31639#31185)
        end
        object edt1: TEdit
          Left = 80
          Top = 28
          Width = 79
          Height = 21
          TabOrder = 0
        end
        object edt2: TEdit
          Left = 232
          Top = 28
          Width = 121
          Height = 21
          TabOrder = 1
        end
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 144
        Width = 583
        Height = 181
        Align = alBottom
        Ctl3D = True
        DataSource = ds1
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object ts_Dept: TTabSheet
      Caption = #37096#38376#31649#29702
      ImageIndex = 1
      OnShow = ts_DeptShow
      ExplicitHeight = 366
      object dbgrd_dept: TDBGrid
        Left = 0
        Top = 0
        Width = 583
        Height = 325
        Align = alClient
        DataSource = ds_dept
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
            FieldName = 'DeptNo'
            Title.Alignment = taCenter
            Width = 46
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DeptName'
            Title.Alignment = taCenter
            Width = 82
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DeptLev'
            Title.Alignment = taCenter
            Width = 58
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Password'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ShortName'
            Title.Alignment = taCenter
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FileHeader'
            Title.Alignment = taCenter
            Width = 150
            Visible = True
          end>
      end
    end
    object ts_app: TTabSheet
      Caption = #36719#20214#21457#24067
      ImageIndex = 2
      OnShow = ts_appShow
      ExplicitHeight = 333
      object dbgrd_app: TDBGrid
        Left = 0
        Top = 0
        Width = 583
        Height = 325
        Align = alClient
        DataSource = ds_app
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'sDate'
            Title.Alignment = taCenter
            Width = 130
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'cType'
            Title.Alignment = taCenter
            Width = 45
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'sVersion'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNew'
            Title.Alignment = taCenter
            Width = 293
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sUrl'
            Title.Alignment = taCenter
            Width = 300
            Visible = True
          end>
      end
    end
  end
  object btn1: TButton
    Left = 464
    Top = 8
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 0
    OnClick = btn1Click
  end
  object qry1: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 120
    Top = 240
  end
  object ds1: TDataSource
    DataSet = qry1
    OnDataChange = ds1DataChange
    Left = 160
    Top = 240
  end
  object qry2: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 192
    Top = 240
  end
  object ds_dept: TDataSource
    DataSet = qry_dept
    Left = 392
    Top = 240
  end
  object qry_dept: TADOQuery
    Connection = DataModule2.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Dept order by DeptNo ASC')
    Left = 344
    Top = 240
  end
  object qry_app: TADOQuery
    Connection = DataModule2.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from appversion')
    Left = 344
    Top = 320
  end
  object ds_app: TDataSource
    DataSet = qry_app
    Left = 392
    Top = 320
  end
end
