--Query, crisr base de dados
--CREATE DATABASE testeb;

--Query, criar tabela
CREATE TABLE alunos(
Id_aluno INT,
nome_aluno VARCHAR(100) NOT NULL,
email VARCHAR(100)NOT NULL,
PRIMARY KEY (Id_aluno)
);

--Query, criar tabela cursos
CREATE TABLE cursos(
Id_curso INT,
nome_curso VARCHAR(100) NOT NULL,
preco_curso NUMERIC(10,2)NOT NULL,
PRIMARY KEY(Id_curso)
);

--Query, criar tabela cursos
CREATE TABLE matriculas(
Id_matricula INT,
Id_curso INT NOT NULL,
Id_aluno INT NOT NULL,
data_cadastro DATE NOT NULL,

PRIMARY KEY(Id_matricula),
FOREIGN KEY(Id_aluno) REFERENCES alunos(Id_aluno),
FOREIGN KEY(Id_curso) REFERENCES cursos(Id_curso)
);
