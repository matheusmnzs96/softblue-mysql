-- Pratica de insercao de dados

USE curso_sql;

INSERT INTO funcionarios (id, nome, salario, departamento) VALUES(1, 'FERNANDO', 1400, 'TI');
INSERT INTO funcionarios (nome, salario, departamento) VALUES('FERNANDO', 1400, 'TI');

UPDATE funcionarios SET nome = 'GUILHERME' WHERE id = 2;
UPDATE funcionarios SET salario = 2500, departamento = 'JURIDICO' WHERE id = 2;

INSERT INTO funcionarios (nome, salario, departamento) VALUES('FABIO', 1700, 'TI');
INSERT INTO funcionarios (nome, salario, departamento) VALUES('JOSE', 1800, 'MARKETING');
INSERT INTO funcionarios (nome, salario, departamento) VALUES('ISABELA', 2200, 'JURIDICO');


SELECT * FROM funcionarios; -- exibe todos os campos da tabela

SELECT * FROM funcionarios WHERE salario > 2000; -- filtra somente os funcionarios com salario maior que 2000
SELECT nome FROM funcionarios WHERE nome = 'GUILHERME'; -- filtra somente o nome do guilherme
SELECT * FROM funcionarios WHERE nome = 'GUILHERME'; -- filtra todos os campos relacionados ao guilherme

-- aumentando somente o salario do fernando em 10%
UPDATE funcionarios SET salario = salario * 1.1 WHERE id = 1;

 -- ! liberando a atualização dos dados da tabela sem precisar informar o ID !
SET SQL_SAFE_UPDATES = 0;

-- aumentando o salario de todos os funcionarios em 10%
UPDATE funcionarios SET salario = salario * 1.1;

/*  como é double entao eu posso utilizar o comando ROUND para arredondar o valor para 2 casas decimais:
    ROUND(valor, num_casas)  */
UPDATE funcionarios SET salario = ROUND(salario * 1.1, 2);

DELETE FROM funcionarios WHERE id = 4; -- deletando os dados do JOSE


-- inserindo dados na tabela veiculos. *OBS: funcionario_id é FK (chave estrangeira)
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Carro', 'SB-0001');
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Carro', 'SB-0002');

UPDATE veiculos SET funcionario_id = 5 WHERE id = 2; -- mudando o dono do veiculo id 2 para o funcionario id 5

SELECT * FROM veiculos; -- visualizando a tabela

-- insercao de dados na tabela salario
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Jr', 1000, 2000);
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Pleno', 2000, 4000);

SELECT * FROM salarios;

-- exemplo de uniao de tabelas usando o comando 'union'
SELECT * from funcionarios WHERE nome = 'GUILHERME' 
UNION 
SELECT * from veiculos WHERE id = 1;















