unit PesaMais.Model.Categoria;

interface

type
  TCategoria = class

  private
    FId_categoria   : Integer;
    FIdentificacao  : String;

    procedure SetId_categoria  (const Value: Integer);
    procedure SetIdentificacao (const Value: String);

  public
    constructor Create;
    Destructor Destroy; override;
    class function New : TCategoria;

    property Id_categoria  : Integer read FId_categoria write SetId_categoria;
    property Identificacao : String read FIdentificacao write SetIdentificacao;

end;



implementation

{ TCategoria }

constructor TCategoria.Create;
begin

end;

destructor TCategoria.Destroy;
begin

  inherited;
end;

class function TCategoria.New: TCategoria;
begin
   Result := Self.Create;
end;

procedure TCategoria.SetIdentificacao(const Value: String);
begin
  FIdentificacao := Value;
end;

procedure TCategoria.SetId_categoria(const Value: Integer);
begin
  FId_categoria := Value;
end;

end.
