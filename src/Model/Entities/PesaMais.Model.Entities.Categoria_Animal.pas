unit PesaMais.Model.Entities.Categoria_Animal;

interface

uses
  { System }
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections;

type
  TCATEGORIA_ANIMAL = class

  private
    { Private declarations } 
    FID_CATEGORIA: Integer;
    FDESCRICAO: String;

  public 
    { Public declarations }
    property ID_CATEGORIA: Integer read FID_CATEGORIA write FID_CATEGORIA;
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;

  end;

implementation

initialization

end.
