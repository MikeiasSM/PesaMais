unit PesaMais.Model.Entities.Endereco;

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
  dbcbr.mapping.attributes,

  { PesaMais }
  PesaMais.Model.Entities.Cidade,
  PesaMais.Model.Entities.Estado,
  PesaMais.Model.Entities.Proprietario,
  PesaMais.Model.Entities.Pessoa;

type
  [Entity]
  [Table('ENDERECO', '')]
  [PrimaryKey('ID_ENDERECO', AutoInc, NoSort, False, 'Chave prim�ria')]
  [Sequence('GEN_ID_ENDERECO')]
  TENDERECO = class
  private
    { Private declarations }
    FID_ENDERECO: Integer;
    FDESCRICAO: String;
    FLOGRADOURO: Nullable<String>;
    FNUMERO: Nullable<String>;
    FCOMPLEMENTO: Nullable<String>;
    FID_CIDADE: Integer;
    FID_ESTADO: Integer;
    FOBS: Nullable<String>;
    FATIVO: Boolean;
    FID_PESSOA: Nullable<Integer>;
    FBAIRRO: Nullable<String>;

    FCIDADE_0: Lazy< TCIDADE > ;
    FESTADO_1: Lazy< TESTADO > ;
    FPESSOA_2: Lazy< TPESSOA > ;
  public
    { Public declarations }
    constructor Create;
    function getCIDADE_0 : TCIDADE;
    function getESTADO_1 : TESTADO;
    function getPESSOA_2 : TPESSOA;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('ID_ENDERECO', ftInteger)]
    [Dictionary('ID_ENDERECO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property id_endereco: Integer read FID_ENDERECO write FID_ENDERECO;

    [Restrictions([NotNull])]
    [Column('DESCRICAO', ftString, 60)]
    [Dictionary('DESCRICAO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property descricao: String read FDESCRICAO write FDESCRICAO;

    [Column('LOGRADOURO', ftString, 200)]
    [Dictionary('LOGRADOURO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property logradouro: Nullable<String> read FLOGRADOURO write FLOGRADOURO;

    [Column('NUMERO', ftString, 10)]
    [Dictionary('NUMERO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property numero: Nullable<String> read FNUMERO write FNUMERO;

    [Column('COMPLEMENTO', ftString, 200)]
    [Dictionary('COMPLEMENTO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property complemento: Nullable<String> read FCOMPLEMENTO write FCOMPLEMENTO;

    [Restrictions([NotNull])]
    [Column('ID_CIDADE', ftInteger)]
    [ForeignKey('FK_ENDERECO_1', 'ID_CIDADE', 'CIDADE', 'ID_CIDADE', SetNull, SetNull)]
    [Dictionary('ID_CIDADE', 'Mensagem de valida��o', '', '', '', taCenter)]
    property id_cidade: Integer read FID_CIDADE write FID_CIDADE;

    [Restrictions([NotNull])]
    [Column('ID_ESTADO', ftInteger)]
    [ForeignKey('FK_ENDERECO_2', 'ID_ESTADO', 'ESTADO', 'ID_ESTADO', SetNull, SetNull)]
    [Dictionary('ID_ESTADO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property id_estado: Integer read FID_ESTADO write FID_ESTADO;

    [Column('OBS', ftString, 255)]
    [Dictionary('OBS', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property obs: Nullable<String> read FOBS write FOBS;

    [Restrictions([NotNull])]
    [Column('ATIVO', ftBoolean)]
    [Dictionary('ATIVO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property ativo: Boolean read FATIVO write FATIVO;

    [Column('ID_PESSOA', ftInteger)]
    [ForeignKey('FK_ENDERECO_3', 'ID_PESSOA', 'PESSOA', 'ID_PESSOA', SetNull, SetNull)]
    [Dictionary('ID_PESSOA', 'Mensagem de valida��o', '', '', '', taCenter)]
    property id_pessoa: Nullable<Integer> read FID_PESSOA write FID_PESSOA;

    [Column('BAIRRO', ftString, 60)]
    [Dictionary('BAIRRO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property bairro: Nullable<String> read FBAIRRO write FBAIRRO;

    [Association(OneToOne,'ID_CIDADE','CIDADE','ID_CIDADE', True)]
    property cidade: TCIDADE read getCIDADE_0;

    [Association(OneToOne,'ID_ESTADO','ESTADO','ID_ESTADO', True)]
    property estado: TESTADO read getESTADO_1;

    [Association(OneToOne,'ID_PESSOA','PESSOA','ID_PESSOA', True)]
    property pessoa: TPESSOA read getPESSOA_2;

  end;

implementation

constructor TENDERECO.Create;
begin
end;

destructor TENDERECO.Destroy;
begin
  if Assigned(FCIDADE_0.Value) then
    FCIDADE_0.Value.Free;

  if Assigned(FESTADO_1.Value) then
    FESTADO_1.Value.Free;

  if Assigned(FPESSOA_2.Value) then
    FPESSOA_2.Value.Free;

  inherited;
end;

function TENDERECO.getCIDADE_0 : TCIDADE;
begin
  Result := FCIDADE_0.Value;
end;

function TENDERECO.getESTADO_1 : TESTADO;
begin
  Result := FESTADO_1.Value;
end;

function TENDERECO.getPESSOA_2 : TPESSOA;
begin
  Result := FPESSOA_2.Value;
end;

initialization
  TRegisterClass.RegisterEntity(TENDERECO)

end.

