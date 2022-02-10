unit PesaMais.Model.PropriedadeLocal;

interface

uses
  PesaMais.Model.Propriedade;
type
  TPropriedadeLocal = class


  private
    FId_propriedade_local : Integer;
    FNome  : String;
    FPropriedade : TPropriedade;
    FId_propriedade: TPropriedade;


    procedure SetId_propriedade_local(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetId_propriedade(const Propriedade: TPropriedade);


  public
    constructor Create;
    destructor Destroy; override;
    class function New : TPropriedadeLocal;

    property Id_propriedade_local : Integer read FId_propriedade_local write SetId_propriedade_local;
    property Nome : String read FNome write SetNome;
    property Id_propriedade : TPropriedade read Fpropriedade write SetId_propriedade;
end;

implementation

{ TPropriedadeLocal }

constructor TPropriedadeLocal.Create;
begin
  FPropriedade := TPropriedade.Create;
end;

destructor TPropriedadeLocal.Destroy;
begin
  FPropriedade.free;
  inherited;
end;

class function TPropriedadeLocal.New: TPropriedadeLocal;
begin
    Result := self.create;
end;

procedure TPropriedadeLocal.SetId_propriedade(const Propriedade: TPropriedade);
begin
  FPropriedade :=   Id_propriedade;
end;

procedure TPropriedadeLocal.SetId_propriedade_local(const Value: Integer);
begin
  FId_propriedade_local := Value;
end;

procedure TPropriedadeLocal.SetNome(const Value: String);
begin
  FNome := Value;
end;


end.
