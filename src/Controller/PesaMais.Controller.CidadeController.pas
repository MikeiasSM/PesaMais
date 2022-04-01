unit PesaMais.Controller.CidadeController;

interface

uses
  { System }
  System.Generics.Collections,

  { Pesa Mais }
  PesaMais.Model.Dao.DaoBase,
  PesaMais.Model.Entities.Cidade, PesaMais.View.Dialog.Messages;
type

  TCidadeController = class

  private
    DAO : TDAOBase<TCIDADE>;
    Dialog : TFormMessage;
  public
    procedure Insert(obj : TCIDADE);
    procedure Update(obj : TCIDADE);
    procedure Delete(obj_id : Integer);
    function FindAll : TObjectList<TCIDADE>;
    function FindById(obj : TCIDADE) : TCIDADE;
    class function New : TCidadeController;
    constructor Create;
  end;

implementation

{ TCidadeController }

constructor TCidadeController.Create;
begin
  Dialog := TFormMessage.Create(nil);
end;

class function TCidadeController.New: TCidadeController;
begin
  Result := Self.Create;
end;

procedure TCidadeController.Insert(obj: TCIDADE);
begin
  DAO := TDAOBase<TCIDADE>.Create;
  if Assigned(obj) then
    DAO.insert(obj)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

procedure TCidadeController.Update(obj: TCIDADE);
begin
  DAO := TDAOBase<TCIDADE>.Create;
  if Assigned(obj) then
    DAO.update(obj, obj.ID_CIDADE)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

procedure TCidadeController.Delete(obj_id: Integer);
begin
  DAO := TDAOBase<TCIDADE>.Create;
  DAO.Delete(obj_id);
end;

function TCidadeController.FindById(obj: TCIDADE): TCIDADE;
begin
  DAO := TDAOBase<TCIDADE>.Create;
  if Assigned(obj) then
    Result := DAO.findById(obj.ID_CIDADE)
  else
    Dialog.ShowDialog('Algo de errado aconteceu!', 'O parâmetro obj está nulo.', TMessages.tpError);
end;

function TCidadeController.FindAll: TObjectList<TCIDADE>;
begin
  DAO := TDAOBase<TCIDADE>.Create;
  Result := DAO.FindAll;
end;

end.
