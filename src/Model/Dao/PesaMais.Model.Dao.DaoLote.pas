unit PesaMais.Model.Dao.DaoLote;

interface

uses
  System.Generics.Collections, PesaMais.Model.Lote,PesaMais.Model.Connection.DmConnection;
type
  TDaoRaca = class

  private
    //Atributo de conexão de dados privados.
    FConnection : TConnection;

  public
    constructor Create;
    Destructor Destroy; override;

    //Metodos de acesso a dados
    function insert (pLote : TLote) : Boolean;
    function delete (pLote : TLote) : Boolean;
    function update (pLote : TLote) : Boolean;
    function FindAll : TList<TLote>;

end;

implementation


{ TDaoRaca }

constructor TDaoRaca.Create;
begin
  FConnection := TConnection.Create(nil);
end;

function TDaoRaca.delete(pLote : TLote): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.ExecutarSQL('DELETE FROM LOTE WHERE ID_LOTE = ?');
    FConnection.SetValue(0, pLote.Id_lote);
    FConnection.ExecSQL;
    FConnection.Connection;
    Result := True;
  except
    FConnection.Rollback;
    Result := False;
  end;
end;

destructor TDaoRaca.Destroy;
begin
  FConnection.DisposeOf;
  inherited;
end;

function TDaoRaca.FindAll: TList<TLote>;
begin

end;

function TDaoRaca.insert(pLote: TLote): Boolean;
begin
  FConnection.StartTransation;
  FConnection.ExecutarSQL('INSERT INTO LOTE (DESCRICAO, ID_PROPRIEDADE) VALEU (? , ?)');
  FConnection.SetValue(0, pLote.Descricao);
  FConnection.SetValue(1, pLote.Id_propriedade);
end;

function TDaoRaca.update(pLote: TLote): Boolean;
begin

end;

end.
