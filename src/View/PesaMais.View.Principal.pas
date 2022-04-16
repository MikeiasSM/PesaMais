unit PesaMais.View.Principal;

interface

uses
  { System }
  System.Types,
  System.SysUtils,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Generics.Collections,
  System.Math.Vectors,
  System.ImageList,

  { FMX }
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
  FMX.ListBox,
  FMX.Ani,
  FMX.ImgList,
  FMX.Objects,
  FMX.Layouts,
  FMX.MultiView,
  FMX.Controls3D,
  FMX.Layers3D,

  { Skia }
  Skia,
  Skia.FMX,

  { PesaMais }
  PesaMais.Model.Entities.Estado,
  PesaMais.View.Pages.Main,
  PesaMais.View.Pages.Usuario,
  PesaMais.View.Pages.Pessoa,
  PesaMais.View.Pages.LancamentoBovino;

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
    btnDashboard: TSpeedButton;
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
    btnConfiguracoes: TSpeedButton;
    Image13: TImage;
    procedure btnUsuarioClick(Sender: TObject);
    procedure btnDashboardClick(Sender: TObject);
    procedure expCadastroClick(Sender: TObject);
    procedure expLancamentoClick(Sender: TObject);
    procedure expConsultaClick(Sender: TObject);
    procedure expRelatorioClick(Sender: TObject);
    procedure btnPessoaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProcedimentoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure setVisibleDashboard;
  end;

var
  FormPrincipal: TFormPrincipal;
  PageMain : TFormMain;


implementation

{$R *.fmx}

{ TfrmMain }

procedure TFormPrincipal.btnDashboardClick(Sender: TObject);
begin
  setVisibleDashboard;
end;

procedure TFormPrincipal.btnPessoaClick(Sender: TObject);
var
  pessoa : TFormPessoa;
begin
  if Assigned(pessoa) then
  begin
    pessoa := TFormPessoa.Create(Self);
    Self.LayoutPrincipal.RemoveObject(0);
    Self.LayoutPrincipal.AddObject(pessoa.Layout1);
  end
  else
  begin
    Self.LayoutPrincipal.RemoveObject(0);
    Self.LayoutPrincipal.AddObject(pessoa.Layout1);
  end;
end;

procedure TFormPrincipal.btnProcedimentoClick(Sender: TObject);
var
  lancamento : TFormLancamento;
begin

  if (Assigned(lancamento)) then
  begin
    lancamento := TFormLancamento.Create(Self);
    Self.LayoutPrincipal.RemoveObject(0);
    Self.LayoutPrincipal.AddObject(lancamento.Layout1);
  end
  else
  begin
    Self.LayoutPrincipal.RemoveObject(0);
    Self.LayoutPrincipal.AddObject(lancamento.Layout1);
  end;

end;

procedure TFormPrincipal.btnUsuarioClick(Sender: TObject);
var
  user : TFormUsuario;
begin
  if Assigned(user) then
  begin
    user := TFormUsuario.Create(Self);
    Self.LayoutPrincipal.RemoveObject(0);
    Self.LayoutPrincipal.AddObject(user.Layout1);
  end
  else
  begin
    Self.LayoutPrincipal.RemoveObject(0);
    Self.LayoutPrincipal.AddObject(user.Layout1);
  end;
end;

procedure TFormPrincipal.expCadastroClick(Sender: TObject);
begin
  if expCadastro.IsExpanded then
    expCadastro.IsExpanded := False
  else
    expCadastro.IsExpanded := True;
end;

procedure TFormPrincipal.expConsultaClick(Sender: TObject);
begin
  if expConsulta.IsExpanded then
    expConsulta.IsExpanded := False
  else
    expConsulta.IsExpanded := True;
end;

procedure TFormPrincipal.expLancamentoClick(Sender: TObject);
begin
  if expLancamento.IsExpanded then
    expLancamento.IsExpanded := False
  else
    expLancamento.IsExpanded := True;
end;

procedure TFormPrincipal.expRelatorioClick(Sender: TObject);
begin
  if expRelatorio.IsExpanded then
    expRelatorio.IsExpanded := False
  else
    expRelatorio.IsExpanded := True;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  setVisibleDashboard;
end;

procedure TFormPrincipal.setVisibleDashboard;
var
  main : TFormMain;
begin
  if Assigned(main) then
  begin
    main := TFormMain.Create(Self);
    Self.LayoutPrincipal.RemoveObject(0);
    Self.LayoutPrincipal.AddObject(main.Layout1);
  end
  else
  begin
    main := TFormMain.Create(nil);
    Self.LayoutPrincipal.RemoveObject(0);
    Self.LayoutPrincipal.AddObject(main.Layout1);
  end;
end;

end.
