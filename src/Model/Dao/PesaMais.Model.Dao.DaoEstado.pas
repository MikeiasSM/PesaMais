unit PesaMais.Model.Dao.DaoEstado;

interface

uses
  System.Generics.Collections,
  PesaMais.Model.Connection.DmConnection,
  PesaMais.Model.Entities.Estado;

type
  TDaoEstado = class

  private
    FConnection: TConnection;
  public
    constructor Create;
    destructor Destroy; override;

    function Insert(pEstado: TEstado): Boolean;
    function Update(pEstado: TEstado): Boolean;
    function Delete(pEstado: TEstado): Boolean;
    function FindAll: TObjectList<TEstado>;

  end;

implementation

{ TDaoEstado }

constructor TDaoEstado.Create;
begin
  FConnection := TConnection.Create(nil);
end;

function TDaoEstado.Delete(pEstado: TEstado): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('DELETE FROM ESTADO WHERE ID_ESTADO = :ID_ESTADO');
    FConnection.FDQuery.Params.ParamByName(':ID_ESTADO').AsInteger := pEstado.Id_estado;
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := true;
  Except
    FConnection.Rollback;
    Result := false;
  end;
end;

destructor TDaoEstado.Destroy;
begin
  FConnection.DisposeOf;
  inherited;
end;

function TDaoEstado.FindAll: TObjectList<TEstado>;
var
  Estado: TEstado;
  List: TObjectList<TEstado>;
begin
  List := TObjectList<TEstado>.Create;
  try
    FConnection.StartTransation;
    FConnection.ExecutarSQL('SELECT * FROM ESTADO');
    while not FConnection.FDQuery.Eof do
    begin
      Estado := TEstado.Create;
      Estado.Id_estado := FConnection.FDQuery.FieldByName('ID_ESTADO').AsInteger;
      Estado.Nome := FConnection.FDQuery.FieldByName('NOME').AsString;
      Estado.Uf := FConnection.FDQuery.FieldByName('UF').AsString;
      List.Add(Estado);
      FConnection.FDQuery.Next;
    end;
    Result := List;
  except
    FConnection.Rollback;
  end;
  List.Destroy;
end;

function TDaoEstado.Insert(pEstado: TEstado): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('INSERT INTO ESTADO (NOME, UF) VALUES (:NOME, :UF)');
    FConnection.FDQuery.Params.ParamByName(':NOME').AsString  := pEstado.Nome;
    FConnection.FDQuery.Params.ParamByName(':UF').AsString  := pEstado.Uf;
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := true;
  Except
    FConnection.Rollback;
    Result := false;
  end;
end;

function TDaoEstado.Update(pEstado: TEstado): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('UPDATE ESTADO SET NOME = :NOME, UF = :UF WHERE ID_ESTADO = :ID_ESTADO');
    FConnection.FDQuery.Params.ParamByName(':NOME').AsString  := pEstado.Nome;
    FConnection.FDQuery.Params.ParamByName(':UF').AsString  := pEstado.Uf;
    FConnection.FDQuery.Params.ParamByName(':ID_ESTADO').AsInteger  := pEstado.Id_estado;
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := true;
  Except
    FConnection.Rollback;
    Result := false;
  end;
end;

end.
