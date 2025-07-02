# 1 RELACIONE AS ENTIDADES E ATRIBUTOS

-- Entidades
-- Dinossauro (nome, toneladas, ano_descoberta, país, grupo, descobridor, era)
-- Grupo (nome)
-- Era (nome, início, fim)
-- Descobridor (nome)


# 2 MODELO CONCEITUAL 

-- Um dinossauro pertence a 1 grupo, 1 era, e foi descoberto por 1 descobridor
-- Um grupo pode conter vários dinossauros
-- Uma era pode conter vários dinossauros
-- Um descobridor pode ter descoberto vários dinossauros


# Tabelas: grupo, era, descobridor, dinossauro

# 4 COMANDO SQL PARA CRIAÇÃO DO BANCO
# CREATE DATABASE IF NOT EXISTS dinossauros;
# USE dinossauros;

#5 CRIAÇÃO DAS TABELAS

CREATE TABLE grupo (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE era (
    id_era INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    inicio_milhoes INT NOT NULL,
    fim_milhoes INT NOT NULL
);

CREATE TABLE descobridor (
    id_descobridor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE dinossauro (
    id_dinossauro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    toneladas INT NOT NULL,
    ano_descoberta INT NOT NULL,
    pais VARCHAR(100),
    id_grupo INT,
    id_descobridor INT,
    id_era INT,
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo),
    FOREIGN KEY (id_descobridor) REFERENCES descobridor(id_descobridor),
    FOREIGN KEY (id_era) REFERENCES era(id_era)
);


# 6 INSERÇÃO DE PELO MENOS 3 REGISTROS POR TABELA

# GRUPOS
INSERT INTO grupo (nome) VALUES 
('Anquilossauros'),
('Ceratopsídeos'),
('Estegossauros'),
('Terópodes');

# ERAS
INSERT INTO era (nome, inicio_milhoes, fim_milhoes) VALUES
('Cretáceo', 145, 66),
('Jurássico', 201, 145);

# DESCOBRIDORES
INSERT INTO descobridor (nome) VALUES
('Maryanska'),
('John Bell Hatcher'),
('Cientistas Alemães'),
('Museu Americano de História Natural'),
('Othniel Charles Marsh'),
('Barnum Brown');

# DINOSSAUROS
INSERT INTO dinossauro (nome, toneladas, ano_descoberta, pais, id_grupo, id_descobridor, id_era) VALUES
('Saichania', 4, 1977, 'Mongólia', 1, 1, 1),
('Tricerátops', 6, 1887, 'Canadá', 2, 2, 1),
('Kentrossauro', 2, 1909, 'Tanzânia', 3, 3, 2),
('Pinacosauro', 6, 1999, 'China', 1, 4, 1),
('Alossauro', 3, 1877, 'América do Norte', 4, 5, 2),
('Torossauro', 8, 1891, 'USA', 2, 2, 1),
('Anquilossauro', 8, 1906, 'América do Norte', 1, 6, 1);


# 7 CONSULTA DADOS DE TODOS OS DINOSSAUROS ORDENADOS POR NOME


SELECT * FROM dinossauro
ORDER BY nome;

# 8 CONSULTA DADOS DE TODOS OS DINOSSAUROS ORDENADOS POR DESCOBRIDOR

SELECT d.*, descb.nome AS descobridor
FROM dinossauro d
JOIN descobridor descb ON d.id_descobridor = descb.id_descobridor
ORDER BY descb.nome;


# 9 CONSULTA OS DINOSSAUROS DO GRUPO anquilossauros POR ORDEM DE DESCOBERTA

SELECT d.*, g.nome AS grupo
FROM dinossauro d
JOIN grupo g ON d.id_grupo = g.id_grupo
WHERE g.nome = 'Anquilossauros'
ORDER BY d.ano_descoberta;

# 10 CONSULTA: DINOSSAUROS DOS GRUPOS ceratopsídeos OU anquilossauros 
#ENTRE 1900 E 1999


SELECT d.*, g.nome AS grupo
FROM dinossauro d
JOIN grupo g ON d.id_grupo = g.id_grupo
WHERE (g.nome = 'Ceratopsídeos' OR g.nome = 'Anquilossauros')
  AND d.ano_descoberta BETWEEN 1900 AND 1999;
