unit PesaMais.View.Pages.Pessoa;

interface

uses
  { System }
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.ImageList,
  System.Actions,
  System.Rtti,

  { FMX }
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Grid.Style,
  FMX.ActnList,
  FMX.TabControl,
  FMX.ImgList,
  FMX.Edit,
  FMX.Objects,
  FMX.Effects,
  FMX.Grid,
  FMX.ScrollBox,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.DateTimeCtrls,
  FMX.Memo.Types,
  FMX.Memo,
  FMX.ListBox,

  { PesaMais }
  PesaMais.View.Pages.Template, FMX.Ani, PesaMais.Model.Entities.Pessoa,
  PesaMais.Controller.Interfaces.InterfacesController,
  PesaMais.Controller.Factory.ControllerFactory,
  PesaMais.Controller.PessoaController, PesaMais.View.Dialog.Messages;

type
  TFormPessoa = class(TFormTemplate)
    txtCodigo: TEdit;
    Código: TLabel;
    txtRazaoNome: TEdit;
    lblRazao_Nome: TLabel;
    txtFantasiaApelido: TEdit;
    lblFantasia_Apelido: TLabel;
    txtCnpjCpf: TEdit;
    lblCnpj_Cpf: TLabel;
    RecCodigo: TRectangle;
    chCliente: TCheckBox;
    chColaborador: TCheckBox;
    chFornecedor: TCheckBox;
    dtCadastro: TDateEdit;
    dtAlteracao: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    RecStatus: TRectangle;
    chAtivo: TCheckBox;
    txtInscrRg: TEdit;
    lblInscr_Rg: TLabel;
    txtTelefone: TEdit;
    Label8: TLabel;
    txtCelular: TEdit;
    Label6: TLabel;
    txtContato1: TEdit;
    Label9: TLabel;
    txtContato2: TEdit;
    Label10: TLabel;
    txtEmail: TEdit;
    Label11: TLabel;
    RecLayerEnd: TRectangle;
    txtObservacao: TMemo;
    btnCadastrarEnd: TSpeedButton;
    Image5: TImage;
    btnRemoverEnd: TSpeedButton;
    Image6: TImage;
    StringGrid1: TStringGrid;
    Rectangle15: TRectangle;
    Label13: TLabel;
    TabControlEnd: TTabControl;
    tabListEnd: TTabItem;
    tabCadEnd: TTabItem;
    ChangeTabEnderecoList: TChangeTabAction;
    ChangeTabEnderecoCad: TChangeTabAction;
    Rectangle12: TRectangle;
    txtCodigoEnd: TEdit;
    txtLogradouro: TEdit;
    txtComplemento: TEdit;
    txtNumero: TEdit;
    txtBairro: TEdit;
    cbTipoEnd: TComboBox;
    chAtivoEnd: TCheckBox;
    cbCidade: TComboBox;
    btnCancelaEndereco: TSpeedButton;
    Image7: TImage;
    btnSalvaEndereco: TSpeedButton;
    Image8: TImage;
    RecDados: TRectangle;
    RecContato: TRectangle;
    chFisica: TCheckBox;
    chJuridica: TCheckBox;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    txtDescricaoEnd: TEdit;
    RectAnimation1: TRectAnimation;
    RecLayerObs: TRectangle;
    Label1: TLabel;
    RecCadastro: TRectangle;
    RecDadosBasicos: TRectangle;
    lblSubTitlePessoal: TLabel;
    Label2: TLabel;
    RectAnimation2: TRectAnimation;
    RecEnderecos: TRectangle;
    RecObs: TRectangle;
    ScrollBar1: TScrollBar;
    procedure FormCreate(Sender: TObject);
    procedure btnCadastrarEndClick(Sender: TObject);
    procedure btnSalvaEnderecoClick(Sender: TObject);
    procedure btnCancelaEnderecoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }

    Controller : TPessoaController;
    Dialog : TFormMessage;

    procedure limpa_componentes_form_pessoa;
    procedure limpa_componentes_form_enredeco;
    procedure popula_combobox_endereco_cidade;
    procedure muda_aba_selecionada;
    function preenche_objeto_com_edits : TPESSOA;
    function validacao_de_campos : Boolean;

  public
    { Public declarations }
  end;

var
  FormPessoa: TFormPessoa;

implementation

{$R *.fmx}

procedure TFormPessoa.btnCadastrarEndClick(Sender: TObject);
begin
  inherited;
  ChangeTabEnderecoCad.ExecuteTarget(Self);
end;

procedure TFormPessoa.btnCancelaEnderecoClick(Sender: TObject);
begin
  inherited;
  ChangeTabEnderecoList.ExecuteTarget(Self);
  limpa_componentes_form_pessoa;
