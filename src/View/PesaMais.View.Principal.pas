unit PesaMais.View.Principal;

interface

uses
  System.Types,
  System.SysUtils,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Generics.Collections,
  FMX.Memo,
  FMX.Edit,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.ListView,
  FMX.ScrollBox,
  FMX.Memo.Types,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.Controls.Presentation,
  FMX.ListView.Adapters.Base,
  PesaMais.Model.Dao.DaoEstado,
  PesaMais.Model.Entities.Estado,
  FMX.Objects,
  FMX.Layouts,
  FMX.MultiView,
  System.Math.Vectors,
  FMX.Controls3D,
  FMX.Layers3D, PesaMais.View.Pages.Main, PesaMais.View.Pages.Template;

type
  TFormPrincipal = class(TForm)
    Layout1: TLayout;
    MultiView1: TMultiView;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Image1: TImage;
    Layout2: TLayout;
    lblNomeLogo: TLabel;
    Layout3: TLayout;
    btnMenu: TImage;
    Layout3D1: TLayout3D;
    Rectangle5: TRectangle;
    Layout4: TLayout;
    Image2: TImage;
    lblCadastro: TLabel;
    Rectangle6: TRectangle;
    Layout5: TLayout;
    Image3: TImage;
    Label1: TLabel;
    Rectangle7: TRectangle;
    Layout6: TLayout;
    Image4: TImage;
    Label2: TLabel;
    Rectangle8: TRectangle;
    Layout7: TLayout;
    Image5: TImage;
    Label3: TLabel;
    Rectangle9: TRectangle;
    Layout8: TLayout;
    Image6: TImage;
    Label4: TLabel;
    Rectangle1: TRectangle;
    Rectangle4: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);

  private
    { Private declarations }
    FDao : TDaoEstado;
    FEstado : TEstado;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;
  PageMain : TFormMain;
  PageTemplate : TFormTemplate;

implementation

uses
  Router4D;

{$R *.fmx}

{ TfrmMain }


procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  Layout1.AddObject(nil);
  PageMain := TFormMain.Create(nil);
  PageTemplate := TFormTemplate.Create(nil);
  try

    Layout1.AddObject(PageMain.Layout1);
  except

  end;

end;

procedure TFormPrincipal.Image2Click(Sender: TObject);
begin
  Layout1.AddObject(nil);
  try
    Layout1.AddObject(PageTemplate.Layout1);
  finally

  end;
end;

end.
