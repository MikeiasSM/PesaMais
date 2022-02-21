unit PesaMais.View.Pages.Usuario;

interface

uses
  { System }
  System.Generics.Collections,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.ImageList,
  System.Rtti,
  System.Actions,

  { FMX }
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Grid.Style,
  FMX.ImgList,
  FMX.ScrollBox,
  FMX.Grid,
  FMX.Controls.Presentation,
  FMX.Objects,
  FMX.Layouts,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Effects,
  FMX.TabControl,
  FMX.ActnList,
  FMX.Edit,

  { PesaMais }
  PesaMais.View.Pages.Template,
  PesaMais.Model.Entities.Usuario;


type
  TFormUsuario = class(TFormTemplate)
    cbAtivo: TCheckBox;
    txtSenha2: TEdit;
    Label2: TLabel;
    Código: TLabel;
    txtCodigo: TEdit;
    Label7: TLabel;
    txtNome: TEdit;
    Label1: TLabel;
    txtSenha1: TEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure PopGrid;
    procedure ClearGrid;
    procedure TestTab;
    procedure ClearComponests;
    function Validation : Boolean;
  public
    { Public declarations }
  end;

var
  FormUsuario: TFormUsuario;

implementation

{$R *.fmx}

procedure TFormUsuario.btnBuscaClick(Sender: TObject);
begin
  inherited;
  testTab;
end;

procedure TFormUsuario.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ClearComponests;
end;

procedure TFormUsuario.btnNovoClick(Sender: TObject);
begin
  inherited;
  testTab;
  txtNome.SetFocus;
end;

procedure TFormUsuario.btnSalvarClick(Sender: TObject);
begin
  inherited;
  var usuario := TUSUARIO.Create;
  if Validation then
  begin
    if txtCodigo.Text = '' then
    begin
      usuario.USUARIO := txtNome.Text;
      usuario.SENHA := txtSenha1.Text;
      usuario.ATIVO := cbAtivo.IsChecked;
      MessageDlg(usuario.Save(usuario), TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    end
    else
    begin
      usuario.ID_USUARIO := StrToInt(txtCodigo.Text);
      usuario.USUARIO := txtNome.Text;
      usuario.SENHA := txtSenha1.Text;
      usuario.ATIVO := cbAtivo.IsChecked;
      MessageDlg(usuario.Update(usuario, usuario.ID_USUARIO), TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
  end;

end;

procedure TFormUsuario.popGrid;
var
  i : Integer;
begin
  var DAO := TUSUARIO.Create;
  try
    StrGrid.Columns[0].Header := 'Codigo';
    StrGrid.Columns[1].Header := 'Usuário';

    StrGrid.RowCount := DAO.FindAll.Count;

    StrGrid.BeginUpdate;
    for i := 0 to Pred(DAO.FindAll.Count) do
    begin
      StrGrid.Cells[0,i] := IntToStr(DAO.FindAll[i].ID_USUARIO);
      StrGrid.Cells[1,i] := DAO.FindAll[i].USUARIO;
    end;
    StrGrid.EndUpdate;
  finally
    DAO.Free;
  end;
end;

procedure TFormUsuario.btnVoltarClick(Sender: TObject);
begin
  inherited;
  changeTabListagem.ExecuteTarget(Self);
  PopGrid;
  TestTab;
end;

procedure TFormUsuario.ClearComponests;
begin
  txtCodigo.Text := '';
  txtNome.Text := '';
  txtNome.TextPrompt := '';
  txtSenha1.Text := '';
  txtSenha1.TextPrompt := '';
  txtSenha2.Text := '';
  txtSenha2.TextPrompt := '';
  cbAtivo.IsChecked := True;
  lblStatus.Text := '';
  txtNome.SetFocus;
end;

procedure TFormUsuario.clearGrid;
var lin, col: integer;
begin
     for lin := 1 to StrGrid.RowCount - 1 do
       for col := 0 to StrGrid.ColumnCount - 1 do
         StrGrid.Cells[col, lin] := '';
end;

procedure TFormUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  PopGrid;
  TestTab;
end;


procedure TFormUsuario.testTab;
begin
  if TabControl1.ActiveTab = tabCadastro then
    lblNomeTela.Text := 'Cadastro de Usuários'
  else
    lblNomeTela.Text := 'Usuários';
end;

function TFormUsuario.Validation: Boolean;
var status : Integer;
begin
  status := 0;

  if txtNome.Text = '' then
  begin
    txtNome.TextPrompt := 'Campo Obrigatório';
    status := status + 1;
  end;

  if txtSenha1.Text = '' then
  begin
    txtSenha1.TextPrompt := 'Campo Obrigatório';
    status := status + 1;
  end;

  if txtSenha2.Text = '' then
  begin
    txtSenha2.TextPrompt := 'Campo Obrigatório';
    status := status + 1;
  end;

  if not txtSenha1.Text.Equals(txtSenha2.Text) then
  begin
    lblStatus.Text := '';
    lblStatus.Text := 'As senhas não coincidem!';
    status := status + 1;
  end;

  if status < 1 then
    Result := True
  else
    Result := False;
end;

end.
