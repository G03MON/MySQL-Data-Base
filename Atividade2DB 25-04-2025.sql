CREATE DATABASE HighSchoolw3;
USE HighSchoolw3;

CREATE TABLE cursos_livres(
id INT PRIMARY KEY,
nome VARCHAR(150),
ch_horas INT
);

CREATE TABLE alunos (
id INT PRIMARY KEY,
nome VARCHAR(100),
idade INT,
curso_id INT,
FOREIGN KEY (curso_id) REFERENCES cursos (id)
);

INSERT INTO alunos (id, nome, idade, curso_id)
VALUES
(1, 'Laura Jr', 18, 1),
(2, 'Addam Newbert', 15, 2),
(3, 'Jane Jacson', 17, 1),
(4, 'Murillo D. Carlos', 14, 3),
(5, 'Zack A. Codename', 36, 2);

INSERT INTO cursos_livres (id, nome, ch_hora)
VALUES
(1, 'Auxiliar de Vendas', 50),
(2, 'Agente de Registro', 100),
(3, 'Finanças e Orçamentos', 80),
(4, 'Microprocessadores', 160),
(5, 'Manutenção Mobile', 120);

-- Criando usuarios no Database 

CREATE USER 'analista_bi'@'localhost' IDENTIFIED BY 'user1234'; 
CREATE USER 'sistema'@'localhost' IDENTIFIED BY 'user2345'; 


-- Libere os acesso para realizar somente o SELECT nas tabelas cursos e alunos
-- libere os acessos para que o usuario sistema realizei SELECT, UPDATE, DELETE
GRANT SELECT ON HighSchoolw3.* TO 'analista_bi'@'localhost';
GRANT SELECT, UPDATE,  DELETE ON HighSchoolw3.* TO 'sistema'@'localhost';


-- Crie um usuario novo chamadao sistema_SELECT para realizar SELECT
CREATE USER 'sistema_SELECT'@'localhost' IDENTIFIED BY 'user8888'; 
GRANT SELECT ON HighSchoolw3.* TO 'sistema_SELECT'@'localhost';

-- Realize a remoção da permissão SELECT do usuário sistema2
REVOKE SELECT ON HighSchoolw3.* FROM 'sistema'@'localhost';
