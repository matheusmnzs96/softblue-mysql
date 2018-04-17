USE curso_sql;

-- visualizacao das tabelas
SELECT * FROM funcionarios;
SELECT * FROM veiculos;

-- inner join
SELECT * FROM funcionarios func INNER JOIN veiculos veic ON veic.funcionario_id = func.id;

-- left join: exibe os dados da tabela esquerda (funcionarios) que satisfazem a condição
SELECT * FROM funcionarios func LEFT JOIN veiculos veic ON veic.funcionario_id = func.id;

-- rigth join: exibe os dados da tabela direita (veiculos) que satisfazem a condição
SELECT * FROM funcionarios func RIGHT JOIN veiculos veic ON veic.funcionario_id = func.id;

INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (null, 'Moto', 'SB-OOO3');
UPDATE veiculos SET placa = 'SB-0003' WHERE id = 3;

/* 
  O MySQL nao possui o comando 'full join'. Desse modo podemos utilizar o comando 'UNION' para 
  unir os comandos de 'left join' e 'right join'. Segue exemplo:
*/
SELECT * FROM funcionarios func LEFT JOIN veiculos veic ON veic.funcionario_id = func.id
UNION
SELECT * FROM funcionarios func RIGHT JOIN veiculos veic ON veic.funcionario_id = func.id;

-- criação da tabela de CPF que se relaciona com os funcionarios
CREATE TABLE cpfs(

	id int unsigned not null,
    cpf varchar(14) not null,
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)

);

SELECT * FROM funcionarios;
SELECT * FROM cpfs; -- visualizando a tabela

INSERT INTO cpfs (id, cpf) VALUES (1, '111.111.111-11');
INSERT INTO cpfs (id, cpf) VALUES (2, '222.222.222-22');
INSERT INTO cpfs (id, cpf) VALUES (3, '333.333.333-33');
INSERT INTO cpfs (id, cpf) VALUES (5, '555.555.555-55');

-- inner join
SELECT * FROM funcionarios INNER JOIN cpfs ON funcionarios.id = cpfs.id;

-- * EQUI JOIN (* é obrigatório o campo chave das duas tabelas terem o mesmo nome)
SELECT * FROM funcionarios JOIN cpfs USING (id);

CREATE TABLE clientes(

	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    quem_indicou int unsigned,
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)

);

INSERT INTO clientes (nome, quem_indicou) VALUES ('André', null);
INSERT INTO clientes (nome, quem_indicou) VALUES ('Samuel', 1);
INSERT INTO clientes (nome, quem_indicou) VALUES ('Carlos', 2);
INSERT INTO clientes (nome, quem_indicou) VALUES ('Rafael', 1);

SELECT * FROM clientes;

-- * Exemplo do uso de SELF JOIN
SELECT a.nome as cliente, b.nome as 'quem indicou' FROM clientes a JOIN clientes b ON a.quem_indicou = b.id;

-- Criando uma Visão (Creat View)
CREATE VIEW funcionarios_view AS SELECT * FROM funcionarios WHERE salario > 1700;

-- exibindo a view:
SELECT * FROM funcionarios_view;






