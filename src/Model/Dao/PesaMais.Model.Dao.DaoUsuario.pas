unit PesaMais.Model.Dao.DaoUsuario;

interface

uses
  System.Generics.Collections,
  PesaMais.Model.Connection.DmConnection,
  PesaMais.Model.Entities.Usuario,
  PesaMais.Model.Dao.DaoBase;

type
  TDaoUsuario = class(TDaoBase<TUSUARIO>)
    private
      DAO : TDaoBase<TUSUARIO>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : TDaoUsuario;
  end;

implementation

{ TDaoUsuario }

constructor TDaoUsuario.Create;
begin
  DAO := TDaoBase<TUSUARIO>.Create;
end;

destructor TDaoUsuario.Destroy;
begin

  inherited;
end;

class function TDaoUsuario.New: TDaoUsuario;
begin
  Result := Self.Create;
end;

end.
