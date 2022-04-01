unit PesaMais.Controller.PessoaController;

interface

uses
  {System}
  System.Generics.Collections,

  { Pesa Mais}
  PesaMais.Model.Dao.DaoBase,
  PesaMais.Model.Entities.Pessoa, PesaMais.View.Dialog.Messages;

type
TPessoaController = class
    private
    DAO : TDAOBase<TPESSOA>;
    Dialog : TFormMessage;
    public
      function Insert(obj : TPESSOA) : String;
      function Update(obj : TPESSOA) : String;
      function Delete(obj_id : Integer) : String;
      function FindAll : TObjectList<TPESSOA>;
      function FindById(obj : TPESSOA) : TPESSOA;
      class function New : TPessoaController;
      constructor Create;
  end;

implementation

{ TPessoaController }

constructor TPessoaController.Create;
begin
  Dialog := TFormMessage.Create(nil);
end;

class function TPessoaController.New: TPessoaController;
begin
  Result := Self.Create;
end;

function TPessoaController.Insert(obj: TPESSOA) : String;
begin
  DAO := TDAOBase<TPESSOA>.Create;
  if Assigned(obj) then
    DAO.insert(obj)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TPessoaController.Update(obj: TPESSOA) : String;
begin
  DAO := TDAOBase<TPESSOA>.Create;
  if Assigned(obj) then
    DAO.update(obj, obj.id_pessoa)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TPessoaController.Delete(obj_id: Integer): String;
begin
  DAO := TDAOBase<TPESSOA>.Create;
  DAO.Delete(obj_id);
end;

function TPessoaController.FindById(obj: TPESSOA): TPESSOA;
var
  Retorno : String;
begin
  DAO := TDAOBase<TPESSOA>.Create;
  if Assigned(obj) then
    Result := DAO.findById(obj.id_pessoa)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TPessoaController.FindAll: TObjectList<TPESSOA>;
begin
  DAO := TDAOBase<TPESSOA>.Create;
  Result := DAO.FindAll;
end;

end.
