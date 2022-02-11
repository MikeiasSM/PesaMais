unit PesaMais.Model.Dao.DaoLote;

interface

uses
  System.Generics.Collections,
  PesaMais.Model.Entities.Lote,
  PesaMais.Model.Connection.DmConnection;

type
  TDaoRaca = class

  private
    //Atributo de conexão de dados privados.
    FConnection : TConnection;

  public
    constructor Create;
    Destructor Destroy; override;

    //Metodos de acesso a dados
    function Insert (pLote : TLote) : Boolean;
    function Delete (pLote : TLote) : Boolean;
    function Update (pLote : TLote) : Boolean;
    function FindAll : TObjectList<TLote>;

end;

implementation

{ TDaoRaca }

constructor TDaoRaca.Create;
begin
  FConnection := TConnection.Create(nil);
end;

function TDaoRaca.Delete(pLote : TLote): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('DELETE FROM LOTE WHERE ID_LOTE = ?');
    FConnection.SetValue(0, pLote.Id_lote);
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := True;
  except
    FConnection.Rollback;
    Result := False;
  end;
end;

destructor TDaoRaca.Destroy;
begin
  FConnection.DisposeOf;
  inherited;
end;

function TDaoRaca.FindAll: TObjectList<TLote>;
var
  Lote : TLote;
  List : TObjectList<TLote>;
begin
  List := TObjectList<TLote>.Create;
  try
    FConnection.StartTransation;
    FConnection.ExecutarSQL('SELECT * FROM LOTE ORDER BY DESCRICAO');
    while not FConnection.FDQuery.Eof do
    begin
      Lote := TLote.Create;
      Lote.Id_Lote := FConnection.FDQuery.FieldByName('ID_LOTE').AsInteger;
      Lote.Descricao := FConnection.FDQuery.FieldByName('DESCRICAO').AsString;

      List.Add(Lote);
      FConnection.FDQuery.Next;

      Result := List;
    end;
  except
    FConnection.Rollback;
  end;
  List.Destroy;
end;

function TDaoRaca.Insert(pLote: TLote): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('INSERT INTO LOTE (DESCRICAO, ID_PROPRIEDADE) VALUE (? , ?)');
    FConnection.SetValue(0, pLote.Descricao);
    FConnection.SetValue(1, pLote.Id_lote);
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := True;
  except
    FConnection.Rollback;
    Result := False;
  end;
end;

function TDaoRaca.Update(pLote: TLote): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('UPDATE LOTE SET DESCRICAO = ?, ID_PROPRIEDADE = ? WHERE ID_LOTE = ?');
    FConnection.SetValue(0, pLote.Descricao);
    FConnection.SetValue(1, pLote.Propriedade.Id_propriedade);
    FConnection.SetValue(2, pLote.Id_lote);
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := True;
  except
    FConnection.Rollback;
    Result := False;
  end;
end;

end.
