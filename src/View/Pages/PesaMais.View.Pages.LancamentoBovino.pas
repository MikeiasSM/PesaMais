unit PesaMais.View.Pages.LancamentoBovino;

interface

uses
  { System }
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.ImageList,

  { FMX }
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Effects,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Objects,
  FMX.Layouts,
  FMX.TabControl,
  FMX.ImgList,
  FMX.Edit,
  FMX.Ani, System.Actions, FMX.ActnList, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid;


type
  TFormLancamento = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    lblNomeTela: TLabel;
    Rectangle7: TRectangle;
    btnNovo: TSpeedButton;
    btnSair: TSpeedButton;
    Rectangle5: TRectangle;
    Rectangle4: TRectangle;
    ShadowEffect2: TShadowEffect;
    Rectangle6: TRectangle;
    Rectangle8: TRectangle;
    TabControl1: TTabControl;
    Circle1: TCircle;
    Line1: TLine;
    Circle2: TCircle;
    Circle3: TCircle;
    Line2: TLine;
    Line3: TLine;
    Circle4: TCircle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StyleBook1: TStyleBook;
    ImageList1: TImageList;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    SpeedButton1: TSpeedButton;
    RectAnimation1: TRectAnimation;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ActionList1: TActionList;
    changeTab1: TChangeTabAction;
    changeTab2: TChangeTabAction;
    changeTab3: TChangeTabAction;
    changeTab4: TChangeTabAction;
    Rectangle14: TRectangle;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Rectangle16: TRectangle;
    rdCompras: TRadioButton;
    rdProcedimento: TRadioButton;
    Rectangle15: TRectangle;
    rec1: TRectangle;
    rec2: TRectangle;
    rdTransferencia: TRadioButton;
    rdVenda: TRadioButton;
    StringGrid1: TStringGrid;
    Rectangle17: TRectangle;
    procedure btnSairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdComprasChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLancamento: TFormLancamento;

implementation
uses
PesaMais.View.Principal;

{$R *.fmx}

procedure TFormLancamento.btnSairClick(Sender: TObject);
var
  Main : TFormPrincipal;
begin
  Main := TFormPrincipal(Self.Owner);
  Main.LayoutPrincipal.RemoveObject(Self.Layout1);
  Main.setVisibleDashboard;
end;

procedure TFormLancamento.FormCreate(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
end;

procedure TFormLancamento.rdComprasChange(Sender: TObject);
begin
  if RadioButton3.IsChecked then begin
    rec1.Visible := true;
    rec2.Visible := true;
  end
  else begin
    rec1.Visible := false;
    rec2.Visible := true;
  end;

end;

procedure TFormLancamento.SpeedButton1Click(Sender: TObject);
begin
  if (TabControl1.TabIndex = 0) then
    changeTab2.ExecuteTarget(Self);

  if (TabControl1.TabIndex = 1) then
    changeTab3.ExecuteTarget(Self);

  if (TabControl1.TabIndex = 2) then
    changeTab4.ExecuteTarget(Self);

  if (TabControl1.TabIndex = 3) then
    ShowMessage('Fim da Linha!');
end;

end.
