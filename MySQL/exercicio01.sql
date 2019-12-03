#1 https://ralflima.000webhostapp.com/
create database exercicio01;
#2
use exercicio01;
#3
create table uzuarios (
	codigo int primary key auto_increment,
    nome varchar (20),
	sobrenome varchar(40),
	idade int
);
#4
rename table uzuarios to usuarios; #renomear a tabela 
set SQL_SAFE_UPDATES=0;
#5
alter table usuarios add email varchar(40); #adicioar uma coluna
#6
alter table usuarios drop column sobrenome; #deletar uma coluna
#7
insert into usuarios (nome, idade, email) values
("Adailton", 22, "adailton.maas@yahoo.com.br"),
("Andressa", 36, "dessa.simas@uol.com.br"),
("Mayara", 24, "mayra.antunes@gmail.com"),
("Cristiane", 14, "criss.maya@gmail.com"),
("Leonardo", 15, "leo.kopff@terra.com.br"),
("Carina", 27, "carina.almeida@gmail.com"),
("Clóvis", 29, "clovis.simao@hotmail.com"),
("Gabriela", 23, "gabriela.braga@live.com"),
("Cibele", null, "cibele.lins@uol.com.br");
select*from usuarios;
#8
select count(*) from usuarios;
#9
select * from usuarios where idade <= 17; 
#10
select * from usuarios where email like "%gmail.com";
#11
select * from usuarios where idade =(select max(idade) from usuarios);
#12
select * from usuarios where idade is null;
#13
update usuarios set idade = 27
where idade is null;
#14
delete from usuarios where idade < 18;
#15
truncate usuarios;
#16
drop database exercicio01;