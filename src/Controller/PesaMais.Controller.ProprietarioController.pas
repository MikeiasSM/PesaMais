unit PesaMais.Controller.ProprietarioController;

interface

uses
  PesaMais.Model.Dao.DaoBase, PesaMais.Model.Entities.Proprietario,
  System.Generics.Collections;
type
  TProprietarioController = class

  private
    DAO : TDAOBase<TPROPRIETARIO>;
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

end;

class function TProprietarioController.New: TProprietarioController;
begin
  Result := Self.Create;
end;

function TProprietarioController.Insert(obj: TPROPRIETARIO) : String;
begin
  DAO := TDAOBase<TPROPRIETARIO>.Create;
  if DAO.insert(obj) then
    Result := 'Registro salvo com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TProprietarioController.Update(obj: TPROPRIETARIO) : String;
begin
  DAO := TDAOBase<TPROPRIETARIO>.Create;
  if DAO.update(obj, obj.id_proprietario) then
    Result := 'Registro alterado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TProprietarioController.Delete(obj_id: Integer): String;
begin
  DAO := TDAOBase<TPROPRIETARIO>.Create;
  if DAO.Delete(obj_id) then
    Result := 'Registro deletado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TProprietarioController.FindById(obj: TPROPRIETARIO): TPROPRIETARIO;
var
  Retorno : String;
begin
  DAO := TDAOBase<TPROPRIETARIO>.Create;
  Result := DAO.findById(obj.id_proprietario);
end;

function TProprietarioController.FindAll: TObjectList<TPROPRIETARIO>;
begin
  DAO := TDAOBase<TPROPRIETARIO>.Create;
  Result := DAO.FindAll;
end;

end.
