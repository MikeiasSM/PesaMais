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
  PesaMais.View.Pages.Template;

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
    RecCadastro: TRectangle;
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
    RecEnderecos: TRectangle;
    txtObservacao: TMemo;
    Label12: TLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure btnCadastrarEndClick(Sender: TObject);
    procedure btnSalvaEnderecoClick(Sender: TObject);
    procedure btnCancelaEnderecoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ClearPessoaComponests;
    procedure ClearEnderecoComponests;
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
  ClearEnderecoComponests;
end;

procedure TFormPessoa.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ClearPessoaComponests;
end;

procedure TFormPessoa.btnSalvaEnderecoClick(Sender: TObject);
begin
  inherited;
  ChangeTabEnderecoList.ExecuteTarget(Self);
end;

procedure TFormPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  TabControlEnd.TabIndex := 0;
  TabControlEnd.TabPosition := TTabPosition.None;
end;

procedure TFormPessoa.ClearEnderecoComponests;
begin
  txtCodigoEnd.Text := '';
  txtLogradouro.Text := '';
  txtNumero.Text := '';
  txtBairro.Text := '';
  txtComplemento.Text := '';
  chAtivoEnd.IsChecked := True;
end;

procedure TFormPessoa.ClearPessoaComponests;
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

end.
