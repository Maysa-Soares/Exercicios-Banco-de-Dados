--Query, criação da Database--
Create database PizzasQuadradas

-- Tabela CLIENTE
CREATE TABLE cliente (
    cliente_id SERIAL PRIMARY KEY,
    telefone VARCHAR(15),
    nome VARCHAR(100),
    logradouro VARCHAR(100),
    numero DECIMAL(5,0),
    complemento VARCHAR(50),
    bairro VARCHAR(30),
	cidade VARCHAR(30),
	estado VARCHAR(2),
	cep DECIMAL(8,0),
    referencia VARCHAR(30)
);