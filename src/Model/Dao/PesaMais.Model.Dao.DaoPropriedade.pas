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
    SQL := 'INSERT INTO PROPRIEDADE (RAZAO_NOME, FANTASIA_APELIDO, CPF_CNPJ, INSC_RG, FONE1, FONE2, EMAIL, CONTATO) VALUE (:RAZAO_NOME, :FANTASIA_APELIDO, :CPF_CNPJ, :INSC_RG,: FONE1, :FONE2, :EMAIL, :CONTATO)';
    FConnection.PrepareStatement(SQL);
    FConnection.FDQuery.Params.ParamByName(':RAZAO_NOME').AsString := pPropriedade.Razao_Nome;
    FConnection.FDQuery.Params.ParamByName(':FANTASIA_APELIDO').AsString := pPropriedade.Fantasia_Apelido;
    FConnection.FDQuery.Params.ParamByName(':CPF_CNPJ').AsString := pPropriedade.Cpf_cnpj;
    FConnection.FDQuery.Params.ParamByName(':INSC_RG').AsString := pPropriedade.Insc_rg;
    FConnection.FDQuery.Params.ParamByName(':FONE1').AsString := pPropriedade.Fone1;
    FConnection.FDQuery.Params.ParamByName(':FONE2').AsString := pPropriedade.Fone2;
    FConnection.FDQuery.Params.ParamByName(':EMAIL').AsString := pPropriedade.Email;
    FConnection.FDQuery.Params.ParamByName(':CONTATO').AsString := pPropriedade.Contato;
    FConnection.ExecSQL;


    SQL := '';
    for I := 0 to Pred(Propriedade.Enderecos.Count) do
    begin
      SQL := 'INSERT INTO ENDERECO (IDENTIFICACAO, ID_CIDADE, LOGRADOURO, NUMERO, CEP, COMPLEMENTO, ID_BAIRRO) VALUE (:IDENTIFICACAO, :ID_CIDADE, :LOGRADOURO, :NUMERO, :CEP, :COMPLEMENTO,  :ID_BAIRRO)';
      FConnection.PrepareStatement(SQL);

      FConnection.FDQuery.Params.ParamByName(':IDENTIFICACAO').AsString := pPropriedade.Enderecos[I].Identificacao;
      FConnection.FDQuery.Params.ParamByName(':ID_CIDADE').AsInteger    := pPropriedade.Enderecos[I].Cidade.Id_Cidade;
      FConnection.FDQuery.Params.ParamByName(':LOGRADOURO').AsString    := pPropriedade.Enderecos[I].Logradouro;
      FConnection.FDQuery.Params.ParamByName(':NUMERO').AsString        := pPropriedade.Enderecos[I].Numero;
      FConnection.FDQuery.Params.ParamByName(':CEP').AsString           := pPropriedade.Enderecos[I].Cep;
      FConnection.FDQuery.Params.ParamByName(':COMPLEMENTO').AsString   := pPropriedade.Enderecos[I].Complemento;
      FConnection.FDQuery.Params.ParamByName(':ID_BAIRRO').AsInteger    := pPropriedade.Enderecos[I].Bairro.Id_Bairro;
      FConnection.ExecSQL;
    end;

    FConnection.Commit;
  except
    FConnection.Rollback;
  end;

end;

function TDaoPropriedade.update(pPropriedade: TPropriedade): Boolean;
var
  SQL: String;
  I: Integer;
  Propriedade: TPropriedade;
begin
  FConnection.StartTransation;
  try
    FConnection.PrepareStatement('UPDATE PRORPIEDADE SET RAZAO_NOME = ?, FANTASIA_APELIDO, CPF_CNPJ = ?, INSC_RG = ?, FONE1 = ?, FONE2 = ?,EMAIL = ?, CONTATO = ? WHERE ID_PROPRIEDADE = ?');
    FConnection.FDQuery.Params.ParamByName(':RAZAO_NOME').AsString := pPropriedade.Razao_Nome;
    FConnection.FDQuery.Params.ParamByName(':FANTASIA_APELIDO').AsString := pPropriedade.Fantasia_Apelido;
    FConnection.FDQuery.Params.ParamByName(':CPF_CNPJ').AsString := pPropriedade.Cpf_cnpj;
    FConnection.FDQuery.Params.ParamByName(':INSC_RG').AsString := pPropriedade.Insc_rg;
    FConnection.FDQuery.Params.ParamByName(':FONE1').AsString := pPropriedade.Fone1;
    FConnection.FDQuery.Params.ParamByName(':FONE2').AsString := pPropriedade.Fone2;
    FConnection.FDQuery.Params.ParamByName(':EMAIL').AsString := pPropriedade.Email;
    FConnection.FDQuery.Params.ParamByName(':CONTATO').AsString := pPropriedade.Contato;
    FConnection.FDQuery.Params.ParamByName(':ID_PROPRIEDADE').AsInteger := pPropriedade.Id_propriedade;
    FConnection.ExecSQL;

    SQL := '';
    for I := 0 to Pred(Propriedade.Enderecos.Count) do
    begin
      SQL := 'UPDATE ENDERECO SET IDENTIFICACAO = :IDENTIFICACAO, ID_CIDADE = :ID_CIDADE, LOGRADOURO = :LOGRADOURO, NUMERO = :NUMERO, CEP = :CEP, COMPLEMENTO = :COMLEMENTO, ID_BAIRRO = :ID_BAIRRO) WHERE ID_ENDERECO = :ID_ENDERECO)';
      FConnection.PrepareStatement(SQL);
      FConnection.FDQuery.Params.ParamByName(':IDENTIFICACAO').AsString := pPropriedade.Enderecos[I].Identificacao;
      FConnection.FDQuery.Params.ParamByName(':ID_CIDADE').AsInteger    := pPropriedade.Enderecos[I].Cidade.Id_Cidade;
      FConnection.FDQuery.Params.ParamByName(':LOGRADOURO').AsString    := pPropriedade.Enderecos[I].Logradouro;
      FConnection.FDQuery.Params.ParamByName(':NUMERO').AsString        := pPropriedade.Enderecos[I].Numero;
      FConnection.FDQuery.Params.ParamByName(':CEP').AsString           := pPropriedade.Enderecos[I].Cep;
      FConnection.FDQuery.Params.ParamByName(':COMPLEMENTO').AsString   := pPropriedade.Enderecos[I].Complemento;
      FConnection.FDQuery.Params.ParamByName(':ID_BAIRRO').AsInteger    := pPropriedade.Enderecos[I].Bairro.Id_Bairro;
      FConnection.ExecSQL;
    end;

    FConnection.Commit;
    Result := True;
  except
    FConnection.Rollback;
    Result := False;
  end;
end;

end.
