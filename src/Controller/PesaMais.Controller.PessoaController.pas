unit PesaMais.Controller.PessoaController;

interface

uses
  {System}
  System.Generics.Collections,

  { Pesa Mais}
  PesaMais.Model.Dao.DaoBase,
  PesaMais.Model.Entities.Pessoa;

type
TPessoaController = class
    private
    DAO : TDAOBase<TPESSOA>;
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

end;

class function TPessoaController.New: TPessoaController;
begin
  Result := Self.Create;
end;

function TPessoaController.Insert(obj: TPESSOA) : String;
begin
  DAO := TDAOBase<TPESSOA>.Create;
  if DAO.insert(obj) then
    Result := 'Registro salvo com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TPessoaController.Update(obj: TPESSOA) : String;
begin
  DAO := TDAOBase<TPESSOA>.Create;
  if DAO.update(obj, obj.id_pessoa) then
    Result := 'Registro alterado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TPessoaController.Delete(obj_id: Integer): String;
begin
  DAO := TDAOBase<TPESSOA>.Create;
  if DAO.Delete(obj_id) then
    Result := 'Registro deletado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TPessoaController.FindById(obj: TPESSOA): TPESSOA;
var
  Retorno : String;
begin
  DAO := TDAOBase<TPESSOA>.Create;
  Result := DAO.findById(obj.id_pessoa);
end;

function TPessoaController.FindAll: TObjectList<TPESSOA>;
begin
  DAO := TDAOBase<TPESSOA>.Create;
  Result := DAO.FindAll;
end;

end.
