unit PesaMais.Model.Connection.DmConnection;

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
  FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.FB,
  FireDAC.DApt,
  FireDAC.DatS,
  FireDAC.Phys,
  Data.DB;

type
  TConnection = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDQueryReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrepareStatement(aSQL: String);
    procedure SetValue(aIndex: Integer; aValue: Variant);
    procedure ExecSQL;
    procedure ExecutarSQL(aSQL: String);
    procedure StartTransation;
    procedure Commit;
    procedure Rollback;
  end;

var
  Connection: TConnection;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TConnection }

procedure TConnection.Commit;
begin
  FDConnection.Commit;
end;

procedure TConnection.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Connected := true;
end;

procedure TConnection.ExecSQL;
begin
  FDQuery.ExecSQL;
end;

procedure TConnection.ExecutarSQL(aSQL : String);
begin
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(aSQL);
  FDQuery.Open();
  FDQuery.First;
end;

procedure TConnection.FDQueryReconcileError(DataSet: TFDDataSet; E: EFDException; UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
  raise Exception.Create(e.Message);
end;

procedure TConnection.PrepareStatement(aSQL: String);
begin
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(aSQL);
end;

procedure TConnection.Rollback;
begin
  FDConnection.Rollback;
end;

procedure TConnection.SetValue(aIndex: Integer; aValue: Variant);
begin
  FDQuery.Params.Add;
  FDQuery.Params[aIndex].Value := aValue;
end;

procedure TConnection.StartTransation;
begin
  FDConnection.StartTransaction;
end;

end.
