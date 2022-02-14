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
  ormbr.dml.generator.firebird,
  PesaMais.Model.Connection.Interfaces;

type
  TdmConexao = class(TDataModule, iModelConnection)
    FDConnection: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FCon : IDBConnection;
    function Con : IDBConnection;
  public
    { Public declarations }
    class function New : iModelConnection;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

function TdmConexao.Con: IDBConnection;
begin
  Result := FCon;
end;

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  FCon := TFactoryFireDac.Create(FDConnection, dnFirebird);
end;

class function TdmConexao.New: iModelConnection;
begin
  Result := Self.Create(nil);
end;

end.
