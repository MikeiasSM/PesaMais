unit PesaMais.Model.Dao.DaoBase;

interface

uses
  System.Generics.Collections,
  System.SysUtils,

  ormbr.container.objectset.interfaces,
  ormbr.container.objectset,
  dbebr.factory.interfaces,

  PesaMais.Model.Connection.DmORM, PesaMais.View.Dialog.Messages;

  type
  TDAOBase<T : class, constructor> = class
    private
      FConnection : IDBConnection;
      FContainer : IContainerObjectSet<T>;
      Dialog : TFormMessage;
    public
      procedure insert(obj : T);
      procedure update(obj : T; id : Integer);
      procedure delete(id : Integer);
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
  Dialog := TFormMessage.Create(nil);
end;

constructor TDAOBase<T>.Create;
begin
  Create(TConnectionFactory.GetConnection);
end;

{** INSERT  **}
procedure TDAOBase<T>.insert(obj: T);
begin
  try
    FContainer.insert(obj);
    Dialog.ShowDialog('Sucesso!', 'Registro salvo com sucesso!', TMessages.tpInformation);
  except
    On E: Exception do
    begin
      Dialog.ShowDialog('Algo de errado aconteceu!', E.Message, TMessages.tpError);
      Exit;
    end;
  end;
end;

{** UPDATE  **}
procedure TDAOBase<T>.update(obj: T; id: Integer);

begin
  try
    var LObject := FContainer.Find(id);
    FContainer.Modify(LObject);
    FContainer.update(obj);
    Dialog.ShowDialog('Sucesso!', 'Registro alterado com sucesso!', TMessages.tpInformation);
  except
    On E: Exception do
    begin
      Dialog.ShowDialog('Algo de errado aconteceu!', E.Message, TMessages.tpError);
      Exit;
    end;
  end;
end;

{** DELETE  **}
procedure TDAOBase<T>.delete(id: Integer);
begin
  var LObject := FContainer.Find(id);
  try
    if Assigned(LObject) then
    begin
      FContainer.delete(LObject);
    end;
    Dialog.ShowDialog('Sucesso!', 'Registro deletado com sucesso!', TMessages.tpInformation);
  except
    On E: Exception do
    begin
      Dialog.ShowDialog('Algo de errado aconteceu!', E.Message, TMessages.tpError);
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
