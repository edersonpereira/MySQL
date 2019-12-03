create database escola;
use escola;
#Tabela de Alunos
create table alunos(
	idAluno int auto_increment,
    nomeAluno varchar(30),
    emailAluno varchar(40),
    primary key(idAluno)
);
# Tabela de turmas
create table turmas(
	idTurma int auto_increment,
    nomeTurma varchar (5),
    turnoTurma varchar(12),
    primary key (idTurma)
);
#Tabela de professores
create table professores(
	idProfessor int auto_increment,
    nomeProfessor varchar(30),
    materiaProfessor varchar(20),
    primary key(idProfessor)
);
#Tabela para unir os dados
create table turmasFormadas(
	idTurma int,
    idAluno int,
    idProfessor int,
    foreign key (idTurma) references turmas(idTurma),
    foreign key (idAluno) references alunos(idAluno),
    foreign key (idProfessor) references professores(idProfessor)
);
#cadastrar Alunos
insert into alunos (nomeAluno,emailAluno) values
("Christian","cris.antunes@gmail.com"),
("Dênis","denis.oliveira@live.com"),
("Elaine","elaine.wust@gmail.com"),
("Felipe","felipe.melo@gmail.com"),
("Graziela","grazi.mendes@uol.com.br");
#Cadastrar Turma
insert into turmas(nomeTurma, turnoTurma) values
("8A", "Vespertino"),
("7C", "Matutino");
#Cadastrar Professores
insert into professores (nomeProfessor) values
("Wellington"),
("Vanessa");
#Cadastrar turmasFormadas
insert into turmasFormadas values
(1,1,1),
(2,2,2),
(1,3,1),
(2,4,2),
(1,5,1);
#Selecionar dados da tabela turmaFormados
select 
	turmas.nomeTurma,
    alunos.nomeAluno,
    professores.nomeProfessor
from turmasFormadas
inner join turmas on turmasFormadas.idTurma = turmas.idTurma
inner join alunos on turmasFormadas.idAluno = alunos.idAluno
inner join professores on turmasFormadas.idProfessor = professores.idProfessor;
#Criando uma view
create view selecionarTurmasFormadas as
select 
	turmas.nomeTurma,
    alunos.nomeAluno,
    professores.nomeProfessor
from turmasFormadas
inner join turmas on turmasFormadas.idTurma = turmas.idTurma
inner join alunos on turmasFormadas.idAluno = alunos.idAluno
inner join professores on turmasFormadas.idProfessor = professores.idProfessor;
#executar view
select*from selecionarTurmasFormadas;
#remover view
drop view selecionarTurmasFormadas;

#Criar uma procedure
create procedure contarTurmasFormadas()
select count(*) from turmasFormadas;
#executar procedure
call contarTurmasFormadas;
#Criar procedure com parametros
create procedure cadastrarTurmasFormadas(idTurma int, idAluno int, idProfessor int)
insert into turmasFormadas values (idTurma, idAluno, idProfessor);
#Executar procedure
call cadastrarTurmasFormadas(2,1,2);
#procedure com dois comandos SQL ou mais
delimiter $$
create procedure comandosMultiplos(idTurma int, idAluno int, idProfessor int)
begin
	insert into turmasFormadas values(idturma, idAluno, idProfessor);
	select * from selecionarTurmasFormadas;
end$$
delimiter ;

call comandosMultiplos(2,1,2);
drop procedure comandosMultiplos;
