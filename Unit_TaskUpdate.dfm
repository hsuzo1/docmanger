object FrmTaskUpdate: TFrmTaskUpdate
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #26356#26032#20219#21153#23436#25104#36827#24230
  ClientHeight = 328
  ClientWidth = 500
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
  object lbl1: TLabel
    Left = 30
    Top = 16
    Width = 48
    Height = 13
    Caption = #20219#21153#20869#23481
  end
  object lbl2: TLabel
    Left = 30
    Top = 119
    Width = 48
    Height = 13
    Caption = #26368#26032#36827#24230
  end
  object lbl3: TLabel
    Left = 30
    Top = 245
    Width = 72
    Height = 13
    Caption = #20219#21153#26159#21542#23436#25104
  end
  object lbl4: TLabel
    Left = 30
    Top = 218
    Width = 72
    Height = 13
    Caption = #28155#21152#35777#26126#25991#26723
  end
  object btn_AddFile: TSpeedButton
    Left = 416
    Top = 215
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btn_AddFileClick
  end
  object lbl_TaskID: TLabel
    Left = 392
    Top = 16
    Width = 77
    Height = 13
    Alignment = taCenter
    AutoSize = False
  end
  object lbl5: TLabel
    Left = 351
    Top = 16
    Width = 36
    Height = 13
    Caption = #24207#21495#65306
  end
  object cbb_isEnd: TComboBox
    Left = 108
    Top = 242
    Width = 113
    Height = 21
    TabOrder = 0
    Items.Strings = (
      #32487#32493#36827#34892
      #20219#21153#23436#25104)
  end
  object btn_save: TButton
    Left = 146
    Top = 278
    Width = 75
    Height = 25
    Caption = #20445#23384#26356#26032
    TabOrder = 1
    OnClick = btn_saveClick
  end
  object btn_cancel: TButton
    Left = 277
    Top = 278
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btn_cancelClick
  end
  object edt_Filename: TEdit
    Left = 108
    Top = 215
    Width = 307
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object edt_Content: TEdit
    Left = 30
    Top = 35
    Width = 439
    Height = 78
    AutoSize = False
    TabOrder = 4
  end
  object edt_NewProgress: TEdit
    Left = 30
    Top = 138
    Width = 439
    Height = 71
    AutoSize = False
    TabOrder = 5
  end
  object dlgOpen: TOpenDialog
    Filter = #25152#26377#25903#25345#30340#25991#26723#31867#22411'|*.doc;*.docx;*.xls;*.xlsx;*.txt;*.pdf;'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofCreatePrompt, ofNoNetworkButton, ofNoDereferenceLinks, ofEnableSizing]
    Title = #28155#21152#38468#20214#25991#26723
    Top = 224
  end
  object qry1: TADOQuery
    Connection = DataModule2.ADOConnection1
    Parameters = <>
    Top = 272
  end
end
