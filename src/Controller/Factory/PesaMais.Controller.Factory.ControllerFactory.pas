unit PesaMais.Controller.Factory.ControllerFactory;


interface

uses
  PesaMais.Controller.UsuarioController;

type
  TControllerFactory = class
    private
    public
      class function New : TControllerFactory;
      class function getUsuarioController : TUsuarioController;

      constructor Create;
  end;

implementation

{ TControllerFactory }

constructor TControllerFactory.Create;
begin

end;

class function TControllerFactory.getUsuarioController: TUsuarioController;
begin
  Result := TUsuarioController.New;
end;

class function TControllerFactory.New: TControllerFactory;
begin
  Result := Self.Create;
end;

end.
