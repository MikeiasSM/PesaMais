unit PesaMais.Model.Entities.Animal;

interface

uses
  PesaMais.Model.Entities.Usuario,
  PesaMais.Model.Entities.RacaAnimal,
  PesaMais.Model.Entities.Lote,
  PesaMais.Model.Entities.Categoria;
type
  TAnimal = class

  private
    FId_animal      : Integer;
    FIdentificacao  : String;
    FSexo           : String;
    FCategoria      : TCategoriaAnimal;
    FRacaanimal     : TRacaAnimal;
    FLote           : Tlote;
    FUsuario        : TUsuario;

    procedure SetId_animal(const Value: Integer);
    procedure SetId_categoria(const Categoria: TCategoriaAnimal);
    procedure SetId_lote(const Lote: Tlote);
    procedure SetId_raca_animal(const Racaanimal: TRacaAnimal);
    procedure SetId_usuario(const Usuario: TUsuario);
    procedure SetIdentificacao(const Value: String);
    procedure SetSexo(const Value: String);

  public
    constructor   Create;
    destructor    Destroy; override;
    class function New : TAnimal;

    property Id_animal      : Integer read FId_animal write SetId_animal;
    property Identificacao  : String read FIdentificacao write SetIdentificacao;
    property Sexo           : String read FSexo write SetSexo;
    property Id_categoria   : TCategoriaAnimal read FCategoria write SetId_categoria;
    property Id_raca_animal : TRacaAnimal read FRacaanimal write SetId_raca_animal;
    property Id_lote        : Tlote read FLote write SetId_lote;
    property Id_usuario     : TUsuario read FUsuario write SetId_usuario;

end;



implementation

{ TAminal }

constructor TAnimal.Create;
begin
  FCategoria   := TCategoriaAnimal.Create;
  FRacaanimal  := TRacaAnimal.Create;
  FLote        := TLote.Create;
  FUsuario     := TUsuario.Create;
end;

destructor TAnimal.Destroy;
begin
  FCategoria.Free;
  FRacaanimal.Free;
  FLote.Free;
  FUsuario.Free;
  inherited;
end;

class function TAnimal.New: TAnimal;
begin
   Result := Self.Create;
end;

procedure TAnimal.SetIdentificacao(const Value: String);
begin
  FIdentificacao := Value;
end;

procedure TAnimal.SetId_animal(const Value: Integer);
begin
  FId_animal := Value;
end;

procedure TAnimal.SetId_categoria(const Categoria: TCategoriaAnimal);
begin
  FCategoria := Id_categoria;
end;

procedure TAnimal.SetId_lote(const Lote: Tlote);
begin
  Flote := Id_lote;
end;

procedure TAnimal.SetId_raca_animal(const Racaanimal: TRacaAnimal);
begin
  FRacaanimal := Id_raca_animal;
end;

procedure TAnimal.SetId_usuario(const Usuario: TUsuario);
begin
  FUsuario := Id_usuario;
end;

procedure TAnimal.SetSexo(const Value: String);
begin
  FSexo := Value;
end;

end.
