object TabGlobal: TTabGlobal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 306
  Width = 560
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\BD\Agenda\Dados\AGENDA.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 64
  end
  object DataSource1: TDataSource
    Left = 504
    Top = 16
  end
  object FDCommand1: TFDCommand
    Connection = FDConnection1
    Transaction = FDTransaction1
    Left = 32
    Top = 88
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 320
    Top = 112
  end
end
