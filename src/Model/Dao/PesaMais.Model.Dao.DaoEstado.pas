unit PesaMais.Model.Dao.DaoEstado;

interface

uses
  PesaMais.Model.Connection.DmConnection,
  PesaMais.Model.Estado;
type
  TDaoEstado = class

  private
    FConnection : TConnection;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Insert(pEstado : TEstado);
    procedure Update(pEstado : TEstado);
    procedure Delete(pEstado : TEstado);
  end;

implementation

{ TDaoEstado }

constructor TDaoEstado.Create;
begin
  FConnection := TConnection.Create(nil);
end;

procedure TDaoEstado.Delete(pEstado : TEstado);
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('DELETE FROM ESTADO WHERE ID_ESTADO = ?');
    FConnection.SetValue(0, pEstado.Id_estado);
    FConnection.ExecSQL;
    FConnection.Commit;
  Except
    FConnection.Rollback;
  end;
end;

destructor TDaoEstado.Destroy;
begin

  inherited;
end;

procedure TDaoEstado.Insert(pEstado : TEstado);
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('INSERT INTO ESTADO (NOME, UF) VALUES (?, ?)');
    FConnection.SetValue(0, pEstado.Nome);
    FConnection.SetValue(1, pEstado.Uf);
    FConnection.ExecSQL;
    FConnection.Commit;
  Except
    FConnection.Rollback;
  end;
end;

procedure TDaoEstado.Update(pEstado : TEstado);
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('UPDATE ESTADO SET NOME = ?, UF = ? WHERE ID_PRODUTO = ?');
    FConnection.SetValue(0, pEstado.Nome);
    FConnection.SetValue(1, pEstado.Uf);
    FConnection.SetValue(2, pEstado.Id_estado);
    FConnection.ExecSQL;
    FConnection.Commit;
  Except
    FConnection.Rollback;
  end;
end;

end.
