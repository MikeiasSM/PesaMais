unit PesaMais.View.Pages.Pessoa;

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
  FMX.Ani,

  { PesaMais }
  PesaMais.View.Pages.Template,
  PesaMais.Model.Entities.Pessoa,
  PesaMais.Model.Entities.Cidade,
  PesaMais.Controller.Interfaces.InterfacesController,
  PesaMais.Controller.Factory.ControllerFactory,
  PesaMais.Controller.PessoaController,
  PesaMais.View.Dialog.Messages,
  PesaMais.Controller.CidadeController;

type

  TTipoEndereco = (tpComercial, tpRural, tpResidencial, tpOutros);

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
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;
    StringColumn9: TStringColumn;
    StringColumn10: TStringColumn;
    StringColumn11: TStringColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnCadastrarEndClick(Sender: TObject);
    procedure btnSalvaEnderecoClick(Sender: TObject);
    procedure btnCancelaEnderecoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure StrGridCellDblClick(const Column: TColumn; const Row: Integer);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }

    ControllerPessoa : TPessoaController;
    ControllerCidade : TCidadeController;
    Dialog : TFormMessage;

    procedure limpa_componentes_form_pessoa;
    procedure limpa_componentes_form_enredeco;
    procedure popula_combobox_endereco_cidade;
    procedure setPessoaController;
    procedure setCidadeController;
    procedure limpa_grid_pessoas;
    procedure popula_grid_pessoas;
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
  if cbCidade.Items.Count <= 0 then
  begin
    popula_combobox_endereco_cidade;
  end;
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
  changeTabListagem.ExecuteTarget(Self);
  muda_aba_selecionada;
end;

procedure TFormPessoa.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if txtCodigo.Text <> '' then begin
    ControllerPessoa.Delete(StrToInt(txtCodigo.Text));
    limpa_componentes_form_pessoa;
    limpa_componentes_form_enredeco;
    changeTabCadastro.ExecuteTarget(Self);
  end;
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
  Dialog := TFormMessage.Create(nil);

  if validacao_de_campos then
  begin
   if txtCodigo.Text = '' then
    begin
      pessoa := preenche_objeto_com_edits;
      ControllerPessoa.Insert(pessoa);
      limpa_componentes_form_pessoa;
      changeTabListagem.ExecuteTarget(Self);
    end
    else
    begin
      pessoa := preenche_objeto_com_edits;
      pessoa.id_pessoa := StrToInt(txtCodigo.Text.Trim);
      ControllerPessoa.Update(pessoa);
      limpa_componentes_form_pessoa;
      changeTabListagem.ExecuteTarget(Self);
    end;
  end;

  ChangeTabListagem.ExecuteTarget(Self);
end;

procedure TFormPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  setPessoaController;
  setCidadeController;
  popula_grid_pessoas;
  muda_aba_selecionada;

  TabControlEnd.TabIndex := 0;
  TabControlEnd.TabPosition := TTabPosition.None;

end;

procedure TFormPessoa.popula_combobox_endereco_cidade;
var
  loop : Integer;
  listCidade : TObjectList<TCIDADE>;
  cidade : TCIDADE;
begin

  cidade := TCIDADE.Create;
  listCidade := ControllerCidade.FindAll;

  if listCidade.Count > 0 then begin
    cbCidade.Clear;
    cbCidade.BeginUpdate;

    for loop := 0 to listCidade.Count - 1 do
    begin
      cidade.nome := listCidade[loop].nome;
      cbCidade.Items.AddObject(cidade.nome, cidade);
    end;

    cbCidade.EndUpdate;
  end;
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
  cbCidade.ItemIndex := -1;
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
  popula_grid_pessoas;
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

procedure TFormPessoa.setPessoaController;
begin
  ControllerPessoa := TControllerFactory.New.getPessoaController;
end;

procedure TFormPessoa.setCidadeController;
begin
  ControllerCidade := TControllerFactory.New.getCidadeController;
end;

procedure TFormPessoa.StrGridCellDblClick(const Column: TColumn; const Row: Integer);
var
  pessoa : TPESSOA;
