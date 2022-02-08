unit PesaMais.Model.Dao.DaoUsuario;

interface

uses
  PesaMais.Model.Connection.DmConnection, PesaMais.Model.Usuario;

type
  TDaoUsuario = class

    private
      {** ATRIBUTO PRIVADO DE CONEXÃO **}
      FConnection : TConnection;

    public
      constructor Create;
      destructor Destroy; override;

      {** METODOS PUBLICOS DE ACESSO A DADOS **}
      function Insert(pUsuario : TUsuario) : Boolean;
      procedure Update(pUsuario : TUsuario);
      procedure Delete(pUsuario : TUsuario);

  end;

implementation

{ TDaoUsuario }

constructor TDaoUsuario.Create;
begin
  FConnection := TConnection.Create(nil);
end;

procedure TDaoUsuario.Delete(pUsuario: TUsuario);
{**

**}
begin
FConnection.StartTransation;
  try
    FConnection.PrepareStatement('DELETE FROM USUARIO WHERE ID_USUARIO = ? ');
    FConnection.SetValue(0, pUsuario.id_usuario);
    FConnection.ExecSQL;
    FConnection.Commit;
  Except
    FConnection.Rollback;
  end;
end;

destructor TDaoUsuario.Destroy;
begin

  inherited;
end;

function TDaoUsuario.Insert(pUsuario: TUsuario) : Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('INSERT INTO (NOME, SENHA, ATIVO) VALUES (?, ?, ?)');
    FConnection.SetValue(0, pUsuario.Nome);
    FConnection.SetValue(1, pUsuario.Senha);
    FConnection.SetValue(2, pUsuario.Ativo);
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := true;
  Except
    FConnection.Rollback;
    Result := false;
  end;

end;

procedure TDaoUsuario.Update(pUsuario: TUsuario);
begin
FConnection.StartTransation;
  try
    FConnection.PrepareStatement('UPDATE USUARIO SET NOME = ?, SENHA = ?, ATIVO = ? WHERE ID_USUARIO = ? ');
    FConnection.SetValue(0,pUsuario.Nome);
    FConnection.SetValue(1,pUsuario.Senha);
    FConnection.SetValue(2,pUsuario.Ativo);
    FConnection.SetValue(3,pUsuario.id_usuario);
    FConnection.ExecSQL;
    FConnection.Commit;
  Except
    FConnection.Rollback;
  end;
end;

end.
