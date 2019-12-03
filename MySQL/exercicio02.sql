create database exercicio02;
use exercicio02;
create table produtos (
	codigo int primary key auto_increment,
    produto varchar(40),
    categoria varchar(20),
    valor double,
    cadastro date
);
insert into produtos values
(null,"Smartphone Samsung A8","telefonia", 1400.00 , '2019-07-22'), 
(null, "Notebook Acer A650","informática",'3800.00' , '2019-03-19'), 
(null, "Telefone sem fio Intelbras","telefonia",'129.90', '2018-12-20'), 
(null, "iPhone XR","telefonia", '5499.00', '2019-07-08'), 
(null, "Notebook Dell Espiron 500","informática",'3975.80', '2019-01-29'), 
(null, "All in one LG A8574","informática",'2547.12', '2019-02-13'), 
(null, "Smartphone Motorola G7","telefonia",'799.00', '2019-04-03'), 
(null, "Smartphone Galaxy S10","telefonia",'4600.00', '2019-05-03'), 
(null, "Notebook Acer Axpros 47","informática",'2857.00', '2019-08-16'), 
(null, "Smartphone Asus Zenfone 6","telefonia",'2356.00', '2018-07-29'), 
(null, "Smartphone Samsung J4", null, '1700.00', '2018-06-16');
set SQL_SAFE_UPDATES = 0;
select*from produtos;
select count(*) from produtos;
select produto, valor from produtos where cadastro between "2019-04-01" and "2019-07-31";
update produtos set categoria = "telefonia" where categoria is null;
select categoria, count(categoria) from produtos group by categoria;
select avg(valor) from produtos;
SELECT round(avg (valor),2) from produtos; # UTILIZAR O ROUND ARREDONDA A QUANTIDADE DE CASAS APÓS A VIRGULA.
select * from produtos  where valor = (select min(valor) from produtos);
select * from produtos where categoria = "telefonia" and valor >=4000.00;
select * from produtos where cadastro < "2018-12-30" and cadastro > "2018-01-01";
delete from produtos where produto like "%LG%" or produto like "%Samsung%";
select codigo from produtos where produto like "%intelbras%";
drop table produtos;
drop database exercicio02;

