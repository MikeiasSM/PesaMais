unit PesaMais.Controller.EnderecoController;

interface

uses
  { System }
  System.Generics.Collections,

  { Pesa Mais }
  PesaMais.Model.Dao.DaoBase,
  PesaMais.Model.Entities.Endereco;
type

  TEnderecoController = class

  private
    DAO : TDAOBase<TENDERECO>;
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

end;

class function TEnderecoController.New: TEnderecoController;
begin
  Result := Self.Create;
end;

function TEnderecoController.Insert(obj: TENDERECO) : String;
begin
  DAO := TDAOBase<TENDERECO>.Create;
  if DAO.insert(obj) then
    Result := 'Registro salvo com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TEnderecoController.Update(obj: TENDERECO) : String;
begin
  DAO := TDAOBase<TENDERECO>.Create;
  if DAO.update(obj, obj.id_endereco) then
    Result := 'Registro alterado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TEnderecoController.Delete(obj_id: Integer): String;
begin
  DAO := TDAOBase<TENDERECO>.Create;
  if DAO.Delete(obj_id) then
    Result := 'Registro deletado com sucesso!'
  else
    Result := 'Erro ao executar ação!';
end;

function TEnderecoController.FindById(obj: TENDERECO): TENDERECO;
var
  Retorno : String;
begin
  DAO := TDAOBase<TENDERECO>.Create;
  Result := DAO.findById(obj.id_endereco);
end;

function TEnderecoController.FindAll: TObjectList<TENDERECO>;
begin
  DAO := TDAOBase<TENDERECO>.Create;
  Result := DAO.FindAll;
end;

end.
