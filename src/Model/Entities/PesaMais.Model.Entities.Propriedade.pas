unit PesaMais.Model.Entities.Propriedade;
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

  { Pesa Mais }
  PesaMais.Model.Entities.Cidade,
  PesaMais.Model.Entities.Estado,
  PesaMais.Model.Entities.Proprietario;

type
  [Entity]
  [Table('PROPRIEDADE', '')]
  [PrimaryKey('ID_PROPRIEDADE', AutoInc, NoSort, False, 'Chave primária')]
  [Sequence('GEN_ID_PROPRIEDADE')]
  TPROPRIEDADE = class
  private
    { Private declarations }
    FID_PROPRIEDADE: Integer;
    FDESCRICAO: String;
    FLOGRADOURO: Nullable<String>;
    FNUMERO: Nullable<String>;
    FCOMPLEMENTO: Nullable<String>;
    FID_CIDADE: Integer;
    FID_ESTADO: Integer;
    FOBS: Nullable<String>;
    FATIVO: Boolean;
    FBAIRRO: Nullable<String>;
    FID_PROPRIETARIO: Nullable<Integer>;

    FCIDADE_0: Lazy< TCIDADE > ;
    FESTADO_1: Lazy< TESTADO > ;
    FPROPRIETARIO_2: Lazy< TPROPRIETARIO > ;
  public
    { Public declarations }
    constructor Create;
    function getCIDADE_0 : TCIDADE;
    function getESTADO_1 : TESTADO;
    function getPROPRIETARIO_2 : TPROPRIETARIO;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('ID_PROPRIEDADE', ftInteger)]
    [Dictionary('ID_PROPRIEDADE', 'Mensagem de validação', '', '', '', taCenter)]
    property id_propriedade: Integer read FID_PROPRIEDADE write FID_PROPRIEDADE;

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
    [ForeignKey('FK_PROPRIEDADE_1', 'ID_CIDADE', 'CIDADE', 'ID_CIDADE', SetNull, SetNull)]
    [Dictionary('ID_CIDADE', 'Mensagem de validação', '', '', '', taCenter)]
    property id_cidade: Integer read FID_CIDADE write FID_CIDADE;

    [Restrictions([NotNull])]
    [Column('ID_ESTADO', ftInteger)]
    [ForeignKey('FK_PROPRIEDADE_2', 'ID_ESTADO', 'ESTADO', 'ID_ESTADO', SetNull, SetNull)]
    [Dictionary('ID_ESTADO', 'Mensagem de validação', '', '', '', taCenter)]
    property id_estado: Integer read FID_ESTADO write FID_ESTADO;

    [Column('OBS', ftString, 255)]
    [Dictionary('OBS', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property obs: Nullable<String> read FOBS write FOBS;

    [Restrictions([NotNull])]
    [Column('ATIVO', ftBoolean)]
    [Dictionary('ATIVO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ativo: Boolean read FATIVO write FATIVO;

    [Column('BAIRRO', ftString, 60)]
    [Dictionary('BAIRRO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property bairro: Nullable<String> read FBAIRRO write FBAIRRO;

    [Column('ID_PROPRIETARIO', ftInteger)]
    [ForeignKey('FK_PROPRIEDADE_3', 'ID_PROPRIETARIO', 'PROPRIETARIO', 'ID_PROPRIETARIO', SetNull, SetNull)]
    [Dictionary('ID_PROPRIETARIO', 'Mensagem de validação', '', '', '', taCenter)]
    property id_proprietario: Nullable<Integer> read FID_PROPRIETARIO write FID_PROPRIETARIO;

    [Association(OneToOne,'ID_CIDADE','CIDADE','ID_CIDADE', True)]
    property cidade: TCIDADE read getCIDADE_0;

    [Association(OneToOne,'ID_ESTADO','ESTADO','ID_ESTADO', True)]
    property estado: TESTADO read getESTADO_1;

    [Association(OneToOne,'ID_PROPRIETARIO','PROPRIETARIO','ID_PROPRIETARIO', True)]
    property proprietario: TPROPRIETARIO read getPROPRIETARIO_2;

  end;

implementation

constructor TPROPRIEDADE.Create;
begin
end;

destructor TPROPRIEDADE.Destroy;
begin
  if Assigned(FCIDADE_0.Value) then
    FCIDADE_0.Value.Free;

  if Assigned(FESTADO_1.Value) then
    FESTADO_1.Value.Free;

  if Assigned(FPROPRIETARIO_2.Value) then
    FPROPRIETARIO_2.Value.Free;

  inherited;
end;

function TPROPRIEDADE.getCIDADE_0 : TCIDADE;
begin
  Result := FCIDADE_0.Value;
end;

function TPROPRIEDADE.getESTADO_1 : TESTADO;
begin
  Result := FESTADO_1.Value;
end;

function TPROPRIEDADE.getPROPRIETARIO_2 : TPROPRIETARIO;
begin
  Result := FPROPRIETARIO_2.Value;
end;

initialization
  TRegisterClass.RegisterEntity(TPROPRIEDADE)

end.
