CREATE TABLE ESPORTES (
    esp_codigo INTEGER,
    esp_nome VARCHAR(40) NOT NULL,

    PRIMARY KEY (esp_codigo)
);


CREATE TABLE EQUIPE (
    equ_codigo INTEGER,
    equ_nome VARCHAR(30) NOT NULL,
    equ_qtd INTEGER,
    equ_status VARCHAR(10) NOT NULL,
    equ_regiao VARCHAR(40) NOT NULL,
    equ_tecnico VARCHAR(60) NOT NULL,
    esp_codigo INTEGER,

    PRIMARY KEY (equ_codigo),
    FOREIGN KEY (esp_codigo) REFERENCES ESPORTES(esp_codigo)
);


CREATE TABLE ATLETAS (
    atl_CPF CHAR(11) NOT NULL,
    atl_nome VARCHAR(60) NOT NULL,
    atl_contato CHAR(11) NOT NULL,
    atl_email VARCHAR(60) NOT NULL,
    atl_dt_nasc DATE NOT NULL,
    atl_sexo VARCHAR(9) NOT NULL,
    atl_limit_fisica VARCHAR(120) NOT NULL,
    equ_codigo INTEGER NOT NULL,
    esp_codigo INTEGER NOT NULL,

    PRIMARY KEY (atl_CPF),
    FOREIGN KEY (equ_codigo) REFERENCES EQUIPE(equ_codigo),
    FOREIGN KEY (esp_codigo) REFERENCES ESPORTES(esp_codigo)
);
