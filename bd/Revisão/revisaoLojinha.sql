drop schema lojinha;
create schema lojinha;
use lojinha;

create table cliente (
id int,
nome varchar(100) not null,
constraint PK_cliente primary key(id)
);

desc cliente;

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

create table categoria(
id int,
nome varchar(100),
 constraint PK_categoria primary key(id)
);

create table fornecedor(
id int,
nome varchar(100),
 constraint PK_fornecedor primary key(id)
);

create table produto (
id int,
descricao varchar(100),
idCategoria int,
idFornecedor int,
estoque int,
	constraint PK_idProduto primary key(id),
	constraint FK_id_categoria foreign key(idCategoria) references categoria(id),
	constraint FK_id_Fornecedor foreign key(idFornecedor) references fornecedor(id)
);

create table pedido_produto (
id int,
idPedido int,
idProduto int,
quantidade int,
	constraint PK_pedido_produto primary key(id),
	constraint FK_id_pedido foreign key(idPedido) references pedido(id),
	constraint FK_id_produto foreign key(idProduto) references produto(id)
);

insert into cliente values 
(01, "Ana"),
(02, "José"),
(03, "João");

insert into email_cliente values
(01,"e1",1),
(02,"e2",1),
(03,"e3",2),
(04,"e4",2),
(05,"e5",3);

insert into pedido values
(01, "2015-10-05", 1),
(02, "2014-12-31", 1),
(03, "2010-09-10", 2),
(04, "2015-03-14", 2),
(05, "2014-07-21", 2);

insert into categoria values
(01,"Ferramenta"),
(02,"Vestuário"),
(03,"Alimento");

insert into fornecedor values
(01,"F1"),
(02,"F2"),
(03,"F3");

insert into produto values
(01, "Alicate", 1, 1, 10),
(02, "Leite", 2, 1, 100),
(03, "Suco", 2, 1, 50),
(04, "Camisa", 3, 2, 40),
(05, "Calça", 3, 2, 20);

insert into pedido_produto values
(01, 01, 01, 10),
(02, 01, 02, 20),
(03, 02, 03, 5),
(04, 03, 04, 10),
(05, 04, 05, 5);