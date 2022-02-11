unit PesaMais.Model.Entities.Bairro;

interface

uses
  PesaMais.Model.Entities.Cidade;

  type
    TBairro = class

  private
    FId_Bairro: Integer;
    FDescricao: String;
    FCidade   : TCidade;
    procedure SetCidade(const Value: TCidade);
    procedure SetDescricao(const Value: String);
    procedure SetId_Bairro(const Value: Integer);

  public
    constructor Create;
    destructor  Destroy; override;
    class function new : TBairro;

    property Id_Bairro  : Integer read FId_Bairro write SetId_Bairro;
    property Descricao  : String  read FDescricao write SetDescricao;
    property Cidade     : TCidade read FCidade    write SetCidade;

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

procedure TBairro.SetCidade(const Value: TCidade);
begin
  FCidade := Value;
end;

procedure TBairro.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TBairro.SetId_Bairro(const Value: Integer);
begin
  FId_Bairro := Value;
end;

end.
