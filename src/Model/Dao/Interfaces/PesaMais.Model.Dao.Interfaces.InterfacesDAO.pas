unit PesaMais.Model.Dao.Interfaces.InterfacesDAO;

interface

uses
  System.Generics.Collections;

type

  IGenericDao<T : class> = interface
    ['{B757F5BC-6C1A-49FD-B881-A725FB0A0A36}']
    function insert(obj : T) : Boolean;
    function update(obj : T; id : Integer) : Boolean;
    function delete(id : Integer) : Boolean;
    function findWhere(AWhere : String) : TObjectList<T>;
    function findById(id : Integer) : T;
    function findAll : TObjectList<T>;
  end;

implementation

end.
