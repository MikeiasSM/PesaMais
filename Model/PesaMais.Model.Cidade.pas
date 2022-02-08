unit PesaMais.Model.Cidade;

interface

uses
  PesaMais.Model.Estado;
type
  TCidade = class

  private
    FCep: String;
    FCodmun_ibge: String;
    FNome: String;
    FId_cidade: Integer;
    FId_estado: TEstado;
    procedure SetCep(const Value: String);
    procedure SetCodmun_ibge(const Value: String);
    procedure SetId_cidade(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetId_estado(const Value: TEstado);

  public
    constructor         Create;
    destructor          Destroy; override;
    class function New:  TCidade;

    property Id_cidade   : Integer read FId_cidade write SetId_cidade;
    property Nome        : String read FNome write SetNome;
    property Cep         : String read FCep write SetCep;
    property Codmun_ibge : String read FCodmun_ibge write SetCodmun_ibge;
    property Id_estado   : TEstado read FId_estado write SetId_estado;

  end;

implementation

{ TCidade }

constructor TCidade.Create;
begin

end;

destructor TCidade.Destroy;
begin

  inherited;
end;

class function TCidade.New: TCidade;
begin
   Result := Self.Create;
end;

procedure TCidade.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TCidade.SetCodmun_ibge(const Value: String);
begin
  FCodmun_ibge := Value;
end;

procedure TCidade.SetId_cidade(const Value: Integer);
begin
  FId_cidade := Value;
end;

procedure TCidade.SetId_estado(const Value: TEstado);
begin
  FId_estado := Value;
end;

procedure TCidade.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
