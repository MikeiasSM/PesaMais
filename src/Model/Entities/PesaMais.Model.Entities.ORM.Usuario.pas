unit PesaMais.Model.Entities.ORM.Usuario;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// ORM
  ormbr.types.blob, 
  ormbr.types.lazy, 
  dbcbr.types.mapping,
  ormbr.types.nullable,
  dbcbr.mapping.classes,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes, System.Generics.Collections,
  PesaMais.Model.Dao.DaoBase;

type
  [Entity]
  [Table('USUARIO', '')]
  [PrimaryKey('ID_USUARIO', AutoInc, NoSort, False, 'Chave primária')]
  [Sequence('GEN_USUARIO_ID')]
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
    [Column('USUARIO', ftString, 40)]
    [Dictionary('USUARIO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property USUARIO: String read FUSUARIO write FUSUARIO;

    [Restrictions([NotNull])]
    [Column('SENHA', ftString, 40)]
    [Dictionary('SENHA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property SENHA: String read FSENHA write FSENHA;

    [Column('ATIVO', ftBoolean)]
    [Dictionary('ATIVO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ATIVO: Nullable<Boolean> read FATIVO write FATIVO;

    class function FindAll : TObjectList<TUSUARIO>;
    class function GetById(AID : Integer; var AUsuario : TUSUARIO; ARetorno : String) : Boolean;
  end;

implementation

{ TUSUARIO }

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
      ARetorno := 'Usuário não encontrado!';
      Exit(False)
    end;

  finally
    DAO.Free
  end;
end;

initialization
  TRegisterClass.RegisterEntity(TUSUARIO)
end.
