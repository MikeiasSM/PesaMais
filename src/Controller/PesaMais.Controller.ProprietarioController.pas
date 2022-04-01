unit PesaMais.Controller.ProprietarioController;

interface

uses
  PesaMais.Model.Dao.DaoBase, PesaMais.Model.Entities.Proprietario,
  System.Generics.Collections, PesaMais.View.Dialog.Messages;
type
  TProprietarioController = class

  private
    DAO : TDAOBase<TPROPRIETARIO>;
    Dialog : TFormMessage;
  public
    function Insert(obj : TPROPRIETARIO) : String;
    function Update(obj : TPROPRIETARIO) : String;
    function Delete(obj_id : Integer) : String;
    function FindAll : TObjectList<TPROPRIETARIO>;
    function FindById(obj : TPROPRIETARIO) : TPROPRIETARIO;
    class function New : TProprietarioController;
    constructor Create;
  end;

implementation

{ TProprietarioController }

constructor TProprietarioController.Create;
begin
  Dialog := TFormMessage.Create(nil);
end;

class function TProprietarioController.New: TProprietarioController;
begin
  Result := Self.Create;
end;

function TProprietarioController.Insert(obj: TPROPRIETARIO) : String;
begin
  DAO := TDAOBase<TPROPRIETARIO>.Create;
  if Assigned(obj) then
    DAO.insert(obj)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TProprietarioController.Update(obj: TPROPRIETARIO) : String;
begin
  DAO := TDAOBase<TPROPRIETARIO>.Create;
  if Assigned(obj) then
    DAO.update(obj, obj.id_proprietario)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TProprietarioController.Delete(obj_id: Integer): String;
begin
  DAO := TDAOBase<TPROPRIETARIO>.Create;
  DAO.Delete(obj_id);
end;

function TProprietarioController.FindById(obj: TPROPRIETARIO): TPROPRIETARIO;
var
  Retorno : String;
begin
  DAO := TDAOBase<TPROPRIETARIO>.Create;
  if Assigned(obj) then
    Result := DAO.findById(obj.id_proprietario)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TProprietarioController.FindAll: TObjectList<TPROPRIETARIO>;
begin
  DAO := TDAOBase<TPROPRIETARIO>.Create;
  Result := DAO.FindAll;
end;

end.
