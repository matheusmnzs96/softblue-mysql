/* 
	criando um usuário com senha (identified by):
	CREATE USER 'matheus_menezes'@'210.190.210.190' IDENTIFIED BY 'minhasenha123'; <-- após o '@' é informado o local IP de onde
																				o usuario pode acessar o banco
*/

-- após o '@' é informado a máquina local (localhost) de onde o usuario pode acessar o banco
CREATE USER 'matheus_menezes'@'localhost' IDENTIFIED BY 'minhasenha123';

 /* 
	após o '@' é informado a '%' de onde o usuario pode acessar o banco a partir de qualquer endereço IP
	CREATE USER 'matheus_menezes'@'%' IDENTIFIED BY 'minhasenha123';
 */
 
 -- dando acesso geral 'all' à todas estruturas (*) do banco 'curso_sql' para o usuario 'matheus_menezes'
GRANT ALL ON curso_sql.* TO 'matheus_menezes'@'localhost';
 /* 
  " GRANT 'ação' ON 'estrutura' TO 'usuario' "
 
	Outros exemplos:
	GRANT SELECT ON curso_sql.* TO 'matheus_menezes'@'localhost';  <-- permite apenas o comando select para o usuario
	GRANT INSERT ON curso_sql.* TO 'matheus_menezes'@'localhost';  <-- permite apenas o comando insert para o usuario
 */
 
 
CREATE USER 'matheus_menezes'@'%' IDENTIFIED BY 'minhasenha123';

-- liberando comando select somente na tabela 'funcionarios' para o usuario
GRANT SELECT ON curso_sql.funcionarios TO 'matheus_menezes'@'%';
-- liberando comando de insercao de dados somente na tabela 'funcionarios' para o usuario
GRANT INSERT ON curso_sql.funcionarios TO 'matheus_menezes'@'%';
 
-- Revogando insert do usuario:
REVOKE INSERT ON curso_sql.funcionarios FROM 'matheus_menezes'@'%';
-- Revogando select do usuario:
REVOKE SELECT ON curso_sql.funcionarios FROM 'matheus_menezes'@'%';


GRANT SELECT ON curso_sql.salarios TO 'matheus_menezes'@'%';
GRANT SELECT ON curso_sql.veiculos TO 'matheus_menezes'@'%';

REVOKE SELECT ON curso_sql.veiculos FROM 'matheus_menezes'@'%';
REVOKE SELECT ON curso_sql.salarios FROM 'matheus_menezes'@'%';
 
REVOKE ALL ON curso_sql.* FROM 'matheus_menezes'@'localhost';
 
-- excluindo usuarios: 
DROP USER 'matheus_menezes'@'localhost';
DROP USER 'matheus_menezes'@'%';
 
 
 
CREATE USER 'matheus_menezes'@'%' IDENTIFIED BY 'minhasenha123';
GRANT SELECT ON curso_sql.* TO 'matheus_menezes'@'%';              -- liberando select para todas as tabelas do banco
GRANT INSERT ON curso_sql.funcionarios TO 'matheus_menezes'@'%';   -- liberando insert para a tabela 'funcionarios'

-- Visualizando todos os usuarios registrados no MySQL: 
SELECT User FROM mysql.user;

-- Exibe os privilégios que o usuário possui
SHOW GRANTS FOR 'matheus_menezes'@'%';

-- revogando alteração (update) para todas as tabelas do banco 
REVOKE UPDATE ON curso_sql.* FROM 'matheus_menezes'@'%';  


