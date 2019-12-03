#Base de dados
create database aula04;
use aula04;
create table cursos(
	idCurso int auto_increment primary key,
    nomeCurso varchar(20),
    valorCurso double
);
#Remover procedure
drop procedure pesquisa;

#criar procedure de cadastro de cursos
#(oque tiver dentro do delimiter é o procedure)
#Parâmetros de entrada: Dados obrigatorios para executar a procedure
#Parâmetros de saída: Dados opcionais de retorno
#colocar in para ter dados obrigatórios.
delimiter $
	create procedure cadastrar(in nome varchar(20),in valor double)
    begin
		declare quantidade int;
        declare mensagem varchar(50);
        set quantidade = (select count(*)from cursos where nomeCurso = nome);
        if quantidade = 0 then 
			insert into cursos(nomeCurso, valorCurso) values (nome,valor);
			set mensagem = "Curso Cadastrado com sucesso";
        else
			set mensagem = "Falha ao cadastrar o curso";
		end if; #finaliza o if.
        select mensagem;
    end $;
delimiter ;
#Executar procedure
call cadastrar("PHP", 1200);
#listar dados da tabela
select*from cursos;

#Procedure para pesquisar um curso através do ID
delimiter $$
	create procedure pesquisa(in id int, out nome varchar(20))
	begin
		select nomeCurso from cursos where idCurso=id;
	end $$
delimiter ;
call pesquisa(2, @retorno);

#Permição para criação de funções
set global log_bin_trust_function_creators = 1;
#Função para retornar a média de valores dos cursos
delimiter **
	create function mediaValores() returns double
    begin
		declare media double;
        set media = (select avg(valorCurso) from cursos);
        return media;
        
    end **
delimiter ;
#chamar função
select mediaValores();

#EXEMPLO COM TRIGGER
alter table cursos add valorCursoVista double;
create trigger desconto before insert
on cursos for each row
set new.valorCursoVista =  new.valorCurso * 0.9;

call cadastrar("Angular", 1000);
select*from cursos;

/* 
	Tempo:
    before-> depois
    after-> antes
	
    OBTER DADOS DA COLUNA
    new->	Manipula o dado que esta sendo executado
    old->	Manipula o dado que consiste a tabela ou que ja foi executado
*/