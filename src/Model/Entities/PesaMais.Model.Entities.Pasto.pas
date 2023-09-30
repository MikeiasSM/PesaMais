unit PesaMais.Model.Entities.Pasto;

interface

uses
  { System }
  DB,
  Classes,
  SysUtils,
  Generics.Collections,

  { PesaMais }
  PesaMais.Model.Entities.endereco;

type
  TPASTO = class
  private
    { Private declarations }
    FID_PASTO: Integer;
    FNOME: String;
    FID_ENDERECO: Integer;

  public 
    { Public declarations } 
    property ID_PASTO: Integer read FID_PASTO write FID_PASTO;
    property NOME: String read FNOME write FNOME;
    property ID_ENDERECO: Integer read FID_ENDERECO write FID_ENDERECO;

  end;

implementation

initialization

end.
