unit PesaMais.Model.Dao.DaoBase;

interface

uses
  System.Generics.Collections,
  System.SysUtils,

  ormbr.container.objectset.interfaces,
  ormbr.container.objectset,
  dbebr.factory.interfaces,

  PesaMais.Model.Connection.DmORM;

  type
  TDAOBase<T : class, constructor> = class
    private
      FConnection : IDBConnection;
      FContainer : IContainerObjectSet<T>;
    public
      function insert(obj : T) : Boolean;
      function update(obj : T; id : Integer) : Boolean;
      function delete(id : Integer) : Boolean;
      function findWhere(AWhere : String) : TObjectList<T>;
      function findById(id : Integer) : T;
      function findAll : TObjectList<T>;

      constructor Create;overload;
      constructor Create(AConnection : IDBConnection);overload;
  end;

implementation

{ TDAOBase<T> }

{** CONSTRUCTORS **}
constructor TDAOBase<T>.Create(AConnection: IDBConnection);
begin
  FConnection := AConnection;
  FContainer := TContainerObjectSet<T>.Create(FConnection);
end;

constructor TDAOBase<T>.Create;
begin
  Create(TConnectionFactory.GetConnection);
end;

{** INSERT  **}
function TDAOBase<T>.insert(obj: T) : Boolean;
begin
  try
    FContainer.insert(obj);
    Result := True;
  except
    On E: Exception do
    begin
      Result := False;
      Exit;
    end;
  end;
end;

{** UPDATE  **}
function TDAOBase<T>.update(obj: T; id: Integer) : Boolean;

begin
  try
    var LObject := FContainer.Find(id);
    FContainer.Modify(LObject);
    FContainer.update(obj);
    Result := True;
  except
    On E: Exception do
    begin
      Result := False;
      Exit;
    end;
  end;
end;

{** DELETE  **}
function TDAOBase<T>.delete(id: Integer): Boolean;
begin
  var LObject := FContainer.Find(id);
  try
    if Assigned(LObject) then
    begin
      FContainer.delete(LObject);
    end;
    Result := True;
  except
    On E: Exception do
    begin
      Result := False;
      Exit;
    end;
  end;
end;

{** FIND BY ID  **}
function TDAOBase<T>.findById(id: Integer): T;
begin
  Result := FContainer.Find(id);
end;

{** FIND WHERE  **}
function TDAOBase<T>.FindWhere(AWhere: String): TObjectList<T>;
begin
  Result := FContainer.FindWhere(AWhere);
end;

{** FIND ALL  **}
function TDAOBase<T>.FindAll: TObjectList<T>;
begin
  Result := FContainer.FindWhere('');
end;

end.
