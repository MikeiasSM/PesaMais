unit PesaMais.Model.Entities.Pessoa;
interface

uses
  { System }
  DB,
  Classes,
  SysUtils,
  Generics.Collections;

type
  TPESSOA = class
  private
    { Private declarations }
    FID_PESSOA: Integer;
    FNOME: String;
    FAPELIDO: String;
    FTIPO_PESSOA: String;
    FFLAG_CLIENTE: Boolean;
    FFLAG_FORNECEDOR: Boolean;
    FFLAG_COLABORADOR: Boolean;
    FCPJ_CNPJ: String;
    FRG_INSCR: String;
    FFONE1: String;
    FFONE2: String;
    FCONTATO1: String;
    FCONTATO2: String;
    FEMAIL: String;
    FOBS: String;
    FATIVO: Boolean;

  public
    { Public declarations }
    property id_pessoa: Integer read FID_PESSOA write FID_PESSOA;
    property nome: String read FNOME write FNOME;
    property apelido: String read FAPELIDO write FAPELIDO;
    property tipo_pessoa: String read FTIPO_PESSOA write FTIPO_PESSOA;
    property flag_cliente: Boolean read FFLAG_CLIENTE write FFLAG_CLIENTE;
    property flag_fornecedor: Boolean read FFLAG_FORNECEDOR write FFLAG_FORNECEDOR;
    property flag_colaborador: Boolean read FFLAG_COLABORADOR write FFLAG_COLABORADOR;
    property cpj_cnpj: String read FCPJ_CNPJ write FCPJ_CNPJ;
    property rg_inscr: String read FRG_INSCR write FRG_INSCR;
    property fone1: String read FFONE1 write FFONE1;
    property fone2: String read FFONE2 write FFONE2;
    property contato1: String read FCONTATO1 write FCONTATO1;
    property contato2: String read FCONTATO2 write FCONTATO2;
    property email: String read FEMAIL write FEMAIL;
    property obs: String read FOBS write FOBS;
    property ativo: Boolean read FATIVO write FATIVO;
    procedure IsFisica(tipo : Boolean); overload;
    procedure IsFisica(tipo : String);  Overload;
    function ToString : String;

  end;

implementation

{ TPESSOA }

procedure TPESSOA.IsFisica(tipo: Boolean);
begin
  if tipo = true then
    FTIPO_PESSOA := 'F'
  else
    FTIPO_PESSOA := 'J';
end;

procedure TPESSOA.IsFisica(tipo: String);
begin
  if tipo = 'FISICA' then
    FTIPO_PESSOA := 'F'
  else
    FTIPO_PESSOA := 'J';
end;

function TPESSOA.ToString: String;
begin
  Result := IntToStr(FID_PESSOA) + ' - ' + FNOME;
end;

initialization

end.

