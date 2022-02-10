program PesaMais;

uses
  System.StartUpCopy,
  FMX.Forms,
  PesaMais.View.Principal in 'src\View\PesaMais.View.Principal.pas' {frmMain},
  PesaMais.Model.Connection.DmConnection in 'src\Model\Connection\PesaMais.Model.Connection.DmConnection.pas' {Connection: TDataModule},
  PesaMais.Model.Dao.DaoUsuario in 'src\Model\Dao\PesaMais.Model.Dao.DaoUsuario.pas',
  PesaMais.Model.Bairros in 'src\Model\PesaMais.Model.Bairros.pas',
  PesaMais.Model.Cidade in 'src\Model\PesaMais.Model.Cidade.pas',
  PesaMais.Model.Endereco in 'src\Model\PesaMais.Model.Endereco.pas',
  PesaMais.Model.Estado in 'src\Model\PesaMais.Model.Estado.pas',
  PesaMais.Model.Pessoa in 'src\Model\PesaMais.Model.Pessoa.pas',
  PesaMais.Model.Usuario in 'src\Model\PesaMais.Model.Usuario.pas',
  PesaMais.Model.Dao.DaoEstado in 'src\Model\Dao\PesaMais.Model.Dao.DaoEstado.pas' {$R *.res},
  PesaMais.Model.Animal in 'src\Model\PesaMais.Model.Animal.pas',
  PesaMais.Model.Categoria in 'src\Model\PesaMais.Model.Categoria.pas',
  PesaMais.Model.RacaAnimal in 'src\Model\PesaMais.Model.RacaAnimal.pas',
  PesaMais.Model.Lote in 'src\Model\PesaMais.Model.Lote.pas',
  PesaMais.Model.Propriedade in 'src\Model\PesaMais.Model.Propriedade.pas',
  PesaMais.Model.PropriedadeLocal in 'src\Model\PesaMais.Model.PropriedadeLocal.pas',
  PesaMais.Model.Dao.DaoRacaAnimal in 'src\Model\Dao\PesaMais.Model.Dao.DaoRacaAnimal.pas',
  PesaMais.Model.Dao.DaoLote in 'src\Model\Dao\PesaMais.Model.Dao.DaoLote.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TConnection, Connection);
  Application.CreateForm(TConnection, Connection);
  Application.Run;
end.
