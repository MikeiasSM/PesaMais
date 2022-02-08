unit PesaMais.Model.Bairros;

interface

uses
  PesaMais.Model.Cidade;
  type
    TBairro = class
  private
    FId_bairro: Integer;
    FDescricao: String;
    FId_cidade: TCidade;
    procedure SetDescricao (const Value: String);
    procedure SetId_bairro (const Value: Integer);
    procedure SetId_cidade(const Id_cidade: TCidade);

  public
    constructor Create;
    destructor  Destroy; override;
    class function new : TBairro;

    property Id_bairro  : Integer read FId_bairro write SetId_bairro;
    property Descricao  : String read FDescricao write SetDescricao;
    property Id_cidade  : TCidade read FId_cidade write SetId_cidade;

  end;

implementation

{ TBairro }

constructor TBairro.Create;
begin

end;

destructor TBairro.Destroy;
begin

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
procedure TBairro.SetId_cidade(const Id_Cidade: TCidade);
begin
  FId_cidade := id_cidade;
end;

end.
