unit PesaMais.Model.Interfaces;

interface


uses
  PesaMais.Model.Entidade.Usuario,
  ormbr.container.objectset.interfaces;

type
  iModelUsuario = interface
    ['{3819D809-5C7A-42B5-9625-12F46BF6257B}']
    function DAO : IContainerObjectSet<TUSUARIO>;
  end;

implementation


end.
