unit PesaMais.Model.Entities.Lote;

interface

uses
  PesaMais.Model.Entities.Propriedade;


type
  TLote = class

  private
    FId_Lote     : Integer;
    FDescricao   : String;
    FPropriedade : TPropriedade;




    procedure SetDescricao(const Value: String);
    procedure SetId_Lote(const Value: Integer);
    procedure SetPropriedade(const Value: TPropriedade);



public
  constructor    Create;
  destructor     Destroy; override;
  class function New : Tlote;

  property Id_lote     : Integer read FId_lote        write SetId_lote;
  property Descricao   : String  read FDescricao      write SetDescricao;
  property Propriedade : TPropriedade read FPropriedade write SetPropriedade;


end;

implementation

{ TLote }

constructor TLote.Create;
begin
   FPropriedade := TPropriedade.Create;
end;

destructor TLote.Destroy;
begin
  FPropriedade.Free;
  inherited;
end;

class function TLote.New: Tlote;
begin
   Result := self.Create;
end;

procedure TLote.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TLote.SetId_lote(const Value: Integer);
begin
  FId_lote := Value;
end;


procedure TLote.SetPropriedade(const Value: TPropriedade);
begin
  FPropriedade := Value;
end;

end.
