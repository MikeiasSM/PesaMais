unit PesaMais.Controller.PropriedadeController;

interface

uses
  PesaMais.Model.Dao.DaoBase, System.Generics.Collections,
  PesaMais.Model.Entities.Propriedade, PesaMais.View.Dialog.Messages;
type
  TPropriedadeController = class

  private
    DAO : TDAOBase<TPROPRIEDADE>;
    Dialog : TFormMessage;
  public
    function Insert(obj : TPROPRIEDADE) : String;
    function Update(obj : TPROPRIEDADE) : String;
    function Delete(obj_id : Integer) : String;
    function FindAll : TObjectList<TPROPRIEDADE>;
    function FindById(obj : TPROPRIEDADE) : TPROPRIEDADE;
    class function New : TPropriedadeController;
    constructor Create;
  end;

implementation

{ TPropriedadeController }

constructor TPropriedadeController.Create;
begin
  Dialog := TFormMessage.Create(nil);
end;

class function TPropriedadeController.New: TPropriedadeController;
begin
  Result := Self.Create;
end;

function TPropriedadeController.Insert(obj: TPROPRIEDADE) : String;
begin
  DAO := TDAOBase<TPROPRIEDADE>.Create;
  if Assigned(obj) then
    DAO.insert(obj)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TPropriedadeController.Update(obj: TPROPRIEDADE) : String;
begin
  DAO := TDAOBase<TPROPRIEDADE>.Create;
  if Assigned(obj) then
    DAO.update(obj, obj.id_propriedade)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TPropriedadeController.Delete(obj_id: Integer): String;
begin
  DAO := TDAOBase<TPROPRIEDADE>.Create;
  DAO.Delete(obj_id);
end;

function TPropriedadeController.FindById(obj: TPROPRIEDADE): TPROPRIEDADE;
var
  Retorno : String;
begin
  DAO := TDAOBase<TPROPRIEDADE>.Create;
  if Assigned(obj) then
    Result := DAO.findById(obj.id_propriedade)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TPropriedadeController.FindAll: TObjectList<TPROPRIEDADE>;
begin
  DAO := TDAOBase<TPROPRIEDADE>.Create;
  Result := DAO.FindAll;
end;

end.
