drop schema lojinha;
create schema lojinha;
use lojinha;

create table cliente (
id int,
nome varchar(100) not null,
constraint PK_cliente primary key(id)
);

desc cliente;
select * from cliente;

create table email_cliente (
id int,
email varchar(100),
id_cliente int,
	constraint PK_email_cliente primary key(id),
	constraint Fk_id_cliente foreign key(id_cliente) references cliente(id)
);

create table pedido (
id int,
data_pedido date not null,
id_cliente int,
	constraint PK_pedido primary key(id),
	constraint FK_pedido_cliente foreign key(id_cliente) references cliente(id)
);