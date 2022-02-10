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
    FCidade: Integer;
    FEstado: TEstado;

    procedure SetCep(const Value: String);
    procedure SetCodmun_ibge(const Value: String);
    procedure SetId_cidade(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetId_estado(const Estado: TEstado);

  public
    constructor         Create;
    destructor          Destroy; override;
    class function New: TCidade;

    property Id_cidade   : Integer read FCidade write SetId_cidade;
    property Nome        : String read FNome write SetNome;
    property Cep         : String read FCep write SetCep;
    property Codmun_ibge : String read FCodmun_ibge write SetCodmun_ibge;
    property Id_estado   : TEstado read FEstado write SetId_estado;

  end;

implementation

{ TCidade }

constructor TCidade.Create;
begin
  FEstado := TEstado.Create;
end;

destructor TCidade.Destroy;
begin
  FEstado.Free;

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
  FCidade := Value;
end;

procedure TCidade.SetId_estado(const Estado: TEstado);
begin
  FEstado := Id_estado;
end;

procedure TCidade.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
