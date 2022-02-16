unit PesaMais.Model.Connection.DmORM;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.FMXUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Comp.UI,
  Data.DB,
  dbebr.factory.interfaces,
  dbebr.factory.firedac,
  ormbr.container.objectset,
  ormbr.container.objectset.interfaces,
  ormbr.dml.generator.firebird;

type
  TConnectionFactory = class(TDataModule)
    FDConnection: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    class function GetConnection : IDBConnection;
  end;

var
  ConnectionFactory: TConnectionFactory;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TConnectionFactory.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Connected := True;
end;

class function TConnectionFactory.GetConnection: IDBConnection;
begin
  Result := TFactoryFireDac.Create(ConnectionFactory.FDConnection, dnFirebird);
end;

end.
