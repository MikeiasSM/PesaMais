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
  PesaMais.View.Pages.CadUsuario,
  PesaMais.Model.Entities.ORM.Usuario;

type
  TFormTemplate = class(TForm, iRouter4DComponent)
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
    ListView1: TListView;
    Button1: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FEndPoint : String;
    FPK : String;
    FTitle : String;
    FSort : String;
    FOrder : String;
    FormUsuario : TFormUsuario;
  public
    { Public declarations }
    function Render : TFMXObject;
    procedure UnRender;
  end;

var
  FormTemplate: TFormTemplate;

implementation

{$R *.fmx}

function TFormTemplate.Render: TFMXObject;
begin
  Result := Layout1;
end;

procedure TFormTemplate.btnNovoClick(Sender: TObject);
begin
  FormUsuario := TFormUsuario.Create(nil);

  FormUsuario.ShowModal();

end;

procedure TFormTemplate.Button1Click(Sender: TObject);
  var
  usuario : TUSUARIO;
  usuario2 : TUSUARIO;

  Item : TListViewItem;
begin

  usuario := TUSUARIO.Create;
  usuario2 := TUSUARIO.Create;

  ListView1.Items.Clear;

  for usuario2 in usuario.FindAll do
  begin
    Item := ListView1.Items.Add;
    item.Text := '('+IntToStr(usuario2.ID_USUARIO)+') '+usuario2.USUARIO;
  end;
  ListView1.EndUpdate;
end;

procedure TFormTemplate.UnRender;
begin

end;


procedure TFormTemplate.FormCreate(Sender: TObject);
begin
  //
end;

{
// CODIGO DE EXEMPLO (CRUD)

//INSERT
procedure TfrmMain.insert;
begin
  FDao := TDaoEstado.Create;
  FEstado := TEstado.Create;

  FEstado.Nome := txtNome.Text;
  FEstado.Uf := txtUf.Text;

  if FDao.Insert(FEstado) then
    ShowMessage('Inserido com Sucesso!')
  else
    ShowMessage('Erro ao Inserir o Registro!');
end;

//UPDATE
procedure TfrmMain.update;
begin
  FDao := TDaoEstado.Create;
  FEstado := TEstado.Create;

  FEstado.Id_estado := StrToInt(txtCod.Text);
  FEstado.Nome := txtNome.Text;
  FEstado.Uf := txtUf.Text;

  if FDao.Update(FEstado) then
    ShowMessage('Alterado com Sucesso!')
  else
    ShowMessage('Erro ao Alterar o Registro!');
end;

//DELETE
procedure TfrmMain.delete;
begin
  FDao := TDaoEstado.Create;
  FEstado := TEstado.Create;

  FEstado.Id_estado := StrToInt(txtCod.Text);

  if FDao.Delete(FEstado) then
    ShowMessage('Deletado com Sucesso!')
  else
    ShowMessage('Erro ao Deletar o Registro!');
end;

//FIND ALL
procedure TfrmMain.findall;
var
  Estado : TEstado;
  Item : TListViewItem;
begin
  FDao := TDaoEstado.Create;
  ListEstado.Items.Clear;
  for Estado in FDao.FindAll do
  begin
    Item := ListEstado.Items.Add;
    item.Text := '('+IntToStr(Estado.Id_estado)+') '+Estado.Nome+' - '+Estado.Uf;
  end;
  ListEstado.EndUpdate;
end;
}

end.
