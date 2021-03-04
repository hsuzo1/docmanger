object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 96
  Width = 236
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=spring5908;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=test;Data Source=10.56.96.241'
    ConnectionTimeout = 3
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 45
    Top = 9
  end
  object ADOCZXXT: TADOConnection
    ConnectionTimeout = 5
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 147
    Top = 9
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 104
    Top = 8
  end
end
