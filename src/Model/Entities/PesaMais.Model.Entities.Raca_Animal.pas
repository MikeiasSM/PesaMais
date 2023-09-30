unit PesaMais.Model.Entities.Raca_Animal;

interface

uses
  { System }
  DB,
  Classes,
  SysUtils,
  Generics.Collections;

type
  TRACA_ANIMAL = class
  private
    { Private declarations } 
    FID_RACA: Integer;
    FDESCRICAO: String;
  public 
    { Public declarations }
    property ID_RACA: Integer read FID_RACA write FID_RACA;
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;
  end;

implementation

initialization

end.
