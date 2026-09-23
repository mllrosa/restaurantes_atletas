-- =========================================================
-- MODELO FÍSICO - BANCO DE DADOS RESTAURANTES
-- Baseado no modelo conceitual/lógico (Marcella Rosa, Nicole Matos)
-- =========================================================

CREATE DATABASE IF NOT EXISTS restaurantes_db;
USE restaurantes_db;

-- ---------------------------------------------------------
-- Tabelas sem dependências (sem FK)
-- ---------------------------------------------------------

CREATE TABLE TIPO_RES (
    TIP_RES_COD   INT AUTO_INCREMENT,
    TIP_RES_CLASS VARCHAR(50) NOT NULL,
    PRIMARY KEY (TIP_RES_COD)
);

CREATE TABLE TIPO_PRATO (
    TIP_PRA_COD  INT AUTO_INCREMENT,
    TIP_PRA_NOME VARCHAR(50) NOT NULL,
    PRIMARY KEY (TIP_PRA_COD)
);

CREATE TABLE FORMA_PAG (
    FOR_PAG_COD  INT AUTO_INCREMENT,
    FOR_PAG_NOME VARCHAR(50) NOT NULL,
    PRIMARY KEY (FOR_PAG_COD)
);

CREATE TABLE RETIRADA (
    RET_COD  INT AUTO_INCREMENT,
    RET_NOME VARCHAR(50) NOT NULL,
    PRIMARY KEY (RET_COD)
);

-- ---------------------------------------------------------
-- RESTAURANTES (depende de TIPO_RES)
-- ---------------------------------------------------------

CREATE TABLE RESTAURANTES (
    RES_CNPJ        CHAR(14),
    RES_NOME        VARCHAR(60) NOT NULL,
    RES_EMAIL       VARCHAR(60) NOT NULL,
    RES_CONTATO     CHAR(11),
    RES_LOGRADOURO  VARCHAR(150),
    RES_BAIRRO      VARCHAR(100),
    RES_CIDADE      VARCHAR(100),
    RES_UF          CHAR(2),
    RES_CEP         CHAR(8),
    RES_SENHA       VARCHAR(100) NOT NULL,
    TIP_RES_COD     INT NOT NULL,
    PRIMARY KEY (RES_CNPJ),
    CONSTRAINT FK_RES_TIPRES FOREIGN KEY (TIP_RES_COD)
        REFERENCES TIPO_RES (TIP_RES_COD)
);

-- ---------------------------------------------------------
-- CLIENTES
-- ---------------------------------------------------------

CREATE TABLE CLIENTES (
    CLI_CPF        CHAR(11),
    CLI_NOME       VARCHAR(100) NOT NULL,
    CLI_EMAIL      VARCHAR(100) NOT NULL,
    CLI_DATA_NAS   DATE NOT NULL,
    CLI_LOGRADOURO VARCHAR(150),
    CLI_BAIRRO     VARCHAR(100),
    CLI_CIDADE     VARCHAR(100),
    CLI_UF         CHAR(2),
    CLI_CEP        CHAR(8),
    CLI_SENHA      VARCHAR(100) NOT NULL,
    PRIMARY KEY (CLI_CPF)
);

-- ---------------------------------------------------------
-- PRATOS (depende de TIPO_PRATO)
-- ---------------------------------------------------------

CREATE TABLE PRATOS (
    PRA_COD     INT AUTO_INCREMENT,
    PRA_NOME    VARCHAR(100) NOT NULL,
    PRA_PRECO   DECIMAL(10,2) NOT NULL,
    TIP_PRA_COD INT NOT NULL,
    PRIMARY KEY (PRA_COD),
    CONSTRAINT FK_PRA_TIPPRA FOREIGN KEY (TIP_PRA_COD)
        REFERENCES TIPO_PRATO (TIP_PRA_COD)
);

-- ---------------------------------------------------------
-- RESTAURANTE_TIPO_PRATO (associativa N:N entre RESTAURANTES e TIPO_PRATO)
-- ---------------------------------------------------------

CREATE TABLE RESTAURANTE_TIPO_PRATO (
    RES_CNPJ    CHAR(14),
    TIP_PRA_COD INT,
    PRIMARY KEY (RES_CNPJ, TIP_PRA_COD),
    CONSTRAINT FK_RTP_RES FOREIGN KEY (RES_CNPJ)
        REFERENCES RESTAURANTES (RES_CNPJ),
    CONSTRAINT FK_RTP_TIPPRA FOREIGN KEY (TIP_PRA_COD)
        REFERENCES TIPO_PRATO (TIP_PRA_COD)
);

-- ---------------------------------------------------------
-- PEDIDOS (depende de CLIENTES, FORMA_PAG, RETIRADA, RESTAURANTES)
-- ---------------------------------------------------------

CREATE TABLE PEDIDOS (
    PED_COD     INT AUTO_INCREMENT,
    PED_STATUS  VARCHAR(50) NOT NULL,
    PED_DATA    DATE NOT NULL,
    PED_PRECO   DECIMAL(10,2) NOT NULL,
    CLI_CPF     CHAR(11) NOT NULL,
    FOR_PAG_COD INT NOT NULL,
    RET_COD     INT NOT NULL,
    RES_CNPJ    CHAR(14) NOT NULL,
    PRIMARY KEY (PED_COD),
    CONSTRAINT FK_PED_CLI FOREIGN KEY (CLI_CPF)
        REFERENCES CLIENTES (CLI_CPF),
    CONSTRAINT FK_PED_FORPAG FOREIGN KEY (FOR_PAG_COD)
        REFERENCES FORMA_PAG (FOR_PAG_COD),
    CONSTRAINT FK_PED_RET FOREIGN KEY (RET_COD)
        REFERENCES RETIRADA (RET_COD),
    CONSTRAINT FK_PED_RES FOREIGN KEY (RES_CNPJ)
        REFERENCES RESTAURANTES (RES_CNPJ)
);

-- ---------------------------------------------------------
-- ITEM_PEDIDO (associativa N:N entre PEDIDOS e PRATOS)
-- ---------------------------------------------------------

CREATE TABLE ITEM_PEDIDO (
    PED_COD       INT,
    PRA_COD       INT,
    ITE_QUANTIDADE INT NOT NULL,
    PRIMARY KEY (PED_COD, PRA_COD),
    CONSTRAINT FK_ITEM_PED FOREIGN KEY (PED_COD)
        REFERENCES PEDIDOS (PED_COD),
    CONSTRAINT FK_ITEM_PRA FOREIGN KEY (PRA_COD)
        REFERENCES PRATOS (PRA_COD)
);
