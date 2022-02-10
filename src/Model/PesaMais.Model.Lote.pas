unit PesaMais.Model.Lote;

interface

uses
  PesaMais.Model.Propriedade;


type
  TLote = class

  private
    FId_lote     : Integer;
    FDescricao   : String;
    FPropriedade : TPropriedade;




    procedure SetDescricao(const Value: String);
    procedure SetId_lote(const Value: Integer);
    procedure SetId_propriedade(const Propriedade: TPropriedade);



public
  constructor    Create;
  destructor     Destroy; override;
  class function New : Tlote;

  property Id_lote     : Integer read FId_lote        write SetId_lote;
  property Descricao   : String  read FDescricao      write SetDescricao;
  property propriedade : TPropriedade read FPropriedade write SetId_propriedade;


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


procedure TLote.SetId_propriedade(const Propriedade: TPropriedade);
begin
  FPropriedade := Propriedade;
end;

end.
