unit PesaMais.Controller.UsuarioController;

interface

uses
  { System }
  System.Generics.Collections,

  { Pesa Mais }
  PesaMais.Model.Entities.Usuario,
  PesaMais.Model.Dao.DaoBase,
  PesaMais.View.Dialog.Messages;

type
  TUsuarioController = class

  private
    DAO : TDAOBase<TUSUARIO>;
    Dialog : TFormMessage;
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
  Dialog := TFormMessage.Create(nil);
end;

class function TUsuarioController.New: TUsuarioController;
begin
  Result := Self.Create;
end;

function TUsuarioController.Insert(Usuario: TUSUARIO) : String;
begin
  DAO := TDAOBase<TUSUARIO>.Create;
  if Assigned(Usuario) then
    DAO.insert(Usuario)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro Usuario está nulo.', TMessages.tpError);
end;

function TUsuarioController.Update(Usuario: TUSUARIO) : String;
begin
  DAO := TDAOBase<TUSUARIO>.Create;
  if Assigned(Usuario) then
    DAO.update(Usuario, Usuario.ID_USUARIO)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro Usuario está nulo.', TMessages.tpError);
end;

function TUsuarioController.Delete(Id_Usuario: Integer): String;
begin
  DAO := TDAOBase<TUSUARIO>.Create;
  DAO.Delete(Id_Usuario);
end;

function TUsuarioController.FindById(Usuario: TUSUARIO): TUSUARIO;
var
  Retorno : String;
begin
  DAO := TDAOBase<TUSUARIO>.Create;
  if Assigned(Usuario) then
    Result := DAO.findById(Usuario.ID_USUARIO)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro Usuario está nulo.', TMessages.tpError);
end;

function TUsuarioController.FindAll: TObjectList<TUSUARIO>;
begin
  DAO := TDAOBase<TUSUARIO>.Create;
  Result := DAO.FindAll;
end;

end.
