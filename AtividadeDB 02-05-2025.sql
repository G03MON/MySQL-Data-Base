-- Criando banco de dados

CREATE DATABASE School_Server;
USE School_Server;

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

ALTER TABLE Alunos_cl ADD email VARCHAR(80);
ALTER TABLE Cursos_Senai MODIFY COLUMN carga_horaria SMALLINT;

DROP TABLE Matricula_cl;

-- Adicionando dados nas tabelas

INSERT INTO Alunos_cl (id_aluno, nome, CPF, data_nascimento, telefone, email)
VALUES
(101, 'Carlos Alberto', 22345653812, '19-04-1999', '11978515657', 'carloscbl@email.com'),
(102, 'Marta Silva', 11190653890, '11-05-1985', '12985564433', 'msilva@email.com'),
(103, 'José Roberto', 30345653900, '22-03-2003', '11995724650', 'jjrobertinho@email.com'),
(104, 'Maria Amélia', 45045253902, '03-01-2000', '73955515690', 'marialia@email.com');

INSERT INTO Cursos_Senai (id_curso, nome_curso, carga_horaria, data_inicio, data_termino)
VALUES
(201, 'Auxiliar de Finanças', 50, '11-03-2024', '28-04-2024'),
(202, 'Auxiliar de Recursos Humanos', 120, '08-02-2024', '25-05-2024'),
(203, 'Sistemas Elétricos', 80, '08-06-2024', '17-08-2024'),
(204, 'Operador de Empilhadeira', 100, '03-05-2024', '04-06-2024');



