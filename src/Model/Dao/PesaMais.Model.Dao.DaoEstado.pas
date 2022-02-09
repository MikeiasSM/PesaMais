unit PesaMais.Model.Dao.DaoEstado;

interface

uses
  PesaMais.Model.Connection.DmConnection,
  PesaMais.Model.Estado, System.Generics.Collections;
type
  TDaoEstado = class

  private
    FConnection : TConnection;
  public
    constructor Create;
    destructor Destroy; override;

    function Insert(pEstado : TEstado) : Boolean;
    function Update(pEstado : TEstado) : Boolean;
    function Delete(pEstado : TEstado) : Boolean;
    function FindAll : TObjectList<TEstado>;

  end;

implementation

uses
  FireDAC.Comp.Client;

{ TDaoEstado }

constructor TDaoEstado.Create;
begin
  FConnection := TConnection.Create(nil);
end;

function TDaoEstado.Delete(pEstado : TEstado) : Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('DELETE FROM ESTADO WHERE ID_ESTADO = ?');
    FConnection.SetValue(0, pEstado.Id_estado);
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
  Estado : TEstado;
  List : TObjectList<TEstado>;
begin
  List := TObjectList<TEstado>.Create;

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
end;

function TDaoEstado.Insert(pEstado : TEstado) : Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('INSERT INTO ESTADO (NOME, UF) VALUES (?, ?)');
    FConnection.SetValue(0, pEstado.Nome);
    FConnection.SetValue(1, pEstado.Uf);
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := true;
  Except
    FConnection.Rollback;
    Result := false;
  end;
end;

function TDaoEstado.Update(pEstado : TEstado) : Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('UPDATE ESTADO SET NOME = ?, UF = ? WHERE ID_ESTADO = ?');
    FConnection.SetValue(0, pEstado.Nome);
    FConnection.SetValue(1, pEstado.Uf);
    FConnection.SetValue(2, pEstado.Id_estado);
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := true;
  Except
    FConnection.Rollback;
    Result := false;
  end;
end;

end.
