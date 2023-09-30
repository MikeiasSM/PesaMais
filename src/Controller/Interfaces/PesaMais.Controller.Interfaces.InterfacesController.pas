unit PesaMais.Controller.Interfaces.InterfacesController;

interface

uses
  { System }
  System.Generics.Collections;
type

  IController<T : class> = interface
    ['{6757F920-B445-4D9F-ABAD-D06AB8C6518E}']
    function Insert(obj : T) : IController<T>;
    function Update(obj : T) : IController<T>;
    function Delete(obj_id : Integer) : IController<T>;
    function FindAll : TObjectList<T>;
    function FindById(Usuario : T) : IController<T>;
  end;


implementation

end.
