unit PesaMais.Model.Entities.Categoria_Animal;

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
  [Table('CATEGORIA_ANIMAL', '')]
  [PrimaryKey('ID_CATEGORIA', AutoInc, NoSort, False, 'Chave primária')]
  [Sequence('GEN_ID_CATEGORIA_ANIMAL')]
  TCATEGORIA_ANIMAL = class
  private
    { Private declarations } 
    FID_CATEGORIA: Integer;
    FDESCRICAO: String;
  public 
    { Public declarations } 
    [Restrictions([NotNull])]
    [Column('ID_CATEGORIA', ftInteger)]
    [Dictionary('ID_CATEGORIA', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_CATEGORIA: Integer read FID_CATEGORIA write FID_CATEGORIA;

    [Restrictions([NotNull])]
    [Column('DESCRICAO', ftString, 60)]
    [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TCATEGORIA_ANIMAL)

end.
