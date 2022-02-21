unit PesaMais.Model.Entities.Estado;

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
  [Table('ESTADO', '')]
  [PrimaryKey('ID_ESTADO', AutoInc, NoSort, False, 'Chave prim�ria')]
  [Sequence('GEN_ID_ESTADO')]
  TESTADO = class
  private
    { Private declarations } 
    FID_ESTADO: Integer;
    FNOME: String;
    FUF: String;
  public 
    { Public declarations } 
    [Restrictions([NotNull])]
    [Column('ID_ESTADO', ftInteger)]
    [Dictionary('ID_ESTADO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property ID_ESTADO: Integer read FID_ESTADO write FID_ESTADO;

    [Restrictions([NotNull])]
    [Column('NOME', ftString, 60)]
    [Dictionary('NOME', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property NOME: String read FNOME write FNOME;

    [Restrictions([NotNull])]
    [Column('UF', ftString, 2)]
    [Dictionary('UF', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property UF: String read FUF write FUF;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TESTADO)

end.
