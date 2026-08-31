CREATE TABLE zonas (
    id_zona SERIAL PRIMARY KEY,
    nome_zona VARCHAR,
    domicilios_total INT,
    familias_total INT,
    populacao_total INT,
    empregos_fora_da_residencia INT,
    empregos_na_residencia INT,
    empregos_sem_endereco_fixo INT,
    tempo_medio_coletivo INT,
    tempo_medio_individual INT
);

CREATE TABLE renda (
    id_renda SERIAL PRIMARY KEY,
    id_zona INT NOT NULL,
    ano INT,
    renda_per_capita INT,
    renda_mediana_familiar INT,
    renda_media_familiar INT,

    CONSTRAINT fk_renda_zona
        FOREIGN KEY (id_zona)
        REFERENCES zonas (id_zona)
);


CREATE TABLE faixa_de_renda (
    id_faixa SERIAL PRIMARY KEY,
    descricao VARCHAR
);

CREATE TABLE pessoas_por_renda (
    id_zona INT,
    id_faixa INT,
    quantidade_pessoas INT,

    PRIMARY KEY (id_zona, id_faixa),

    CONSTRAINT fk_pessoas_renda_zona
        FOREIGN KEY (id_zona)
        REFERENCES zonas (id_zona),

    CONSTRAINT fk_pessoas_renda_faixa
        FOREIGN KEY (id_faixa)
        REFERENCES faixa_de_renda (id_faixa)
);

CREATE TABLE categoria_tipo (
    id_tipo SERIAL PRIMARY KEY,
    descricao VARCHAR
);

CREATE TABLE categoria_modo (
    id_modo SERIAL PRIMARY KEY,
    descricao VARCHAR
);

CREATE TABLE categoria_motivo (
    id_motivo SERIAL PRIMARY KEY,
    descricao VARCHAR
);

CREATE TABLE viagem (
    id_viagem SERIAL PRIMARY KEY,
    id_origem INT NOT NULL,
    id_destino INT NOT NULL,
  	quantidade_viagens_diarias INT,
	id_tipo INT NOT NULL,  

    CONSTRAINT fk_viagem_origem
        FOREIGN KEY (id_origem)
        REFERENCES zonas (id_zona),

    CONSTRAINT fk_viagem_destino
        FOREIGN KEY (id_destino)
        REFERENCES zonas (id_zona),

    CONSTRAINT fk_viagem_tipo
        FOREIGN KEY (id_tipo)
        REFERENCES categoria_tipo (id_tipo)
);

 
CREATE TABLE quantidade_tipo (
    id_zona INT,
    id_tipo INT,
    quantidade_viagens_produzidas INT,
    quantidade_viagens_atraidas INT,

    PRIMARY KEY (id_zona, id_tipo),

    CONSTRAINT fk_quantidade_tipo_zona
        FOREIGN KEY (id_zona)
        REFERENCES zonas (id_zona),

    CONSTRAINT fk_quantidade_tipo_tipo
        FOREIGN KEY (id_tipo)
        REFERENCES categoria_tipo (id_tipo)
);

CREATE TABLE quantidade_modo (
    id_zona INT,
    id_modo INT,
    quantidade_viagens_produzidas INT,
    quantidade_viagens_atraidas INT,

    PRIMARY KEY (id_zona, id_modo),

    CONSTRAINT fk_quantidade_modo_zona
        FOREIGN KEY (id_zona)
        REFERENCES zonas (id_zona),

    CONSTRAINT fk_quantidade_modo_modo
        FOREIGN KEY (id_modo)
        REFERENCES categoria_modo (id_modo)
);

CREATE TABLE quantidade_motivo (
    id_zona INT,
    id_motivo INT,
    quantidade_viagens_produzidas INT,
    quantidade_viagens_produzidas_motivo_no_destino INT,
	quantidade_viagens_atraidas INT,
    quantidade_viagens_atraidas_motivo_no_destino INT,

    PRIMARY KEY (id_zona, id_motivo),

    CONSTRAINT fk_quantidade_motivo_zona
        FOREIGN KEY (id_zona)
        REFERENCES zonas (id_zona),

    CONSTRAINT fk_quantidade_motivo_motivo
        FOREIGN KEY (id_motivo)
        REFERENCES categoria_motivo (id_motivo)
);



