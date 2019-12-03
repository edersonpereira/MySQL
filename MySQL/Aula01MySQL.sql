#1 Criar base de dados
create database apex_aula01;

#2 Selecionar base de dados
use apex_aula01;

#3 Criar tabela
create table clientes(
	codigo int primary key auto_increment,
    nome varchar(30) not null,
	email varchar(40),
    idade int
);

#4 Inserir dados
insert into clientes values(null, "Daniela", "dani@gmail.com", 23);
insert into clientes (nome, idade) values ("Gabriel", 16);
insert into clientes (nome, email, idade) values
("Jéssica", "jessica@gmail.com", 30),
("Luana", "luana@gmail.com", 40),
("Renato", "renato@gmail.com", 21),
("Yuri", "yuri@gmail.com", 14);

#5 Selecionar dados
select * from clientes;
select nome, idade from clientes;

#6 Agrupar dados
select sum(idade) from clientes; #soma de todas as idades.
select avg(idade) from clientes; #divisão da soma total pela quantidade de linhas.
select max(idade) from clientes; #retorna o maior valor
select min(idade) from clientes; #retorna o menor valor
select concat("Registros encontrados: ", count(*)) from clientes; #count: quantidade de linhas, concat: concatenar algo junto.

#7 Condicional
select
	nome,
    idade,
    if(idade >= 18, "Maior de idade", "Menor de idade") as "condicional" #utiliza o "as" para criar um nome para a coluna desejada.
from clientes;

#8 Selecionando dados por linha
select * from clientes where idade <= 18;
select * from clientes where idade <= 18 and email <> ""; 
select * from clientes where idade <= 18 and email is null;
select * from clientes where idade <= 18 and email is not null;  

#9 Data e hora
select now() from clientes;
select now() from clientes limit 1; #limitar quantidade de linhas
select 
	date_format(now(),"%d/%m/%Y") as "Data",
    date_format(now(),"%H:%i") as "Hora"
from clientes limit 1;

#10 Ordenar
select * from clientes order by idade;
select * from clientes order by nome asc; #A-Z
select * from clientes order by nome desc; #Z-A

#11 Filtrar dados
select email from clientes where email like "d%"; #utilizado para procurar que começe com a letra desejada #like significa CONTEM
select email from clientes where email like "%gmail.com"; #procura oque termina com
select email from clientes where email like "%u%"; #procura oque contem em qualquer parte

#12 Atualizar dados
update clientes set email = "gabriel@hotmail.com", idade = 26
where codigo = 2; #sempre lembrar de usar o WHERE para selecionar apenas o desejado.

#13 Habilitar o comando update e delete
set SQL_SAFE_UPDATES = 0;

#13 Remover dados
delete from clientes where email like "%hotmail.com";

#14 Limpar a tabela e reiniciar contagem
truncate clientes;

#15 Remover a tabela
drop table clientes;

#16 Remover base de dados
drop database apex_aula01;