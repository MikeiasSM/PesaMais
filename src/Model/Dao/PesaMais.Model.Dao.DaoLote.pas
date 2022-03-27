unit PesaMais.Model.Dao.DaoLote;

interface

uses
  PesaMais.Model.Entities.Lote,
  PesaMais.Model.Dao.DaoBase;

type
  TDaoRaca = class(TDaoBase<TLOTE>)

  private
  public
    constructor Create;
    Destructor Destroy; override;
end;

implementation

{ TDaoRaca }

constructor TDaoRaca.Create;
begin

end;

destructor TDaoRaca.Destroy;
begin

  inherited;
end;

end.
