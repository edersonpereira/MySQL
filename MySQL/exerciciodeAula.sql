create database aula03_atividade;
use aula03_atividade;
create table cursos(
	codigoCurso int primary key auto_increment,
    nomeCurso varchar (20),
    valorCurso double
);
create table alunos(
	codigoAluno int primary key auto_increment,
    nomeAluno varchar(30),
    enderecoAluno varchar (40)
);
create table turmas(
	codigoCurso int,
    codigoAluno int,
    foreign key (codigoCurso) references cursos(codigoCurso),
    foreign key (codigoAluno) references alunos(codigoAluno)
);
create procedure cadastrarCursos ()
insert into cursos (nomeCurso, valorCurso) values
("Java","3.000"),
("C#","2.000");
call cadastrarCursos;