unit PesaMais.View.Pages.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  PesaMais.Model.Dao.DaoEstado,
  PesaMais.Model.Entities.Estado;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Label1: TLabel;
    ListView1: TListView;
    Rectangle4: TRectangle;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDao : TDaoEstado;
    procedure findall;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.fmx}

procedure TForm1.findall;
var
  Estado : TEstado;
  Item : TListViewItem;
begin
  FDao := TDaoEstado.Create;
  ListView1.Items.Clear;
  for Estado in FDao.FindAll do
  begin
    Item := ListView1.Items.Add;
    item.Text := '('+IntToStr(Estado.Id_estado)+') '+Estado.Nome+' - '+Estado.Uf;
  end;
  ListView1.EndUpdate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  findall;
end;

end.
