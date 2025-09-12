CREATE DATABASE PI; 
USE PI;
CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (40),
email VARCHAR (40) UNIQUE NOT NULL,
senha VARCHAR (40) UNIQUE NOT NULL,
telefone char (13) UNIQUE NOT NULL
);

SELECT * FROM usuario;

INSERT INTO usuario (nome, email, senha, telefone) Values
('arthur', 'arthur.rfreitas@sptech.school', 'robson321', '11999544180'),
('lucas', 'lucas.peres@sptech.school', 'litros51', '11998534289'),
('everton', 'everton.silva@sptech.school', 'teste112','11990765498'), 
('eduardo', 'eduardo.nascimento@sptech.school', 'eduzinhoxxx', '11999544165'), 
('cintia', 'cintia.azevedo@sptech.school', 'cintiacorinthians', '11993444175'),
('igor', 'igor.fonseca@sptech.school', 'igorlupa', '11999544187');

SELECT telefone AS 'Telefone Cadastrado',
email AS 'Email Cadastrado',
nome AS 'Nome Completo'
FROM usuario ORDER BY nome;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
NomeEmpresa VARCHAR (40) UNIQUE NOT NULL,
CNPJ CHAR (14) UNIQUE NOT NULL,
email VARCHAR (30) UNIQUE NOT NULL
);

INSERT INTO empresa (NomeEmpresa, CNPJ, email) Values
('Stefanini', '43569657000124', 'Stefanini@contato.com'),
('bradesco', '87543762345871', 'Bradesco@contato.com'),
('atos', '23758976542314', 'Atos@contato.com'), 
('accenture', '98745098123458', 'Accenture@contato.com'), 
('minsait', '43876123498987', 'Minsait@contato.com'),
('itau', '47587123984309', 'itau@comercial.com');

select NomeEmpresa AS 'Nome da Empresa',
email AS 'email'
FROM empresa order by 'Nome da Empresa';

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
ppm FLOAT,
data_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
identificador INT NOT NULL,
localsensor VARCHAR (30) NOT NULL
);

INSERT INTO sensor (ppm, identificador, localsensor) values
(20, 1, 'Camera fria 15, parede 2'),
	(30, 2, 'Camera fria 5, parede 2'),
	(40, 2, 'Camera fria 17, parede 1'),
	(12, 3, 'Camera fria 16, parede 3'),
	(28, 1, 'Camera fria 14, parede 2'),
	(33, 3, 'Camera fria 08, parede 3'),
	(44, 1, 'Camera fria 10, parede 1'),
	(32, 2, 'Camera fria 6, parede 1'),
	(55, 1, 'Camera fria 2, parede 2'),
    (89, 1, 'Camera fria 12, parede 3'),
	(22, 2, 'Camera fria 14, parede 1'),
	(12, 3, 'Camera fria 06, parede 2');
    
    SELECT ppm AS 'Gás em PPM',
		data_registro AS 'Data do registro',
        localSensor AS 'Local do Sensor',
        identificador AS 'Identificador do Sensor'
        FROM sensor
        WHERE ppm >= 50;