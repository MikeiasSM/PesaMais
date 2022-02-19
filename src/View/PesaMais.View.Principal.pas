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
  Router4D,
  FMX.MultiView,
  System.Math.Vectors,
  FMX.Controls3D,
  FMX.Layers3D,
  PesaMais.View.Pages.Main,
  PesaMais.View.Pages.Template,
  FMX.ListBox,
  FMX.Ani,
  Skia,
  Skia.FMX, System.ImageList, FMX.ImgList;

type
  TFormPrincipal = class(TForm)
    MultiViewMenu: TMultiView;
    Rectangle1: TRectangle;
    Rectangle4: TRectangle;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Label1: TLabel;
    ToolBar1: TToolBar;
    LayoutPrincipal: TLayout;
    expCadastro: TExpander;
    StyleBook1: TStyleBook;
    btnAnimais: TSpeedButton;
    btnLote: TSpeedButton;
    btnUsuario: TSpeedButton;
    btnPessoa: TSpeedButton;
    expLancamento: TExpander;
    btnCheckin: TSpeedButton;
    btnCheckout: TSpeedButton;
    btnProcedimento: TSpeedButton;
    expConsulta: TExpander;
    btnConsulta: TSpeedButton;
    expRelatorio: TExpander;
    btnRelatorio: TSpeedButton;
    btnConfiguracoes: TSpeedButton;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    btnProprietario: TSpeedButton;
    Image2: TImage;
    Layout2: TLayout;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image1: TImage;
    procedure btnUsuarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

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


implementation

{$R *.fmx}

{ TfrmMain }

procedure TFormPrincipal.btnUsuarioClick(Sender: TObject);
var
  template : TFormTemplate;
begin
  if Assigned(template) then
  begin
    template := TFormTemplate.Create(Self);
    Self.LayoutPrincipal.RemoveObject(0);
    Self.LayoutPrincipal.AddObject(template.Layout1);
  end
  else
  begin
    Self.LayoutPrincipal.RemoveObject(0);
    Self.LayoutPrincipal.AddObject(template.Layout1);
  end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
var
  LAnimatedImage: TSkAnimatedImage;
begin

  LAnimatedimage := TSkAnimatedImage.Create(Self);

  LAnimatedimage.LoadFromFile('C:\Users\mikei\Documents\Projetos\PesaMais\assets\rocket.json');
  LAnimatedimage.Parent := Self.LayoutPrincipal;
  LAnimatedImage.Size.Width := LayoutPrincipal.Size.Width;
  LAnimatedImage.Size.Height := LayoutPrincipal.Size.Height;
end;

end.
