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
  PesaMais.Controller.UsuarioController,
  PesaMais.Controller.Factory.ControllerFactory,
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
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    lblStatus: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure StrGridCellDblClick(const Column: TColumn; const Row: Integer);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    Linha : Integer;
    Controller : TUsuarioController;

    procedure PopGrid;
    procedure ClearGrid;
    procedure TestTab;
    procedure ClearComponests;
    function Validation : Boolean;
    procedure GetGrid;
  public
    { Public declarations }
    procedure setUsuarioController;
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
  changeTabListagem.ExecuteTarget(Self);
  PopGrid;
  TestTab;
end;

procedure TFormUsuario.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if txtCodigo.Text <> '' then
  begin
    MessageDlg(Controller.Delete(StrToInt(txtCodigo.Text)), TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    ClearComponests;
    changeTabListagem.ExecuteTarget(Self);
  end
  else
  begin
    ShowMessage('Erro ao executar esta ação!');
  end;
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
      MessageDlg(Controller.Insert(usuario), TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
      ClearComponests;
      changeTabListagem.ExecuteTarget(Self);

    end
    else
    begin
      usuario.ID_USUARIO := StrToInt(txtCodigo.Text);
      usuario.USUARIO := txtNome.Text;
      usuario.SENHA := txtSenha1.Text;
      usuario.ATIVO := cbAtivo.IsChecked;
      MessageDlg(Controller.Update(usuario), TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
      ClearComponests;
      changeTabListagem.ExecuteTarget(Self);
    end;
  end;
end;

procedure TFormUsuario.PopGrid;
var
  i : Integer;
  list : TObjectList<TUSUARIO>;
begin
  list := Controller.FindAll;

  try
    StrGrid.Columns[0].Header := 'Codigo';
    StrGrid.Columns[1].Header := 'Usuário';
    StrGrid.Columns[2].Header := 'Senha';
    StrGrid.Columns[3].Header := 'Ativo';

    StrGrid.RowCount := list.Count;

    StrGrid.BeginUpdate;
    for i := 0 to Pred(list.Count) do
    begin
      StrGrid.Cells[0,i] := IntToStr(list[i].ID_USUARIO);
      StrGrid.Cells[1,i] := list[i].USUARIO;
      StrGrid.Cells[2,i] := list[i].SENHA;
      StrGrid.Cells[3,i] := list[i].ATIVO;
    end;
    StrGrid.EndUpdate;
  finally
    Controller.Free;
  end;
end;

procedure TFormUsuario.setUsuarioController;
begin
  Controller := TControllerFactory.New.getUsuarioController;
end;

procedure TFormUsuario.StrGridCellDblClick(const Column: TColumn; const Row: Integer);
begin
  inherited;
  var usuario := TUSUARIO.Create;
  if StrGrid.Row >= 0 then
    usuario.ID_USUARIO := strToInt(StrGrid.Cells[0,Row]);
    usuario.USUARIO    := StrGrid.Cells[1,Row];
    usuario.SENHA      := StrGrid.Cells[2,Row];
    usuario.ATIVO      := StrToBool(StrGrid.Cells[3,Row]);

    changeTabCadastro.ExecuteTarget(Self);

    txtCodigo.Text := IntToStr(usuario.ID_USUARIO);
    txtNome.Text := usuario.USUARIO;
    txtSenha1.Text := usuario.SENHA;
    txtSenha2.Text := usuario.SENHA;
    cbAtivo.IsChecked := usuario.ATIVO;
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
  PopGrid;
end;

procedure TFormUsuario.ClearGrid;
var lin, col: integer;
begin
     for lin := 1 to StrGrid.RowCount - 1 do
       for col := 0 to StrGrid.ColumnCount - 1 do
         StrGrid.Cells[col, lin] := '';
end;

procedure TFormUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  setUsuarioController;
  PopGrid;
  TestTab;
end;


procedure TFormUsuario.GetGrid;
var
  cod, nome, ativo : String;
begin

end;

procedure TFormUsuario.TestTab;
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
    ShowMessage('erro');
    status := status + 1;
  end;

  if status < 1 then
    Result := True
  else
    Result := False;

  status := 0;
end;

end.
