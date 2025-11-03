-- QYERYS (FILTROS)

-- busca de dados textuais
SELECT * FROM customers 
WHERE country = 'France';

-- busca dados numericos 
SELECT * FROM products
WHERE units_in_stock = 0;

-- busca operadores logicos 
SELECT * FROM products
WHERE unit_price >= 53;

-- buscar com (OR)
SELECT * FROM products
WHERE init_price  <= 53 AND unit_price >=90;


-- buscar com (OR)
SELECT * FROM products
WHERE init_price  <= 53 OR unit_price >=90;

-- buscar por data
SELECT * FROM products
WHERE order_data >= '1988-01-01';

-- QUERYS (AND E OR)
--buscas de dados textuais com (AND)
SELECT * FROM customers
WHERE contact_title = 'Owner' AND country = 'France';


-- buscar de dados testuais com (OR)
SELECT * FROM customers 
WHERE country = 'Mexico' OR country = 'France';