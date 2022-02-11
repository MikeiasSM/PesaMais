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
  PesaMais.Model.Entities.Estado, FMX.Objects, FMX.Layouts, FMX.MultiView,
  System.Math.Vectors, FMX.Controls3D, FMX.Layers3D;

type
  TfrmMain = class(TForm)
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
  private
    { Private declarations }
    FDao : TDaoEstado;
    FEstado : TEstado;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}


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
