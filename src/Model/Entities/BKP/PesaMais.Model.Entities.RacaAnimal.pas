unit PesaMais.Model.Entities.RacaAnimal;

interface
type
  TRacaAnimal = class

private
    FId_Raca    : Integer;
    FDescricao  : String;

    procedure SetDescricao(const Value: String);
    procedure SetId_raca(const Value: Integer);

public
    constructor         Create;
    destructor          Destroy; override;
    class function New : TRacaAnimal;

    property Id_Raca   : Integer read FId_raca write SetId_Raca;
    property Descricao : String read FDescricao write SetDescricao;
end;



implementation

{ TRacaAnimal }

constructor TRacaAnimal.Create;
begin

end;

destructor TRacaAnimal.Destroy;
begin

  inherited;
end;

class function TRacaAnimal.New: TRacaAnimal;
begin
    result := Self.Create;
end;

procedure TRacaAnimal.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TRacaAnimal.SetId_Raca(const Value: Integer);
begin
  FId_Raca := Value;
end;

end.
