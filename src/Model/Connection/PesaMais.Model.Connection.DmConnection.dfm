object Connection: TConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 164
  Width = 228
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Delphi\Exemplo\Database\DADOS.FDB'
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
