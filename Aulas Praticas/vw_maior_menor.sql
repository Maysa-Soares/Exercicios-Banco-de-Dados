-- Criação do banco de dados
--CREATE DATABASE "alunosCPTM_novo";

-- Tabela de alunos
CREATE TABLE alunos (
    aluno_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL, -- Aumentar limite de caracteres
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')) -- M=Masculino, F=Feminino
);

-- Tabela de apresentações
CREATE TABLE apresentacoes (
    apresentacao_id SERIAL PRIMARY KEY,
    aluno_id INTEGER NOT NULL REFERENCES alunos(aluno_id) ON DELETE CASCADE, -- Garantir a integridade referencial
    tema VARCHAR(100) NOT NULL DEFAULT 'Soft Skills', -- Tema 100 caracteres
    apresentou BOOLEAN NOT NULL, -- BOOLEAN apresentou ou não
    comentario TEXT DEFAULT NULL -- Comentário pode NULL
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
    (21, false, 'Faltou no dia'),
	(23, false, 'Trocou o dia da Apresentação'),
	(26, false, 'Não ira realizar a apresentação'),
	(30, false, 'Trocou o dia da apresentação');

-- Inserindo apresentações com comentário "Apresentação feita com sucesso"
INSERT INTO apresentacoes (aluno_id, apresentou, comentario) 
VALUES
	(4, true, 'Apresentação feita com sucesso'),
    (5, true, 'Apresentação feita com sucesso'),
	(6, true, 'Apresentação feita com sucesso'),
	(7, true, 'Apresentação feita com sucesso'),
    (15, true, 'Apresentação feita com sucesso'),
	(16, true, 'Apresentação feita com sucesso'),
	(27, true, 'Apresentação feita com sucesso'),
	(29, true, 'Apresentação feita com sucesso'),
	(31, true, 'Apresentação feita com sucesso'),
	(32, true, 'Apresentação feita com sucesso');
	

--alterar pra ter sobrenome e nacvionalidade                                                 
ALTER TABLE alunos
ADD COLUMN sobrenome VARCHAR(100),
ADD COLUMN nacionalidade VARCHAR(50) DEFAULT 'Brasileira';


-- ver qual p maior e menor nome
SELECT MAX(LENGTH(nome)) AS maior_nome,
       MIN(LENGTH(nome)) AS menor_nome
FROM alunos;

--noome maior
SELECT *
FROM alunos
WHERE LENGTH(nome) = (
    SELECT MAX(LENGTH(nome)) FROM alunos
);

--nome menor
SELECT *
FROM alunos
WHERE LENGTH(nome) = (
    SELECT MIN(LENGTH(nome)) FROM alunos
);

-- exemplo tiago
SELECT nome
FROM alunos
WHERE LENGTH(nome) = (SELECT MAX(LENGTH(nome)) FROM alunos)
   OR nome = (
       SELECT nome
       FROM alunos
       ORDER BY LENGTH(nome) ASC
       LIMIT 1
   );

CREATE VIEW view_maior_menor_nome AS
SELECT
    (SELECT nome FROM alunos ORDER BY LENGTH(nome) DESC LIMIT 1) AS maior_nome,
    (SELECT nome FROM alunos ORDER BY LENGTH(nome) ASC LIMIT 1) AS menor_nome;

select * from view_maior_menor_nome;

