unit PesaMais.Model.Entities.PropriedadeLocal;

interface

uses
  PesaMais.Model.Entities.Propriedade;
type
  TPropriedadeLocal = class


  private
    FId_Propriedade_Local : Integer;
    FNome                 : String;
    FPropriedade          : TPropriedade;


    procedure SetId_Propriedade_Local(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetPropriedade(const Value: TPropriedade);


  public
    constructor Create;
    destructor Destroy; override;
    class function New : TPropriedadeLocal;

    property Id_propriedade_local : Integer read FId_propriedade_local write SetId_Propriedade_Local;
    property Nome : String read FNome write SetNome;
    property Propriedade : TPropriedade read FPropriedade write SetPropriedade;
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
procedure TPropriedadeLocal.SetId_Propriedade_Local(const Value: Integer);
begin
  FId_Propriedade_Local := Value;
end;

procedure TPropriedadeLocal.SetNome(const Value: String);
begin
  FNome := Value;
end;


procedure TPropriedadeLocal.SetPropriedade(const Value: TPropriedade);
begin
  FPropriedade := Value;
end;

end.
