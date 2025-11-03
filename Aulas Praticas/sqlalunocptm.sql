-- Criação do banco de dados
--CREATE DATABASE "alunosCPTM";

-- Tabela de alunos
CREATE TABLE alunos (
    aluno_id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F'))
	-- M=Masculino, F=Feminino
);

-- Tabela de apresentações
CREATE TABLE apresentacoes (
    apresentacao_id SERIAL PRIMARY KEY,
    aluno_id INTEGER REFERENCES alunos(aluno_id),
    tema VARCHAR(30) NOT NULL DEFAULT 'Soft Skills',
    apresentou BOOLEAN NOT NULL,
    comentario TEXT
);

-- Inserindo alunos
INSERT INTO alunos (nome, sexo)
VALUES
	('ALBERTO ARAUJO', 'M'),
	('ALEXANDRE SANTANA', 'M'),
	('ANA CAROLINA SANTOS', 'F'),
	('CAUÊ VALENTE', 'M'),
	('GABRIEL SANTOS', 'M'),
	('GUILHERME NERY', 'M'),
	('GUILHERME SILVA', 'M'),
	('GUSTAVO SILVA', 'M'),
	('IZABELLA OLIVEIRA', 'F'),
	('JOÃO PEDRO SILVA', 'M'),
	('JOÃO PEDRO BORIN', 'M'),
	('JOSUÉ TICONA', 'M'),
	('LUCAS DONATO', 'M'),
	('PAULO HENRIQUE DAMACENO', 'M'),
	('PAULO RENATO SILVA', 'M'),
	('SOFIA PIRES', 'F'),
	('FLÁVIA RIBEIRO', 'F'),
	('GABRIEL LIMA', 'M'),
	('JUAN SANTOS', 'M'),
	('KAUAN SANTOS', 'M'),
	('LETICIA GOMES', 'F'),
	('MARIA MIRANDA', 'F'),
	('MARIA SANTOS', 'F'),
	('MARIA MELO', 'F'),
	('MAYSA SANTOS', 'F'),
	('NICOLLY GONÇALVES', 'F'),
	('PEDRO SANTOS', 'M'),
	('RILLARY SILVA', 'F'),
	('VITORIA SILVA', 'F'),
	('WERÔNICA MELO', 'F'),
	('YGOR SILVA', 'M'),
	('YURI SILVA', 'M');


-- Inserindo apresentações com comentário 'diversos'
INSERT INTO apresentacoes (aluno_id, apresentou, comentario) 
VALUES
	(10, false, 'Trocou o dia da apresentação'),
	(2, false, 'Trocou o dia da apresentação'),
	(27, true, 'Trocou o dia da apresentação'),
	(30, false, 'Trocou o dia da apresentação'),
	(11, true, 'Antecipou a apresentação'),
	(21, false, 'Faltou no dia');
	
--inserindo apresentações com comentario "Apresentação feita com sucesso"



--inserindo apresentações sem comentarios "null"



--praticas join com o bd alunoscptm
--LEFT JOIN
SELECT  alunos.aluno_id,
		alunos.nome,
		alunos.sexo,
		apresentacoes.comentario
FROM alunos
LEFT JOIN apresentacoes
	ON alunos.aluno_id = apresentacoes.aluno_id
ORDER BY alunos.aluno_id DESC LIMIT 100;

--CROSS JOIN
SELECT  alunos.aluno_id,
		alunos.nome,
		apresentacoes.apresentacao_id,
		apresentacoes.comentario
FROM alunos
CROSS JOIN apresentacoes;

--
SELECT  a.aluno_id,
		a.nome,
		a.sexo,
		SUM (ap.apresentacao_id) AS total_comentarios
FROM alunos a
RIGHT JOIN apresentacoes ap
	ON a.aluno_id = ap.aluno_id
GROUP BY a.aluno_id;

