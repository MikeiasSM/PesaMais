unit PesaMais.Model.Entities.Lote;

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
  [Table('LOTE', '')]
  [PrimaryKey('ID_LOTE', AutoInc, NoSort, False, 'Chave prim�ria')]
  [Sequence('GEN_ID_LOTE')]
  TLOTE = class
  private
    { Private declarations } 
    FID_LOTE: Integer;
    FDESCRICAO: String;
  public 
    { Public declarations } 
    [Restrictions([NotNull])]
    [Column('ID_LOTE', ftInteger)]
    [Dictionary('ID_LOTE', 'Mensagem de valida��o', '', '', '', taCenter)]
    property ID_LOTE: Integer read FID_LOTE write FID_LOTE;

    [Restrictions([NotNull])]
    [Column('DESCRICAO', ftString, 60)]
    [Dictionary('DESCRICAO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TLOTE)

end.
