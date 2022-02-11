program PesaMais;

uses
  System.StartUpCopy,
  FMX.Forms,
  PesaMais.View.Principal in 'src\View\PesaMais.View.Principal.pas' {frmMain},
  PesaMais.Model.Connection.DmConnection in 'src\Model\Connection\PesaMais.Model.Connection.DmConnection.pas' {Connection: TDataModule},
  PesaMais.Model.Entities.Bairro in 'src\Model\Entities\PesaMais.Model.Entities.Bairro.pas',
  PesaMais.Model.Entities.Cidade in 'src\Model\Entities\PesaMais.Model.Entities.Cidade.pas',
  PesaMais.Model.Entities.Endereco in 'src\Model\Entities\PesaMais.Model.Entities.Endereco.pas',
  PesaMais.Model.Entities.Estado in 'src\Model\Entities\PesaMais.Model.Entities.Estado.pas',
  PesaMais.Model.Entities.Pessoa in 'src\Model\Entities\PesaMais.Model.Entities.Pessoa.pas',
  PesaMais.Model.Entities.Usuario in 'src\Model\Entities\PesaMais.Model.Entities.Usuario.pas',
  PesaMais.Model.Entities.Animal in 'src\Model\Entities\PesaMais.Model.Entities.Animal.pas',
  PesaMais.Model.Entities.Categoria in 'src\Model\Entities\PesaMais.Model.Entities.Categoria.pas',
  PesaMais.Model.Entities.RacaAnimal in 'src\Model\Entities\PesaMais.Model.Entities.RacaAnimal.pas',
  PesaMais.Model.Entities.Lote in 'src\Model\Entities\PesaMais.Model.Entities.Lote.pas',
  PesaMais.Model.Entities.Propriedade in 'src\Model\Entities\PesaMais.Model.Entities.Propriedade.pas',
  PesaMais.Model.Entities.PropriedadeLocal in 'src\Model\Entities\PesaMais.Model.Entities.PropriedadeLocal.pas',
  PesaMais.Model.Dao.DaoLote in 'src\Model\Dao\PesaMais.Model.Dao.DaoLote.pas',
  PesaMais.Model.Dao.DaoEstado in 'src\Model\Dao\PesaMais.Model.Dao.DaoEstado.pas' {$R *.res},
  PesaMais.Model.Dao.DaoUsuario in 'src\Model\Dao\PesaMais.Model.Dao.DaoUsuario.pas',
  PesaMais.Model.Dao.DaoRacaAnimal in 'src\Model\Dao\PesaMais.Model.Dao.DaoRacaAnimal.pas',
  PesaMais.View.Pages.Main in 'src\View\Pages\PesaMais.View.Pages.Main.pas' {Form1},
  PesaMais.Model.Dao.DaoPropriedade in 'src\Model\Dao\PesaMais.Model.Dao.DaoPropriedade.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TConnection, Connection);
  Application.CreateForm(TConnection, Connection);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
