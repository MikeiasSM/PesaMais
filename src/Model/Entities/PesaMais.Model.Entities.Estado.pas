unit PesaMais.Model.Entities.Estado;

interface

uses
  { System }
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections;

type
  TESTADO = class
  private
    { Private declarations } 
    FID_ESTADO: Integer;
    FNOME: String;
    FUF: String;
  public 
    { Public declarations }
    property ID_ESTADO: Integer read FID_ESTADO write FID_ESTADO;
    property NOME: String read FNOME write FNOME;
    property UF: String read FUF write FUF;
  end;

implementation

initialization

end.