begin
  inherited;
  pessoa := TPESSOA.Create;
  if StrGrid.Row >= 0 then begin
    pessoa.id_pessoa := StrToInt(StrGrid.Cells[0, Row]);
    pessoa.nome := StrGrid.Cells[1, Row];
    pessoa.apelido := StrGrid.Cells[2, Row];
    pessoa.cpj_cnpj := StrGrid.Cells[3, Row];
    pessoa.rg_inscr := StrGrid.Cells[4, Row];
    pessoa.fone1 := StrGrid.Cells[5, Row];
    pessoa.fone2 := StrGrid.Cells[6, Row];
    pessoa.contato1 := StrGrid.Cells[7, Row];
    pessoa.contato2 := StrGrid.Cells[8, Row];
    pessoa.email := StrGrid.Cells[9, Row];

    changeTabCadastro.ExecuteTarget(Self);

    txtCodigo.Text := IntToStr(pessoa.id_pessoa);
    txtRazaoNome.Text := pessoa.nome;
    txtFantasiaApelido.Text := pessoa.apelido;
    txtCnpjCpf.Text := pessoa.cpj_cnpj;
    txtInscrRg.Text := pessoa.rg_inscr;
    txtTelefone.Text := pessoa.fone1;
    txtCelular.Text := pessoa.fone2;
    txtContato1.Text := pessoa.contato1;
    txtContato2.Text := pessoa.contato2;
    txtEmail.Text := pessoa.email;
  end;

end;

procedure TFormPessoa.popula_grid_pessoas;
var
  i : Integer;
  list : TObjectList<TPESSOA>;
begin
  list := ControllerPessoa.FindAll;

  try
    StrGrid.Columns[0].Header := 'Codigo';
    StrGrid.Columns[1].Header := 'Raz.Social/Nome';
    StrGrid.Columns[2].Header := 'Fantasia/Apelido';
    StrGrid.Columns[3].Header := 'Pessoa';
    StrGrid.Columns[4].Header := 'CNPJ/CPF';
    StrGrid.Columns[5].Header := 'Inscr/RG';
    StrGrid.Columns[6].Header := 'Fone 1';
    StrGrid.Columns[7].Header := 'Fone 2';
    StrGrid.Columns[8].Header := 'Contato 1';
    StrGrid.Columns[9].Header := 'Contato 2';
    StrGrid.Columns[10].Header := 'E-mail';

    StrGrid.Columns[0].Width := 100;
    StrGrid.Columns[1].Width := 350;
    StrGrid.Columns[2].Width := 350;
    StrGrid.Columns[3].Width := 200;
    StrGrid.Columns[4].Width := 200;
    StrGrid.Columns[5].Width := 200;
    StrGrid.Columns[6].Width := 200;
    StrGrid.Columns[7].Width := 200;
    StrGrid.Columns[8].Width := 200;
    StrGrid.Columns[9].Width := 350;
    StrGrid.Columns[10].Width := 350;

    StrGrid.RowCount := list.Count;

    StrGrid.BeginUpdate;
    for i := 0 to Pred(list.Count) do
    begin
      StrGrid.Cells[0,i] := IntToStr(list[i].id_pessoa);
      StrGrid.Cells[1,i] := list[i].nome;
      StrGrid.Cells[2,i] := list[i].apelido;
      if list[i].tipo_pessoa = 'F' then
        StrGrid.Cells[3,i] := 'FISICA'
      else
        StrGrid.Cells[3,i] := 'JURIDICA';
      StrGrid.Cells[4,i] := list[i].cpj_cnpj;
      StrGrid.Cells[5,i] := list[i].rg_inscr;
      StrGrid.Cells[6,i] := list[i].fone1;
      StrGrid.Cells[7,i] := list[i].fone2;
      StrGrid.Cells[8,i] := list[i].contato1;
      StrGrid.Cells[9,i] := list[i].contato2;
      StrGrid.Cells[10,i] := list[i].email;
    end;
    StrGrid.EndUpdate;
  finally
    list.Free;
  end;
end;

procedure TFormPessoa.limpa_grid_pessoas;
var lin, col: integer;
begin
  for lin := 1 to StrGrid.RowCount - 1 do
    for col := 0 to StrGrid.ColumnCount - 1 do
      StrGrid.Cells[col, lin] := '';
end;

end.
