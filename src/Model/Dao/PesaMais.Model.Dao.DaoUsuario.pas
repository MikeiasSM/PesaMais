unit PesaMais.Model.Dao.DaoUsuario;

interface

uses
  System.Generics.Collections,
  PesaMais.Model.Connection.DmConnection,
  PesaMais.Model.Entities.Usuario;

type
  TDaoUsuario = class

    private
      {** ATRIBUTO PRIVADO DE CONEX�O **}
      FConnection : TConnection;

    public
      constructor Create;
      destructor Destroy; override;

      {** METODOS PUBLICOS DE ACESSO A DADOS **}
      function Insert(pUsuario : TUsuario) : Boolean;
      function Update(pUsuario : TUsuario) : Boolean;
      function Delete(pUsuario : TUsuario) : Boolean;
      function FindAll : TObjectList<TUsuario>;

  end;

implementation

{ TDaoUsuario }

constructor TDaoUsuario.Create;
begin
  FConnection := TConnection.Create(nil);
end;

function TDaoUsuario.Delete(pUsuario: TUsuario) : Boolean;
begin
FConnection.StartTransation;
  try
    FConnection.PrepareStatement('DELETE FROM USUARIO WHERE ID_USUARIO = ? ');
    FConnection.SetValue(0, pUsuario.id_usuario);
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := True;
  Except
    FConnection.Rollback;
    Result := False;
  end;
end;

destructor TDaoUsuario.Destroy;
begin

  inherited;
end;

function TDaoUsuario.FindAll: TObjectList<TUsuario>;
var
  Usuario : TUsuario;
  List : TObjectList<TUsuario>;
begin
  List := TObjectList<TUsuario>.Create;
  try
    FConnection.StartTransation;
    FConnection.ExecutarSQL('SELECT * FROM USUARIO ORDER BY NOME');
    while not FConnection.FDQuery.Eof do
    begin
      Usuario := TUsuario.Create;
      Usuario.id_usuario := FConnection.FDQuery.FieldByName('ID_USUARIO').AsInteger;
      Usuario.Nome := FConnection.FDQuery.FieldByName('NOME').AsString;
      Usuario.Senha := FConnection.FDQuery.FieldByName('SENHA').AsString;

      List.Add(Usuario);
      FConnection.FDQuery.Next;

      Result := List;
    end;
  except
    FConnection.Rollback;
  end;
  List.Destroy;
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

function TDaoUsuario.Update(pUsuario: TUsuario) : Boolean;
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
    Result := True;
  Except
    FConnection.Rollback;
    Result := False;
  end;
end;

end.