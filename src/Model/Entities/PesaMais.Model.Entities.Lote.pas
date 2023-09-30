unit PesaMais.Model.Entities.Lote;

interface

uses
  { System }
  DB,
  Classes, 
  SysUtils, 
  Generics.Collections;

type
  TLOTE = class
  private
    { Private declarations } 
    FID_LOTE: Integer;
    FDESCRICAO: String;

  public 
    { Public declarations }
    property ID_LOTE: Integer read FID_LOTE write FID_LOTE;
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;

  end;

implementation

initialization

end.
