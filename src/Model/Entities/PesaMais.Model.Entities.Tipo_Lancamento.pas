unit PesaMais.Model.Entities.Tipo_Lancamento;

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
  [Table('TIPO_LANCAMENTO', '')]
  [PrimaryKey('ID_TIPO', AutoInc, NoSort, False, 'Chave primária')]
  [Sequence('GEN_ID_TIPO_LANCAMENTO')]
  TTIPO_LANCAMENTO = class
  private
    { Private declarations } 
    FID_TIPO: Integer;
    FDESCRICAO: String;
  public 
    { Public declarations } 
    [Restrictions([NotNull])]
    [Column('ID_TIPO', ftInteger)]
    [Dictionary('ID_TIPO', 'Mensagem de validação', '', '', '', taCenter)]
    property ID_TIPO: Integer read FID_TIPO write FID_TIPO;

    [Restrictions([NotNull])]
    [Column('DESCRICAO', ftString, 30)]
    [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TTIPO_LANCAMENTO)

end.
