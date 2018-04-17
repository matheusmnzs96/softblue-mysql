USE exercicios;

SELECT * FROM curso;
SELECT * FROM tipo;
SELECT * FROM instrutor;
SELECT * FROM pedido;
SELECT * FROM pedido_detalhe;
SELECT * FROM aluno;

-- Selecione os nomes de todos os alunos que já fizeram alguma matrícula na Softblue, sem repetição;
SELECT DISTINCT(a.aluno) FROM aluno a JOIN pedido p ON p.aluno_cod = a.codigo;

-- Exiba o nome do aluno mais antigo da Softblue;
SELECT DISTINCT(a.aluno) FROM aluno a JOIN pedido p ON p.aluno_cod = a.codigo ORDER BY p.datahora LIMIT 1;

-- Exiba o nome do aluno mais recente da Softblue;
SELECT DISTINCT(a.aluno) FROM aluno a JOIN pedido p ON p.aluno_cod = a.codigo ORDER BY p.datahora DESC LIMIT 1;

-- Exiba o nome do terceiro aluno mais antigo da Softblue;
SELECT DISTINCT(a.aluno) FROM aluno a JOIN pedido p ON p.aluno_cod = a.codigo ORDER BY p.datahora LIMIT 2, 1; -- Ou LIMIT 1 OFFSET 2

-- Exiba a quantidade de cursos que já foram vendidos pela Softblue;
SELECT COUNT(*) FROM pedido_detalhe;

-- Exiba o valor total já arrecadado pelos cursos vendidos pela Softblue;
SELECT SUM(valor) FROM pedido_detalhe;

-- Exiba o valor médio cobrado por curso para o pedido cujo CODIGO é 2;
SELECT AVG(valor) FROM pedido_detalhe WHERE pedido_cod = 2;

-- Exiba o valor do curso mais caro da Softblue;
SELECT MAX(valor) FROM curso;

-- Exiba o valor do curso mais barato da Softblue;
SELECT MIN(valor) FROM curso;

-- Exiba o valor total de cada pedido realizado na Softblue;
SELECT pedido_cod, SUM(valor) AS 'valor total' FROM pedido_detalhe GROUP BY pedido_cod;

-- Exiba os nomes dos instrutores da Softblue e a quantidade de cursos que cada um tem sob sua responsabilidade;
SELECT i.instrutor, COUNT(c.curso) AS 'quantidade de cursos' FROM instrutor i JOIN curso c
ON i.codigo = c.instrutor_cod GROUP BY i.instrutor;


SELECT * FROM curso;
SELECT * FROM tipo;
SELECT * FROM instrutor;
SELECT * FROM pedido;
SELECT * FROM pedido_detalhe;
SELECT * FROM aluno;


-- Exiba o número do pedido, nome do aluno e valor para todos os pedidos realizados na
-- Softblue cujo valor total sejam maiores que 500;
SELECT pd.pedido_cod, a.aluno, SUM(pd.valor) FROM pedido_detalhe pd JOIN pedido p
ON pd.pedido_cod = p.codigo JOIN aluno a ON p.aluno_cod = a.codigo
GROUP BY pd.pedido_cod HAVING SUM(pd.valor) > 500;

-- Exiba o número do pedido, nome do aluno e quantos cursos foram comprados no pedido
-- para todos os pedidos realizados na Softblue que compraram dois ou mais cursos;
SELECT pd.pedido_cod, a.aluno, COUNT(pd.pedido_cod) FROM pedido_detalhe pd JOIN pedido p
ON pd.pedido_cod = p.codigo JOIN aluno a ON p.aluno_cod = a.codigo
GROUP BY pd.pedido_cod HAVING COUNT(pd.pedido_cod) > 1;

-- Exiba o nome e endereço de todos os alunos que morem em Avenidas (Av.);
SELECT aluno, endereco FROM aluno WHERE endereco LIKE 'Av.%';

-- Exiba os nomes dos cursos de Java da Softblue;
SELECT curso FROM curso WHERE curso LIKE '%Java%';

-- Utilizando subquery, exiba uma lista com os nomes dos cursos disponibilizados
-- pela Softblue informando para cada curso qual o seu menor valor de venda já praticado;
SELECT c.curso, (SELECT MIN(pd.valor) FROM pedido_detalhe pd WHERE c.codigo = pd.curso_cod) AS 'menor valor'
FROM curso c;

-- Utilizando subquery e o parâmetro IN, exiba os nomes dos cursos disponibilizados
-- pela Softblue cujo tipo de curso seja 'Programação';
SELECT curso c FROM curso c WHERE c.tipo_cod
IN(
	SELECT t.codigo FROM tipo t WHERE t.tipo = 'Programação'
);

-- Utilizando subquery e o parâmetro EXISTS, exiba novamente os nomes dos cursos
-- disponibilizados pela Softblue cujo tipo de curso seja 'Programação';
SELECT curso.curso FROM curso WHERE
EXISTS(
	SELECT tipo.codigo FROM tipo WHERE curso.tipo_cod = tipo.codigo AND tipo.tipo = 'Programação'
);


SELECT * FROM curso;
SELECT * FROM tipo;
SELECT * FROM instrutor;
SELECT * FROM pedido;
SELECT * FROM pedido_detalhe;
SELECT * FROM aluno;


-- Exiba uma lista com os nomes dos instrutores da Softblue e ao lado o total acumulado
-- das vendas referente aos cursos pelo qual o instrutor é responsável;
SELECT instrutor, (SELECT SUM(pedido_detalhe.valor) FROM pedido_detalhe JOIN curso
ON pedido_detalhe.curso_cod = curso.codigo WHERE curso.instrutor_cod = instrutor.codigo) AS 'total de vendas'
FROM instrutor;

-- Crie uma visão que exiba os nomes dos alunos e quanto cada um já comprou em cursos;
CREATE VIEW compras_alunos_view AS 
SELECT aluno, (SELECT SUM(pedido_detalhe.valor) FROM pedido_detalhe JOIN pedido ON
pedido_detalhe.pedido_cod = pedido.codigo WHERE pedido.aluno_cod = aluno.codigo) AS 'total de compras'
FROM aluno;

SELECT * FROM compras_alunos_view;






