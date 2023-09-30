unit PesaMais.Model.Entities.Proprietario;

interface

uses
  { System }
  DB,
  Classes,
  SysUtils,
  Generics.Collections;

type
  TPROPRIETARIO = class
  private
    { Private declarations }
    FID_PROPRIETARIO: Integer;
    FNOME: String;
    FAPELIDO: String;
    FCPJ_CNPJ: String;
    FRG_INSCR: String;
    FFONE1: String;
    FFONE2: String;
    FCONTATO1: String;
    FCONTATO2: String;
    FEMAIL: String;
    FOBS: String;
    FATIVO: Boolean;
    FTIPO_PROPRIETARIO: String;
  public
    { Public declarations }
    property id_proprietario: Integer read FID_PROPRIETARIO write FID_PROPRIETARIO;
    property nome: String read FNOME write FNOME;
    property apelido: String read FAPELIDO write FAPELIDO;
    property cpj_cnpj: String read FCPJ_CNPJ write FCPJ_CNPJ;
    property rg_inscr: String read FRG_INSCR write FRG_INSCR;
    property fone1: String read FFONE1 write FFONE1;
    property fone2: String read FFONE2 write FFONE2;
    property contato1: String read FCONTATO1 write FCONTATO1;
    property contato2: String read FCONTATO2 write FCONTATO2;
    property email: String read FEMAIL write FEMAIL;
    property obs: String read FOBS write FOBS;
    property ativo: Boolean read FATIVO write FATIVO;
    property tipo_proprietario: String read FTIPO_PROPRIETARIO write FTIPO_PROPRIETARIO;
  end;

implementation

initialization

end.

