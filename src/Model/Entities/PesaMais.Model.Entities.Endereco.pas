unit PesaMais.Model.Entities.Endereco;

interface

uses
  PesaMais.Model.Entities.Estado,
  PesaMais.Model.Entities.Cidade,
  PesaMais.Model.Entities.Bairro,
  PesaMais.Model.Entities.Pessoa;
type
  TEndereco = class
private
    FLogradouro: String;
    FId_endereco: Integer;
    FEstado: TEstado;
    FBairro: TBairro;
    FCep: String;
    FNumero: String;
    FIdentificacao: String;
    FComplemento: String;
    FCidade: TCidade;
    FPessoa: TPessoa;

    procedure SetCep(const Value: String);
    procedure SetComplemento(const Value: String);
    procedure SetBairro(const Bairro: TBairro);
    procedure SetCidade(const Cidade: TCidade);
    procedure SetEndereco(const Value: Integer);
    procedure SetEstado(const Estado: TEstado);
    procedure SetIdentificacao(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetPessoa(const Value: TPessoa);

public
    constructor Create;
    destructor Destroy; override;
    class function New : TEndereco;

    property Id_endereco    : Integer read FId_endereco write SetId_endereco;
    property Identificacao  : String  read FIdentificacao write SetIdentificacao;
    property Logradouro     : String  read FLogradouro write SetLogradouro;
    property Numero         : String  read FNumero write SetNumero;
    property Cep            : String  read FCep write SetCep;
    property Complemento    : String  read FComplemento write SetComplemento;
    property Cidade         : TCidade read FCidade write SetCidade;
    property Bairro         : TBairro read FBairro write SetBairro;
    property Estado         : TEstado read FEstado write SetEstado;
    property Pessoa         : TPessoa read FPessoa write SetPessoa;

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

procedure TEndereco.SetBairro(const Bairro: TBairro);
begin
  FBairro := Bairro;
end;

procedure TEndereco.SetCidade(const Cidade: TCidade);
begin
  FCidade := Cidade;
end;

procedure TEndereco.SetId_endereco(const Value: Integer);
begin
  FId_endereco := Value;
end;

procedure TEndereco.Setestado(const Estado : TEstado);
begin
  FEstado := Estado;
end;

procedure TEndereco.Setpessoa(const Pessoa: TPessoa);
begin
  FPessoa := Pessoa;
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
