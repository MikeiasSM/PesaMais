unit PesaMais.Controller.Interfaces.InterfacesController;

interface

uses
  { System }
  System.Generics.Collections,

  { Pesa Mais}
  PesaMais.Controller.UsuarioController,
  PesaMais.Controller.PessoaController,
  PesaMais.Controller.EnderecoController,
  PesaMais.Controller.ProprietarioController,
  PesaMais.Controller.PropriedadeController;
type

  IController<T : class> = interface
    ['{6757F920-B445-4D9F-ABAD-D06AB8C6518E}']
    function Insert(obj : T) : IController<T>;
    function Update(obj : T) : IController<T>;
    function Delete(obj_id : Integer) : IController<T>;
    function FindAll : TObjectList<T>;
    function FindById(Usuario : T) : IController<T>;
  end;

  IControllerFactory = interface
    ['{FAFA7982-2919-4284-98CF-C5CB8B33D3A3}']
    function getUsuarioController      : TUsuarioController;
    function getPessoaController       : TPessoaController;
    function getEnderecoController     : TEnderecoController;
    function getProprietarioController : TProprietarioController;
    function getPropriedadeController  : TPropriedadeController;
  end;

implementation

end.
