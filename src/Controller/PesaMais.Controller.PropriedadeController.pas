unit PesaMais.Controller.PropriedadeController;

interface

uses
  PesaMais.Model.Dao.DaoBase, System.Generics.Collections,
  PesaMais.Model.Entities.Propriedade;
type
  TPropriedadeController = class

  private
    DAO : TDAOBase<TPROPRIEDADE>;
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

end;

class function TPropriedadeController.New: TPropriedadeController;
begin
  Result := Self.Create;
end;

function TPropriedadeController.Insert(obj: TPROPRIEDADE) : String;
begin
  DAO := TDAOBase<TPROPRIEDADE>.Create;
  if DAO.insert(obj) then
    Result := 'Registro salvo com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TPropriedadeController.Update(obj: TPROPRIEDADE) : String;
begin
  DAO := TDAOBase<TPROPRIEDADE>.Create;
  if DAO.update(obj, obj.id_propriedade) then
    Result := 'Registro alterado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TPropriedadeController.Delete(obj_id: Integer): String;
begin
  DAO := TDAOBase<TPROPRIEDADE>.Create;
  if DAO.Delete(obj_id) then
    Result := 'Registro deletado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TPropriedadeController.FindById(obj: TPROPRIEDADE): TPROPRIEDADE;
var
  Retorno : String;
begin
  DAO := TDAOBase<TPROPRIEDADE>.Create;
  Result := DAO.findById(obj.id_propriedade);
end;

function TPropriedadeController.FindAll: TObjectList<TPROPRIEDADE>;
begin
  DAO := TDAOBase<TPROPRIEDADE>.Create;
  Result := DAO.FindAll;
end;

end.
