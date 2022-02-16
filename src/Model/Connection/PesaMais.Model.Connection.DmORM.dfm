object ConnectionFactory: TConnectionFactory
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 235
  Width = 149
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Delphi\Exemplo\Database\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 56
    Top = 88
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 56
    Top = 136
  end
end
