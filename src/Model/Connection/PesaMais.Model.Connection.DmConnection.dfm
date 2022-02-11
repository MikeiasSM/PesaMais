object Connection: TConnection
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 415
  Width = 446
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\PesaMais\Database\PESAMAIS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 56
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 128
    Top = 56
  end
end
