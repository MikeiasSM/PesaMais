unit PesaMais.Model.Endereco;

interface
type
  TModelo = class

  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New  : TModelo;

  end;

implementation

{ TEstado }

constructor TModelo.Create;
begin

end;

destructor TModelo.Destroy;
begin

  inherited;
end;

class function TModelo.New: TModelo;
begin
  Result := Self.Create;
end;

end.
