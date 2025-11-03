-- Criação da tabela contem_pizzas_do_pedido
CREATE TABLE contem_pizzas_do_pedido (
	id_pizzapedido SERIAL PRIMARY KEY,     
    id_pedido INT,            
    quantidade NUMERIC(3,0),         
    valor NUMERIC(5,2),               
    CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) 
);