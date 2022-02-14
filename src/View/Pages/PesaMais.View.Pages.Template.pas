unit PesaMais.View.Pages.Template;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
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
  System.ImageList,
  FMX.ImgList,
  Bind4D, Router4D.Interfaces, PesaMais.View.Pages.CadUsuario,
  PesaMais.Model.Interfaces,PesaMais.Model.Usuario, PesaMais.Model.Entidade.Usuario,
  System.Generics.Collections, FMX.ListBox, FMX.ListView.Types, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.ListView.Appearances;

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
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Rectangle7: TRectangle;
    Rectangle5: TRectangle;
    ListView1: TListView;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FEndPoint : String;
    FPK : String;
    FTitle : String;
    FSort : String;
    FOrder : String;
    FormUsuario : TFormUsuario;

    FDao : iModelUsuario;
    procedure findAll;
  public
    { Public declarations }
    function Render : TFMXObject;
    procedure UnRender;
  end;

var
  FormTemplate: TFormTemplate;

implementation

{$R *.fmx}

procedure TFormTemplate.FormCreate(Sender: TObject);
begin
  //findAll;
end;

function TFormTemplate.Render: TFMXObject;
begin
  Result := Layout1;
end;

procedure TFormTemplate.SpeedButton1Click(Sender: TObject);
begin
  FormUsuario := TFormUsuario.Create(nil);

  FormUsuario.ShowModal();

end;

procedure TFormTemplate.UnRender;
begin

end;

procedure TFormTemplate.findall;
var
  Usuario : TUSUARIO;
  List : TObjectList<TUSUARIO>;
  Item : TListViewItem;
  i : Integer;
begin

  List := TModelUsuario.New.DAO.Find;

  ListView1.Items.Clear;
  for Usuario in List do
  begin
    Item := ListView1.Items.Add;
    item.Text := '('+IntToStr(Usuario.ID_USUARIO)+') '+Usuario.USUARIO;
  end;
  ListView1.EndUpdate;
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
