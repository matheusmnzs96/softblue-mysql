USE curso_sql;

-- tabela de pedidos
CREATE TABLE pedidos(
	id int unsigned not null auto_increment,
    descricao varchar(100) not null,
    valor double not null default '0',
    pago varchar(3) not null default 'Não',
    PRIMARY KEY (id)
);

INSERT INTO pedidos (descricao, valor) VALUES	
		('TV', 3000),
		('Geladeira', 1400),
        ('DVD Player', 300);
        
SELECT * FROM pedidos;

CALL limpa_pedidos(); -- chamando procedure

-- tabela de estoques
CREATE TABLE estoque(
	id int unsigned not null auto_increment,
    descricao varchar(50) not null,
    quantidade int not null,
    PRIMARY KEY (id)
);

-- renomeando coluna da 'estoque'
ALTER TABLE estoque CHANGE quatidade quantidade int not null;

-- criando gatilho para limpar pedidos antes de inserir dados no estoque
CREATE TRIGGER gatilho_limpa_pedidos
BEFORE INSERT
ON estoque
FOR EACH ROW
CALL limpa_pedidos();

-- testando gatilho
INSERT INTO estoque (descricao, quantidade) VALUES
	('Fogão', 5);

SELECT * FROM pedidos;

SELECT * FROM estoque;

