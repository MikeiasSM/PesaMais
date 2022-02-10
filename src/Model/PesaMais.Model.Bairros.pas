unit PesaMais.Model.Bairros;

interface

uses
  PesaMais.Model.Cidade;
  type
    TBairro = class
  private
    FId_bairro: Integer;
    FDescricao: String;
    FCidade: TCidade;

    procedure SetDescricao (const Value: String);
    procedure SetId_bairro (const Value: Integer);
    procedure SetId_cidade (const Cidade: TCidade);

  public
    constructor Create;
    destructor  Destroy; override;
    class function new : TBairro;

    property Id_bairro  : Integer read FId_bairro write SetId_bairro;
    property Descricao  : String read FDescricao write SetDescricao;
    property Id_cidade  : TCidade read FCidade write SetId_cidade;

  end;

implementation

{ TBairro }

constructor TBairro.Create;
begin
   FCidade := FCidade.Create;
end;

destructor TBairro.Destroy;
begin
  FCidade.Free;
  inherited;
end;

class function TBairro.new: TBairro;
begin
    Result := Self.Create;
end;

procedure TBairro.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TBairro.SetId_bairro(const Value: Integer);
begin
  FId_bairro := Value;

end;
procedure TBairro.SetId_cidade(const Cidade: TCidade);
begin
  FCidade := id_cidade;
end;

end.
