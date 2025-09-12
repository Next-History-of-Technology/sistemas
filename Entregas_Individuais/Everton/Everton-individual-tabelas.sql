CREATE DATABASE projeto1;
USE projeto1;

CREATE TABLE empresa (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(45)
);

INSERT INTO empresa (Nome) VALUES
('C6 Bank'),
('Safra'),
('Itaú');

CREATE TABLE usuario (
  idUsuario INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  email VARCHAR(45) UNIQUE NOT NULL,
  cpf CHAR(11) UNIQUE NOT NULL,
  telefone CHAR(11) UNIQUE NOT NULL,
  fkempresa INT,
  CONSTRAINT fkUsuarioEmpresa
    FOREIGN KEY (fkempresa)
    REFERENCES empresa(idEmpresa)
);

INSERT INTO usuario (Nome, email, cpf, telefone, fkempresa) VALUES
('Goku', 'goku@dragonball.com', '11122233344', '11987654321', 1),
('Lara Croft', 'lara@tombraid.com', '22233344455', '11987654322', 2),
('Harley Quinn', 'harley@arkham.com', '33344455566', '11987654323', 3),
('Dexter Morgan', 'dexter@lab.com', '44455566677', '11987654324', 1),
('Ellie Williams', 'ellie@thelastofus.com', '55566677788', '11987654325', 2);

CREATE TABLE sensor (
  idSensor INT PRIMARY KEY AUTO_INCREMENT,
  Localizacao VARCHAR(45)
);

INSERT INTO sensor (Localizacao) VALUES
('Área de Desossa'),
('Câmara Fria 1'),
('Área de Embalagem'),
('Câmara Fria 2');

CREATE TABLE leituras (
  idNotificacao INT PRIMARY KEY AUTO_INCREMENT,
  horario DATETIME,
  fksensor INT,
  CONSTRAINT fkLeituraSensor
    FOREIGN KEY (fksensor)
    REFERENCES sensor(idSensor)
);

INSERT INTO leituras (horario, fksensor) VALUES
('2024-05-15 10:00:00', 1),
('2024-05-15 10:05:00', 2),
('2024-05-15 10:10:00', 3),
('2024-05-15 10:15:00', 4),
('2024-05-15 10:20:00', 1),
('2024-05-15 10:25:00', 2);

SELECT * FROM empresa;
SELECT * FROM usuario;
SELECT * FROM sensor;
SELECT * FROM leituras;


SELECT Nome, email FROM usuario WHERE Nome = 'Lara Croft';
SELECT Nome FROM empresa WHERE Nome LIKE '%a%';
SELECT Localizacao FROM sensor WHERE Localizacao LIKE '%Câmara%';

SELECT idUsuario AS 'ID do Usuário', 
    Nome AS 'Nome Completo', 
    email AS 'Email de Contato' 
FROM usuario;

SELECT CONCAT('CPF: ', cpf, ' | Telefone: ', telefone) AS 'Informações de Contato'
FROM usuario;

SELECT idEmpresa AS 'Código da Empresa',
    Nome AS 'Nome da Empresa',
    CASE
        WHEN Nome = 'C6 Bank' THEN 'Financeiro'
        WHEN Nome = 'Safra' THEN 'Financeiro'
        WHEN Nome = 'Itaú' THEN 'Financeiro'
        ELSE 'Desconhecido'
    END AS 'Setor'
FROM empresa;

SELECT
    idSensor AS 'ID do Sensor',
    Localizacao AS 'Área de Monitoramento'
FROM sensor;

SELECT horario AS 'Data e Hora da Leitura'
FROM leituras;

SELECT usuario.nome AS 'Nome do Usuario',
    empresa.Nome AS 'Nome da Empresa'
FROM usuario
JOIN empresa ON usuario.fkempresa = empresa.idEmpresa;

SELECT CONCAT(usuario.Nome, ' (', usuario.email, ')') AS 'Informações de Contato',
    empresa.Nome AS 'Empresa'
FROM usuario
JOIN empresa ON usuario.fkempresa = empresa.idEmpresa;

SELECT
    usuario.Nome AS 'Usuario',
    CASE
        WHEN empresa.Nome = 'C6 Bank' THEN 'Financeiro Digital'
        WHEN empresa.Nome = 'Itaú' THEN 'Banco Tradicional'
        WHEN empresa.Nome = 'Safra' THEN 'Private Bank'
        ELSE 'Outro'
    END AS 'Tipo de Empresa'
FROM usuario
JOIN empresa ON usuario.fkempresa = empresa.idEmpresa;

SELECT leituras.horario AS 'Horário da Leitura',
    sensor.Localizacao AS 'Local do Sensor'
FROM leituras
INNER JOIN sensor ON leituras.fksensor = sensor.idSensor;

