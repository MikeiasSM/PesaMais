unit PesaMais.View.Pages.Template;

interface

uses
  { System }
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.ImageList,
  System.Generics.Collections,
  System.Rtti,
  System.Actions,

  { FMX }
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Layouts,
  FMX.Edit,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.ListBox,
  FMX.ListView.Types,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.ListView.Appearances,
  FMX.ImgList,
  FMX.Grid.Style,
  FMX.ScrollBox,
  FMX.Grid,
  FMX.TabControl,
  FMX.Effects,
  FMX.ActnList,

  { PesaMais }
  PesaMais.Model.Entities.Usuario;

type
  TFormTemplate = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    btnImprimir: TSpeedButton;
    lblNomeTela: TLabel;
    ImageList1: TImageList;
    StyleBook1: TStyleBook;
    btnNovo: TSpeedButton;
    btnSair: TSpeedButton;
    Rectangle7: TRectangle;
    Rectangle5: TRectangle;
    TabControl1: TTabControl;
    tabListagem: TTabItem;
    tabCadastro: TTabItem;
    Rectangle6: TRectangle;
    ShadowEffect1: TShadowEffect;
    ActionList1: TActionList;
    changeTabListagem: TChangeTabAction;
    changeTabCadastro: TChangeTabAction;
    ShadowEffect2: TShadowEffect;
    StrGrid: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    ShadowEffect3: TShadowEffect;
    RecCorpo: TRectangle;
    RecButton: TRectangle;
    btnSalvar: TSpeedButton;
    Image1: TImage;
    btnCancelar: TSpeedButton;
    Image2: TImage;
    btnExcluir: TSpeedButton;
    Image4: TImage;
    Rectangle8: TRectangle;
    ShadowEffect4: TShadowEffect;
    Image3: TImage;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Edit1: TEdit;
    Rectangle11: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTemplate: TFormTemplate;

implementation

uses
  PesaMais.View.Principal;

{$R *.fmx}

procedure TFormTemplate.btnCancelarClick(Sender: TObject);
begin
  changeTabListagem.ExecuteTarget(Self);
end;

procedure TFormTemplate.btnNovoClick(Sender: TObject);
begin
  changeTabCadastro.ExecuteTarget(Self);
end;

procedure TFormTemplate.btnSairClick(Sender: TObject);
var
  Main : TFormPrincipal;
begin
  Main := TFormPrincipal(Self.Owner);
  Main.LayoutPrincipal.RemoveObject(Self.Layout1);
  Main.setVisibleDashboard;
end;

procedure TFormTemplate.FormCreate(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
end;

end.
