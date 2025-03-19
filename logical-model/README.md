### Logical Model

#### Empresa(<u>CNPJ</u>, Nome, end_CEP, end_num, end_rua)

#### Contatos(<u>CNPJ, Contato</u>)

- #### CNPJ -> Empresa(CNPJ)

#### Diretor(<u>CPF</u>, Nome, [CNPJ]!)

#### Funcionario(<u>CPF</u>, Nome, Salario, Chefe, CNPJ!)

- #### CNPJ -> Empresa(CNPJ)
- #### Chefe -> Funcionario(CPF)

#### Motorista(<u>CPF</u>, [CNH]!)

- #### CPF -> Funcionario(CPF)

#### Onibus(<u>CHASSI</u>, Empresa)

#### Viagem(<u>COD</u>, Linha, Origem, Destino)

#### Conduz(<u>CHASSI, CPF, COD, Data</u>)

- #### CHASSI -> Onibus(CHASSI)
- #### COD -> Viagem(COD)
- #### CPF -> Motorista(CPF)
- #### [Data, CPF]
- #### [Data, CHASSI]

#### Manutencao(<u>CHASSI, COD</u>)

- #### CHASSI -> Onibus(CHASSI)

#### Oficina(<u>ID</u>)

#### Inspecao(<u>NUM</u>, Tipo)

#### Acontece(<u>(CHASSI, COD), ID</u>, NUM)

- #### (CHASSI, COD) -> Manutencao((CHASSI, COD))
- #### ID -> Oficina(ID)
- #### NUM -> Inspecao(NUM)

#### Passageiro(<u>CPF</u>, Nome)

#### Desconto(<u>ID</u>, Taxa)

#### Passagem(<u>Num</u>, DataEmissao, Preco, PrecoFinal, COD!, CPF, ID)

- #### COD -> Viagem(COD)
- #### CPF -> Passageiro(CPF)
- #### ID -> Desconto(ID)
