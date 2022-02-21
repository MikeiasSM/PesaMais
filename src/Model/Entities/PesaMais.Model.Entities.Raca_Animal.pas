unit PesaMais.Model.Entities.Raca_Animal;

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
  [Table('RACA_ANIMAL', '')]
  [PrimaryKey('ID_RACA', AutoInc, NoSort, False, 'Chave primária')]
  [Sequence('GEN_ID_RACA_ANIMAL')]
  TRACA_ANIMAL = class
  private
    { Private declarations } 
    FID_RACA: Integer;
    FDESCRICAO: String;
  public 
    { Public declarations } 
    [Restrictions([NotNull])]
    [Column('ID_RACA', ftInteger)]
    [Dictionary('ID_RACA', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_RACA: Integer read FID_RACA write FID_RACA;

    [Restrictions([NotNull])]
    [Column('DESCRICAO', ftString, 60)]
    [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TRACA_ANIMAL)

end.
