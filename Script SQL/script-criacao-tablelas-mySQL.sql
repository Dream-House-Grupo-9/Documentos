-- drop database dreamhouse

create database dreamHouse;

use  dreamHouse;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------

CREATE TABLE Usuario (
  idUsuario INT NOT NULL PRIMARY KEY,
  nome VARCHAR(100) NULL,
  email VARCHAR(20) NULL,
  senha VARCHAR(20) NULL,
  autenticado TINYINT NULL
  );

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE Cliente (
  idCliente INT NOT NULL PRIMARY KEY,
  cpf CHAR(11),
  dtNascimento DATE,
  email VARCHAR(100),
  telefone VARCHAR(15),
  whatsapp VARCHAR(15),
  assinante TINYINT,
  fkUsuario INT NOT NULL,
  FOREIGN KEY (fkUsuario) REFERENCES Usuario (idUsuario)
  );
   


-- -----------------------------------------------------
-- Table `mydb`.`categoriaImovel`
-- -----------------------------------------------------
CREATE TABLE categoriaImovel(
  idcategoriaImovel INT NOT NULL PRIMARY KEY,
  categoria VARCHAR(45) NULL
  );


-- -----------------------------------------------------
-- Table `mydb`.`Anuncio`
-- -----------------------------------------------------
CREATE TABLE Anuncio (
  idAnuncio INT NOT NULL PRIMARY KEY,
  dtPublicacao DATETIME NULL,
  descricao VARCHAR(300) NULL,
  inicioDisponibilidade DATE NULL,
  finalDisponibilidade DATE NULL,
  cidade VARCHAR(100) NULL,
  bairro VARCHAR(100) NULL,
  lougadoro VARCHAR(150) NULL,
  numero VARCHAR(15) NULL,
  fkCategoriaImovel INT,
  FOREIGN KEY (fkCategoriaImovel) REFERENCES categoriaImovel (idcategoriaImovel),
  fkCliente INT,
  FOREIGN KEY (fkCliente) REFERENCES Cliente (idCliente)
  );

-- -----------------------------------------------------
-- Table `mydb`.`imagemAnuncio`
-- -----------------------------------------------------
CREATE TABLE imagemAnuncio (
  idImagem INT NOT NULL PRIMARY KEY,
  imagem BLOB NULL,
  fkAnuncio INT NOT NULL,
  FOREIGN KEY (fkAnuncio) REFERENCES Anuncio (idAnuncio)
 );


-- -----------------------------------------------------
-- Table `mydb`.`avaliacaoAnuncio`
-- -----------------------------------------------------
CREATE TABLE avaliacaoAnuncio (
  fkAnuncio INT NOT NULL,
  fkUsuario INT NOT NULL,
  ativarFavorito TINYINT NULL,
  notaAnuncio INT NULL,
  comentario VARCHAR(200) NULL,
  PRIMARY KEY (fkAnuncio, fkUsuario),
  FOREIGN KEY (fkAnuncio) REFERENCES Anuncio (idAnuncio),
  FOREIGN KEY (fkUsuario) REFERENCES Usuario (idUsuario)
  );


-- -----------------------------------------------------
-- Table `mydb`.`detalhesAnuncio`
-- -----------------------------------------------------
CREATE TABLE detalhesAnuncio (
  iddetalhesAnuncio INT NOT NULL PRIMARY KEY,
  ativoDiaria TINYINT NULL,
  ativoSemanal TINYINT NULL,
  ativoMensal TINYINT NULL,
  valorDiaria FLOAT NULL,
  valorSemanal FLOAT NULL,
  valorMensal FLOAT NULL,
  qtdDormitorios INT NULL,
  qtdToaletes INT NULL,
  garagem TINYINT NULL,
  areaDeTrabalho TINYINT NULL,
  mobiliada TINYINT NULL,
  fkAnuncio INT NOT NULL,
  FOREIGN KEY (fkAnuncio) REFERENCES Anuncio (idAnuncio)
 );

