unit PesaMais.Model.Dao.DaoBase;

interface

uses
  System.Generics.Collections,

  ormbr.container.objectset.interfaces,
  ormbr.container.objectset,
  dbebr.factory.interfaces,

  PesaMais.Model.Connection.DmORM;

  type
  TDAOBase<T: class, constructor> = class
    private
      FConnection : IDBConnection;
      FContainer : IContainerObjectSet<T>;
    public
      procedure Insert(AValue : T);
      procedure Update(AValue : T; AID : Integer);
      procedure Delete(AID : Integer);
      function  FindWhere(AWhere : String) : TObjectList<T>;
      function  FindById(AID : Integer) : T;
      function  FindAll : TObjectList<T>;

      constructor Create;overload;
      constructor Create(AConnection : IDBConnection);overload;
  end;

implementation

{ TDAOBase<T> }

constructor TDAOBase<T>.Create(AConnection: IDBConnection);
begin
  FConnection := AConnection;
  FContainer := TContainerObjectSet<T>.Create(FConnection);
end;

constructor TDAOBase<T>.Create;
begin
  Create(TConnectionFactory.GetConnection);
end;

procedure TDAOBase<T>.Delete(AID: Integer);
begin
  var LObject := FContainer.Find(AID);
  if Assigned(LObject) then
  begin
    FContainer.Delete(LObject);
  end;
end;

function TDAOBase<T>.FindAll: TObjectList<T>;
begin
  Result := FContainer.FindWhere('');
end;

function TDAOBase<T>.FindById(AID: Integer): T;
begin
  Result := FContainer.Find(AID);
end;

function TDAOBase<T>.FindWhere(AWhere: String): TObjectList<T>;
begin
  Result := FContainer.FindWhere(AWhere);
end;

procedure TDAOBase<T>.Insert(AValue: T);
begin
  FContainer.Insert(AValue);
end;

procedure TDAOBase<T>.Update(AValue: T; AID: Integer);
begin
  var LObject := FContainer.Find(AID);
  FContainer.Modify(LObject);
  FContainer.Update(AValue);
end;

end.
