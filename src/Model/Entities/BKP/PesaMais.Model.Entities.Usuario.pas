unit PesaMais.Model.Entities.Usuario;

interface

type
  TUsuario = class

  private
    FAtivo: Boolean;
    FSenha: String;
    FNome: String;
    Fid_usuario: Integer;
    procedure SetAtivo(const Value: Boolean);
    procedure Setid_usuario(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetSenha(const Value: String);

  public
    { ** DEFAULT ** }
    constructor Create;
    destructor Destroy; override;
    class function New: TUsuario;

    { ** PROPERTYS ** }
    property id_usuario: Integer read Fid_usuario write Setid_usuario;
    property Nome: String read FNome write SetNome;
    property Senha: String read FSenha write SetSenha;
    property Ativo: Boolean read FAtivo write SetAtivo;

  end;

implementation

{ TUsuario }

constructor TUsuario.Create;
begin

end;

destructor TUsuario.Destroy;
begin

  inherited;
end;

class function TUsuario.New: TUsuario;
begin
  Result := Self.Create;
end;

procedure TUsuario.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TUsuario.Setid_usuario(const Value: Integer);
begin
  Fid_usuario := Value;
end;

procedure TUsuario.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TUsuario.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

end.
