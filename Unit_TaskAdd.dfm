object FrmTaskAdd: TFrmTaskAdd
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #28155#21152#24037#20316#20219#21153
  ClientHeight = 366
  ClientWidth = 569
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
  object lbl_TaskLev: TLabel
    Left = 36
    Top = 24
    Width = 72
    Height = 13
    Caption = #20219#21153#21457#24067#37096#38376
  end
  object lbl1: TLabel
    Left = 60
    Top = 51
    Width = 48
    Height = 13
    Caption = #25991#20214#23383#21495
  end
  object lbl2: TLabel
    Left = 60
    Top = 78
    Width = 48
    Height = 13
    Caption = #26159#21542#20027#21150
  end
  object lbl3: TLabel
    Left = 60
    Top = 105
    Width = 48
    Height = 13
    Caption = #20219#21153#20869#23481
  end
  object lbl4: TLabel
    Left = 60
    Top = 200
    Width = 48
    Height = 13
    Caption = #20998#31649#39046#23548
  end
  object lbl5: TLabel
    Left = 60
    Top = 227
    Width = 48
    Height = 13
    Caption = #20027#21150#20154#21592
  end
  object lbl6: TLabel
    Left = 243
    Top = 227
    Width = 84
    Height = 13
    Caption = #21327#21150#20154#21592#25110#37096#38376
  end
  object lbl7: TLabel
    Left = 36
    Top = 253
    Width = 72
    Height = 13
    Caption = #35201#27714#23436#25104#26085#26399
  end
  object lbl8: TLabel
    Left = 305
    Top = 24
    Width = 72
    Height = 13
    Caption = #20219#21153#25152#23646#24180#24230
  end
  object lbl9: TLabel
    Left = 60
    Top = 281
    Width = 48
    Height = 13
    Caption = #38468#20214#25991#26723
  end
  object btn_AddFile: TSpeedButton
    Left = 460
    Top = 277
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btn_AddFileClick
  end
  object cbb1: TComboBox
    Left = 114
    Top = 21
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    Items.Strings = (
      #20013#22830
      #33258#27835#21306
      #24066#22996#25919#24220
      #26412#23616#26426#20851
      #20854#20182#21333#20301
      #39046#23548#20132#21150)
  end
  object edt_filenum: TEdit
    Left = 114
    Top = 48
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object cbb_zhuban: TComboBox
    Left = 114
    Top = 75
    Width = 99
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    Items.Strings = (
      #20027#21150
      #21327#21150)
  end
  object cbb_Controller: TComboBox
    Left = 114
    Top = 197
    Width = 99
    Height = 21
    TabOrder = 5
  end
  object cbb_Operater: TComboBox
    Left = 114
    Top = 224
    Width = 99
    Height = 21
    TabOrder = 6
  end
  object edt_ViceOperator: TEdit
    Left = 333
    Top = 224
    Width = 200
    Height = 21
    TabOrder = 7
  end
  object dtp1: TDateTimePicker
    Left = 114
    Top = 251
    Width = 99
    Height = 21
    Date = 41713.734379513890000000
    Time = 41713.734379513890000000
    TabOrder = 8
  end
  object btn_Save: TButton
    Left = 189
    Top = 320
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 10
    OnClick = btn_SaveClick
  end
  object btn_cancel: TButton
    Left = 305
    Top = 320
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 11
    OnClick = btn_cancelClick
  end
  object cbb_Year: TComboBox
    Left = 383
    Top = 21
    Width = 89
    Height = 21
    TabOrder = 1
    Items.Strings = (
      '2014'#24180
      '2015'#24180
      '2016'#24180
      '2017'#24180)
  end
  object edt_Attatch: TEdit
    Left = 114
    Top = 278
    Width = 345
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object edt_content: TEdit
    Left = 114
    Top = 102
    Width = 419
    Height = 89
    AutoSize = False
    TabOrder = 4
  end
  object dlgOpen: TOpenDialog
    Filter = #25152#26377#25903#25345#30340#25991#26723#31867#22411'|*.doc;*.docx;*.xls;*.xlsx;*.txt;*.pdf;'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofCreatePrompt, ofNoNetworkButton, ofNoDereferenceLinks, ofEnableSizing]
    Title = #28155#21152#38468#20214#25991#26723
    Left = 8
    Top = 304
  end
  object qry_Add: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Left = 64
    Top = 304
  end
end
