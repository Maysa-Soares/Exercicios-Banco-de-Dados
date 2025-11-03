
-- Criação da tabela Pedido
CREATE TABLE pedido (
    id_pedido SERIAL PRIMARY KEY,             
    valor NUMERIC(4,2),          
    data TIMESTAMP,               
    telefone VARCHAR(15)
);