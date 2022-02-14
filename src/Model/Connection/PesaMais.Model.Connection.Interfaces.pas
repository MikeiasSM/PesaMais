unit PesaMais.Model.Connection.Interfaces;

interface

uses
  /// orm factory connection
  dbebr.factory.interfaces;

type
  iModelConnection = interface
    ['{E38341EE-9358-4721-A503-7728B38493AC}']
    function Con : IDBConnection;
  end;

implementation

end.
