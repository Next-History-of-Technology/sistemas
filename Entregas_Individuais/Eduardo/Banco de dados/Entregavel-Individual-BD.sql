-- Projeto - Monitoramento de vazamento de amonia em Frigorificos

CREATE DATABASE ProjetoAmonia;

USE ProjetoAmonia;

CREATE TABLE Usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,
cpf VARCHAR(11) NOT NULL UNIQUE,
email VARCHAR(40) NOT NULL UNIQUE,
senha VARCHAR(30) NOT NULL,
telefone VARCHAR(11),
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Usuario (nome, cpf, email, senha, telefone) VALUES 
	('Eduardo Nascimento', '11111111111', 'eduardo.nascimento@sptech.school', 'urubu100', '11911111111'),
	('Lucas Peres', '22222222222', 'lucas.peres@sptech.school', 'urubu100', '11922222222'),
	('Arthur Rodrigues', '33333333333', 'arthur.rodrigues@sptech.school', 'urubu100', '11933333333'),
	('Cintia Azevedo', '44444444444', 'cintia.azevedo@sptech.school', 'urubu100', '11944444444'),
	('Igor Ruy', '55555555555', 'igor.ruy@sptech.school', 'urubu100', '11955555555'),
	('Everton Barbosa', '66666666666', 'everton.barbosa@sptech.school', 'urubu100', '11966666666');
    
SELECT * FROM Usuario;

SELECT * FROM Usuario
	WHERE dtCadastro > '2025-09-02' AND dtCadastro < '2025-09-03';
    
CREATE TABLE Empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
razaoSocial VARCHAR(60) NOT NULL,
cnpj VARCHAR(14) NOT NULL UNIQUE,
email VARCHAR(40) NOT NULL UNIQUE,
telefone VARCHAR(11),
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Empresa (razaoSocial, cnpj, email, telefone) VALUES 
	('Friboi', '01111111000101', 'friboi@empresa.com', '11911111111'),	
	('JBS', '02222222000202', 'jbs@empresa.com', '11922222222'),
	('Minerva', '03333333000303', 'minerva@empresa.com', '11933333333'),
	('Marfrig', '04444444000404', 'marfrig@empresa.com', '11944444444');
    
SELECT * FROM Empresa;

SELECT * FROM Empresa
	WHERE dtCadastro > '2025-09-02' AND dtCadastro < '2025-09-03';
    
CREATE TABLE DadosArduino (
idDadosArduino INT PRIMARY KEY AUTO_INCREMENT,
identificador VARCHAR(15) NOT NULL,
nivelAmonia INT,
dtColeta DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO DadosArduino (identificador, nivelAmonia) VALUES 
	('Ident1', 0),
	('Ident2', 0),
	('Ident3', 0),
	('Ident4', 0),
	('Ident5', 0);
    
INSERT INTO DadosArduino (identificador, nivelAmonia) VALUES 
	('Ident1', 0),
	('Ident2', 2),
	('Ident3', 3),
	('Ident4', 4),
	('Ident5', 0);

INSERT INTO DadosArduino (identificador, nivelAmonia) VALUES 
	('Ident1', 0),
	('Ident2', 4),
	('Ident3', 6),
	('Ident4', 8),
	('Ident5', 0);
    
SELECT * FROM DadosArduino;

SELECT * FROM DadosArduino
	WHERE identificador = 'Ident2';
    
SELECT * FROM DadosArduino
	WHERE identificador = 'Ident3';
    
SELECT * FROM DadosArduino
	WHERE identificador = 'Ident4';
    
SELECT * FROM DadosArduino
	WHERE identificador = 'Ident5';
    
CREATE TABLE IdentificadorSensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
identificador VARCHAR(15) NOT NULL UNIQUE,
lugarPredio VARCHAR(30) NOT NULL,
posicao VARCHAR(30) NOT NULL,
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO IdentificadorSensor (identificador, lugarPredio, posicao) VALUES
	('Ident1', 'Camera 1', 'Parede Leste 1'),
	('Ident2', 'Camera 1', 'Parede Leste 2'),
	('Ident3', 'Camera 1', 'Parede Oeste 1'),
	('Ident4', 'Camera 1', 'Parede Oeste 2'),
	('Ident5', 'Camera 2', 'Parede Leste 1'),
	('Ident6', 'Camera 2', 'Parede Leste 2'),
	('Ident7', 'Camera 2', 'Parede Oeste 1'),
	('Ident8', 'Camera 2', 'Parede Oeste 2');
    
SELECT * FROM IdentificadorSensor;

SELECT * FROM IdentificadorSensor
	WHERE lugarPredio = 'Camera 1';
    
SELECT * FROM IdentificadorSensor
	WHERE posicao LIKE '%Leste%';