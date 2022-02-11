unit PesaMais.Model.Entities.Propriedade;

interface

uses
  System.Generics.Collections,
  PesaMais.Model.Entities.Endereco;

type
  TPropriedade = class


  private
    FId_Propriedade     : Integer;
    FRazao_Nome         : String;
    FFantasia_Apelido   : String;
    FCPF_CNPJ           : String;
    FInsc_Rg            : String;
    FFone1              : String;
    FFone2              : String;
    FEmail              : String;
    FContato1           : String;
    FEnderecos          : TList<TEndereco>;

    procedure SetId_propriedade(const Value: Integer);
    procedure SetRazao_Nome(const Value: String);
    procedure SetFantasia_Apelido(const Value: String);
    procedure SetCPF_CNPJ(const Value: String);
    procedure SetInsc_rg(const Value: String);
    procedure SetFone1(const Value: String);
    procedure SetFone2(const Value: String);
    procedure SetContato1(const Value: String);
    procedure SetEmail(const Value: String);
    procedure SetEnderecos(const Value: TList<TEndereco>);



  public
    constructor       Create;
    destructor        Destroy; Override;
    class function    New : TPropriedade;

    property Id_propriedade   : Integer read FId_propriedade write SetId_propriedade;
    property Razao_Nome       : String read FRazao_Nome write SetRazao_Nome;
    property Fantasia_Apelido : String read FFantasia_Apelido write SetFantasia_Apelido;
    property Cpf_cnpj         : String read FCpf_cnpj write SetCpf_cnpj;
    property Insc_rg          : String read FInsc_rg write SetInsc_rg;
    property Fone1            : String read FFone1 write SetFone1;
    property Fone2            : String read FFone2 write SetFone2;
    property Email            : String read FEmail write SetEmail;
    property Contato1         : String read FContato1 write SetContato1;
    property Enderecos        : TList<TEndereco> read FEnderecos write SetEnderecos;
  end;




implementation

{ TPropriedade }

constructor TPropriedade.Create;
begin
  FEnderecos := TList<TEndereco>.Create;
end;

destructor TPropriedade.Destroy;
begin
  FEnderecos.Destroy;
  inherited;
end;

class function TPropriedade.New: TPropriedade;
begin
   result := Self.Create;
end;

procedure TPropriedade.SetContato1(const Value: String);
begin
  FContato1 := Value;
end;

procedure TPropriedade.SetCpf_cnpj(const Value: String);
begin
  FCpf_cnpj := Value;
end;

procedure TPropriedade.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TPropriedade.SetEnderecos(const Value: TList<TEndereco>);
begin
  FEnderecos := Value;
end;

procedure TPropriedade.SetFantasia_Apelido(const Value: String);
begin
  FFantasia_Apelido := Value;
end;

procedure TPropriedade.SetFone1(const Value: String);
begin
  FFone1 := Value;
end;

procedure TPropriedade.SetFone2(const Value: String);
begin
  FFone2 := Value;
end;

procedure TPropriedade.SetId_propriedade(const Value: Integer);
begin
  FId_propriedade := Value;
end;

procedure TPropriedade.SetInsc_rg(const Value: String);
begin
  FInsc_rg := Value;
end;

procedure TPropriedade.SetRazao_Nome(const Value: String);
begin
  FRazao_Nome := Value;
end;

end.
