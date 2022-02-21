unit PesaMais.Model.Entities.Proprietario;

interface

uses
  { System }
  DB,
  Classes,
  SysUtils,
  Generics.Collections,

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
  [Table('PROPRIETARIO', '')]
  [PrimaryKey('ID_PROPRIETARIO', AutoInc, NoSort, False, 'Chave primária')]
  [Sequence('GEN_PROPRIETARIO_ID')]
  TPROPRIETARIO = class
  private
    { Private declarations } 
    FID_PROPRIETARIO: Integer;
    FNOME: String;
    FAPELIDO: Nullable<String>;
    FCPJ_CNPJ: Nullable<String>;
    FRG_INSCR: Nullable<String>;
    FFONE1: Nullable<String>;
    FFONE2: Nullable<String>;
    FCONTATO1: Nullable<String>;
    FCONTATO2: Nullable<String>;
    FEMAIL: Nullable<String>;
    FOBS: Nullable<String>;
    FATIVO: Boolean;
  public 
    { Public declarations } 
    [Restrictions([NotNull])]
    [Column('ID_PROPRIETARIO', ftInteger)]
    [Dictionary('ID_PROPRIETARIO', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_PROPRIETARIO: Integer read FID_PROPRIETARIO write FID_PROPRIETARIO;

    [Restrictions([NotNull])]
    [Column('NOME', ftString, 60)]
    [Dictionary('NOME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property NOME: String read FNOME write FNOME;

    [Column('APELIDO', ftString, 60)]
    [Dictionary('APELIDO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property APELIDO: Nullable<String> read FAPELIDO write FAPELIDO;

    [Column('CPJ_CNPJ', ftString, 15)]
    [Dictionary('CPJ_CNPJ', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CPJ_CNPJ: Nullable<String> read FCPJ_CNPJ write FCPJ_CNPJ;

    [Column('RG_INSCR', ftString, 15)]
    [Dictionary('RG_INSCR', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property RG_INSCR: Nullable<String> read FRG_INSCR write FRG_INSCR;

    [Column('FONE1', ftString, 15)]
    [Dictionary('FONE1', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FONE1: Nullable<String> read FFONE1 write FFONE1;

    [Column('FONE2', ftString, 15)]
    [Dictionary('FONE2', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FONE2: Nullable<String> read FFONE2 write FFONE2;

    [Column('CONTATO1', ftString, 30)]
    [Dictionary('CONTATO1', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CONTATO1: Nullable<String> read FCONTATO1 write FCONTATO1;

    [Column('CONTATO2', ftString, 30)]
    [Dictionary('CONTATO2', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CONTATO2: Nullable<String> read FCONTATO2 write FCONTATO2;

    [Column('EMAIL', ftString, 60)]
    [Dictionary('EMAIL', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property EMAIL: Nullable<String> read FEMAIL write FEMAIL;

    [Column('OBS', ftString, 255)]
    [Dictionary('OBS', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property OBS: Nullable<String> read FOBS write FOBS;

    [Restrictions([NotNull])]
    [Column('ATIVO', ftBoolean)]
    [Dictionary('ATIVO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ATIVO: Boolean read FATIVO write FATIVO;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TPROPRIETARIO)

end.
