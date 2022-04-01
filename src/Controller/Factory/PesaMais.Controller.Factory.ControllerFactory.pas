unit PesaMais.Controller.Factory.ControllerFactory;


interface

uses
  PesaMais.Controller.UsuarioController,
  PesaMais.Controller.Interfaces.InterfacesController,
  PesaMais.Controller.PessoaController,
  PesaMais.Controller.EnderecoController,
  PesaMais.Controller.ProprietarioController,
  PesaMais.Controller.PropriedadeController,
  PesaMais.Controller.CidadeController;

type
  TControllerFactory = class(TInterfacedObject, IControllerFactory)
    private
    public
      function getUsuarioController      : TUsuarioController;
      function getPessoaController       : TPessoaController;
      function getEnderecoController     : TEnderecoController;
      function getProprietarioController : TProprietarioController;
      function getPropriedadeController  : TPropriedadeController;
      function getCidadeController       : TCidadeController;

      constructor Create;
      class function New : IControllerFactory;
  end;

implementation

{ TControllerFactory }

constructor TControllerFactory.Create;
begin

end;

function TControllerFactory.getCidadeController: TCidadeController;
begin
  Result := TCidadeController.New;
end;

function TControllerFactory.getEnderecoController: TEnderecoController;
begin
  Result := TEnderecoController.New;
end;

function TControllerFactory.getPessoaController: TPessoaController;
begin
  Result := TPessoaController.New;
end;

function TControllerFactory.getPropriedadeController: TPropriedadeController;
begin
  Result := TPropriedadeController.New;
end;

function TControllerFactory.getProprietarioController: TProprietarioController;
begin
  Result := TProprietarioController.New;
end;

function TControllerFactory.getUsuarioController: TUsuarioController;
begin
  Result := TUsuarioController.New;
end;

class function TControllerFactory.New: IControllerFactory;
begin
  Result := Self.Create;
end;

end.
