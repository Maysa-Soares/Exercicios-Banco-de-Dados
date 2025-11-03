-- Criação da tabela Pizza
CREATE TABLE pizza (
    id_pizza SERIAL PRIMARY KEY,  
    nome_pizza VARCHAR(30),             
    descricao VARCHAR(100),  
    valor NUMERIC(5,2)      
);