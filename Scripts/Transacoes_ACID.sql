USE curso_sql;

-- visualizar mecanismos de armazenamento
SHOW ENGINES;

CREATE TABLE contas_bancarias(
	
    id int unsigned not null auto_increment,
    titular varchar(45) not null,
    saldo double not null,
    PRIMARY KEY (id)

) engine = InnoDB; -- InnoDB suporta transacoes

INSERT INTO contas_bancarias (titular, saldo) VALUES
	('André', 1000),
	('Carlos', 2000);
    
SELECT * FROM contas_bancarias;

-- utilizando transacoes:
START TRANSACTION; -- iniciando transacao

-- transferindo saldo bancario de uma conta à outra:
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;

ROLLBACK; -- cancelando transacao
-- 'COMMIT' : efetua transacao











