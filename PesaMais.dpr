program PesaMais;

uses
  System.StartUpCopy,
  FMX.Forms,
  PesaMais.View.Principal in 'src\View\PesaMais.View.Principal.pas' {Form1},
  PesaMais.Model.Connection.DmConnection in 'src\Model\Connection\PesaMais.Model.Connection.DmConnection.pas' {Connection: TDataModule},
  PesaMais.Model.Dao.DaoUsuario in 'src\Model\Dao\PesaMais.Model.Dao.DaoUsuario.pas',
  PesaMais.Model.Bairros in 'src\Model\PesaMais.Model.Bairros.pas',
  PesaMais.Model.Cidade in 'src\Model\PesaMais.Model.Cidade.pas',
  PesaMais.Model.Endereco in 'src\Model\PesaMais.Model.Endereco.pas',
  PesaMais.Model.Estado in 'src\Model\PesaMais.Model.Estado.pas',
  PesaMais.Model.Pessoa in 'src\Model\PesaMais.Model.Pessoa.pas',
  PesaMais.Model.Usuario in 'src\Model\PesaMais.Model.Usuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TConnection, Connection);
  Application.Run;
end.
