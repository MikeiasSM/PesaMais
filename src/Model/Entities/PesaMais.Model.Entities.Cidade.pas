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
  [PrimaryKey('ID_CIDADE', NotInc, NoSort, False, 'Chave primária')]
  TCIDADE = class
  private
    { Private declarations } 
    FID_CIDADE: Integer;
    FNOME: String;
    FCEP: Nullable<String>;
    FCODMUN_IBGE: Nullable<String>;
    FID_ESTADO: Integer;

    FESTADO_0:  TESTADO;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('ID_CIDADE', ftInteger)]
    [Dictionary('ID_CIDADE', 'Mensagem de validação', '', '', '', taCenter)]
    [Sequence('GEN_ID_CIDADE')]
    property ID_CIDADE: Integer read FID_CIDADE write FID_CIDADE;

    [Restrictions([NotNull])]
    [Column('NOME', ftString, 60)]
    [Dictionary('NOME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property NOME: String read FNOME write FNOME;

    [Column('CEP', ftString, 8)]
    [Dictionary('CEP', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CEP: Nullable<String> read FCEP write FCEP;

    [Column('CODMUN_IBGE', ftString, 8)]
    [Dictionary('CODMUN_IBGE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CODMUN_IBGE: Nullable<String> read FCODMUN_IBGE write FCODMUN_IBGE;

    [Restrictions([NotNull])]
    [Column('ID_ESTADO', ftInteger)]
    [ForeignKey('FK_CIDADE_1', 'ID_ESTADO', 'ESTADO', 'ID_ESTADO', SetNull, SetNull)]
    [Dictionary('ID_ESTADO', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_ESTADO: Integer read FID_ESTADO write FID_ESTADO;

    [Association(OneToOne,'ID_ESTADO','ESTADO','ID_ESTADO')]
    property ESTADO: TESTADO read FESTADO_0 write FESTADO_0;

  end;

implementation

constructor TCIDADE.Create;
begin
  FESTADO_0 := TESTADO.Create;
end;

destructor TCIDADE.Destroy;
begin
  if Assigned(FESTADO_0) then
    FESTADO_0.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TCIDADE)

end.
