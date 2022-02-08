program PesaMais;

uses
  System.StartUpCopy,
  FMX.Forms,
  PesaMais.View.Principal in 'src\View\PesaMais.View.Principal.pas' {frmMain},
  PesaMais.Model.Pessoa in 'Model\PesaMais.Model.Pessoa.pas',
  PesaMais.Model.Usuario in 'Model\PesaMais.Model.Usuario.pas',
  PesaMais.Model.Estado in 'Model\PesaMais.Model.Estado.pas',
  PesaMais.Model.Cidade in 'Model\PesaMais.Model.Cidade.pas',
  PesaMais.Model.Endereco in 'Model\PesaMais.Model.Endereco.pas',
  PesaMais.Model.Connection.DmConnection in 'Model\Connection\PesaMais.Model.Connection.DmConnection.pas' {Connection: TDataModule},
  PesaMais.Model.Dao.DaoUsuario in 'Model\Dao\PesaMais.Model.Dao.DaoUsuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TConnection, Connection);
  Application.Run;
end.
