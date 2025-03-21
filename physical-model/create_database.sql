CREATE TABLE EMPRESA (
    CNPJ VARCHAR(14) PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL UNIQUE,
    END_CEP VARCHAR(8),
    END_NUM VARCHAR(10),
    END_RUA VARCHAR(100)
);

CREATE TABLE CONTATOS (
    CNPJ VARCHAR(14),
    CONTATO VARCHAR(50),
    CONSTRAINT PK_CONTATOS PRIMARY KEY (CNPJ, CONTATO),
    CONSTRAINT FK_CONTATOS_EMPRESA FOREIGN KEY (CNPJ) REFERENCES EMPRESA(CNPJ) ON DELETE CASCADE 
);

CREATE TABLE DIRETOR (
    CPF VARCHAR(11) PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(14) NOT NULL UNIQUE,
    CONSTRAINT FK_DIRETOR_EMPRESA FOREIGN KEY (CNPJ) REFERENCES EMPRESA(CNPJ)
);

CREATE TABLE FUNCIONARIO (
    CPF VARCHAR(11) PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    SALARIO DECIMAL(10,2) NOT NULL,
    CPF_CHEFE VARCHAR(11),
    CNPJ VARCHAR(14) NOT NULL,
    CONSTRAINT FK_FUNCIONARIO_EMPRESA FOREIGN KEY (CNPJ) REFERENCES EMPRESA(CNPJ),
    CONSTRAINT FK_FUNCIONARIO_CHEFE FOREIGN KEY (CPF_CHEFE) REFERENCES FUNCIONARIO(CPF)
);

CREATE TABLE MOTORISTA (
    CPF VARCHAR(11) PRIMARY KEY,
    CNH VARCHAR(20) NOT NULL,
    CONSTRAINT FK_MOTORISTA_FUNCIONARIO FOREIGN KEY (CPF) REFERENCES FUNCIONARIO(CPF) ON DELETE CASCADE
);

CREATE TABLE ONIBUS (
    CHASSI VARCHAR(20),
    EMPRESA VARCHAR(14) NOT NULL,
    CONSTRAINT PK_ONIBUS PRIMARY KEY(CHASSI)
);

CREATE TABLE VIAGEM (
    COD VARCHAR(4) PRIMARY KEY,
    LINHA VARCHAR(50) NOT NULL,
    ORIGEM VARCHAR(100) NOT NULL,
    DESTINO VARCHAR(100) NOT NULL 
);

CREATE TABLE CONDUZ (
    CHASSI VARCHAR(20),
    CPF VARCHAR(11),
    COD VARCHAR(4),
    DATA_CONDUZ DATE,
    CONSTRAINT PK_CONDUZ PRIMARY KEY (CHASSI, CPF, COD, DATA_CONDUZ),
    CONSTRAINT FK_CONDUZ_ONIBUS FOREIGN KEY (CHASSI) REFERENCES ONIBUS(CHASSI),
    CONSTRAINT FK_CONDUZ_MOTORISTA FOREIGN KEY (CPF) REFERENCES MOTORISTA(CPF),
    CONSTRAINT FK_CONDUZ_VIAGEM FOREIGN KEY (COD) REFERENCES VIAGEM(COD)
);

CREATE TABLE MANUTENCAO (
    CHASSI VARCHAR(20),
    COD VARCHAR(4),
    CONSTRAINT PK_MANUTENCAO PRIMARY KEY (CHASSI, COD),
    CONSTRAINT FK_ONIBUS_MANUTENCAO FOREIGN KEY (CHASSI) REFERENCES ONIBUS(CHASSI)
);

CREATE TABLE OFICINA (
    ID VARCHAR(3) PRIMARY KEY
);

CREATE TABLE INSPECAO (
    NUM NUMBER(1) PRIMARY KEY,
    TIPO VARCHAR(50) DEFAULT 'PREVENTIVA'
);

CREATE TABLE ACONTECE (
    CHASSI VARCHAR(20),
    COD VARCHAR(4),
    ID VARCHAR(3),
    NUM NUMBER(1),
    CONSTRAINT PK_ACONTECE PRIMARY KEY (CHASSI, COD, ID),
    CONSTRAINT FK_ACONTECE_MANUTENCAO FOREIGN KEY (CHASSI, COD) REFERENCES MANUTENCAO(CHASSI, COD),
    CONSTRAINT FK_ACONTECE_OFICINA FOREIGN KEY (ID) REFERENCES OFICINA(ID),
    CONSTRAINT FK_ACONTECE_NUMERO FOREIGN KEY (NUM) REFERENCES INSPECAO(NUM)
);

CREATE TABLE PASSAGEIRO (
    CPF VARCHAR(11) PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL
);

CREATE TABLE DESCONTO (
    ID VARCHAR(4) PRIMARY KEY,
    TAXA DECIMAL(5,2)
);

CREATE TABLE PASSAGEM (
    NUM NUMBER(3) PRIMARY KEY,
    DATA_EMISSAO DATE,
    PRECO DECIMAL(10,2),
    PRECO_FINAL DECIMAL(10,2),
    COD VARCHAR(4) NOT NULL,
    CPF VARCHAR(11),
    ID VARCHAR(4),
    CONSTRAINT FK_PASSAGEN_VIAGEM FOREIGN KEY (COD) REFERENCES VIAGEM(COD),
    CONSTRAINT FK_PASSAGEM_CPF FOREIGN KEY (CPF) REFERENCES PASSAGEIRO(CPF),
    CONSTRAINT FK_PASSAGEM_DESCONTO FOREIGN KEY (ID) REFERENCES DESCONTO(ID)
);
