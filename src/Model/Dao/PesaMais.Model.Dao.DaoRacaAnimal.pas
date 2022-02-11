unit PesaMais.Model.Dao.DaoRacaAnimal;

interface

uses
  System.Generics.Collections,
  PesaMais.Model.Connection.DmConnection,
  PesaMais.Model.Entities.RacaAnimal;


type
  TDaoRacaAnimal = class

  Private
    //Atributo de conexão de dados privados.
    FConnection : TConnection;

  Public
    constructor Create;
    destructor Destroy; override;

     //Metodos publicos de acesso a dados.
    function Insert(pRacaAnimal : TRacaAnimal): Boolean;
    function Update(pRacaAnimal : TRacaAnimal): Boolean;
    function Delete(pRacaAnimal : TRacaAnimal): Boolean;
    function FindAll : TObjectList<TRacaAnimal>;

  end;

implementation

{ TDaoRacaAnimal }

constructor TDaoRacaAnimal.Create;
begin
  FConnection := TConnection.Create(nil);
end;

function TDaoRacaAnimal.Delete(pRacaAnimal : TRacaAnimal) : Boolean;
begin
   FConnection.StartTransation;
 try
   FConnection.ExecutarSQL('DELETE FROM RACA_ANIMAL WHERE ID_RACA = ?');
   FConnection.SetValue(0, pRacaAnimal.Id_raca);
   FConnection.ExecSQL;
   FConnection.Commit;
   Result := true;
 except
   FConnection.Rollback;
   Result := False;
  end;
end;

destructor TDaoRacaAnimal.Destroy;
begin
   FConnection.DisposeOf;
   inherited;
end;

function TDaoRacaAnimal.FindAll: TObjectList<TRacaAnimal>;
var
  Raca : TRacaAnimal;
  List : TObjectList<TRacaAnimal>;
begin
  List := TObjectList<TRacaAnimal>.Create;
  try
    FConnection.StartTransation;
    FConnection.ExecutarSQL('SELECT * FROM RACA_ANIMAL ORDER BY DESCRICAO');
    while not FConnection.FDQuery.Eof do
    begin
      Raca := TRacaAnimal.Create;
      Raca.Id_raca := FConnection.FDQuery.FieldByName('ID_RACA').AsInteger;
      Raca.Descricao := FConnection.FDQuery.FieldByName('DESCRICAO').AsString;

      List.Add(Raca);
      FConnection.FDQuery.Next;

      Result := List;
    end;
  except
    FConnection.Rollback;
  end;
  List.Destroy;
end;

function TDaoRacaAnimal.Insert(pRacaAnimal: TRacaAnimal): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('INSERT INTO RACA_ANIMAL(DESCRICAO) VALUES (?)');
    FConnection.SetValue(0, pRacaAnimal.Descricao);
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := true;
  except
    FConnection.Rollback;
    Result := false;
  end;
end;

function TDaoRacaAnimal.Update(pRacaAnimal: TRacaAnimal) : Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('UPDATE RACA_ANIMAL SET DESCRICAO = ? WHERE ID_RACA = ?');
    FConnection.SetValue(0, pRacaAnimal.Descricao);
    FConnection.SetValue(1, pRacaAnimal.Id_raca);
    FConnection.ExecSQL;
    FConnection.Commit;

    Result := True;
  except
    FConnection.Rollback;
    Result := False;
  end;

end;

end.
