unit PesaMais.Model.Pessoa;

interface

uses
  System.Classes,
  System.Generics.Collections,
  PesaMais.Model.Endereco;

type
  TPessoa = class

  private
    FFantasia_Apelido: String;
    FTipoPessoa: String;
    FObservacao: String;
    FCPF_CNPJ: String;
    FPessoa: String;
    FEmail: String;
    FAtivo: Boolean;
    FId_Pessoa: Integer;
    FContato2: String;
    FDataAlteracao: TDate;
    FContato1: String;
    FRG_Inscr: String;
    FRazsocial_Nome: String;
    FEnderecos: TList<TEndereco>;
    FDataCadastro: TDate;
    FFone2: String;
    FFone1: String;

    procedure SetAtivo(const Value: Boolean);
    procedure SetContato1(const Value: String);
    procedure SetContato2(const Value: String);
    procedure SetCPF_CNPJ(const Value: String);
    procedure SetDataAlteracao(const Value: TDate);
    procedure SetDataCadastro(const Value: TDate);
    procedure SetEmail(const Value: String);
    procedure SetEnderecos(const Value: TList<TEndereco>);
    procedure SetFantasia_Apelido(const Value: String);
    procedure SetFone1(const Value: String);
    procedure SetFone2(const Value: String);
    procedure SetId_Pessoa(const Value: Integer);
    procedure SetObservacao(const Value: String);
    procedure SetPessoa(const Value: String);
    procedure SetRazsocial_Nome(const Value: String);
    procedure SetRG_Inscr(const Value: String);
    procedure SetTipoPessoa(const Value: String);

  public
    constructor Create;
    destructor Destroy; override;
    class function New : TPessoa;

    property Id_Pessoa : Integer read FId_Pessoa write SetId_Pessoa;
    property Razsocial_Nome : String read FRazsocial_Nome write SetRazsocial_Nome;
    property Fantasia_Apelido : String read FFantasia_Apelido write SetFantasia_Apelido;
    property CPF_CNPJ : String read FCPF_CNPJ write SetCPF_CNPJ;
    property RG_Inscr : String read FRG_Inscr write SetRG_Inscr;
    property Fone1 : String read FFone1 write SetFone1;
    property Fone2 : String read FFone2 write SetFone2;
    property Contato1 : String read FContato1 write SetContato1;
    property Contato2 : String read FContato2 write SetContato2;
    property Email : String read FEmail write SetEmail;
    property Observacao : String read FObservacao write SetObservacao;
    property DataCadastro : TDate read FDataCadastro write SetDataCadastro;
    property DataAlteracao : TDate read FDataAlteracao write SetDataAlteracao;
    property TipoPessoa : String read FTipoPessoa write SetTipoPessoa;
    property Pessoa : String read FPessoa write SetPessoa;
    property Ativo : Boolean read FAtivo write SetAtivo;
    property Enderecos : TList<TEndereco> read FEnderecos write SetEnderecos;

  end;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin
  FEnderecos := TList<TEndereco>.Create;
end;

destructor TPessoa.Destroy;
begin
  FEnderecos.Destroy;
  inherited;
end;

class function TPessoa.New: TPessoa;
begin
  Result := Self.Create;
end;

procedure TPessoa.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TPessoa.SetContato1(const Value: String);
begin
  FContato1 := Value;
end;

procedure TPessoa.SetContato2(const Value: String);
begin
  FContato2 := Value;
end;

procedure TPessoa.SetCPF_CNPJ(const Value: String);
begin
  FCPF_CNPJ := Value;
end;

procedure TPessoa.SetDataAlteracao(const Value: TDate);
begin
  FDataAlteracao := Value;
end;

procedure TPessoa.SetDataCadastro(const Value: TDate);
begin
  FDataCadastro := Value;
end;

procedure TPessoa.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TPessoa.SetEnderecos(const Value: TList<TEndereco>);
begin
  FEnderecos := Value;
end;

procedure TPessoa.SetFantasia_Apelido(const Value: String);
begin
  FFantasia_Apelido := Value;
end;

procedure TPessoa.SetFone1(const Value: String);
begin
  FFone1 := Value;
end;

procedure TPessoa.SetFone2(const Value: String);
begin
  FFone2 := Value;
end;

procedure TPessoa.SetId_Pessoa(const Value: Integer);
begin
  FId_Pessoa := Value;
end;

procedure TPessoa.SetObservacao(const Value: String);
begin
  FObservacao := Value;
end;

procedure TPessoa.SetPessoa(const Value: String);
begin
  FPessoa := Value;
end;

procedure TPessoa.SetRazsocial_Nome(const Value: String);
begin
  FRazsocial_Nome := Value;
end;

procedure TPessoa.SetRG_Inscr(const Value: String);
begin
  FRG_Inscr := Value;
end;

procedure TPessoa.SetTipoPessoa(const Value: String);
begin
  FTipoPessoa := Value;
end;

end.
