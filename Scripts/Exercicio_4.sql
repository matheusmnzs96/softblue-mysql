USE exercicios;

-- inserção de dados tabela tipo
INSERT INTO tipo (tipo) VALUES ('Banco de dados');
INSERT INTO tipo (tipo) VALUES ('Programação');
INSERT INTO tipo (tipo) VALUES ('Modelagem de dados');

SELECT * FROM tipo; -- visualizando a tabela 'tipo'

-- inserção de dados tabela instrutor
INSERT INTO instrutor (instrutor, telefone) VALUES ('André Milani', '1111-1111');
INSERT INTO instrutor (instrutor, telefone) VALUES ('Carlos Tosin', '1211-1212');

SELECT * FROM instrutor;

-- as demais inserções de dados a seguir:

INSERT INTO curso (curso, tipo_cod, instrutor_cod, valor) VALUES ('Java Fundamentos', 2, 2, 270);
INSERT INTO curso (curso, tipo_cod, instrutor_cod, valor) VALUES ('Java Avançado', 2, 2, 330);
INSERT INTO curso (curso, tipo_cod, instrutor_cod, valor) VALUES ('SQL Completo', 1, 1, 170);
INSERT INTO curso (curso, tipo_cod, instrutor_cod, valor) VALUES ('Php Básico', 2, 1, 270);

SELECT * FROM curso;

INSERT INTO aluno (aluno, endereco, email, nascimento) VALUES ('José', 'Rua XV de Novembro 72', 'jose@softblue.com.br', '1996-12-16');
INSERT INTO aluno (aluno, endereco, email, nascimento) VALUES ('Wagner', 'Av. Paulista', 'wagner@softblue.com.br', '1998-07-31');
INSERT INTO aluno (aluno, endereco, email, nascimento) VALUES ('Emílio', 'Rua Lajes 103, ap: 701', 'emilio@softblue.com.br', '1999-9-9');
INSERT INTO aluno (aluno, endereco, email, nascimento) VALUES ('Cris', 'Rua Tauney 22', 'cris@softblue.com.br', '1995-10-5');
INSERT INTO aluno (aluno, endereco, email, nascimento) VALUES ('Regina', 'Rua Salles 305', 'regina@softblue.com.br', '1985-4-13');
INSERT INTO aluno (aluno, endereco, email, nascimento) VALUES ('Fernando', 'Av. Central 30', 'fernando@softblue.com.br', '1992-11-23');

SELECT * FROM aluno;

INSERT INTO pedido (aluno_cod, datahora) VALUES (2, '2010-4-15 11:23:32');
INSERT INTO pedido (aluno_cod, datahora) VALUES (2, '2010-4-15 14:36:21');
INSERT INTO pedido (aluno_cod, datahora) VALUES (3, '2010-4-16 11:17:45');
INSERT INTO pedido (aluno_cod, datahora) VALUES (4, '2010-4-17 14:27:22');
INSERT INTO pedido (aluno_cod, datahora) VALUES (5, '2010-4-18 11:18:19');
INSERT INTO pedido (aluno_cod, datahora) VALUES (6, '2010-4-19 13:47:35');
INSERT INTO pedido (aluno_cod, datahora) VALUES (6, '2010-4-20 18:13:44');

SELECT * FROM pedido;

INSERT INTO pedido_detalhe (pedido_cod, curso_cod, valor) VALUES (1, 1, 270);
INSERT INTO pedido_detalhe (pedido_cod, curso_cod, valor) VALUES (1, 2, 330);
INSERT INTO pedido_detalhe (pedido_cod, curso_cod, valor) VALUES (2, 1, 270);
INSERT INTO pedido_detalhe (pedido_cod, curso_cod, valor) VALUES (2, 2, 330);
INSERT INTO pedido_detalhe (pedido_cod, curso_cod, valor) VALUES (2, 3, 170);
INSERT INTO pedido_detalhe (pedido_cod, curso_cod, valor) VALUES (3, 4, 270);
INSERT INTO pedido_detalhe (pedido_cod, curso_cod, valor) VALUES (4, 2, 330);
INSERT INTO pedido_detalhe (pedido_cod, curso_cod, valor) VALUES (4, 4, 270);
INSERT INTO pedido_detalhe (pedido_cod, curso_cod, valor) VALUES (5, 3, 170);
INSERT INTO pedido_detalhe (pedido_cod, curso_cod, valor) VALUES (6, 3, 170);
INSERT INTO pedido_detalhe (pedido_cod, curso_cod, valor) VALUES (7, 4, 270);

SELECT * FROM pedido_detalhe;

-- * abaixo, pratica com select:
-- exercicio 2

SELECT * FROM aluno;
SELECT curso FROM curso;
SELECT curso, valor FROM curso WHERE valor > 200;
SELECT curso, valor FROM curso WHERE valor BETWEEN 200 AND 300;
SELECT * FROM pedido WHERE datahora BETWEEN '2010-04-15' AND '2010-04-19';
SELECT * FROM pedido WHERE date(datahora) = '2010-04-15';

-- exercicio 3

SELECT * FROM aluno;

UPDATE aluno SET endereco = 'Av. Brasil 778' WHERE codigo = 1;
UPDATE aluno SET email = 'cristiano@softblue.com.br' WHERE codigo = 4;

SET SQL_SAFE_UPDATES = 0;
UPDATE curso SET valor = valor * 1.1 WHERE valor < 300;

SELECT * FROM curso;

UPDATE curso SET valor = ROUND(valor * 1.1, 2) WHERE valor < 300;
UPDATE curso SET curso = 'Php fundamentos' WHERE codigo = 4;
