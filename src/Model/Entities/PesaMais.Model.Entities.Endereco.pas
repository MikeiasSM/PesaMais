unit PesaMais.Model.Entities.Endereco;

interface

uses
  { System }
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections,

  { PesaMais }
  PesaMais.Model.Entities.Cidade,
  PesaMais.Model.Entities.Estado,
  PesaMais.Model.Entities.Proprietario,
  PesaMais.Model.Entities.Pessoa;

type
  TENDERECO = class
  private
    { Private declarations }
    FID_ENDERECO: Integer;
    FDESCRICAO: String;
    FLOGRADOURO: String;
    FNUMERO: String;
    FCOMPLEMENTO: String;
    FID_CIDADE: Integer;
    FOBS: String;
    FATIVO: Boolean;
    FID_PESSOA: Integer;
    FBAIRRO: String;

  public
    { Public declarations }
    property id_endereco: Integer read FID_ENDERECO write FID_ENDERECO;
    property descricao: String read FDESCRICAO write FDESCRICAO;
    property logradouro: String read FLOGRADOURO write FLOGRADOURO;
    property numero: String read FNUMERO write FNUMERO;
    property complemento: String read FCOMPLEMENTO write FCOMPLEMENTO;
    property id_cidade: Integer read FID_CIDADE write FID_CIDADE;
    property obs: String read FOBS write FOBS;
    property ativo: Boolean read FATIVO write FATIVO;
    property id_pessoa: Integer read FID_PESSOA write FID_PESSOA;
    property bairro: String read FBAIRRO write FBAIRRO;

  end;

implementation

initialization

end.

