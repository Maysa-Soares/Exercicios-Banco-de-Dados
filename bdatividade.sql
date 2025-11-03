-- Query, Cria base de dados
CREATE DATABASE testeb;

-- Query, Cria tabela ALUNO
CREATE TABLE alunos(
id_aluno INT,
nome_aluno VARCHAR(100),
email VARCHAR(100)
);

 -- Query, Cria tabela CURSOS
CREATE TABLE cursos(
id_curso INT,
nome_curso VARCHAR(100),
preco_curso NUMERIC(10,2)
);

 -- Query, Cria tabela MATRICULAS
CREATE TABLE matriculas(
id_matricula INT,
id_curso INT,
id_aluno INT,
data_cadastro DATE
);

--Querys, Buscar tabelas
SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM matriculas;

--Querys, Remove
DROP TABLE alunos;
DROP TABLE cursos;
DROP TABLE matriculas;


-- Trabalhando com NOT NULL, PRIMARY KEY e FOREIGN KEY
-- Query, Cria tabela ALUNO
CREATE TABLE alunos(
id_aluno INT,
nome_aluno VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
PRIMARY KEY(id_aluno)
);

 -- Query, Cria tabela CURSOS
CREATE TABLE cursos(
id_curso INT,
nome_curso VARCHAR(100) NOT NULL,
preco_curso NUMERIC(10,2) NOT NULL,
PRIMARY KEY(id_curso)
);

 -- Query, Cria tabela MATRICULAS
CREATE TABLE matriculas(
id_matricula INT,
id_curso INT NOT NULL,
id_aluno INT NOT NULL,
data_cadastro DATE NOT NULL,

PRIMARY KEY(id_matricula),
FOREIGN KEY(id_aluno) REFERENCES alunos(id_aluno),
FOREIGN KEY(id_curso) REFERENCES cursos(id_curso)
);

-- Query, Popular Tabelas
INSERT INTO alunos(id_aluno, nome_aluno, email)
VALUES
	(1, 'Ana Carolina', 'ana123@gmail.com'),
	(2, 'Pedro Henrique', 'pedro123@gmail.com'),
	(3, 'carla', 'carla123@gmail.com'),
	(4, 'Diego Santos', 'diego123@gmail.com');

INSERT INTO cursos(id_curso, nome_curso, preco_curso)
VALUES
	(1, 'Excel', 100),
	(2, 'VBA', 200),
	(3, 'PowerBI', 150),
	(4, 'DS', 1100);

INSERT INTO matriculas(id_matricula, id_curso, id_aluno, data_cadastro)
VALUES
	(1, 1, 1, '2021/03/11'),
	(2, 1, 2, '2021/06/21'),
	(3, 2, 3, '2021/01/08'),
	(4, 3, 1, '2021/04/03'),
	(5, 4, 1, '2021/05/10'),
	(6, 4, 3, '2021/05/10');

-- Query, Atualizar Dados
UPDATE cursos
SET preco_curso = 300
WHERE id_curso = 1;

-- Query, Atualizar Dados
UPDATE alunos
SET nome_aluno = 'Maysa Soares'
WHERE id_aluno = 1;

-- Query, Deletar Dados
DELETE FROM matriculas
WHERE id_matricula = 5;

-- Query, para excluir todos os dados da tabela
TRUNCATE TABLE matriculas;

-- Query, para excluir tabelas(ERROR)
DROP TABLE alunos;
DROP TABLE cursos;
DROP TABLE matriculas;

-- Query, para excluir tabelas(SUCCESSFULLY)
DROP TABLE alunos CASCADE;
DROP TABLE cursos CASCADE;
DROP TABLE matriculas;

-- Querys, Buscar tabelas
SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM matriculas;

--- FIM QUERYS [DDL, CRUD...] ---