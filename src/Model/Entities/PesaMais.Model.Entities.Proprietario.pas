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
  [PrimaryKey('ID_PROPRIETARIO', AutoInc, NoSort, False, 'Chave prim�ria')]
  [Sequence('GEN_ID_PROPRIETARIO')]
  TPROPRIETARIO = class
  private
    { Private declarations } 
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
    FTIPO_PROPRIETARIO: String;
  public
    { Public declarations }
    [Restrictions([NotNull])]
    [Column('ID_PROPRIETARIO', ftInteger)]
    [Dictionary('ID_PROPRIETARIO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property id_proprietario: Integer read FID_PROPRIETARIO write FID_PROPRIETARIO;

    [Restrictions([NotNull])]
    [Column('NOME', ftString, 60)]
    [Dictionary('NOME', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property nome: String read FNOME write FNOME;

    [Column('APELIDO', ftString, 60)]
    [Dictionary('APELIDO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property apelido: Nullable<String> read FAPELIDO write FAPELIDO;

    [Column('CPJ_CNPJ', ftString, 15)]
    [Dictionary('CPJ_CNPJ', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property cpj_cnpj: Nullable<String> read FCPJ_CNPJ write FCPJ_CNPJ;

    [Column('RG_INSCR', ftString, 15)]
    [Dictionary('RG_INSCR', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property rg_inscr: Nullable<String> read FRG_INSCR write FRG_INSCR;

    [Column('FONE1', ftString, 15)]
    [Dictionary('FONE1', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property fone1: Nullable<String> read FFONE1 write FFONE1;

    [Column('FONE2', ftString, 15)]
    [Dictionary('FONE2', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property fone2: Nullable<String> read FFONE2 write FFONE2;

    [Column('CONTATO1', ftString, 30)]
    [Dictionary('CONTATO1', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property contato1: Nullable<String> read FCONTATO1 write FCONTATO1;

    [Column('CONTATO2', ftString, 30)]
    [Dictionary('CONTATO2', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property contato2: Nullable<String> read FCONTATO2 write FCONTATO2;

    [Column('EMAIL', ftString, 60)]
    [Dictionary('EMAIL', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property email: Nullable<String> read FEMAIL write FEMAIL;

    [Column('OBS', ftString, 255)]
    [Dictionary('OBS', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property obs: Nullable<String> read FOBS write FOBS;

    [Restrictions([NotNull])]
    [Column('ATIVO', ftBoolean)]
    [Dictionary('ATIVO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property ativo: Boolean read FATIVO write FATIVO;

    [Restrictions([NotNull])]
    [Column('TIPO_PROPRIETARIO', ftString, 1)]
    [Dictionary('TIPO_PROPRIETARIO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property tipo_proprietario: String read FTIPO_PROPRIETARIO write FTIPO_PROPRIETARIO;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TPROPRIETARIO)

end.

