unit PesaMais.Model.Entities.Usuario;

interface

uses
  { System }
  DB,
  Classes,
  SysUtils,
  Generics.Collections,
  System.Generics.Collections;

type

  TUSUARIO = class
  private
    { Private declarations }
    FID_USUARIO: Integer;
    FUSUARIO: String;
    FSENHA: String;
    FATIVO: Boolean;
  public
    { Public declarations }
    property ID_USUARIO: Integer read FID_USUARIO write FID_USUARIO;
    property USUARIO: String read FUSUARIO write FUSUARIO;
    property SENHA: String read FSENHA write FSENHA;
    property ATIVO: Boolean read FATIVO write FATIVO;

  end;

implementation

{ TUSUARIO }

initialization

end.
