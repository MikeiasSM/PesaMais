unit PesaMais.Model.Entities.Cidade;

interface

uses
  { System }
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections;

type
  TCIDADE = class

  private
    { Private declarations }
    FID_CIDADE: Integer;
    FNOME: String;
    FCEP: String;
    FCODMUN_IBGE: String;
    FID_ESTADO: Integer;

  public
    { Public declarations }
    property id_cidade: Integer read FID_CIDADE write FID_CIDADE;
    property nome: String read FNOME write FNOME;
    property cep: String read FCEP write FCEP;
    property codmun_ibge: String read FCODMUN_IBGE write FCODMUN_IBGE;
    property id_estado: Integer read FID_ESTADO write FID_ESTADO;

  end;

implementation

initialization

end.
