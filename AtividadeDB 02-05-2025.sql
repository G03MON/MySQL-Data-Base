-- Criando banco de dados

CREATE DATABASE School_Server;
USE school_Server;

-- Inserindo tabelas

CREATE TABLE Alunos_cl (
	id_aluno INT PRIMARY KEY,
    nome VARCHAR(120),
    CPF BIGINT(30),
    data_nascimento DATE,
    telefone VARCHAR(30)
);

CREATE TABLE Cursos_Senai (
	id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(150),
    carga_horaria INT,
    data_inicio date,
    data_termino date
);

CREATE TABLE Matriculas_cl (
	id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_curso INT,
    data_matricula date,
    FOREIGN KEY (id_aluno) REFERENCES Alunos_cl(id_aluno),
	FOREIGN KEY (id_curso) REFERENCES Curso_Senai(id_curso)
);

-- Modificações e consultas
SHOW TABLES;
SHOW DATABASES;

ALTER TABLE Alunos_cl ADD email VARCHAR(80);
ALTER TABLE Cursos_Senai MODIFY COLUMN carga_horaria SMALLINT;

UPDATE Alunos_cl
SET telefone = '1122339958'
WHERE id_aluno = 101;

DELETE FROM Cursos_Senai WHERE nome_curso = 'Operador de Empilhadeira';
DROP TABLE Matricula_cl;

-- Adicionando dados nas tabelas

INSERT INTO Alunos_cl (id_aluno, nome, CPF, data_nascimento, telefone, email)
VALUES
(101, 'Carlos Alberto', 22345653812, '1999-03-12', '11978515657', 'carloscbl@email.com'),
(102, 'Marta Silva', 11190653890, '1985-04-20', '12985564433', 'msilva@email.com'),
(103, 'José Roberto', 30345653900, '2003-06-19', '11995724650', 'jjrobertinho@email.com'),
(104, 'Maria Amélia', 45045253902, '2000-01-23', '73955515690', 'marialia@email.com');

INSERT INTO Cursos_Senai (id_curso, nome_curso, carga_horaria, data_inicio, data_termino)
VALUES
(201, 'Auxiliar de Finanças', 50, '2024-05-08', '2024-07-26'),
(202, 'Auxiliar de Recursos Humanos', 120, '2024-02-08', '2024-05-28'),
(203, 'Sistemas Elétricos', 80, '2024-03-08', '2024-04-20'),
(204, 'Operador de Empilhadeira', 100, '2024-11-08', '2025-01-26');

INSERT INTO Matricula_cl (id_aluno, id_curso, data_matricula)
VALUES
(101, 201, '2024-05-01'),
(102, 202, '2024-02-01'),
(103, 203, '2024-03-01'),
(104, 204, '2024-11-01');

-- Seleção de dados

SELECT * FROM Alunos_cl;
SELECT * FROM Cursos_Senai WHERE carga_horaria > 70;
SELECT * FROM Matricula_cl WHERE data_matricula > '01-03-2024'
SELECT nome, data_nascimento FROM Alunos_cl;
