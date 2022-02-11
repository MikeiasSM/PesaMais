unit PesaMais.Model.Entities.Endereco;

interface

uses
  PesaMais.Model.Entities.Estado,
  PesaMais.Model.Entities.Cidade,
  PesaMais.Model.Entities.Bairro;
type
  TEndereco = class
private
    FLogradouro: String;
    FId_endereco: Integer;
    FEstado: TEstado;
    FPessoa: Integer;
    FBairro: TBairro;
    FCep: String;
    FNumero: String;
    FIdentificacao: String;
    FComplemento: String;
    FCidade: TCidade;

    procedure SetCep(const Value: String);
    procedure SetComplemento(const Value: String);
    procedure SetId_bairro(const Bairro: TBairro);
    procedure SetId_cidade(const Cidade: TCidade);
    procedure SetId_endereco(const Value: Integer);
    procedure SetId_estado(const Estado: TEstado);
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
    property Id_cidade      : TCidade read FCidade write SetId_cidade;
    property Id_bairro      : TBairro read FBairro write SetId_bairro;
    property Id_estado      : TEstado read FEstado write SetId_estado;
    property Id_pessoa      : Integer read FPessoa write SetId_pessoa;

end;

implementation

{ TEstado }


{ TEndereco }

constructor TEndereco.Create;
begin
  FCidade := TCidade.Create;
  FEstado := TEstado.Create;
  FBairro := TBairro.Create;
end;

destructor TEndereco.Destroy;
begin
  FCidade.Free;
  FEstado.Free;
  FBairro.Free;
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

procedure TEndereco.SetId_bairro(const Bairro: TBairro);
begin
  FBairro := Id_bairro;
end;

procedure TEndereco.SetId_cidade(const Cidade: TCidade);
begin
  FCidade := Id_cidade;
end;

procedure TEndereco.SetId_endereco(const Value: Integer);
begin
  FId_endereco := Value;
end;

procedure TEndereco.SetId_estado(const Estado : TEstado);
begin
  FEstado := Id_estado;
end;

procedure TEndereco.SetId_pessoa(const Value: Integer);
begin
  FPessoa := Value;
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
