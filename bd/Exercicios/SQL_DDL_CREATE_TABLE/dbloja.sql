-- drop schema dbloja;
create schema if not exists dbloja default character set utf8;
use dbloja;

create table if not exists cliente (
	id_cliente int auto_increment,
    nome varchar(100),
    limite_credito decimal(5,2),
    status varchar(10),
    cep varchar(10),
    logradouro varchar(200),
    numero int,
		constraint PK_cliente primary key(id_cliente)
)Engine = InnoDB;

-- select * from cliente;
-- desc cliente;

create table if not exists pedido (
	id_pedido int auto_increment,
    data date,
    total_pedido decimal(5,2),
    id_cliente int not null,
		constraint PK_pedido primary key (id_pedido),
		constraint FK_pedido_cliente foreign key(id_cliente) references cliente(id_cliente)
)engine = InnoDB;

-- select * from pedido;
-- desc pedido;

create table if not exists categoria (
	id_categoria int auto_increment,
    nome varchar(100),
		constraint PK_categoria primary key (id_categoria)
)Engine = InnoDB;

-- select * from categoria;
-- desc categoria;

create table if not exists produto (
	id_produto int auto_increment,
    nome varchar(100),
    preco decimal (5,2),
    id_categoria int not null,
		constraint PK_produto primary key (id_produto),
        constraint FK_produto_categoria foreign key(id_categoria) references categoria(id_categoria)
)Engine = InnoDB;

-- select * from produto;
-- desc produto;

create table if not exists rl_pedido_produto (
	id_produto int,
    id_pedido int,
    quantidade int,
		constraint PK_rl_pedido_produto primary key (id_produto,id_pedido)
        -- constraint FK_produto foreign key (id_produto) references produto(id_produto),
        -- constraint FK_pedido foreign key (id_pedido) references pedido(id_pedido)
)Engine = InnoDB;

alter table rl_pedido_produto add (constraint FK_produto foreign key (id_produto) references produto(id_produto), constraint FK_pedido foreign key (id_pedido) references pedido(id_pedido));

-- desc rl_pedido_produto;
-- select * from rl_pedido_produto;
-- show create table rl_pedido_produto;
/* resultado do show create table
CREATE TABLE `rl_pedido_produto` (
   `id_produto` int NOT NULL,
   `id_pedido` int NOT NULL,
   `quantidade` int DEFAULT NULL,
   PRIMARY KEY (`id_produto`,`id_pedido`),
   KEY `FK_pedido` (`id_pedido`),
   CONSTRAINT `FK_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
   CONSTRAINT `FK_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3
 */ 