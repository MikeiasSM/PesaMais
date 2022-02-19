object ConnectionFactory: TConnectionFactory
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 235
  Width = 149
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\PesaMais\Database\PESAMAIS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
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
