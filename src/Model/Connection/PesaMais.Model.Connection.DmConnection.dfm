object Connection: TConnection
  OnCreate = DataModuleCreate
  Height = 158
  Width = 202
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 56
  end
  object FDQuery: TFDQuery
    OnReconcileError = FDQueryReconcileError
    Connection = FDConnection
    Left = 128
    Top = 56
  end
end
