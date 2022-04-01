unit PesaMais.Controller.EnderecoController;

interface

uses
  { System }
  System.Generics.Collections,

  { Pesa Mais }
  PesaMais.Model.Dao.DaoBase,
  PesaMais.Model.Entities.Endereco, PesaMais.View.Dialog.Messages;
type

  TEnderecoController = class

  private
    DAO : TDAOBase<TENDERECO>;
    Dialog : TFormMessage;
  public
    function Insert(obj : TENDERECO) : String;
    function Update(obj : TENDERECO) : String;
    function Delete(obj_id : Integer) : String;
    function FindAll : TObjectList<TENDERECO>;
    function FindById(obj : TENDERECO) : TENDERECO;
    class function New : TEnderecoController;
    constructor Create;
  end;

implementation

{ TEnderecoController }

constructor TEnderecoController.Create;
begin
  Dialog := TFormMessage.Create(nil);
end;

class function TEnderecoController.New: TEnderecoController;
begin
  Result := Self.Create;
end;

function TEnderecoController.Insert(obj: TENDERECO) : String;
begin
  DAO := TDAOBase<TENDERECO>.Create;
  if Assigned(obj) then
    DAO.insert(obj)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TEnderecoController.Update(obj: TENDERECO) : String;
begin
  DAO := TDAOBase<TENDERECO>.Create;
  if Assigned(obj) then
    DAO.update(obj, obj.id_endereco)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TEnderecoController.Delete(obj_id: Integer): String;
begin
  DAO := TDAOBase<TENDERECO>.Create;
  DAO.Delete(obj_id);
end;

function TEnderecoController.FindById(obj: TENDERECO): TENDERECO;
var
  Retorno : String;
begin
  DAO := TDAOBase<TENDERECO>.Create;
  if Assigned(obj) then
    Result := DAO.findById(obj.id_endereco)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TEnderecoController.FindAll: TObjectList<TENDERECO>;
begin
  DAO := TDAOBase<TENDERECO>.Create;
  Result := DAO.FindAll;
end;

end.