end;

procedure TFormPessoa.btnCancelarClick(Sender: TObject);
begin
  inherited;
  limpa_componentes_form_pessoa;
end;

procedure TFormPessoa.btnNovoClick(Sender: TObject);
begin
  inherited;
  muda_aba_selecionada;
end;

procedure TFormPessoa.btnSalvaEnderecoClick(Sender: TObject);
begin
  inherited;
  {**
    ADICIONA ENDERECO
   **}
  ChangeTabEnderecoList.ExecuteTarget(Self);
end;

procedure TFormPessoa.btnSalvarClick(Sender: TObject);
var
  pessoa : TPESSOA;
begin
  inherited;
  Controller := TControllerFactory.New.getPessoaController;
  Dialog := TFormMessage.Create(nil);

  if validacao_de_campos then
  begin
   if txtCodigo.Text = '' then
    begin
      pessoa := preenche_objeto_com_edits;
      Dialog.ShowDialog('Sucesso!', Controller.Insert(pessoa), tpInformation);
      limpa_componentes_form_pessoa;
      changeTabListagem.ExecuteTarget(Self);
    end
    else
    begin
      pessoa := preenche_objeto_com_edits;
      pessoa.id_pessoa := StrToInt(txtCodigo.Text.Trim);
      Dialog.ShowDialog('Sucesso!', Controller.Update(pessoa), tpInformation);
      limpa_componentes_form_pessoa;
      changeTabListagem.ExecuteTarget(Self);
    end;
  end;

  ChangeTabListagem.ExecuteTarget(Self);
end;

procedure TFormPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  TabControlEnd.TabIndex := 0;
  TabControlEnd.TabPosition := TTabPosition.None;
end;

procedure TFormPessoa.popula_combobox_endereco_cidade;
begin
  //
end;

function TFormPessoa.preenche_objeto_com_edits: TPESSOA;
var
  pessoa : TPESSOA;
begin
  pessoa := TPESSOA.Create;
  pessoa.nome := txtRazaoNome.Text.Trim;
  pessoa.apelido := txtFantasiaApelido.Text.Trim;
  pessoa.cpj_cnpj := txtCnpjCpf.Text.Trim;
  pessoa.rg_inscr := txtInscrRg.Text.Trim;
  if chFisica.IsChecked then
    pessoa.tipo_pessoa := 'F'
  else
    pessoa.tipo_pessoa := 'J';
  pessoa.fone1 := txtTelefone.Text.Trim;
  pessoa.fone2 := txtCelular.Text.Trim;
  pessoa.contato1 := txtContato1.Text.Trim;
  pessoa.contato2 := txtContato2.Text.Trim;
  pessoa.email := txtEmail.Text.Trim;
  pessoa.obs := txtObservacao.Text.Trim;
  pessoa.flag_cliente := chCliente.IsChecked;
  pessoa.flag_fornecedor := chFornecedor.IsChecked;
  pessoa.flag_colaborador := chColaborador.IsChecked;
  pessoa.ativo := chAtivo.IsChecked;

  Result := pessoa;
end;

procedure TFormPessoa.limpa_componentes_form_enredeco;
begin
  txtCodigoEnd.Text := '';
  txtLogradouro.Text := '';
  txtNumero.Text := '';
  txtBairro.Text := '';
  txtComplemento.Text := '';
  chAtivoEnd.IsChecked := True;
end;

procedure TFormPessoa.limpa_componentes_form_pessoa;
begin
  txtCodigo.Text := '';
  txtRazaoNome.Text := '';
  txtFantasiaApelido.Text := '';
  txtCnpjCpf.Text := '';
  txtInscrRg.Text := '';
  txtTelefone.Text := '';
  txtCelular.Text := '';
  txtContato1.Text := '';
  txtContato2.Text := '';
  txtEmail.Text := '';
  txtObservacao.Text := '';
  chCliente.IsChecked := True;
  chFisica.IsChecked := True;
  chAtivo.IsChecked := True;
  txtRazaoNome.SetFocus;
end;

procedure TFormPessoa.muda_aba_selecionada;
begin
  if TabControl1.ActiveTab = tabCadastro then
    lblNomeTela.Text := 'Cadastro de Pessoa'
  else
    lblNomeTela.Text := 'Pessoas';
end;

function TFormPessoa.validacao_de_campos: Boolean;
var status : Integer;
begin
  status := 0;

  if txtRazaoNome.Text = '' then
  begin
    txtRazaoNome.TextPrompt := 'Campo Obrigatório';
    status := status + 1;
  end;

  if status < 1 then
    Result := True
  else
    Result := False;

  status := 0;
end;

end.
