
CREATE DATABASE Projeto;
USE Projeto;


-- Tabela de Usuários

CREATE TABLE Usuario (
    idCadastro INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) UNIQUE NOT NULL,
    nome VARCHAR(60) NOT NULL,
    senha VARCHAR(16) NOT NULL,
    telefone CHAR(13) UNIQUE NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL
);

INSERT INTO Usuario VALUES
     (default, 'anaprofissionaal@gmail.com', 'Ana da Silva', 'a21p645', '11987654321', '12345678901'),
    (default, 'joao.empresa@yahoo.com.br', 'João dos Santos', 'be2638mb', '11965439876', '98765432100'),
    (default, 'mariana.costa@sptech.school', 'Mariana Costa', 'pdbc7195nc', '11944332211', '45678912345');

SELECT * FROM Usuario;

-- Consulta com CONCAT
SELECT CONCAT('Nome: ', nome) AS 'Nome completo',
    CONCAT('Email: ', email) AS 'Email cadastrado',
    CONCAT('Tel: ', telefone) AS 'Telefone cadastrado',
    CONCAT('CPF: ', cpf) AS 'CPF cadastrado' FROM Usuario;


SELECT nome, cpf, CASE  WHEN cpf = '12345678901' 
THEN 'Usuário encontrado' ELSE 'Outro usuário' END AS 'Status' FROM Usuario;


-- Tabela de Empresas

CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    CNPJ CHAR(14) UNIQUE NOT NULL,
    razaoSocial VARCHAR(80) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO Empresa (CNPJ, razaoSocial, email) VALUES
    ('11222333000155', 'Banco do Brasil', 'bbcorp@gmail.com'),
    ('99887766000122', 'Magazine Luiza', 'magalu@gmail.com'),
    ('55443322000199', 'Petrobras', 'petrobras@gamil.com');


SELECT CONCAT('ID: ', idEmpresa) AS 'Número de cadastro',
    CONCAT('CNPJ: ', CNPJ) AS 'CNPJ da empresa',
    CONCAT('Razão Social: ', razaoSocial) AS 'Nome da Empresa',
    CONCAT('Email: ', email) AS 'Email cadastrado' FROM Empresa;


-- Tabela de Sensores

CREATE TABLE Sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
    niveldePPM FLOAT
);

INSERT INTO Sensor (niveldePPM) VALUES 
(20), (50), (80), (100);


SELECT dtRegistro AS 'Data e hora do registro',
    niveldePPM AS 'Concentração do gás em PPM',

CASE WHEN niveldePPM < 25 THEN 'Seguro'
	WHEN niveldePPM BETWEEN 25 AND 50 THEN 'Atenção'
	WHEN niveldePPM BETWEEN 51 AND 100 THEN 'Perigo Moderado'
ELSE 'Nível Crítico' END AS 'Classificação do nível' FROM Sensor;


-- Tabela de Níveis de Amônia

CREATE TABLE NvlAmonia (
    idAmonia INT PRIMARY KEY AUTO_INCREMENT,
    minPpm FLOAT,
    maxPpm FLOAT,
    nvlAlerta VARCHAR(20),
    CONSTRAINT chknvlAlerta 
        CHECK(nvlAlerta IN ('Baixo', 'Médio', 'Alto', 'Crítico', 'Fatal'))
);

INSERT INTO NvlAmonia (minPpm, maxPpm, nvlAlerta) VALUES
    (0, 25, 'Baixo'),
    (26, 50, 'Médio'),
    (50, 100, 'Alto'),
    (100, 500, 'Crítico'),
    (2500, 5000, 'Fatal');

-- Consulta com CONCAT + CASE
SELECT CONCAT('Nível: ', nvlAlerta) AS 'Nível de risco',
    CONCAT('Máximo: ', maxPpm, ' ppm') AS 'Concentração máxima',
CASE WHEN nvlAlerta = 'Baixo' THEN 'Situação segura'
	WHEN nvlAlerta = 'Médio' THEN 'Atenção moderada'
	WHEN nvlAlerta = 'Alto' THEN 'Atenção alta'
	WHEN nvlAlerta = 'Crítico' THEN 'Emergência'
ELSE 'Zona Fatal – evacuar imediatamente' END AS 'Recomendação' FROM NvlAmonia;






