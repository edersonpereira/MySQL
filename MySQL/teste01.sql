create database teste01;
show databases;
use teste01;
create table contatos(
	nome varchar(30) not null,
    telefonde varchar(30) not null
);
show tables;
drop table contatos;
create table contatos(
	codigo int primary key auto_increment,
    nome varchar(30) not null,
    sobrenome varchar(30) not null,
    ddd int (2) not null,
    telefone varchar(9) not null,
    data_nasc date null,
	email varchar(30) null
);
drop table contatos;
show tables;
alter table contatos
add ativo smallint not null after email;
describe contatos;
alter table contatos
change telefone fone varchar(9) not null;
insert into contatos values(null,"Bruno","Matheus",47,"912345678","1995-09-14","bruno@gmail.com",1);
select * from contatos;

update contatos set 
sobrenome = "Mateus" where codigo = 1;
update contatos set
	ddd = 48,
    email = "brunoo@gmail.com"
where codigo =1;
drop database teste01;