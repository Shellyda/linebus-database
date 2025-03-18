## Logical Model

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

#### Viagem(<u>Cod</u>, Linha, Origem, Destino)

#### Conduz(<u>CHASSI, CPF, Cod, Data</u>)

- #### CHASSI -> Onibus(CHASSI)
- #### Cod -> Viagem(Cod)
- #### CPF -> Motorista(CPF)
- #### AK1 [Data, CPF]
- #### AK2 [Data, CHASSI]

#### Manutencao(<u>CHASSI, Cod</u>)

- #### CHASSI -> Onibus(CHASSI)

#### Oficina(<u>ID</u>)

#### Acontece(<u>(CHASSI, Cod), ID</u>)

- #### (CHASSI, Cod) -> Manutencao((CHASSI, Cod))
- #### ID -> Oficina(ID)

#### Passagem(<u>Num</u>, DataEmissao, Preco, PrecoFinal, Cod!)

- #### Cod -> Viagem(Cod)

#### Passageiro(<u>CPF</u>, Nome)

#### Desconto(<u>ID</u>, taxa)

#### Compra(<u>Num</u>, CPF!, ID)

- #### Num -> Passagem(Num)
- #### CPF -> Passageiro(CPF)
- #### ID -> Desconto(ID)
