/*
 * Curso de Banco de Dados (SoftBlue)
 * Setembro, 2017
 * Aluno: Matheus dos Santos Menezes
 * Manaus - AM, Brasil
 */

CREATE DATABASE curso_sql; -- criando um banco

USE curso_sql; -- SEMPRE executar para avisar ao mysql que estou usando esse banco de dados

CREATE TABLE funcionarios(
	
    id int unsigned not null auto_increment,
    nome varchar(45) not null,
    salario double not null default '0',
    departamento varchar(45) not null,
    PRIMARY KEY (id) -- avisando ao mysql que a coluna 'id' é a chave primária (pk)

);

CREATE TABLE veiculos(

	id int unsigned not null auto_increment,
    funcionario_id int unsigned default null, -- coluna chave estrangeira (fk) que conterá os dados da coluna 'id' da tabela 'funcionarios'
    veiculo varchar(45) not null default '',
    placa varchar(10) not null default '',
    PRIMARY KEY (id),
    CONSTRAINT fk_veiculos_funcionarios FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id)

);

CREATE TABLE salarios(

	faixa varchar(45) not null,
    inicio double not null,
    fim double not null,
	PRIMARY KEY (faixa)

);

ALTER TABLE funcionarios CHANGE COLUMN nome nome_func varchar(45) not null; -- modifica a coluna 'nome' para 'nome_func'
ALTER TABLE funcionarios CHANGE COLUMN nome_func nome varchar(45) not null; -- modifica novamente para 'nome'
ALTER TABLE funcionarios MODIFY nome varchar(50); -- modifica a coluna 'nome' da tabela 'funcionarios' para varchar de tamanho 50
ALTER TABLE funcionarios MODIFY nome varchar(45); -- modifica novamente para varchar(45)

DROP TABLE salarios; -- excluindo a tabela 'salarios'

-- criando o indice 'departamentos' para listar a coluna 'departamento' da tabela 'funcionarios'
CREATE INDEX departamentos ON funcionarios (departamento);

-- listando o 'nome' dos 'funcionarios' pelos 6 primeiros caracteres
CREATE INDEX nomes ON funcionarios (nome(6));

CREATE TABLE salarios(

	faixa varchar(45) not null,
    inicio double not null,
    fim double not null,
	PRIMARY KEY (faixa)

);


