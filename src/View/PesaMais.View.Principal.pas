unit PesaMais.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  PesaMais.Model.Dao.DaoEstado, PesaMais.Model.Estado, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.Generics.Collections, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TfrmMain = class(TForm)
    txtCod: TEdit;
    txtNome: TEdit;
    btnGravar: TButton;
    txtUF: TEdit;
    Deletar: TButton;
    Listar: TButton;
    ListEstado: TListView;
    procedure btnGravarClick(Sender: TObject);
    procedure DeletarClick(Sender: TObject);
    procedure ListarClick(Sender: TObject);
  private
    { Private declarations }
    FDao : TDaoEstado;
    FEstado : TEstado;

    procedure insert;
    procedure update;
    procedure delete;
    procedure findall;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnGravarClick(Sender: TObject);
begin
  if txtCod.Text = '' then
    insert
  else
    update;

  findall;
end;

procedure TfrmMain.ListarClick(Sender: TObject);
begin
  findall;
end;

procedure TfrmMain.DeletarClick(Sender: TObject);
begin
  delete;
  findall;
end;

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

end.
