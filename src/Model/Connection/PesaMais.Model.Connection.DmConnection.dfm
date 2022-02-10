object Connection: TConnection
  OnCreate = DataModuleCreate
  Height = 415
  Width = 446
  PixelsPerInch = 96
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
