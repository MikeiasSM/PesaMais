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
  dbcbr.mapping.attributes;

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

  end;

implementation

{ TUSUARIO }

initialization
TRegisterClass.RegisterEntity(TUSUARIO)
end.
