unit PesaMais.Model.Entities.Tipo_Lancamento;

interface

uses
  { System }
  DB,
  Classes,
  SysUtils,
  Generics.Collections;

type
  TTIPO_LANCAMENTO = class
  private
    { Private declarations } 
    FID_TIPO: Integer;
    FDESCRICAO: String;
  public 
    { Public declarations }
    property ID_TIPO: Integer read FID_TIPO write FID_TIPO;
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;
  end;

implementation

initialization

end.
