unit PesaMais.Model.Entities.Cidade;

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
  PesaMais.Model.Entities.estado;

type
  [Entity]
  [Table('CIDADE', '')]
  [PrimaryKey('ID_CIDADE', AutoInc, NoSort, False, 'Chave primária')]
  [Sequence('GEN_ID_CIDADE')]
  [OrderBy('NOME ASC')]
  TCIDADE = class
  private
    { Private declarations }
    FID_CIDADE: Integer;
    FNOME: String;
    FCEP: Nullable<String>;
    FCODMUN_IBGE: Nullable<String>;
    FID_ESTADO: Integer;

    FESTADO_0: Lazy< TESTADO > ;
  public
    { Public declarations }
    constructor Create;
    function getESTADO_0 : TESTADO;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('ID_CIDADE', ftInteger)]
    [Dictionary('ID_CIDADE', 'Mensagem de validação', '', '', '', taCenter)]
    property id_cidade: Integer read FID_CIDADE write FID_CIDADE;

    [Restrictions([NotNull])]
    [Column('NOME', ftString, 60)]
    [Dictionary('NOME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nome: String read FNOME write FNOME;

    [Column('CEP', ftString, 8)]
    [Dictionary('CEP', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cep: Nullable<String> read FCEP write FCEP;

    [Column('CODMUN_IBGE', ftString, 8)]
    [Dictionary('CODMUN_IBGE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property codmun_ibge: Nullable<String> read FCODMUN_IBGE write FCODMUN_IBGE;

    [Restrictions([NotNull])]
    [Column('ID_ESTADO', ftInteger)]
    [ForeignKey('FK_CIDADE_1', 'ID_ESTADO', 'ESTADO', 'ID_ESTADO', SetNull, SetNull)]
    [Dictionary('ID_ESTADO', 'Mensagem de validação', '', '', '', taCenter)]
    property id_estado: Integer read FID_ESTADO write FID_ESTADO;

    [Association(OneToOne,'ID_ESTADO','ESTADO','ID_ESTADO', True)]
    property estado: TESTADO read getESTADO_0;

  end;

implementation

constructor TCIDADE.Create;
begin
end;

destructor TCIDADE.Destroy;
begin
  if Assigned(FESTADO_0.Value) then
    FESTADO_0.Value.Free;

  inherited;
end;

function TCIDADE.getESTADO_0 : TESTADO;
begin
  Result := FESTADO_0.Value;
end;

initialization
  TRegisterClass.RegisterEntity(TCIDADE)

end.
