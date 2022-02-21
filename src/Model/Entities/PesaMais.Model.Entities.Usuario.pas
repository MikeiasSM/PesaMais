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
  [PrimaryKey('ID_USUARIO', AutoInc, NoSort, False, 'Chave prim�ria')]
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
    [Dictionary('ID_USUARIO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property ID_USUARIO: Integer read FID_USUARIO write FID_USUARIO;

    [Restrictions([NotNull])]
    [Column('NOME', ftString, 40)]
    [Dictionary('NOME', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property USUARIO: String read FUSUARIO write FUSUARIO;

    [Restrictions([NotNull])]
    [Column('SENHA', ftString, 40)]
    [Dictionary('SENHA', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property SENHA: String read FSENHA write FSENHA;

    [Column('ATIVO', ftBoolean)]
    [Dictionary('ATIVO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property ATIVO: Nullable<Boolean> read FATIVO write FATIVO;

    class function FindAll : TObjectList<TUSUARIO>;
    class function GetById (AID : Integer; var AUsuario : TUSUARIO; ARetorno : String) : Boolean;
    class function Save (AValue : TUSUARIO) : String;
    class function Update (AValue : TUSUARIO; AID : Integer) : String;
    class function Delete (AID : Integer) : String;
  end;

implementation

{ TUSUARIO }

class function TUSUARIO.Delete(AID: Integer): String;
begin
  var
  Dao := TDAOBase<TUSUARIO>.Create;
  try
    try
      Dao.Delete(AID);
      Result := 'Registro Excluido com Sucesso!';
    except
      On E: Exception do
      begin
        Result := E.Message;
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

class function TUSUARIO.GetById(AID: Integer; var AUsuario: TUSUARIO;
  ARetorno: String): Boolean;
begin
  Result := True;
  var DAO := TDAOBase<TUSUARIO>.Create;

  try
    AUsuario := DAO.FindById(AID);
    if AUsuario = nil then
    begin
      ARetorno := 'Registro n�o encontrado!';
      Exit(False)
    end;

  finally
    DAO.Free
  end;
end;

class function TUSUARIO.Save(AValue : TUSUARIO): String;
begin
  var DAO := TDAOBase<TUSUARIO>.Create;
  try
    try
      Dao.Insert(AValue);
      Result := 'Registro Salvo com Sucesso!';
    except
      On E: Exception do
      begin
        Result := E.Message;
        Exit;
      end;
    end;
  finally
    Dao.Free;
  end;
end;

class function TUSUARIO.Update(AValue: TUSUARIO; AID : Integer) : String;
begin
  var DAO := TDAOBase<TUSUARIO>.Create;
  try
    try
      Dao.Update(AValue, AID);
      Result := 'Registro Alterado com Sucesso!';
    except
      On E: Exception do
      begin
        Result := E.Message;
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
