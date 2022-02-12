unit PesaMais.Model.Dao.DaoBairro;

interface
uses
     System.Generics.Collections,
     PesaMais.Model.Connection.DmConnection,
     PesaMais.Model.Entities.Bairro,
     PesaMais.Model.Entities.Cidade;


type
  FDaoBairro = class

  private
   FConnection : TConnection;


  public
    Constructor Create;
    Destructor Destroy; override;

    function Insert (pBairro: TBairro) : Boolean;
    function Delete (pBairro: TBairro) : Boolean;
    function Update (pBairro: TBairro) : Boolean;
    function FindAll : TObjectList<TBairro>;

  end;

implementation




{ FDaoBairro }


constructor FDaoBairro.Create;
begin
  FConnection :=  TConnection.Create(nil);
end;

function FDaoBairro.Delete(pBairro: TBairro): Boolean;
BEGIN
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('DELETE FROM BAIRRO WHERE ID_BAIRRO = ?');
    FConnection.SetValue(0, pBairro.Id_Bairro);
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := true;
  Except
    FConnection.Rollback;
    Result := false;
  end;
end;

destructor FDaoBairro.Destroy;
begin
    FConnection.DisposeOf;
  inherited;
end;

function FDaoBairro.FindAll: TObjectList<TBairro>;
Var
  Bairro: TBairro;
  List: TObjectList<TBairro>;
begin
  List := TObjectList<TBairro>.Create;

  try
    FConnection.StartTransation;
    FConnection.ExecutarSQL('SELECT * FROM Bairro');
    while not FConnection.FDQuery.Eof do
    begin
      Bairro := TBairro.Create;
      Bairro.Id_Bairro := FConnection.FDQuery.FieldByName('ID_BAIRRO').AsInteger;
      Bairro.Descricao := FConnection.FDQuery.FieldByName('DESCRICAO').AsString;
      Bairro.Cidade := FConnection.FDQuery.FieldByName('ID_CIDADE').AsInteger;
      List.Add(Bairro);
      FConnection.FDQuery.Next;
    end;
    Result := List;
  except
    FConnection.Rollback;
  end;
  List.Destroy;
end;

function FDaoBairro.Insert(pBairro: TBairro): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.ExecutarSQL('INSERT INTO BAIRRO (DESCRICAO, ID_CIDADE) VALUE (?,?)');
    FConnection.SetValue(0, pBairro.Descricao);
    FConnection.SetValue(1, pBairro.Cidade);
    FConnection.ExecSQL;
    FConnection.Commit;

    Result := True;
  finally
    FConnection.Rollback;
    Result := False;

  end;

end;

function FDaoBairro.Update(pBairro: TBairro): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.ExecutarSQL('UPDATE BAIRRO SET ID_BAIRRO = ? , DESCRICAO = ?, ID_CIDADE = ? WHERE ID_BAIRRO = ?');
    FConnection.SetValue(0, pBairro.Descricao);
    FConnection.SetValue(1, pBairro.Cidade);
  finally

  end;
end;

end.
