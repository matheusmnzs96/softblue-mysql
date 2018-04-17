-- URI Online Judge SQL
-- Copyright URI Online Judge
-- www.urionlinejudge.com.br
-- Problem 2609

CREATE DATABASE URI_Online_Judge;

USE URI_Online_Judge;

CREATE TABLE categories (
  id int unsigned not null auto_increment,
  name varchar(50),
  PRIMARY KEY (id)
);

CREATE TABLE products (
  id int unsigned not null auto_increment,
  name varchar(50),
  amount int not null,
  price double not null,
  id_categories int unsigned,
  FOREIGN KEY (id_categories) REFERENCES categories (id),
  PRIMARY KEY (id)
);

INSERT INTO categories (id, name) VALUES 
(1,	'wood'),
(2,	'luxury'),
(3,	'vintage'),
(4,	'modern'),
(5,	'super luxury');
  
INSERT INTO products (id, name, amount, price, id_categories) VALUES 
(1,	'Two-doors wardrobe', 100,	800,	1),
(2,	'Dining table',	1000,	560,	3),
(3,	'Towel holder',	10000,	25.50,	4),
(4,	'Computer desk',	350,	320.50,	2),
(5,	'Chair',	3000,	210.64,	4),
(6,	'Single bed',	750,	460,	1);

  /*  Execute this query to drop the tables */
  -- DROP TABLE categories,products; --
  
SELECT * FROM products;
SELECT * FROM categories;

/*
	Como de costume o setor de vendas está fazendo uma análise de quantos produtos temos em estoque, e você poderá ajudar eles.
	Então seu trabalho será exibir o nome e a quantidade de produtos de cada uma categoria:
*/
-- solução:
SELECT categ.name as 'Name', SUM(prod.amount) as 'Sum' FROM 
products prod JOIN categories categ
ON prod.id_categories = categ.id
GROUP BY categ.name;

SELECT ROUND(AVG(price), 2) as 'Média prices' FROM products;


-- *!!! EXEMPLO DE UMA ID(PK) QUE NAO APARECE NO CAMPO ID(FK) DA OUTRA TABELA, usando in / not in
SELECT * FROM categories categ
WHERE categ.id 
NOT IN (SELECT prod.id_categories FROM products prod);

