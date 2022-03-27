unit PesaMais.Controller.UsuarioController;

interface

uses
  { System }
  System.Generics.Collections,

  { Pesa Mais }
  PesaMais.Model.Entities.Usuario,
  PesaMais.Model.Dao.DaoBase,
  PesaMais.Model.Dao.DaoUsuario;

type
  TUsuarioController = class

  private
    DAO : TDAOBase<TUSUARIO>;
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

end;

class function TUsuarioController.New: TUsuarioController;
begin
  Result := Self.Create;
end;

function TUsuarioController.Insert(Usuario: TUSUARIO) : String;
begin
  DAO := TDAOBase<TUSUARIO>.Create;
  if DAO.insert(Usuario) then
    Result := 'Registro salvo com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TUsuarioController.Update(Usuario: TUSUARIO) : String;
begin
  DAO := TDAOBase<TUSUARIO>.Create;
  if DAO.update(Usuario, Usuario.ID_USUARIO) then
    Result := 'Registro alterado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TUsuarioController.Delete(Id_Usuario: Integer): String;
begin
  DAO := TDAOBase<TUSUARIO>.Create;
  if DAO.Delete(Id_Usuario) then
    Result := 'Registro deletado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TUsuarioController.FindById(Usuario: TUSUARIO): TUSUARIO;
var
  Retorno : String;
begin
  DAO := TDAOBase<TUSUARIO>.Create;
  Result := DAO.findById(Usuario.ID_USUARIO);
end;

function TUsuarioController.FindAll: TObjectList<TUSUARIO>;
begin
  DAO := TDAOBase<TUSUARIO>.Create;
  Result := DAO.FindAll;
end;

end.
