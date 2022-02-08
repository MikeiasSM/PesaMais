unit PesaMais.Model.Endereco;

interface

uses
  PesaMais.Model.Estado, PesaMais.Model.Cidade, PesaMais.Model.Bairros;
type
  TEndereco = class
private
    FLogradouro: String;
    FId_endereco: Integer;
    FId_estado: TEstado;
    FId_pessoa: Integer;
    FId_bairro: TBairro;
    FCep: String;
    FNumero: String;
    FIdentificacao: String;
    FComplemento: String;
    FId_cidade: TCidade;
    procedure SetCep(const Value: String);
    procedure SetComplemento(const Value: String);
    procedure SetId_bairro(const Id_bairro: TBairro);
    procedure SetId_cidade(const Id_cidade: TCidade);
    procedure SetId_endereco(const Value: Integer);
    procedure SetId_estado(const Id_estado: TEstado);
    procedure SetId_pessoa(const Value: Integer);
    procedure SetIdentificacao(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetNumero(const Value: String);

public
  constructor Create;
  destructor Destroy; override;
  class function New : TEndereco;

  property Id_endereco    : Integer read FId_endereco write SetId_endereco;
  property Identificacao  : String read FIdentificacao write SetIdentificacao;
  property Logradouro     : String read FLogradouro write SetLogradouro;
  property Numero         : String read FNumero write SetNumero;
  property Cep            : String read FCep write SetCep;
  property Complemento    : String read FComplemento write SetComplemento;
  property Id_cidade      : TCidade read FId_cidade write SetId_cidade;
  property Id_bairro      : TBairro read FId_bairro write SetId_bairro;
  property Id_estado      : TEstado read FId_estado write SetId_estado;
  property Id_pessoa      : Integer read FId_pessoa write SetId_pessoa;



end;

implementation

{ TEstado }


{ TEndereco }

constructor TEndereco.Create;
begin

end;

destructor TEndereco.Destroy;
begin

  inherited;
end;

class function TEndereco.New: TEndereco;
begin
    result := Self.Create;
end;

procedure TEndereco.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TEndereco.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TEndereco.SetIdentificacao(const Value: String);
begin
  FIdentificacao := Value;
end;

procedure TEndereco.SetId_bairro(const Id_bairro: TBairro);
begin
  FId_bairro := Id_bairro;
end;

procedure TEndereco.SetId_cidade(const Id_cidade: TCidade);
begin
  FId_cidade := Id_cidade;
end;

procedure TEndereco.SetId_endereco(const Value: Integer);
begin
  FId_endereco := Value;
end;

procedure TEndereco.SetId_estado(const Id_estado : TEstado);
begin
  FId_estado := Id_estado;
end;

procedure TEndereco.SetId_pessoa(const Value: Integer);
begin
  FId_pessoa := Value;
end;

procedure TEndereco.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

end.
