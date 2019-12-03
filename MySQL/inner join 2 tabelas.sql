#1 criar base de dados
create database unirtabelas;
#2 selecionar base de dados
use unirtabelasproducts;
#3 criar tabela
create table marcas(
	idMarca int auto_increment primary key,
    nomeMarca varchar (30)
);
#4 tabelas de produtos
create table produtos(
	idProdutos int auto_increment primary key,
    nomeProduto varchar (30),
    idMarca int,
    foreign key (idMarca) references marcas(idMarca)
);
#5 Inserir marcas
insert into marcas (nomeMarca) values
("Nestlé"),
("Kraft Heinz"),
("Coca-Cola");
insert into produtos (nomeProduto, idMarca) values
("Graraná Kuat", 3),
("Ketchup 500gr Heinz", 2),
("Água Mineral Crystal", 3),
("Creme de Leite Ligth",1);
#6 Selecionar
select * from produtos;
#7 unir dados entre tabelas #o ponto significa que esta entrando dentro de uma estrutura.
select 
	produtos.nomeProduto,
    marcas.nomeMarca
from produtos inner join marcas on produtos.idMarca = marcas.idMarca;
#8 inserir nova marca
insert into marcas (nomeMarca) values ("Mondelez");
#Exibir quantidade de produtos por marca
select 
	 marcas.nomeMarca,
     count(produtos.idProdutos) from marcas
left join produtos on marcas.idMarca = produtos.idMarca group by marcas.nomeMarca;
#exibir o nome do produto
select 
	 marcas.nomeMarca,
     produtos.nomeProduto from marcas
left join produtos on marcas.idMarca = produtos.idMarca;