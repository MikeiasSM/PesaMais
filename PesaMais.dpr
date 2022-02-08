program PesaMais;

uses
  System.StartUpCopy,
  FMX.Forms,
  PesaMais.View.Principal in 'src\View\PesaMais.View.Principal.pas' {frmMain},
  PesaMais.Model.Pessoa in 'Model\PesaMais.Model.Pessoa.pas',
  PesaMais.Model.Usuario in 'Model\PesaMais.Model.Usuario.pas',
  PesaMais.Model.Estado in 'Model\PesaMais.Model.Estado.pas',
  PesaMais.Model.Cidade in 'Model\PesaMais.Model.Cidade.pas',
  PesaMais.Model.Endereco in 'Model\PesaMais.Model.Endereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
