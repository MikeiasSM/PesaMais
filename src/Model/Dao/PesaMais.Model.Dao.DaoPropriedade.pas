unit PesaMais.Model.Dao.DaoPropriedade;

interface

uses
  System.Generics.Collections,
  PesaMais.Model.Connection.DmConnection,
  PesaMais.Model.Entities.Propriedade,
  PesaMais.Model.Entities.Estado,
  PesaMais.Model.Entities.Endereco,
  PesaMais.Model.Entities.Cidade,
  PesaMais.Model.Entities.Bairro;

type
  TDaoPropriedade = class

  private
    // Atributo de conexão
    FConnection: TConnection;

  public
    constructor Create;
    destructor Destroy; override;

    // Metodos de acesso a dados
    function insert(pPropriedade: TPropriedade): Boolean;
    function delete(pPropriedade: TPropriedade): Boolean;
    function update(pPropriedade: TPropriedade): Boolean;
    function FindAll: TObjectList<TPropriedade>;

  end;

implementation

{ TDaoPropriedade }

constructor TDaoPropriedade.Create;
begin
  FConnection := TConnection.Create(nil);
end;

function TDaoPropriedade.delete(pPropriedade: TPropriedade): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('DELETE FROM PROPRIEDADE WHERE ID_PROPRIEDADE = ?');
    FConnection.SetValue(0, pPropriedade.Id_propriedade);
    FConnection.ExecSQL;
    FConnection.Commit;

    Result := True;

  except

    FConnection.Rollback;
    Result := False;

  end;
end;

destructor TDaoPropriedade.Destroy;
begin
  FConnection.DisposeOf;
  inherited;
end;

function TDaoPropriedade.FindAll: TObjectList<TPropriedade>;
var
  Propriedade: TPropriedade;
  List: TObjectList<TPropriedade>;
begin
  List := TObjectList<TPropriedade>.Create;

    Propriedade := TPropriedade.Create;

  try
    FConnection.StartTransation;

    while not FConnection.FDQuery.Eof do
    begin
    FConnection.ExecutarSQL('select * from propriedade');
    Propriedade.Id_propriedade   := FConnection.FDQuery.FieldByName('ID_PROPRIEDADE').AsInteger;
    Propriedade.Razao_Nome       := FConnection.FDQuery.FieldByName('RAZAO_NOME').AsString;
    Propriedade.Fantasia_Apelido := FConnection.FDQuery.FieldByName('FANTASIA_APELIDO').AsString;
    Propriedade.Cpf_cnpj         := FConnection.FDQuery.FieldByName('CPF_CNPJ').AsString;
    Propriedade.Insc_rg          := FConnection.FDQuery.FieldByName('INSC_RG').AsString;
    Propriedade.Fone1            := FConnection.FDQuery.FieldByName('FONE1').AsString;
    Propriedade.Fone2            := FConnection.FDQuery.FieldByName('FONE2').AsString;
    Propriedade.Email            := FConnection.FDQuery.FieldByName('EMAIL').AsString;
    Propriedade.Contato          := FConnection.FDQuery.FieldByName('CONTATO').AsString;

    List.Add(Propriedade);
    FConnection.FDQuery.Next
    end;
    Result := List;
  except
    FConnection.Rollback
  end;

  List.Destroy;
end;

function TDaoPropriedade.insert(pPropriedade: TPropriedade): Boolean;
Var
  SQL: String;
  I: Integer;
  Propriedade: TPropriedade;
 // List: TObjectList<Integer>;
begin
  //List := TObjectList<Integer>.Create;

    Propriedade := TPropriedade.Create;

  try
    FConnection.StartTransation;
    SQL := 'INSERT INTO PROPRIEDADE (RAZAO_NOME, FANTASIA_APELIDO, CPF_CNPJ, INSC_RG, FONE1, FONE2, EMAIL, CONTATO) VALUE (?,?,?,?,?,?,?,?)';
    FConnection.PrepareStatement(SQL);

    FConnection.SetValue(0, pPropriedade.Razao_Nome);
    FConnection.SetValue(1, pPropriedade.Fantasia_Apelido);
    FConnection.SetValue(2, pPropriedade.Cpf_cnpj);
    FConnection.SetValue(3, pPropriedade.Insc_rg);
    FConnection.SetValue(4, pPropriedade.Fone1);
    FConnection.SetValue(5, pPropriedade.Fone2);
    FConnection.SetValue(6, pPropriedade.Email);
    FConnection.SetValue(7, pPropriedade.Contato);
    FConnection.ExecSQL;


    SQL := '';
    for I := 0 to Pred(Propriedade.Enderecos.Count) do
    begin
      SQL := 'INSERT INTO ENDERECO (IDENTIFICACAO, ID_CIDADE, ID_BAIRRO, ID_ESTADO, ID_PESSOA, ID_PROPRIEDADE) VALUE (?,?,?,?,?,?)';
      FConnection.PrepareStatement(SQL);
      FConnection.SetValue(0, pPropriedade.Enderecos[I].Identificacao);
      FConnection.SetValue(1, pPropriedade.Enderecos[I].Cidade.Id_Cidade);
      FConnection.SetValue(2, pPropriedade.Enderecos[I].Bairro.Id_Bairro);
      FConnection.SetValue(3, pPropriedade.Enderecos[I].Estado.Id_estado);
      FConnection.SetValue(4, pPropriedade.Enderecos[I].Pessoa);
      FConnection.SetValue(5, pPropriedade.Id_propriedade);

      FConnection.ExecSQL;
    end;

    FConnection.Commit;
  except
    FConnection.Rollback;
  end;

end;

function TDaoPropriedade.update(pPropriedade: TPropriedade): Boolean;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('UPDATE PRORPIEDADE SET RAZAO_NOME = ?, FANTASIA_APELIDO, CPF_CNPJ = ?, INSC_RG = ?, FONE1 = ?, FONE2 = ?,EMAIL = ?, CONTATO = ? WHERE ID_PROPRIEDADE = ?');
    FConnection.SetValue(0, pPropriedade.Razao_nome);
    FConnection.SetValue(1, pPropriedade.Razao_Nome)
    FConnection.SetValue(2, pPropriedade.Cpf_cnpj);
    FConnection.SetValue(3, pPropriedade.Insc_rg);
    FConnection.SetValue(4, pPropriedade.Fone1);
    FConnection.SetValue(5, pPropriedade.Fone2);
    FConnection.SetValue(6, pPropriedade.Email);
    FConnection.SetValue(7, pPropriedade.Contato);
    FConnection.ExecSQL;
    FConnection.Commit;
    Result := True;
  except
    FConnection.Rollback;
    Result := False;
  end;
end;

end.
