unit PesaMais.Model.Entities.Cidade;

interface

uses
  PesaMais.Model.Entities.Estado;
type
  TCidade = class

  private
    FCep         : String;
    FCodmun_Ibge : String;
    FNome        : String;
    FEstado      : TEstado;
    FCidade      : Integer;
    procedure SetCep(const Value: String);
    procedure SetCodmun_Ibge(const Value: String);
    procedure SetEstado(const Value: TEstado);
    procedure SetId_Cidade(const Value: Integer);
    procedure SetNome(const Value: String);

  public
    constructor         Create;
    destructor          Destroy; override;
    class function New: TCidade;

    property Id_Cidade   : Integer read FCidade      write SetId_Cidade;
    property Nome        : String  read FNome        write SetNome;
    property Cep         : String  read FCep         write SetCep;
    property Codmun_Ibge : String  read FCodmun_Ibge write SetCodmun_Ibge;
    property Estado      : TEstado read FEstado      write SetEstado;

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

end;

procedure TCidade.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TCidade.SetCodmun_Ibge(const Value: String);
begin
  FCodmun_ibge := Value;
end;

procedure TCidade.SetEstado(const Value: TEstado);
begin
  FEstado := Value;
end;

procedure TCidade.SetId_Cidade(const Value: Integer);
begin
  FCidade := Value;
end;

procedure TCidade.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
