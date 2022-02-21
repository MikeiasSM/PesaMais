unit PesaMais.Model.Entities.Pasto;

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
  PesaMais.Model.Entities.endereco,
  PesaMais.Model.Dao.DaoBase;

type
  [Entity]
  [Table('PASTO', '')]
  [PrimaryKey('ID_PASTO', AutoInc, NoSort, False, 'Chave primária')]
  [Sequence('GEN_PASTO_ID')]
  TPASTO = class
  private
    { Private declarations }
    FID_PASTO: Integer;
    FNOME: String;
    FID_ENDERECO: Integer;

    FENDERECO_0:  TENDERECO  ;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('ID_PASTO', ftInteger)]
    [Dictionary('ID_PASTO', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_PASTO: Integer read FID_PASTO write FID_PASTO;

    [Restrictions([NotNull])]
    [Column('NOME', ftString, 30)]
    [Dictionary('NOME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property NOME: String read FNOME write FNOME;

    [Restrictions([NotNull])]
    [Column('ID_ENDERECO', ftInteger)]
    [ForeignKey('FK_PASTO_1', 'ID_ENDERECO', 'ENDERECO', 'ID_ENDERECO', SetNull, SetNull)]
    [Dictionary('ID_ENDERECO', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_ENDERECO: Integer read FID_ENDERECO write FID_ENDERECO;

    [Association(OneToOne,'ID_ENDERECO','ENDERECO','ID_ENDERECO')]
    property ENDERECO: TENDERECO read FENDERECO_0 write FENDERECO_0;

  end;

implementation

constructor TPASTO.Create;
begin
  FENDERECO_0 := TENDERECO.Create;
end;

destructor TPASTO.Destroy;
begin
  if Assigned(FENDERECO_0) then
    FENDERECO_0.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TPASTO)

end.
