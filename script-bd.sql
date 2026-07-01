CREATE DATABASE bd_desigualdade_no_transporte_sp;
USE bd_desigualdade_no_transporte_sp;

CREATE TABLE zona (
id_zona INT AUTO_INCREMENT PRIMARY KEY,
nome_zona VARCHAR(100),
domicilio_total INT,
familia_total INT,
populacao_total INT,
empregos_inteiro INT,
automoveis_particulares INT,
emprego_total INT
);

CREATE TABLE renda(
id_renda INT AUTO_INCREMENT PRIMARY KEY,
ano INT,
renda_per_capita DECIMAL(10,2),
renda_mediana_familiar DECIMAL(10,2),
renda_media_familiar DECIMAL(10,2),
percentual_baixa_renda DECIMAL(10,2),
percentual_alta_renda DECIMAL(10,2),
id_zona INT NOT NULL,
FOREIGN KEY (id_zona) REFERENCES zona(id_zona)
);

CREATE TABLE viagem(
id_indicador_viagem INT AUTO_INCREMENT PRIMARY KEY,
ano INT,
total_viagens_produzidas INT,
total_viagens_atraidas INT,
tempo_medio_coletivo TIME,
tempo_medio_individual TIME,
modo_viagem VARCHAR(100),
id_zona INT NOT NULL,
id_zona_destino INT NOT NULL,
FOREIGN KEY (id_zona) REFERENCES zona(id_zona),
FOREIGN KEY (id_zona_destino) REFERENCES zona(id_zona)
);
