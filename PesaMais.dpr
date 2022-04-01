program PesaMais;

uses
  System.StartUpCopy,
  FMX.Forms,
  PesaMais.View.Principal in 'src\View\PesaMais.View.Principal.pas' {FormPrincipal},
  PesaMais.View.Pages.Template in 'src\View\Pages\PesaMais.View.Pages.Template.pas' {FormTemplate},
  PesaMais.View.Pages.Main in 'src\View\Pages\PesaMais.View.Pages.Main.pas' {FormMain},
  PesaMais.View.Pages.Usuario in 'src\View\Pages\PesaMais.View.Pages.Usuario.pas' {FormUsuario},
  PesaMais.View.Pages.Pessoa in 'src\View\Pages\PesaMais.View.Pages.Pessoa.pas' {FormUsuario},
  PesaMais.View.Dialog.Messages in 'src\View\Dialog\PesaMais.View.Dialog.Messages.pas',
  PesaMais.Model.Entities.Interfaces.InterfacesModel in 'src\Model\Entities\Interfaces\PesaMais.Model.Entities.Interfaces.InterfacesModel.pas',
  PesaMais.Model.Dao.Interfaces.InterfacesDAO in 'src\Model\Dao\Interfaces\PesaMais.Model.Dao.Interfaces.InterfacesDAO.pas',
  PesaMais.Model.Connection.DmConnection in 'src\Model\Connection\PesaMais.Model.Connection.DmConnection.pas' {Connection: TDataModule},
  PesaMais.Model.Connection.DmORM in 'src\Model\Connection\PesaMais.Model.Connection.DmORM.pas' {ConnectionFactory: TDataModule},
  PesaMais.Model.Dao.DaoBase in 'src\Model\Dao\PesaMais.Model.Dao.DaoBase.pas',
  PesaMais.Model.Entities.Usuario in 'src\Model\Entities\PesaMais.Model.Entities.Usuario.pas',
  PesaMais.Model.Entities.Animal in 'src\Model\Entities\PesaMais.Model.Entities.Animal.pas',
  PesaMais.Model.Entities.Categoria_Animal in 'src\Model\Entities\PesaMais.Model.Entities.Categoria_Animal.pas',
  PesaMais.Model.Entities.Cidade in 'src\Model\Entities\PesaMais.Model.Entities.Cidade.pas',
  PesaMais.Model.Entities.Endereco in 'src\Model\Entities\PesaMais.Model.Entities.Endereco.pas',
  PesaMais.Model.Entities.Estado in 'src\Model\Entities\PesaMais.Model.Entities.Estado.pas',
  PesaMais.Model.Entities.Lote in 'src\Model\Entities\PesaMais.Model.Entities.Lote.pas',
  PesaMais.Model.Entities.Pasto in 'src\Model\Entities\PesaMais.Model.Entities.Pasto.pas',
  PesaMais.Model.Entities.Proprietario in 'src\Model\Entities\PesaMais.Model.Entities.Proprietario.pas',
  PesaMais.Model.Entities.Raca_Animal in 'src\Model\Entities\PesaMais.Model.Entities.Raca_Animal.pas',
  PesaMais.Model.Entities.Tipo_Lancamento in 'src\Model\Entities\PesaMais.Model.Entities.Tipo_Lancamento.pas',
  PesaMais.Model.Entities.Propriedade in 'src\Model\Entities\PesaMais.Model.Entities.Propriedade.pas',
  PesaMais.Model.Entities.Pessoa in 'src\Model\Entities\PesaMais.Model.Entities.Pessoa.pas',
  PesaMais.Controller.Factory.ControllerFactory in 'src\Controller\Factory\PesaMais.Controller.Factory.ControllerFactory.pas',
  PesaMais.Controller.CidadeController in 'src\Controller\PesaMais.Controller.CidadeController.pas',
  PesaMais.Controller.EnderecoController in 'src\Controller\PesaMais.Controller.EnderecoController.pas',
  PesaMais.Controller.PessoaController in 'src\Controller\PesaMais.Controller.PessoaController.pas',
  PesaMais.Controller.PropriedadeController in 'src\Controller\PesaMais.Controller.PropriedadeController.pas',
  PesaMais.Controller.ProprietarioController in 'src\Controller\PesaMais.Controller.ProprietarioController.pas',
  PesaMais.Controller.UsuarioController in 'src\Controller\PesaMais.Controller.UsuarioController.pas',
  PesaMais.Controller.Interfaces.InterfacesController in 'src\Controller\Interfaces\PesaMais.Controller.Interfaces.InterfacesController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TConnection, Connection);
  Application.CreateForm(TConnectionFactory, ConnectionFactory);
  Application.Run;
end.
