create database exercicio03;
use exercicio03;
set SQL_SAFE_UPDATES=0;
create table alunos (
	codigo int primary key auto_increment,
    nome varchar(30),
    genero varchar(20),
    nota1 double,
    nota2 double,
    nota3 double
);
insert into alunos values
(null,"Alana","Feminino", 7, 8 , 9.5),
(null,"Brenda","Feminino", 8.5 , 7.3 ,7.7), 
(null,"Gustavo","Masculino", 9, 9.1, 8.6), 
(null,"Júlio","Masculino", 4.5 , 3.9 , 4), 
(null,"Jéssica","Feminino", 7 , 6.8, 7), 
(null,"Lúcia","Feminino", 10 , 9.8 , 10), 
(null,"Rony","Masculino" , 5.6 , 6.3 , 5.9), 
(null,"Tamara","Feminino",7 , 8 , 7.5 ), 
(null,"Guilherme","Masculino", 7 , 7.1 , 7.7), 
(null,"Lorena","Feminino", 4 , 4.5 , 4.4 );
select*from alunos;
select genero, count(genero) from alunos group by genero;
select nome, round((nota1+nota2+nota3)/3,2) as "média" from alunos;
select count(*) from alunos where round((nota1+nota2+nota3)/3,2) >=7;
select nome, nota1,nota2,nota3, round((nota1+nota2+nota3)/3,2) as "média" from alunos where ((nota1+nota2+nota3)/3) = (select max((nota1+nota2+nota3)/3) from alunos);
select nome, nota1,nota2,nota3, round((nota1+nota2+nota3)/3,2) as "média" from alunos where ((nota1+nota2+nota3)/3) = (select min((nota1+nota2+nota3)/3) from alunos);
select nome, if(((nota1+nota2+nota3)/3)>=7,"Aprovado","Reprovado" ) as "situação" from aluno;
update alunos set nome = "Joice" where nome= "Jéssica" ;
select count(*) from alunos where ((nota1+nota2+nota3)/3) >= 7 and genero= "masculino";
select count(*) from alunos where ((nota1+nota2+nota3)/3 between 8 and 9) and (genero="feminino");
select avg(round((nota1+nota2+nota3)/3)) as "média da turma" from alunos;
select nome, round((nota1+nota2+nota3)/3) as "média" from alunos where((nota1+nota2+nota3)/3) >= (select avg(round((nota1+nota2+nota3)/3)) from alunos); 
select nome,nota1,nota2,nota3 from alunos where nota1>7 and nota2>7 and nota3>7 ;
drop table alunos;
drop database exercicio03;