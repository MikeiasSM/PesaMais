unit PesaMais.Model.Entities.Animal;

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
  PesaMais.Model.Entities.Categoria_Animal,
  PesaMais.Model.Entities.Lote,
  PesaMais.Model.Entities.Raca_Animal,
  PesaMais.Model.Entities.Usuario;

type
  [Entity]
  [Table('ANIMAL', '')]
  [PrimaryKey('ID_ANIMAL', AutoInc, NoSort, False, 'Chave primária')]
  [Sequence('GEN_ID_ANIMAL')]
  TANIMAL = class
  private
    { Private declarations } 
    FID_ANIMAL: Integer;
    FIDENTIDADE: Nullable<String>;
    FSEXO: Nullable<String>;
    FID_CATEGORIA: Integer;
    FID_RACA_ANIMAL: Integer;
    FID_LOTE: Nullable<Integer>;
    FID_USUARIO: Integer;

    FCATEGORIA_ANIMAL_0:  TCATEGORIA_ANIMAL  ;
    FLOTE_1:  TLOTE  ;
    FRACA_ANIMAL_2:  TRACA_ANIMAL  ;
    FUSUARIO_3:  TUSUARIO  ;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('ID_ANIMAL', ftInteger)]
    [Dictionary('ID_ANIMAL', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_ANIMAL: Integer read FID_ANIMAL write FID_ANIMAL;

    [Column('IDENTIDADE', ftString, 30)]
    [Dictionary('IDENTIDADE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property IDENTIDADE: Nullable<String> read FIDENTIDADE write FIDENTIDADE;

    [Column('SEXO', ftString, 30)]
    [Dictionary('SEXO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property SEXO: Nullable<String> read FSEXO write FSEXO;

    [Restrictions([NotNull])]
    [Column('ID_CATEGORIA', ftInteger)]
    [ForeignKey('FK_ANIMAL_4', 'ID_CATEGORIA', 'CATEGORIA_ANIMAL', 'ID_CATEGORIA', SetNull, SetNull)]
    [Dictionary('ID_CATEGORIA', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_CATEGORIA: Integer read FID_CATEGORIA write FID_CATEGORIA;

    [Restrictions([NotNull])]
    [Column('ID_RACA_ANIMAL', ftInteger)]
    [ForeignKey('FK_ANIMAL_2', 'ID_RACA_ANIMAL', 'RACA_ANIMAL', 'ID_RACA', SetNull, SetNull)]
    [Dictionary('ID_RACA_ANIMAL', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_RACA_ANIMAL: Integer read FID_RACA_ANIMAL write FID_RACA_ANIMAL;

    [Column('ID_LOTE', ftInteger)]
    [ForeignKey('FK_ANIMAL_1', 'ID_LOTE', 'LOTE', 'ID_LOTE', SetNull, SetNull)]
    [Dictionary('ID_LOTE', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_LOTE: Nullable<Integer> read FID_LOTE write FID_LOTE;

    [Restrictions([NotNull])]
    [Column('ID_USUARIO', ftInteger)]
    [ForeignKey('FK_ANIMAL_3', 'ID_USUARIO', 'USUARIO', 'ID_USUARIO', SetNull, SetNull)]
    [Dictionary('ID_USUARIO', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_USUARIO: Integer read FID_USUARIO write FID_USUARIO;

    [Association(OneToOne,'ID_CATEGORIA','CATEGORIA_ANIMAL','ID_CATEGORIA')]
    property CATEGORIA_ANIMAL: TCATEGORIA_ANIMAL read FCATEGORIA_ANIMAL_0 write FCATEGORIA_ANIMAL_0;

    [Association(OneToOne,'ID_LOTE','LOTE','ID_LOTE')]
    property LOTE: TLOTE read FLOTE_1 write FLOTE_1;

    [Association(OneToOne,'ID_RACA_ANIMAL','RACA_ANIMAL','ID_RACA')]
    property RACA_ANIMAL: TRACA_ANIMAL read FRACA_ANIMAL_2 write FRACA_ANIMAL_2;

    [Association(OneToOne,'ID_USUARIO','USUARIO','ID_USUARIO')]
    property USUARIO: TUSUARIO read FUSUARIO_3 write FUSUARIO_3;

  end;

implementation

constructor TANIMAL.Create;
begin
  FCATEGORIA_ANIMAL_0 := TCATEGORIA_ANIMAL.Create;
  FLOTE_1 := TLOTE.Create;
  FRACA_ANIMAL_2 := TRACA_ANIMAL.Create;
  FUSUARIO_3 := TUSUARIO.Create;
end;

destructor TANIMAL.Destroy;
begin
  if Assigned(FCATEGORIA_ANIMAL_0) then
    FCATEGORIA_ANIMAL_0.Free;

  if Assigned(FLOTE_1) then
    FLOTE_1.Free;

  if Assigned(FRACA_ANIMAL_2) then
    FRACA_ANIMAL_2.Free;

  if Assigned(FUSUARIO_3) then
    FUSUARIO_3.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TANIMAL)

end.
