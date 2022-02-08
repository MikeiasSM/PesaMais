unit PesaMais.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  PesaMais.Model.Dao.DaoEstado, PesaMais.Model.Estado;

type
  TfrmMain = class(TForm)
    txtCod: TEdit;
    txtNome: TEdit;
    btnGravar: TButton;
    txtUF: TEdit;
  private
    { Private declarations }
    FDao : TDaoEstado;
    FEstado : TEstado;

    function executa : boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

function TfrmMain.executa;
begin

  FDao := TDaoEstado.Create;
  FEstado := TEstado.Create;

  FEstado.Nome := txtNome.Text;
  FEstado.Uf := txtUf.Text;

  if FDao.Insert(FEstado) then
    ShowMessage('Inserido com Sucesso!')
  else
    ShowMessage('Inserido !');

    result := true;
end;

end.
