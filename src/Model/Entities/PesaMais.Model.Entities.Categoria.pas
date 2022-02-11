unit PesaMais.Model.Entities.Categoria;

interface

type
  TCategoriaAnimal = class

  private
    FId_Categoria   : Integer;
    FDescricao      : String;

    procedure SetId_categoria  (const Value: Integer);
    procedure SetDescricao(const Value: String);

  public
    constructor Create;
    Destructor Destroy; override;
    class function New : TCategoriaAnimal;

    property Id_categoria  : Integer read FId_categoria write SetId_Categoria;
    property Descricao     : String read FDescricao write SetDescricao;

end;



implementation

{ TCategoriaAnimal }

constructor TCategoriaAnimal.Create;
begin

end;

destructor TCategoriaAnimal.Destroy;
begin

  inherited;
end;

class function TCategoriaAnimal.New: TCategoriaAnimal;
begin
   Result := Self.Create;
end;

procedure TCategoriaAnimal.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TCategoriaAnimal.SetId_categoria(const Value: Integer);
begin
  FId_categoria := Value;
end;

end.
