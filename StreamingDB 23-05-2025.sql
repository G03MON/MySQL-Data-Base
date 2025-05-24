-- Criando banco de dados

CREATE DATABASE Netflix_db;
USE Netflix_db;

-- Criando tabelas

CREATE TABLE filmes(
	filme_id INT PRIMARY KEY,
    filme_tt VARCHAR(255) NOT NULL,
    filme_gen VARCHAR(80)
);

CREATE TABLE clientes(
	cliente_id INT PRIMARY KEY,
    nome_cli VARCHAR(255) NOT NULL,
    email_cli VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE detalhes(
	detalhes_id INT PRIMARY KEY,
    cliente_id INT,
    filme_id INT,
    detalhes_data DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (filme_id) REFERENCES filmes(filme_id)
);

-- Inserindo dados

INSERT INTO filmes(filme_id, filme_tt, filme_gen)
VALUES
(1, 'O Homem de Pedra', 'Ficção'),
(2, 'Vida Longa', 'Drama'),
(3, 'Panico 11', 'Terror'),
(4, 'O Rei', 'Suspense'),
(5, 'Lua Crescente', 'Romance');

INSERT INTO clientes(cliente_id, nome_cli, email_cli)
VALUES
(11, 'Paulo Souza', 'numpy@gmail.com'),
(22, 'Ana Diana', 'flores_22@gmail.com'),
(33, 'Diogo Albatroz', 'palmeiras_1@yahoo.com.br'),
(44, 'Glauco Silva', 'glauco_33@outlook.com'),
(55, 'Nailton Nathan', 'snail@gmail.com');

INSERT INTO detalhes(detalhes_id, cliente_id, filme_id, detalhes_data)
VALUES
(111, 11, 1, '2025-01-01'),
(222, 22, 2, '2025-02-01'),
(333, 33, 3, '2025-03-01'),
(444, 44, 4, '2025-04-01'),
(555, 55, 5, '2025-05-01');

-- Aplicando junção de tabelas
-- INNER JOIN: lista todas as assinaturas com informações de clientes e filmes.

SELECT 
	detalhes.detalhes_id,
    clientes.nome_cli,
    filmes.filme_tt,
    detalhes.detalhes_data
FROM
	detalhes
INNER JOIN
	clientes ON filmes.filme_id = detalhes.filme_id
RIGHT JOIN 
	detalhes ON filmes.filme.id = clientes.cliente_id;

-- LEFT JOIN: lista todos os clientes e suas assinaturas, incluindo clientes que não fizeram assinaturas.

SELECT
	clientes.nome_cli,
    detalhes.detalhes_id,
    filmes.filme_tt,
    detalhes.detalhes_data
FROM
	clientes
LEFT JOIN
	detalhes ON clientes.cliente_id = detalhes.cliente_id
LEFT JOIN
	filmes ON detalhes.filme_id = filmes.filme_id;

-- RIGHT JOIN: lista todos os filmes e as assinaturas feitas, incluindo filmes que não foram assinados.

SELECT
	filmes.filme_tt,
    detalhes.detalhes_id,
    clientes.nome_cli,
    detalhes.detalhes_data
FROM
	filmes
RIGHT JOIN
	detalhes ON filmes.filme_id = detalhes.filme_id
RIGHT JOIN
	clientes ON detalhes.cliente_id - clientes.cliente_id;

    
-- FULL OUTER JOIN: lista todos os clientes e filmes, incluindo aqueles que não têm assinaturas.

SELECT
	clientes.nome_cli,
    filmes.filme_tt,
    detalhes.detalhes_id,
    detalhes.detalhes_data
FROM
	clientes
FULL OUTER JOIN 
	detalhes ON clientes.cliente_id = detalhes.cliente_id
FULL OUTER JOIN 
	filmes ON detalhes.filme_id = filmes.filme_id;
    
-- CROSS JOIN: lista todas as combinações possíveis de clientes e filmes.

SELECT
	clientes.nome_cli,
    filmes.filme_tt
FROM
	clientes
CROSS JOIN
	filmes;
    
-- DML

SHOW DATABASES;
SHOW TABLES;

SELECT * FROM filmes;
SELECT * FROM clientes;
SELECT * FROM detalhes;
