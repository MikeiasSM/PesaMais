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
  [PrimaryKey('ID_ENDERECO', AutoInc, NoSort, False, 'Chave primária')]
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
    FOBS: Nullable<String>;
    FATIVO: Boolean;
    FID_PESSOA: Nullable<Integer>;
    FBAIRRO: Nullable<String>;

    FCIDADE_0:  TCIDADE  ;
    FPESSOA_1:  TPESSOA  ;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('ID_ENDERECO', ftInteger)]
    [Dictionary('ID_ENDERECO', 'Mensagem de validação', '', '', '', taCenter)]
    property id_endereco: Integer read FID_ENDERECO write FID_ENDERECO;

    [Restrictions([NotNull])]
    [Column('DESCRICAO', ftString, 60)]
    [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property descricao: String read FDESCRICAO write FDESCRICAO;

    [Column('LOGRADOURO', ftString, 200)]
    [Dictionary('LOGRADOURO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property logradouro: Nullable<String> read FLOGRADOURO write FLOGRADOURO;

    [Column('NUMERO', ftString, 10)]
    [Dictionary('NUMERO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property numero: Nullable<String> read FNUMERO write FNUMERO;

    [Column('COMPLEMENTO', ftString, 200)]
    [Dictionary('COMPLEMENTO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property complemento: Nullable<String> read FCOMPLEMENTO write FCOMPLEMENTO;

    [Restrictions([NotNull])]
    [Column('ID_CIDADE', ftInteger)]
    [ForeignKey('FK_ENDERECO_1', 'ID_CIDADE', 'CIDADE', 'ID_CIDADE', SetNull, SetNull)]
    [Dictionary('ID_CIDADE', 'Mensagem de validação', '', '', '', taCenter)]
    property id_cidade: Integer read FID_CIDADE write FID_CIDADE;

    [Column('OBS', ftString, 255)]
    [Dictionary('OBS', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property obs: Nullable<String> read FOBS write FOBS;

    [Restrictions([NotNull])]
    [Column('ATIVO', ftBoolean)]
    [Dictionary('ATIVO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ativo: Boolean read FATIVO write FATIVO;

    [Column('ID_PESSOA', ftInteger)]
    [ForeignKey('FK_ENDERECO_3', 'ID_PESSOA', 'PESSOA', 'ID_PESSOA', SetNull, SetNull)]
    [Dictionary('ID_PESSOA', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pessoa: Nullable<Integer> read FID_PESSOA write FID_PESSOA;

    [Column('BAIRRO', ftString, 60)]
    [Dictionary('BAIRRO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property bairro: Nullable<String> read FBAIRRO write FBAIRRO;

    [Association(OneToOne,'ID_CIDADE','CIDADE','ID_CIDADE')]
    property cidade: TCIDADE read FCIDADE_0 write FCIDADE_0;

    [Association(OneToOne,'ID_PESSOA','PESSOA','ID_PESSOA')]
    property pessoa: TPESSOA read FPESSOA_1 write FPESSOA_1;

  end;

implementation

constructor TENDERECO.Create;
begin
  FCIDADE_0 := TCIDADE.Create;
  FPESSOA_1 := TPESSOA.Create;
end;

destructor TENDERECO.Destroy;
begin
  if Assigned(FCIDADE_0) then
    FCIDADE_0.Free;

  if Assigned(FPESSOA_1) then
    FPESSOA_1.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TENDERECO)

end.

