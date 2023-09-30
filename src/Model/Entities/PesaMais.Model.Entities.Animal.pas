unit PesaMais.Model.Entities.Animal;

interface

uses
  { System }
  DB,
  Classes,
  SysUtils,
  Generics.Collections,

  { PesaMais }
  PesaMais.Model.Entities.Categoria_Animal,
  PesaMais.Model.Entities.Lote,
  PesaMais.Model.Entities.Raca_Animal,
  PesaMais.Model.Entities.Usuario;

type
  TANIMAL = class
  private
    { Private declarations } 
    FID_ANIMAL: Integer;
    FIDENTIDADE: String;
    FSEXO: String;
    FID_CATEGORIA: Integer;
    FID_RACA_ANIMAL: Integer;
    FID_LOTE: Integer;
    FID_USUARIO: Integer;
  public 
    { Public declarations }

    property ID_ANIMAL: Integer read FID_ANIMAL write FID_ANIMAL;
    property IDENTIDADE: String read FIDENTIDADE write FIDENTIDADE;
    property SEXO: String read FSEXO write FSEXO;
    property ID_CATEGORIA: Integer read FID_CATEGORIA write FID_CATEGORIA;
    property ID_RACA_ANIMAL: Integer read FID_RACA_ANIMAL write FID_RACA_ANIMAL;
    property ID_LOTE: Integer read FID_LOTE write FID_LOTE;
    property ID_USUARIO: Integer read FID_USUARIO write FID_USUARIO;

  end;

implementation


initialization

end.
