unit PesaMais.Controller.UsuarioController;

interface

uses
  System.Generics.Collections,
  PesaMais.Model.Entities.Usuario;
type
  TUsuarioController = class

  private
    DAO : TUSUARIO;
  public
    function Insert(Usuario : TUSUARIO) : String;
    function Update(Usuario : TUSUARIO) : String;
    function Delete(Id_Usuario : Integer) : String;
    function FindAll : TObjectList<TUSUARIO>;
    function FindById(Usuario : TUSUARIO) : TUSUARIO;
    class function New : TUsuarioController;
    constructor Create;
  end;

implementation

{ TUsuarioController }

constructor TUsuarioController.Create;
begin
  DAO := TUSUARIO.Create;
end;

function TUsuarioController.Delete(Id_Usuario: Integer): String;
begin
  if DAO.Delete(Id_Usuario) then
    Result := 'Registro deletado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TUsuarioController.FindAll: TObjectList<TUSUARIO>;
begin
  Result := DAO.FindAll;
end;

function TUsuarioController.FindById(Usuario: TUSUARIO): TUSUARIO;
var
  Retorno : String;
begin
  Result := DAO.GetById(Usuario.ID_USUARIO, Usuario, Retorno);
end;

function TUsuarioController.Insert(Usuario: TUSUARIO) : String;
begin
  if DAO.Insert(Usuario) then
    Result := 'Registro salvo com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

class function TUsuarioController.New: TUsuarioController;
begin
  Result := Self.Create;
end;


function TUsuarioController.Update(Usuario: TUSUARIO) : String;
begin
  if DAO.Update(Usuario, Usuario.ID_USUARIO) then
    Result := 'Registro alterado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

end.
