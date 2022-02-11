unit PesaMais.Model.Entities.Estado;

interface
type
  TEstado = class

  private
    FId_estado  : Integer;
    FUf         : String;
    FNome       : String;
    procedure SetId_estado (const Value: Integer);
    procedure SetNome      (const Value: String);
    procedure SetUf        (const Value: String);


  public
    constructor Create;
    destructor Destroy; override;
    class function New : TEstado;

    property Id_estado : integer read Fid_estado write Setid_estado;
    property Nome      : string read Fnome write Setnome;
    property Uf        : string read Fuf write Setuf;

  end;

implementation

{ TEstado }

constructor TEstado.Create;
begin

end;

destructor TEstado.Destroy;
begin

  inherited;
end;

class function TEstado.New: TEstado;
begin
   Result := Self.Create;
end;

procedure TEstado.SetId_estado(const Value: integer);
begin
  FId_estado := Value;
end;

procedure TEstado.SetNome(const Value: string);
begin
  FNome    := Value;
end;

procedure TEstado.SetUf(const Value: string);
begin
  FUf := Value;
end;

end.
