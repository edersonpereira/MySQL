create database customers;
use customers;
create table customers(
	customerID int primary key auto_increment,
    customerName varchar(40),
    contactName varchar(30),
    address varchar(30),
    city varchar(30),
    postalCode varchar(20),
    country varchar(30)
);
describe customers;
drop tables customers;
insert into customers (customerName, contactName, address, city, postalCode, country) values
("Alfreds Futterkiste", "Maria Anders", "Obere Str. 57", "Berlin", "12209","Germany"),
("Ana Trujillo Emparedados y helados", "Ana Trujillo", "Avda. de la Constitución 2222",	"México D.F.", "05021", "Mexico"),
("Antonio Moreno Taquería", "Antonio Moreno", "Mataderos 2312", "México D.F.", "05023", "Mexico"),
("Around the Horn","Thomas Hardy", "120 Hanover Sq.", "London", "WA1 1DP", "UK"),
("Berglunds snabbköp", "Christina Berglund", "Berguvsvägen 8", "Luleå", "S-958 22", "Sweden");
insert into customers values (null, "Frankenversand","Peter Franken", "Berliner Platz 43", "Munchen", "80805", "Germany");
# SELECT
select * from customers;
select count(distinct country) from customers; #distinct é usado para selecionar sem repetições.
select * from customers where country = "Mexico";
select * from customers where customerID = 1;
select * from customers where country = "Germany" and city = "Berlin";
select * from customers where city = "Berlin" or city = "München";
select * from customers where country = "Germany" or country = "Mexico";
select * from customers where not country = "Mexico";
select * from customers where  country = "Germany" and (city= "berlin" or city="Munchen");
select * from customers where not country = "germany" and not country = "usa";
select * from customers order by country;
select * from customers order by country desc;
select * from customers order by country, customerName;
select * from customers order by country asc, customerName desc;
# INSERIR
insert into customers (customerName, contactName, address, city, postalCode, country) values
("White Clover Markets", "Karl Jablonski", "305-14th Ave.S.Suite 3B", "Seattle","98128", "USA"),
("Wilman Kala", "Matti Karttunen", "Keskuskatu 45", "Helsinki", "21240", "Finland"),
("Wolski", "Zbyszek", "ul. Filtrowa 68", "Walla", "01-012", "Poland");
insert into customers (customerName, city, country)
values ("Cardinal","Stavanger","Norway");
# VALORES NULOS
select customerName, contactName, address from customers
where address is null;
select customerName, contactName, address from customers
where address is not null;
#ATUALIZAR
update customers
set contactName = "Alfred Schmidt", city = "Frankfurt"
where customerID = 1;
update customers set contactName = "Juan" where country = "Mexico";
set SQL_SAFE_UPDATES = 0;
# DELETAR
delete from customers where customerName = "Alfreds Futterkiste";
# SELECIONAR TOP
select * from customers limit 3;
select * from customers where country =  "Germany" limit 3;
#procurar algo especifico
select * from customers where customerName like "a%";
select * from customers where customerName like "%or%";
select * from customers where customerName like "_r%"; # o _ determina quantidade de letras existentes antes ou depois da proxima letra.
