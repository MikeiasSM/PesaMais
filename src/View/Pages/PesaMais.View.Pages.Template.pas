unit PesaMais.View.Pages.Template;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.ImageList,
  System.Generics.Collections,
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
  Bind4D,
  Router4D.Interfaces,
  PesaMais.Model.Entities.Usuario, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, FMX.TabControl, FMX.Effects, System.Actions,
  FMX.ActnList;

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
    btnBusca: TSpeedButton;
    ShadowEffect2: TShadowEffect;
    StrGrid: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    ShadowEffect3: TShadowEffect;
    RecCorpo: TRectangle;
    lblStatus: TLabel;
    RecButton: TRectangle;
    btnSalvar: TSpeedButton;
    Image1: TImage;
    btnVoltar: TSpeedButton;
    Image3: TImage;
    btnCancelar: TSpeedButton;
    Image2: TImage;
    procedure btnNovoClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    FEndPoint : String;
    FPK : String;
    FTitle : String;
    FSort : String;
    FOrder : String;
  public
    { Public declarations }
  end;

var
  FormTemplate: TFormTemplate;

implementation

uses
  PesaMais.View.Principal;

{$R *.fmx}

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
end;

procedure TFormTemplate.FormCreate(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TabControl1.TabPosition.tpNone;
end;

procedure TFormTemplate.btnBuscaClick(Sender: TObject);
begin
  changeTabListagem.ExecuteTarget(Self);
end;

end.
