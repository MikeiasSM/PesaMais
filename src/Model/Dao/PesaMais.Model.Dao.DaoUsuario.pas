unit PesaMais.Model.Dao.DaoUsuario;

interface

uses
  System.Generics.Collections,
  PesaMais.Model.Connection.DmConnection,
  PesaMais.Model.Entities.Usuario;

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
    FConnection.PrepareStatement('DELETE FROM USUARIO WHERE ID_USUARIO = :ID_USUARIO');
    FConnection.FDQuery.Params.ParamByName(':ID_USUARIO').AsInteger := pUsuario.id_usuario;
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
    FConnection.ExecutarSQL('SELECT * FROM USUARIO ORDER BY USUARIO');
    while not FConnection.FDQuery.Eof do
    begin
      Usuario := TUsuario.Create;
      Usuario.id_usuario := FConnection.FDQuery.FieldByName('ID_USUARIO').AsInteger;
      Usuario.Usuario := FConnection.FDQuery.FieldByName('USUARIO').AsString;
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
    FConnection.PrepareStatement('INSERT INTO (USUARIO, SENHA, ATIVO) VALUES (:USUARIO, :SENHA, :ATIVO)');
    FConnection.FDQuery.Params.ParamByName(':USUARIO').AsString := pUsuario.Usuario;
    FConnection.FDQuery.Params.ParamByName(':SENHA').AsString := pUsuario.Senha;
    FConnection.FDQuery.Params.ParamByName(':ATIVO').AsBoolean := pUsuario.Ativo;
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
    FConnection.PrepareStatement('UPDATE USUARIO SET USUARIO = :USUARIO, SENHA = :SENHA, ATIVO = :ATIVO WHERE ID_USUARIO = :ID_USUARIO ');
    FConnection.FDQuery.Params.ParamByName(':USUARIO').AsString := pUsuario.Usuario;
    FConnection.FDQuery.Params.ParamByName(':SENHA').AsString := pUsuario.Senha;
    FConnection.FDQuery.Params.ParamByName(':ATIVO').AsBoolean := pUsuario.Ativo;
    FConnection.FDQuery.Params.ParamByName(':ID_USUARIO').AsInteger := pUsuario.id_usuario;
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := True;
  Except
    FConnection.Rollback;
    Result := False;
  end;
end;

end.
