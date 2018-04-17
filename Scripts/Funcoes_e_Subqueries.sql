USE curso_sql;

SELECT * FROM funcionarios;

-- count() retorna o numero de registros na tabela:
SELECT COUNT(*) FROM funcionarios;
SELECT COUNT(*) FROM funcionarios WHERE salario > 2000; -- retorna o numero de registros que possui o salario  maior que 2000
SELECT COUNT(*) FROM funcionarios WHERE salario > 1600 AND departamento = 'JURIDICO'; -- e agora que trabalhe no setor juridico

-- sum() retorna a soma dos registros do campo informado:
SELECT SUM(salario) FROM funcionarios;
SELECT SUM(salario) FROM funcionarios WHERE departamento = 'TI'; -- dos que trabalham na T.I

-- avg() retorna a média dos registros do campo informado:
SELECT AVG(salario) FROM funcionarios;
SELECT AVG(salario) FROM funcionarios WHERE departamento = 'TI'; -- dos que trabalham na T.I

-- max() retorna o maior valor entre os registros do campo informado:
SELECT MAX(salario) FROM funcionarios; -- maior salario
SELECT MAX(salario) FROM funcionarios WHERE departamento = 'TI'; -- da T.I

-- min() retorna o menor valor entre os registros do campo informado:
SELECT MIN(salario) FROM funcionarios; -- menor salario
SELECT MIN(salario) FROM funcionarios WHERE departamento = 'TI'; -- da T.I

-- distinct() retorna registros não repetidos:
SELECT DISTINCT(departamento) FROM funcionarios;

-- order by retorna registros ordenados pelo campo informado:
SELECT * FROM funcionarios ORDER BY nome; -- nesse caso em ordem alfabetica dos 'nomes' (asc)
SELECT * FROM funcionarios ORDER BY nome DESC; -- em ordem decrescente

SELECT * FROM funcionarios ORDER BY salario; -- ordenado pelo salario
SELECT * FROM funcionarios ORDER BY departamento; -- ordenado pelo departamento

-- ordena primeiramente os departamentos e logo em seguida pelo salario de cada departamento (asc):
SELECT * FROM funcionarios ORDER BY departamento, salario;
SELECT * FROM funcionarios ORDER BY departamento, salario DESC; -- pelo salario mais alto (decrescente)

SELECT * FROM funcionarios;

-- 'limit n' retorna os n primeiros registros da tabela
SELECT * FROM funcionarios LIMIT 2;

-- os dois selects abaixo fazem a mesma coisa: Pula o primeiro registro e exibe os dois próximos
SELECT * FROM funcionarios LIMIT 2 OFFSET 1;
											
										-- '1' representa quantos registros pular. Já o '2' depois da vírgula é o numero de
SELECT * FROM funcionarios LIMIT 1, 2;	--  registros que será exibido.

-- group by agrupa os registros pelo campo informado
SELECT departamento, AVG(salario) AS 'média salarial do departamento' FROM funcionarios GROUP BY departamento;

-- group by com a função 'having' que funciona como um 'where' de agrupamentos
SELECT departamento, AVG(salario) AS 'média salarial do departamento' FROM funcionarios
GROUP BY departamento HAVING AVG(salario) > 2000;

-- retorna o numero de funcionários de cada departamento
SELECT departamento, COUNT(*) FROM funcionarios GROUP BY departamento;

-- exemplo de subqueries - IN / NOT IN:
SELECT nome FROM funcionarios WHERE departamento IN('JURIDICO');

-- retorna o nome dos funcionarios e seus salarios cujo departamento tem média salarial maior que 2000
SELECT nome, salario FROM funcionarios WHERE departamento
IN(
	SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000
);


