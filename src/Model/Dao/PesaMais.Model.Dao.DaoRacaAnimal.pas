unit PesaMais.Model.Dao.DaoRacaAnimal;

interface

uses
  PesaMais.Model.Dao.DaoBase,
  PesaMais.Model.Entities.Raca_Animal;

type
  TDaoRacaAnimal = class(TDaoBase<TRACA_ANIMAL>)
  Private
  Public
    constructor Create;
    destructor Destroy; override;

  end;

implementation

{ TDaoRacaAnimal }

constructor TDaoRacaAnimal.Create;
begin

end;

destructor TDaoRacaAnimal.Destroy;
begin

  inherited;
end;

end.
