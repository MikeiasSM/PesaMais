unit PesaMais.Model.Entities.Propriedade;
interface

uses
  { System }
  DB,
  Classes,
  SysUtils,
  Generics.Collections,

  { Pesa Mais }
  PesaMais.Model.Entities.Cidade,
  PesaMais.Model.Entities.Estado,
  PesaMais.Model.Entities.Proprietario;

type
  TPROPRIEDADE = class
  private
    { Private declarations }
    FID_PROPRIEDADE: Integer;
    FDESCRICAO: String;
    FLOGRADOURO: String;
    FNUMERO: String;
    FCOMPLEMENTO: String;
    FID_CIDADE: Integer;
    FID_ESTADO: Integer;
    FOBS: String;
    FATIVO: Boolean;
    FBAIRRO: String;
    FID_PROPRIETARIO: Integer;
  public
    { Public declarations }

    property id_propriedade: Integer read FID_PROPRIEDADE write FID_PROPRIEDADE;
    property descricao: String read FDESCRICAO write FDESCRICAO;
    property logradouro: String read FLOGRADOURO write FLOGRADOURO;
    property numero: String read FNUMERO write FNUMERO;
    property complemento: String read FCOMPLEMENTO write FCOMPLEMENTO;
    property id_cidade: Integer read FID_CIDADE write FID_CIDADE;
    property id_estado: Integer read FID_ESTADO write FID_ESTADO;
    property obs: String read FOBS write FOBS;
    property ativo: Boolean read FATIVO write FATIVO;
    property bairro: String read FBAIRRO write FBAIRRO;
    property id_proprietario: Integer read FID_PROPRIETARIO write FID_PROPRIETARIO;


  end;

implementation


initialization

end.
