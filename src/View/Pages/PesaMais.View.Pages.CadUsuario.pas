unit PesaMais.View.Pages.CadUsuario;

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
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Layouts,
  FMX.Objects;

type
  TFormUsuario = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    txtCodigo: TEdit;
    txtNome: TEdit;
    txtSenha1: TEdit;
    Código: TLabel;
    Label7: TLabel;
    cbAtivo: TCheckBox;
    btnSalvar: TSpeedButton;
    btnSair: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label1: TLabel;
    txtSenha2: TEdit;
    Label2: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsuario: TFormUsuario;

implementation

{$R *.fmx}

procedure TFormUsuario.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormUsuario.btnSalvarClick(Sender: TObject);
begin
  //
end;


end.
