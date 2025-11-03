
-- Tabela CLIENTE
CREATE TABLE Cliente (
 cliente_id SERIAL PRIMARY KEY,
 telefone VARCHAR(15),
 nome VARCHAR(100),
 logradouro VARCHAR(100),
 numero INTEGER,
 complemento VARCHAR(50),
 bairro VARCHAR(30),
 referencia VARCHAR(30)
);

-- Tabela PIZZA
CREATE TABLE pizza (
 pizza_id SERIAL PRIMARY KEY,
 nome VARCHAR(30),
 descricao VARCHAR(30),
 valor DECIMAL(4 , 2 )
);

-- Tabela PEDIDO
CREATE TABLE pedido (
 pedido_id SERIAL PRIMARY KEY,
 cliente_id INTEGER,
 data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 valor DECIMAL(4 , 2 )
);

-- Tabela ITEM_PEDIDO
CREATE TABLE item_pedido (	
 item_pedido_id SERIAL PRIMARY KEY,
 pedido_id INTEGER,
 pizza_id INTEGER,
 quantidade DECIMAL(2 , 0 ),
 valor DECIMAL(5 , 2 )
);

-- Consultar TABELA
SELECT * FROM pizza;


--alterar tipo-definiçao
-- ALTERAR TIPO-DEFINIÇÃO (COLUNA)
ALTER TABLE pizza 
ALTER COLUMN descricao TYPE VARCHAR(100),
ALTER COLUMN descricao SET NOT NULL,
ALTER COLUMN descricao SET DEFAULT 'MOLHO, TOMATE, AZEITONA';

-- TESTANDO DEFAULT da TABELA (PIZZA)
-- 1 Inserindo pizzas com descrição
INSERT INTO pizza (nome, descricao, valor) VALUES
('Peperoni', DEFAULT, 55.00),
('Especial da Casa', 'MOLHO, QUEIJO, PALMITO', 45.00),
('Mexicana', 'MOLHO, QUEIJO, PIMENTA, CARNE', 41.50);

-- 2 Inserindo pizzas sem descrição
INSERT INTO pizza (nome, valor) VALUES 
('Margherita', 35.90),
('Calabresa', 32.50),
('Quatro Queijos', 38.00);

-- CONSULTANDO TABELA
SELECT * FROM pizza;

-- 3 Inserindo pizzas usando CONCAT + valor de DEFAULT
INSERT INTO pizza (nome, descricao, valor)
VALUES (
    'Cinco Queijos',
    CONCAT('QUEIJO MUÇARELA, PROVOLONE, PARMESÃO, GORGONZOLA, ', 'MOLHO, TOMATE, AZEITONA'),
    59.90
);

-- ADD CONSTRAINTS (FK)
ALTER TABLE pedido
ADD CONSTRAINT cliente_id
FOREIGN KEY (cliente_id)
REFERENCES cliente(cliente_id);

-- CONSULTANDO TABELA
SELECT * FROM pedido;

-- Conferindo CONSTRAINTS no PSQL
\d pedido
\d item_pedido


-- QUERYS para alteração de TABELAS
--Altera o nome da tabela "Cliente" para "clientes"
ALTER TABLE clintes RENAME TO clientes;
ALTER TABLE pizza RENAME TO pizzas;
ALTER TABLE pedido RENAME TO pedidos;
ALTER TABLE item_pedido RENAME TO item_pedidos;


--altera o nome da coluna "nome" para "primero_nome" na tabela "clientes"
ALTER TABLE clientes RENAME COLUMN nome TO primeiro_nome;

--altera uma nova coluna  "ultimoo_nome" na tabela "clientes"
ALTER TABLE clientes ADD COLUMN ultimo_nome VARCHAR(30);

--Alterar tipo da coluna quantidade da tabela item_pedido
ALTER TABLE item_pedidos ALTER COLUMN quantidade TYPE DECIMAL(3,0);

-- comandos para ALTERAÇAO 
-- aDD CONSTRAINT (FK)
ALTER TABLE pedido
ADD CONSTRAINT cliente_id
FOREIGN KEY (cliente_id)
REFERENCES cliente(cliente_id);

--TORNAR A COLUNA ID COMO CHAVE PRIMARIA
alter table clientes ADD PRIMARY KEY (cliente_id);

--segunda feira dia 14?04/25 --- fim
