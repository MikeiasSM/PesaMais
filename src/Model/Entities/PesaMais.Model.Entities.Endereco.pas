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
  PesaMais.Model.Entities.Proprietario;

type
  [Entity]
  [Table('ENDERECO', '')]
  [PrimaryKey('ID_ENDERECO', AutoInc, NoSort, False, 'Chave primária')]
  [Sequence('GEN_ENDERECO_ID')]
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
    FID_PROPRIETARIO: Integer;
    FBAIRRO: Nullable<String>;

    FCIDADE_0:  TCIDADE  ;
    FESTADO_1:  TESTADO  ;
    FPROPRIETARIO_2:  TPROPRIETARIO  ;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('ID_ENDERECO', ftInteger)]
    [Dictionary('ID_ENDERECO', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_ENDERECO: Integer read FID_ENDERECO write FID_ENDERECO;

    [Restrictions([NotNull])]
    [Column('DESCRICAO', ftString, 60)]
    [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;

    [Column('LOGRADOURO', ftString, 200)]
    [Dictionary('LOGRADOURO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property LOGRADOURO: Nullable<String> read FLOGRADOURO write FLOGRADOURO;

    [Column('NUMERO', ftString, 10)]
    [Dictionary('NUMERO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property NUMERO: Nullable<String> read FNUMERO write FNUMERO;

    [Column('COMPLEMENTO', ftString, 200)]
    [Dictionary('COMPLEMENTO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property COMPLEMENTO: Nullable<String> read FCOMPLEMENTO write FCOMPLEMENTO;

    [Restrictions([NotNull])]
    [Column('ID_CIDADE', ftInteger)]
    [ForeignKey('FK_ENDERECO_2', 'ID_CIDADE', 'CIDADE', 'ID_CIDADE', SetNull, SetNull)]
    [Dictionary('ID_CIDADE', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_CIDADE: Integer read FID_CIDADE write FID_CIDADE;

    [Restrictions([NotNull])]
    [Column('ID_ESTADO', ftInteger)]
    [ForeignKey('FK_ENDERECO_3', 'ID_ESTADO', 'ESTADO', 'ID_ESTADO', SetNull, SetNull)]
    [Dictionary('ID_ESTADO', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_ESTADO: Integer read FID_ESTADO write FID_ESTADO;

    [Column('OBS', ftString, 255)]
    [Dictionary('OBS', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property OBS: Nullable<String> read FOBS write FOBS;

    [Restrictions([NotNull])]
    [Column('ATIVO', ftBoolean)]
    [Dictionary('ATIVO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ATIVO: Boolean read FATIVO write FATIVO;

    [Restrictions([NotNull])]
    [Column('ID_PROPRIETARIO', ftInteger)]
    [ForeignKey('FK_ENDERECO_4', 'ID_PROPRIETARIO', 'PROPRIETARIO', 'ID_PROPRIETARIO', SetNull, SetNull)]
    [Dictionary('ID_PROPRIETARIO', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_PROPRIETARIO: Integer read FID_PROPRIETARIO write FID_PROPRIETARIO;

    [Column('BAIRRO', ftString, 60)]
    [Dictionary('BAIRRO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property BAIRRO: Nullable<String> read FBAIRRO write FBAIRRO;

    [Association(OneToOne,'ID_CIDADE','CIDADE','ID_CIDADE')]
    property CIDADE: TCIDADE read FCIDADE_0 write FCIDADE_0;

    [Association(OneToOne,'ID_ESTADO','ESTADO','ID_ESTADO')]
    property ESTADO: TESTADO read FESTADO_1 write FESTADO_1;

    [Association(OneToOne,'ID_PROPRIETARIO','PROPRIETARIO','ID_PROPRIETARIO')]
    property PROPRIETARIO: TPROPRIETARIO read FPROPRIETARIO_2 write FPROPRIETARIO_2;

  end;

implementation

constructor TENDERECO.Create;
begin
  FCIDADE_0 := TCIDADE.Create;
  FESTADO_1 := TESTADO.Create;
  FPROPRIETARIO_2 := TPROPRIETARIO.Create;
end;

destructor TENDERECO.Destroy;
begin
  if Assigned(FCIDADE_0) then
    FCIDADE_0.Free;

  if Assigned(FESTADO_1) then
    FESTADO_1.Free;

  if Assigned(FPROPRIETARIO_2) then
    FPROPRIETARIO_2.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TENDERECO)

end.
