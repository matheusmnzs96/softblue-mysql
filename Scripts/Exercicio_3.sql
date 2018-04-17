CREATE DATABASE exercicios;

USE exercicios;

CREATE TABLE tipo(

	codigo int unsigned not null auto_increment,
    tipo varchar(32) not null,
    PRIMARY KEY (codigo)
	
);

CREATE TABLE instrutor(

	codigo int unsigned not null auto_increment,
    instrutor varchar(64) not null,
    telefone varchar(12) default null,
    PRIMARY KEY (codigo)

);

CREATE TABLE curso(

	codigo int unsigned not null auto_increment,
    curso varchar(64) not null,
    tipo_cod int unsigned not null,
    instrutor_cod int unsigned not null,
    PRIMARY KEY (codigo),
    FOREIGN KEY (tipo_cod) REFERENCES tipo (codigo),
    FOREIGN KEY (instrutor_cod) REFERENCES instrutor (codigo)

);
-- ! inseri a coluna 'valor' na tabela 'curso'
ALTER TABLE curso ADD valor double not null;

CREATE TABLE aluno(

	codigo int unsigned not null auto_increment,
    aluno varchar(64) not null,
    endereco varchar(230) not null,
    email varchar(128) not null,
    PRIMARY KEY (codigo)

);

ALTER TABLE tipo MODIFY tipo varchar(32);
ALTER TABLE instrutor MODIFY instrutor varchar(64);
ALTER TABLE instrutor MODIFY telefone varchar(12);
ALTER TABLE curso MODIFY curso varchar(64);

CREATE TABLE pedido(

	codigo int unsigned not null auto_increment,
    aluno_cod int unsigned not null,
    datahora datetime not null,
    PRIMARY KEY (codigo),
    FOREIGN KEY (aluno_cod) REFERENCES aluno (codigo)

);

CREATE TABLE pedido_detalhe(

	pedido_cod int unsigned not null,
    curso_cod int unsigned not null,
    valor double not null,
    FOREIGN KEY (pedido_cod) REFERENCES pedido (codigo),
    FOREIGN KEY (curso_cod) REFERENCES curso (codigo)

);

CREATE INDEX fk_tipo ON curso (tipo_cod);
CREATE INDEX fk_instrutor ON curso (instrutor_cod);
CREATE INDEX fk_aluno ON pedido (aluno_cod);
CREATE INDEX fk_pedido ON pedido_detalhe (pedido_cod);
CREATE INDEX fk_curso ON pedido_detalhe (curso_cod);

ALTER TABLE aluno ADD data_nascimento varchar(10) not null;
ALTER TABLE aluno CHANGE COLUMN data_nascimento nascimento date not null;

CREATE INDEX alunos ON aluno (aluno);

ALTER TABLE instrutor ADD email varchar(100) not null;
ALTER TABLE instrutor DROP email; 