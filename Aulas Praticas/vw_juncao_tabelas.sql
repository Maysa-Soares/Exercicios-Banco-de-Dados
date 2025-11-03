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
	

-- Inserindo apresentações sem comentários (NULL)
INSERT INTO apresentacoes (aluno_id, apresentou) 
VALUES
    (8, false),
    (14, true);

--alterar pra ter sobrenome e nacionalidade                                                 
ALTER TABLE alunos
ADD COLUMN sobrenome VARCHAR(100),
ADD COLUMN nacionalidade VARCHAR(50) DEFAULT 'Brasileira';


--atualizar pra ter o sobrenome
UPDATE alunos
SET sobrenome = split_part(nome, ' ', 2)
WHERE sobrenome IS NULL;


SELECT * FROM alunos;

-- tarefa alunoocptm
-- Atualiza nome e sobrenome
UPDATE alunos
SET
    nome = INITCAP(nome),
    sobrenome = INITCAP(sobrenome);

--criar view
-- vw_correcao_nomes.sql
CREATE OR REPLACE VIEW vw_correcao_nomes AS
SELECT
    aluno_id,
    INITCAP(nome) AS nome_corrigido,
    INITCAP(sobrenome) AS sobrenome_corrigido,
    sexo,
    nacionalidade
FROM alunos;

SELECT * FROM  vw_correcao_nomes;

--tarefa 7
-- View que junta alunos com suas apresentações
CREATE OR REPLACE VIEW vw_juncao_tabelas AS
SELECT
    a.aluno_id,
    INITCAP(a.nome) AS nome,
    INITCAP(a.sobrenome) AS sobrenome,
    a.sexo,
    a.nacionalidade,
    ap.apresentacao_id,
	ap.aluno_id as fk_aluno_id,
    ap.tema,
    ap.apresentou,
    ap.comentario
FROM
    alunos a
LEFT JOIN apresentacoes ap ON a.aluno_id = ap.aluno_id;

SELECT * FROM vw_juncao_tabelas;