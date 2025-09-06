CREATE DATABASE Projeto;

USE Projeto;

CREATE TABLE Usuario (
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(50) UNIQUE NOT NULL,
nome VARCHAR(60) NOT NULL,
senha VARCHAR(16) NOT NULL,
telefone CHAR(13) UNIQUE NOT NULL,
cpf VARCHAR(11) UNIQUE NOT NULL
);

INSERT INTO Usuario (email, nome, senha, telefone, cpf) VALUES
	('eduardo.nascimento@sptech.school', 'Eduardo Nascimento', 'Urubu100', '11937061684', '33688622666'),
    ('lucas.peres@sptech.school', 'Lucas Peres', 'Lp_2006', '11973239898', '55708075856');
    

SELECT * FROM Usuario;
SELECT nome AS 'Nome completo',
		email AS 'Email cadastrado',
        telefone AS 'Telefone cadastrado',
        cpf AS 'CPF cadastrado'
        FROM Usuario;
        
SELECT * FROM Usuario
	WHERE cpf = '55708075856';





CREATE TABLE Empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
CNPJ CHAR(14) UNIQUE NOT NULL,
razãoSocial VARCHAR(80) UNIQUE NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO Empresa (CNPJ, razãoSocial, email) VALUES
	('42599543000117', 'Itau Unibanco', 'itaubanco@empresarial'),
    ('84224447000134', 'Casas Bahia', 'casasbahia@vendas');
    
    
SELECT * FROM Empresa;
SELECT idEmpresa AS 'Número de cadastro',
		CNPJ AS 'CNPJ da empresa',
		razãoSocial AS 'Razão Social da empresa',
		email AS 'Email cadastrado'
        FROM empresa;




CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
niveldePPM FLOAT
);

INSERT INTO sensor (niveldePPM) VALUES
	(20);
    
SELECT * FROM sensor;

INSERT INTO sensor (niveldePPM) VALUES
	(50);
    
SELECT * FROM sensor;
SELECT dtRegistro AS 'Data e hora do registro',
		niveldePPM AS 'Concentração do gás em PPM'
        FROM sensor;
        
SELECT * FROM sensor
	WHERE dtRegistro = '2025-08-26 20:47:00';
    
INSERT INTO sensor (niveldePPM) VALUES
	(80);
    
INSERT INTO sensor (niveldePPM) VALUES
	(100);
    
SELECT niveldePPM AS 'Concentração do gás em PPM',
		dtRegistro AS 'Data e hora do registro'
        FROM sensor
        WHERE niveldePPM >= 50;
        
        
        

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
    (26, 50, 'Médio'),
    (50, 100, 'Alto'),
    (100, 500, 'Crítico'),
    (2500, 5000, 'Fatal');
    
    
    SELECT nvlAlerta AS 'Nivel de risco',
			maxPpm AS 'Concentração maxima'
            FROM nvlAMonia;
            
	
    
	
    
    