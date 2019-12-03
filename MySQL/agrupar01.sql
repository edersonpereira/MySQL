#1 Base de dados
create database apex_aula01;

#2 Selecionar base
use apex_aula01;

#3 Tabela
create table cursos(
	nome varchar(30),
    categoria varchar(20)
);

#4 Inserir Curso
insert into cursos values
("Java", "Back-End"),
("HTML", "Front-End"),
("C#", "Back-End"),
("PHP", "Back-End"),
("CSS", "Front-End");

#5 Selecionar cursos 
select * from cursos;
select 
	categoria,
    count(*)
from cursos group by categoria; #contar quantidade de cada grupo.
