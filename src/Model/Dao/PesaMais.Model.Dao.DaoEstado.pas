unit PesaMais.Model.Dao.DaoEstado;

interface

uses
  PesaMais.Model.Entities.Estado,
  PesaMais.Model.Dao.DaoBase;

type
  TDaoEstado =  class
  private
  public
    constructor Create;
    destructor Destroy; override;

  end;

implementation

{ TDaoEstado }

constructor TDaoEstado.Create;
begin

end;

destructor TDaoEstado.Destroy;
begin

  inherited;
end;

end.
