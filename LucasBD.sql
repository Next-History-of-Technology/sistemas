CREATE DATABASE individual;

USE individual;


CREATE TABLE Usuario (
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(50) UNIQUE NOT NULL,
nome VARCHAR(60) NOT NULL,
sobrenome VARCHAR(60) NOT NULL,
senha VARCHAR(16) NOT NULL,
telefone CHAR(13) UNIQUE,
cpf VARCHAR(11) UNIQUE NOT NULL,
genero CHAR(1)
	CONSTRAINT chkgenero CHECK(genero IN('M','F'))
);

INSERT INTO Usuario (email, nome, sobrenome, senha, cpf, genero) VALUES
	('lucas.peres@sptech.school','Lucas', 'Peres', 'urubu100', '30928653838', 'M');	
    
SELECT * FROM Usuario;


CREATE TABLE Empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
CNPJ CHAR(14) UNIQUE NOT NULL,
razãoSocial VARCHAR(80) UNIQUE NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
endereço VARCHAR(100)
);

CREATE TABLE sensor (
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
niveldePPM FLOAT,
identificador INT NOT NULL,
localSensor VARCHAR(30) NOT NULL,
situacao VARCHAR(15) NOT NULL
	CONSTRAINT chksituacao CHECK(situacao IN ('Ativo' , 'Desativado'))
);

INSERT INTO sensor (niveldePPM, identificador, localSensor, situacao) VALUES
	(50, 1, 'Compressor', 'Ativo' );



CREATE TABLE nvlAmonia (
idAmonia INT PRIMARY KEY AUTO_INCREMENT,
minPpm FLOAT,
maxPpm FLOAT,
nvlAlerta VARCHAR(20),
CONSTRAINT chknvlAlerta 
	CHECK(nvlAlerta IN ('Baixo', 'Médio', 'Alto', 'Crítico', 'Fatal'))
);

INSERT INTO nvlAmonia (minPpm, maxPpm, nvlAlerta) VALUES
	(0, 25, 'Baixo'),
    (25, 50, 'Médio'),
    (50, 100, 'Alto'),
    (100, 500, 'Crítico'),
    (2500, 5000, 'Fatal');






