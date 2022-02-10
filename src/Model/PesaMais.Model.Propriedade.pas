unit PesaMais.Model.Propriedade;

interface

uses
  PesaMais.Model.Bairros, PesaMais.Model.Cidade, PesaMais.Model.Estado;
type
  TPropriedade = class


  private
    Fid_propriedade     : Integer;
    FRazao_nome         : String;
    FFantasia_apelido   : String;
    FCpf_cnpj           : String;
    FInsc_rg            : String;
    FFone1              : String;
    FFone2              : String;
    FEmail              : String;
    Flogradouro         : String;
    FComplemento        : String;
    FNumero             : String;
    FBairro             : TBairro;
    FCidade             : TCidade;
    FEstado             : TEstado;
    FCep                : String;
    FContato            : String;

    procedure SetCep(const Value: String);
    procedure SetComplemento(const Value: String);
    procedure SetContato(const Value: String);
    procedure SetCpf_cnpj(const Value: String);
    procedure SetEmail(const Value: String);
    procedure SetFantasia_Apelido(const Value: String);
    procedure SetFone1(const Value: String);
    procedure SetFone2(const Value: String);
    procedure SetId_bairro(const Bairro: TBairro);
    procedure SetId_cidade(const Cidade: TCidade);
    procedure SetId_estado(const Estado: TEstado);
    procedure SetId_propriedade(const Value: Integer);
    procedure SetInsc_rg(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetRazao_Nome(const Value: String);


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
    property Logradouro       : String read FLogradouro write SetLogradouro;
    property Complemento      : String read FComplemento write SetComplemento;
    property Numero           : String read FNumero write SetNumero;
    property Id_bairro        : TBairro read FBairro write SetId_bairro;
    property Id_cidade        : TCidade read FCidade write SetId_cidade;
    property Id_estado        : TEstado read FEstado write SetId_estado;
    property Cep              : String read FCep write SetCep;
    property Contato          : String read FContato write SetContato;

  end;




implementation

{ TPropriedade }

constructor TPropriedade.Create;
begin
  FBairro := TBairro.Create;
  FCidade := TCidade.Create;
  FEstado := TEstado.Create;
end;

destructor TPropriedade.Destroy;
begin
  FBairro.Free;
  FCidade.Free;
  FEstado.Free;
  inherited;
end;

class function TPropriedade.New: TPropriedade;
begin
   result := Self.Create;
end;

procedure TPropriedade.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TPropriedade.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TPropriedade.SetContato(const Value: String);
begin
  FContato := Value;
end;

procedure TPropriedade.SetCpf_cnpj(const Value: String);
begin
  FCpf_cnpj := Value;
end;

procedure TPropriedade.SetEmail(const Value: String);
begin
  FEmail := Value;
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

procedure TPropriedade.SetId_bairro(const Bairro: TBairro);
begin
  FBairro := Id_bairro;
end;

procedure TPropriedade.SetId_cidade(const Cidade: TCidade);
begin
  FCidade := Id_cidade;
end;

procedure TPropriedade.SetId_estado(const Estado: TEstado);
begin
  FEstado := Id_estado;
end;

procedure TPropriedade.SetId_propriedade(const Value: Integer);
begin
  FId_propriedade := Value;
end;

procedure TPropriedade.SetInsc_rg(const Value: String);
begin
  FInsc_rg := Value;
end;

procedure TPropriedade.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TPropriedade.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TPropriedade.SetRazao_Nome(const Value: String);
begin
  FRazao_Nome := Value;
end;

end.
