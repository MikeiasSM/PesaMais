unit PesaMais.Model.Entities.Pessoa;
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

  { PesaMais }
  //PesaMais.Model.Entities.Endereco;

type
  [Entity]
  [Table('PESSOA', '')]
  [PrimaryKey('ID_PESSOA', AutoInc, NoSort, False, 'Chave prim�ria')]
  [Sequence('GEN_ID_PESSOA')]
  [OrderBy('ID_PESSOA ASC')]
  TPESSOA = class
  private
    { Private declarations }
    FID_PESSOA: Integer;
    FNOME: String;
    FAPELIDO: Nullable<String>;
    FTIPO_PESSOA: String;
    FFLAG_CLIENTE: Boolean;
    FFLAG_FORNECEDOR: Boolean;
    FFLAG_COLABORADOR: Boolean;
    FCPJ_CNPJ: Nullable<String>;
    FRG_INSCR: Nullable<String>;
    FFONE1: Nullable<String>;
    FFONE2: Nullable<String>;
    FCONTATO1: Nullable<String>;
    FCONTATO2: Nullable<String>;
    FEMAIL: Nullable<String>;
    FOBS: Nullable<String>;
    FATIVO: Boolean;
    //FENDERECOS : TObjectList<TENDERECO>;
  public
    { Public declarations }
    [Restrictions([NotNull])]
    [Column('ID_PESSOA', ftInteger)]
    [Dictionary('ID_PESSOA', 'Mensagem de valida��o', '', '', '', taCenter)]
    property id_pessoa: Integer read FID_PESSOA write FID_PESSOA;

    [Restrictions([NotNull])]
    [Column('NOME', ftString, 60)]
    [Dictionary('NOME', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property nome: String read FNOME write FNOME;

    [Column('APELIDO', ftString, 60)]
    [Dictionary('APELIDO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property apelido: Nullable<String> read FAPELIDO write FAPELIDO;

    [Restrictions([NotNull])]
    [Column('TIPO_PESSOA', ftString, 1)]
    [Dictionary('TIPO_PESSOA', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property tipo_pessoa: String read FTIPO_PESSOA write FTIPO_PESSOA;

    [Restrictions([NotNull])]
    [Column('FLAG_CLIENTE', ftBoolean)]
    [Dictionary('FLAG_CLIENTE', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property flag_cliente: Boolean read FFLAG_CLIENTE write FFLAG_CLIENTE;

    [Restrictions([NotNull])]
    [Column('FLAG_FORNECEDOR', ftBoolean)]
    [Dictionary('FLAG_FORNECEDOR', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property flag_fornecedor: Boolean read FFLAG_FORNECEDOR write FFLAG_FORNECEDOR;

    [Restrictions([NotNull])]
    [Column('FLAG_COLABORADOR', ftBoolean)]
    [Dictionary('FLAG_COLABORADOR', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property flag_colaborador: Boolean read FFLAG_COLABORADOR write FFLAG_COLABORADOR;

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
    {
    [Association(OneToMany, 'id_pessoa', 'endereco', 'id_pessoa')]
    [CascadeActions([CascadeAutoInc, CascadeInsert, CascadeUpdate, CascadeDelete])]
    property enderecos : TObjectList<TENDERECO> read FENDERECOS write FENDERECOS;
    }

    procedure IsFisica(tipo : Boolean); overload;
    procedure IsFisica(tipo : String);  Overload;
    function ToString : String;

  end;

implementation

{ TPESSOA }

procedure TPESSOA.IsFisica(tipo: Boolean);
begin
  if tipo = true then
    FTIPO_PESSOA := 'F'
  else
    FTIPO_PESSOA := 'J';
end;

procedure TPESSOA.IsFisica(tipo: String);
begin
  if tipo = 'FISICA' then
    FTIPO_PESSOA := 'F'
  else
    FTIPO_PESSOA := 'J';
end;

function TPESSOA.ToString: String;
begin
  Result := IntToStr(FID_PESSOA) + ' - ' + FNOME;
end;

initialization
  TRegisterClass.RegisterEntity(TPESSOA)

end.

