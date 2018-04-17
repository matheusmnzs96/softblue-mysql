USE exercicios;

SELECT * FROM curso;
SELECT * FROM tipo;
SELECT * FROM instrutor;
SELECT * FROM pedido;
SELECT * FROM pedido_detalhe;
SELECT * FROM aluno;

/*  
	*IMPORTANTE: sempre fazer um join primeiro com as duas tabelas que possuem os campos selecionados em comum, e posteriormente poderá utilizar
os campos que fazem parte e se relacionam com essas tabelas.

*/

-- Exiba uma lista com os títulos dos cursos da Softblue e o tipo de curso ao lado;
SELECT curso.curso, tipo.tipo FROM curso INNER JOIN tipo ON curso.tipo_cod = tipo.codigo;

-- Exiba uma lista com os títulos dos cursos da Softblue, tipo do curso, nome do instrutor responsável pelo mesmo e telefone;
SELECT curso.curso, tipo.tipo, instrutor.instrutor, instrutor.telefone FROM
curso INNER JOIN tipo ON curso.tipo_cod = tipo.codigo
INNER JOIN instrutor ON curso.instrutor_cod = instrutor.codigo;

-- Exiba uma lista com o código e data e hora dos pedidos e os códigos dos cursos de cada pedido;
SELECT pedido.codigo, pedido.datahora, pedido_detalhe.curso_cod FROM
pedido_detalhe INNER JOIN pedido ON pedido_detalhe.pedido_cod = pedido.codigo;

-- Exiba uma lista com o código e data e hora dos pedidos e os títulos dos cursos de cada pedido;
SELECT pedido.codigo, pedido.datahora, curso.curso FROM
pedido_detalhe INNER JOIN pedido ON pedido_detalhe.pedido_cod = pedido.codigo
INNER JOIN curso ON pedido_detalhe.curso_cod = curso.codigo;

-- Exiba uma lista com o código e data e hora dos pedidos, nome do aluno e os títulos dos cursos de cada pedido;
SELECT pedido.codigo, pedido.datahora, aluno.aluno, curso.curso FROM
pedido INNER JOIN pedido_detalhe ON pedido_detalhe.pedido_cod = pedido.codigo
INNER JOIN curso ON pedido_detalhe.curso_cod = curso.codigo
INNER JOIN aluno ON pedido.aluno_cod = aluno.codigo;


-- EXERCICIOS COM VISÕES (VIEWS) ----- 

-- Crie uma visão que traga o título e preço somente dos cursos de programação da Softblue;
CREATE VIEW tipo_programacao_view AS
SELECT curso.curso, curso.valor FROM
curso INNER JOIN tipo ON curso.tipo_cod = tipo.codigo WHERE tipo = 'Programação';

SELECT * FROM tipo_programacao_view;

-- Crie uma visão que traga os títulos dos cursos, tipo do curso e nome do instrutor;
CREATE VIEW instrutor_view AS
SELECT curso.curso AS 'título do curso', tipo.tipo AS 'tipo do curso', instrutor.instrutor AS 'instrutor do curso' FROM
curso INNER JOIN tipo ON curso.tipo_cod = tipo.codigo
INNER JOIN instrutor ON curso.instrutor_cod = instrutor.codigo;

SELECT * FROM instrutor_view;

-- Crie uma visão que exiba os pedidos realizados, informando o nome do aluno, data e código do pedido;
CREATE VIEW pedidos_view AS
SELECT aluno.aluno AS 'nome do aluno', pedido.datahora AS 'data e hora do pedido', pedido.codigo AS 'codigo do pedido' FROM
pedido INNER JOIN aluno ON pedido.aluno_cod = aluno.codigo;

SELECT * FROM pedidos_view;




-- ---- * AVALIAÇÃO DO MODULO 5 --------------------------

/* 

CREATE TABLE instrutores(

	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    PRIMARY KEY (id)

);

CREATE TABLE cursos(

	id int unsigned not null auto_increment,
    ins_id int unsigned,
    titulo varchar(20) not null,
    PRIMARY KEY (id),
    FOREIGN KEY (ins_id) REFERENCES instrutores (id)

);

SELECT * FROM instrutores;
SELECT * FROM cursos;

INSERT INTO instrutores (nome) VALUES ('André');
INSERT INTO instrutores (nome) VALUES ('Carlos');
INSERT INTO instrutores (nome) VALUES ('Samuel');
INSERT INTO instrutores (nome) VALUES ('Fábio');

INSERT INTO cursos (ins_id, titulo) VALUES (1, 'Java');
INSERT INTO cursos (ins_id, titulo) VALUES (null, 'Php');
INSERT INTO cursos (ins_id, titulo) VALUES (1, 'MySQL');
INSERT INTO cursos (ins_id, titulo) VALUES (3, 'SQL');
INSERT INTO cursos (ins_id, titulo) VALUES (2, 'C++');

SELECT * FROM INSTRUTORES RIGHT JOIN CURSOS ON INSTRUTORES.NOME = CURSOS.TITULO;

SELECT * FROM INSTRUTORES LEFT JOIN CURSOS ON INSTRUTORES.ID = CURSOS.INS_ID;

*/


