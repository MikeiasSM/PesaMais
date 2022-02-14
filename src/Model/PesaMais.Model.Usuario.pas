unit PesaMais.Model.Usuario;

interface

uses
  ormbr.container.objectset,
  ormbr.container.objectset.interfaces,
  PesaMais.Model.Interfaces,
  PesaMais.Model.Entidade.Usuario,
  PesaMais.Model.Connection.Interfaces;

type
  TModelUsuario = class(TInterfacedObject, iModelUsuario)
    private
      FDAO : IContainerObjectSet<TUSUARIO>;
      FCon : iModelConnection;

    public
      constructor Create;
      destructor Destroy;override;
      class function New : iModelUsuario;
      function DAO : IContainerObjectSet<TUSUARIO>;
  end;
implementation

uses
  PesaMais.Model.Connection.DmORM;

{ TModelUsuario }

constructor TModelUsuario.Create;
begin
  FCon := TdmConexao.New;
  FDAO := TContainerObjectSet<TUSUARIO>.Create(FCon.Con, 10);

end;

function TModelUsuario.DAO: IContainerObjectSet<TUSUARIO>;
begin
  Result := FDAO;
end;

destructor TModelUsuario.Destroy;
begin

  inherited;
end;

class function TModelUsuario.New: iModelUsuario;
begin
  Result := Self.Create;
end;

end.
