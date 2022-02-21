unit PesaMais.Model.Dao.DaoRacaAnimal;

interface

uses
  System.Generics.Collections,
  PesaMais.Model.Connection.DmConnection,
  PesaMais.Model.Entities.Raca_Animal;


type
  TDaoRacaAnimal = class

  Private
    //Atributo de conexão de dados privados.
    FConnection : TConnection;

  Public
    constructor Create;
    destructor Destroy; override;

     //Metodos publicos de acesso a dados.
    function Insert(pRacaAnimal : TRaca_Animal): Boolean;
    function Update(pRacaAnimal : TRaca_Animal): Boolean;
    function Delete(pRacaAnimal : TRaca_Animal): Boolean;
    function FindAll : TObjectList<TRaca_Animal>;

  end;

implementation

{ TDaoRacaAnimal }

constructor TDaoRacaAnimal.Create;
begin
  FConnection := TConnection.Create(nil);
end;

function TDaoRacaAnimal.Delete(pRacaAnimal : TRaca_Animal) : Boolean;
begin
   FConnection.StartTransation;
 try
   FConnection.PrepareStatement('DELETE FROM RACA_ANIMAL WHERE ID_RACA = :ID_RACA');
   FConnection.FDQuery.Params.ParamByName(':ID_RACA').AsInteger := pRacaAnimal.Id_Raca;
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

function TDaoRacaAnimal.FindAll: TObjectList<TRaca_Animal>;
var
  Raca : TRaca_Animal;
  List : TObjectList<TRaca_Animal>;
begin
  List := TObjectList<TRaca_Animal>.Create;
  try
    FConnection.StartTransation;
    FConnection.ExecutarSQL('SELECT * FROM RACA_ANIMAL ORDER BY DESCRICAO');
    while not FConnection.FDQuery.Eof do
    begin
      Raca := TRaca_Animal.Create;
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

function TDaoRacaAnimal.Insert(pRacaAnimal: TRaca_Animal): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('INSERT INTO RACA_ANIMAL(DESCRICAO) VALUES (:DESCRICAO)');
    FConnection.FDQuery.Params.ParamByName(':DESCRICAO').AsString := pRacaAnimal.Descricao;
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := true;
  except
    FConnection.Rollback;
    Result := false;
  end;
end;

function TDaoRacaAnimal.Update(pRacaAnimal: TRaca_Animal) : Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('UPDATE RACA_ANIMAL SET DESCRICAO = :DESCRICAO WHERE ID_RACA = :ID_RACA');
    FConnection.FDQuery.Params.ParamByName(':DESCRICAO').AsString := pRacaAnimal.Descricao;
    FConnection.FDQuery.Params.ParamByName(':ID_RACA').AsInteger := pRacaAnimal.Id_Raca;
    FConnection.ExecSQL;
    FConnection.Commit;

    Result := True;
  except
    FConnection.Rollback;
    Result := False;
  end;

end;

end.
