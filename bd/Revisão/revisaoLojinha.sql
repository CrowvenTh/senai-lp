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
