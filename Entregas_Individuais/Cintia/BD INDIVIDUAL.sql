Use sprint1;

CREATE TABLE Usuario ( 
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50) NOT NULL, 
email VARCHAR (50) UNIQUE NOT NULL, 
senha VARCHAR (18) NOT NULL,
CPF CHAR (11) UNIQUE NOT NULL,
telefone CHAR (13);


INSERT INTO Usuario VALUES
(DEFAULT,'Cintia','cintia@gmail.com','123.spt',11234567002, 5511930931009),
(DEFAULT,'Vivian','melhor@gmail.com','sptech',11234567003, 5511930931009),
(DEFAULT,'Pedro','Pedro@gmail.com','pepe12',11234567004, 5511930931009),
(DEFAULT,'Mario','Mario@gmail.com','armario1',11234567005, 5511930931009),
(DEFAULT,'Luiza','Luiza@gmail.com','Luz44',11234567006, 5511930931009),
(DEFAULT,'Julia','Julia@gmail.com','julinha01',11234567007, 5511930931009);

SELECT * FROM Usuario;

SELECT CONCAT(nome,'  ',CPF,'   ',senha,'  ',email,'   ',telefone) AS 'DadosPessoais' FROM Usuario;


CREATE TABLE Empresa ( 
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
CNPJ CHAR (14) UNIQUE NOT NULL,
razaoSocial VARCHAR (50) UNIQUE NOT NULL,
email VARCHAR (50) UNIQUE NOT NULL,
nomeResponsavel VARCHAR (40) NOT NULL
);


INSERT INTO Empresa VALUES
(DEFAULT, 12345678912454, 'Accenture','accenture@empresa.com','Alex Santana'),
(DEFAULT, 12345678912400, 'Atos','atos@empresa.com','Luciano Lancaster'),
(DEFAULT, 12345678910005, 'Itau','itau@empresa.com','Nicole Marques'),
(DEFAULT, 12345678912000, 'Safra','safra@empresa.com','Safira Santos'),
(DEFAULT, 12345678912333, 'SPTECH','sptech@empresa.com','Alessandro Goulart');



CREATE TABLE Sensor ( 
idSensor INT PRIMARY KEY AUTO_INCREMENT, 
dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
nivelPPM FLOAT,
identificador INT NOT NULL
);

INSERT INTO Sensor (idSensor,nivelPPM,identificador) VALUES
(DEFAULT, 20, 001),
(DEFAULT, 25, 002),
(DEFAULT, 50, 003),
(DEFAULT, 25, 004),
(DEFAULT, 57, 005),
(DEFAULT, 33, 006),
(DEFAULT, 42, 007);



