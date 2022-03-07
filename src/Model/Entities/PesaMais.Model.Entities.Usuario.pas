unit PesaMais.Model.Entities.Usuario;

interface

uses
  { System }
  DB,
  Classes,
  SysUtils,
  Generics.Collections,
  System.Generics.Collections,

  { ORMBr }
  ormbr.types.blob,
  ormbr.types.lazy,
  dbcbr.types.mapping,
  ormbr.types.nullable,
  dbcbr.mapping.classes,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes,

  { PesaMais }
  PesaMais.Model.Dao.DaoBase;

type
  [Entity]
  [Table('USUARIO', '')]
  [PrimaryKey('ID_USUARIO', AutoInc, NoSort, False, 'Chave primária')]
  [Sequence('GEN_ID_USUARIO')]
  TUSUARIO = class
  private
    { Private declarations }
    FID_USUARIO: Integer;
    FUSUARIO: String;
    FSENHA: String;
    FATIVO: Nullable<Boolean>;
  public
    { Public declarations }
    [Restrictions([NotNull])]
    [Column('ID_USUARIO', ftInteger)]
    [Dictionary('ID_USUARIO', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_USUARIO: Integer read FID_USUARIO write FID_USUARIO;

    [Restrictions([NotNull])]
    [Column('NOME', ftString, 40)]
    [Dictionary('NOME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property USUARIO: String read FUSUARIO write FUSUARIO;

    [Restrictions([NotNull])]
    [Column('SENHA', ftString, 40)]
    [Dictionary('SENHA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property SENHA: String read FSENHA write FSENHA;

    [Column('ATIVO', ftBoolean)]
    [Dictionary('ATIVO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ATIVO: Nullable<Boolean> read FATIVO write FATIVO;

    class function FindAll : TObjectList<TUSUARIO>;
    class function GetById (AID : Integer; var AUsuario : TUSUARIO; ARetorno : String) : TUsuario;
    class function Insert (AValue : TUSUARIO) : Boolean;
    class function Update (AValue : TUSUARIO; AID : Integer) : Boolean;
    class function Delete (AID : Integer) : Boolean;
  end;

implementation

{ TUSUARIO }

class function TUSUARIO.Delete(AID: Integer): Boolean;
begin
  var
  Dao := TDAOBase<TUSUARIO>.Create;
  try
    try
      Dao.Delete(AID);
      Result := True;
    except
      On E: Exception do
      begin
        Result := False;
        Exit;
      end;
    end;
  finally
    Dao.Free;
  end;
end;

class function TUSUARIO.FindAll: TObjectList<TUSUARIO>;
begin
  var DAO := TDAOBase<TUSUARIO>.Create;
  try
    Result := DAO.FindAll;
  finally
    DAO.Free;
  end;
end;

class function TUSUARIO.GetById(AID: Integer; var AUsuario: TUSUARIO;  ARetorno: String): TUsuario;
begin
  var DAO := TDAOBase<TUSUARIO>.Create;

  try
    AUsuario := DAO.FindById(AID);
    Result := AUsuario;
    if AUsuario = nil then
    begin
      ARetorno := 'Registro não encontrado!';
      Exit()
    end;

  finally
    DAO.Free
  end;
end;

class function TUSUARIO.Insert(AValue : TUSUARIO): Boolean;
begin
  var DAO := TDAOBase<TUSUARIO>.Create;
  try
    try
      Dao.Insert(AValue);
      Result := True;
    except
      On E: Exception do
      begin
        Result := False;
        Exit;
      end;
    end;
  finally
    Dao.Free;
  end;
end;

class function TUSUARIO.Update(AValue: TUSUARIO; AID : Integer) : Boolean;
begin
  var DAO := TDAOBase<TUSUARIO>.Create;
  try
    try
      Dao.Update(AValue, AID);
      Result := True;
    except
      On E: Exception do
      begin
        Result := False;
        Exit;
      end;
    end;
  finally
    Dao.Free;
  end;
end;

initialization

TRegisterClass.RegisterEntity(TUSUARIO)

end.
