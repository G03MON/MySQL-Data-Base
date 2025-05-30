-- Atividade 1 - Administração de Banco de Dados
-- Ementa: DML (Linguagem de  Manipulação de Dados)

CREATE DATABASE Admin7;
USE Admin7;

CREATE TABLE Televendas(
id_venda BIGINT NOT NULL,
nome_cli VARCHAR(52),
item_pedido VARCHAR(52),
qt BIGINT,
valor FLOAT
);

INSERT INTO Televendas (id_venda, nome_cli, item_pedido, qt, valor)
VALUES
(1, 'Jhonny D. beck', 'Macbook', 5, 15000.75),
(2, 'Charlos Cage', 'Telescopio', 1, 2300.33),
(3, 'Maria B. Anthony', 'Tecpix', 1, 300.12),
(4, 'Barbie Random', 'Mochila', 15, 1022.98),
(5, 'Xanna C. Zehara', 'Meia', 200, 100.98);

UPDATE Televendas
SET item_pedido = 'Megapix'
WHERE id_venda = 3;

SELECT id_venda, nome_cli, item_pedido, qt, valor FROM Televendas;

DELETE FROM Televendas WHERE id_venda = 5;

SET SQL_SAFE_UPDATES = 0;

DROP DATABASE Admin7;
