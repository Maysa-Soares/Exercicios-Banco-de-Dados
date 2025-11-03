CREATE TABLE clientes (
    id_cliente INT,
    nome_cliente VARCHAR(100) NOT NULL,
    telefone_cliente NUMERIC(11, 0) UNIQUE NOT NULL,
    bairro_cliente VARCHAR(100) NOT NULL,
    rua_cliente VARCHAR(100) NOT NULL,
    numcasa_cliente INT NOT NULL,
	
	PRIMARY KEY(id_cliente)
);


CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    telefone_cliente NUMERIC(11, 0) NOT NULL,
    datahora_pedido TIMESTAMP NOT NULL,
    valor_pedido NUMERIC(10, 2) NOT NULL,
    bairro_cliente VARCHAR(100) NOT NULL,
    rua_cliente VARCHAR(100) NOT NULL,
    numcasa_cliente INT NOT NULL,
    formapag_pedido VARCHAR(100) NOT NULL,
    qtd_pedido INT NOT NULL,

    FOREIGN KEY (telefone_cliente) REFERENCES clientes(telefone_cliente)
);


CREATE TABLE pizza(
	id_pizza INT,
	nome_pizza VARCHAR(100) NOT NULL,
	valor_pizza NUMERIC(10, 2) NOT NULL,

	PRIMARY KEY(id_pizza)
	);

CREATE TABLE pedidopizza(
	 id_pizza INT,
	 id_pedido INT,

	FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
	FOREIGN KEY (id_pizza) REFERENCES pizza(id_pizza)
);
	
SELECT * FROM clientes;
SELECT * FROM pedidos;
SELECT * FROM pizza;
SELECT * FROM pedidopizza;

CREATE DATABASE atividade;