-- drop database lojinha;
create schema if not exists lojinha default character set utf8;
use lojinha;

create table if not exists cliente (
	clienteID int auto_increment,
	nome varchar(50) not null,
		primary key(clienteID)
);

create table if not exists emailCliente (
	emailClienteID int auto_increment,
	email varchar(100) not null,
	clienteID int not null,
		primary key(emailClienteID),
		foreign key(clienteID) references lojinha.cliente(clienteID)
);

create table if not exists pedido (
	pedidoID int auto_increment,
	dataPedido date not null,
	clienteID int not null,
		primary key(pedidoID),
		foreign key(clienteID) references lojinha.cliente(clienteID) 
);

create table if not exists categoria (
	categoriaID int auto_increment,
	nome varchar(40) not null,
		primary key(categoriaID)
);

create table if not exists fornecedor (
	fornecedorID int auto_increment,
	nome varchar(40) not null,
		primary key(fornecedorID)
);

create table if not exists produto (
	produtoID int auto_increment,
	descricao varchar(40) not null,
	categoriaID int not null,
	fornecedorID int not null,
	estoque int not null,
		primary key(produtoID),
		foreign key(categoriaID) references lojinha.categoria(categoriaID),
		foreign key(fornecedorID) references lojinha.fornecedor(fornecedorID)
);

create table if not exists pedidoProduto (
	pedidoProdutoID int auto_increment,
	pedidoID int not null,
	produtoID int not null,
	quantidade int not null,
		primary key(pedidoProdutoID),
		foreign key(pedidoID) references lojinha.pedido(pedidoID),
		foreign key(produtoID) references lojinha.produto(produtoID)
);

-- cliente
insert into lojinha.cliente(nome) values 
("Ana"), ("José"), ("João");
-- select * from cliente;

-- emailCliente
insert into lojinha.emailCliente(email, clienteId) values
("e1",1), ("e2",1), ("e3",2), ("e4",2), ("e5",1);
-- select * from emailCliente;

-- pedido
insert into lojinha.pedido(dataPedido, clienteID) values
("2015/10/05",1),
("2014/12/31",1),
("2010/09/10",2),
("2015/03/14",2),
("2014/07/21",2);
-- select * from pedido;

-- categoria
insert into lojinha.categoria(nome) values
("Ferramenta"), ("Vestuário"), ("Alimento");
-- select * from categoria;

-- forncedor
insert into lojinha.fornecedor(nome) values
("F1"), ("F2"), ("F3");
-- select * from fornecedor;

-- produto
insert into lojinha.produto(descricao, categoriaID, fornecedorID, estoque) values
("Alicate", 1, 1, 10),
("Leite", 2, 1, 100),
("Suco", 2, 1, 50),
("Camisa", 3, 2, 40),
("Calça", 3, 2, 20);
-- select * from produto;

-- pedidoProduto
insert into lojinha.pedidoProduto(pedidoID, produtoID, quantidade) values
(1, 1, 10),
(1, 2, 20),
(2, 1, 5),
(3, 4, 10),
(4, 5, 5);
-- select * from pedidoProduto;

-- QUERYs

-- a) Mostre todos os clientes com seus e-mails organizados pelo nome do cliente.
select c.nome, e.email 
	from cliente as c
		inner join emailcliente as e
			on c.clienteID = e.clienteID
	order by c.nome asc;

-- b) Mostre todos os pedidos realizados entre 2010 e 2014.
select * 
	from pedido 
		where year(dataPedido) between 2010 and 2014;

-- c) Mostre todos os clientes que possuem pedidos entre 2015 e 2016.
	select 
		c.nome as cliente, 
		date_format(p.dataPedido, '%d/%m/%Y') as data
			from cliente as c
				inner join pedido as p
				on c.clienteID = p.clienteID
			where year(dataPedido) between 2015 and 2016;
		
-- d) Mostre o nome das categorias que iniciam pela letra "f", organizadas pelo nome da categoria de forma descendente, sem valores repetidos.
select distinct * 
	from categoria 
		where nome like 'f%' 
	order by nome desc;

-- e) Apresente o total de produtos que são da categoria Vestuário.
update produto set categoriaID = 3 where produtoID = 2;  
update produto set categoriaID = 3 where produtoID = 3;  
update produto set categoriaID = 2 where produtoID = 3;  
update produto set categoriaID = 2 where produtoID = 5;  

select
	sum(p.estoque) as Quantidade,
	c.nome as categoria
	from produto as p
		inner join categoria as c
			on p.categoriaID = c.categoriaID
				where c.categoriaID = '2';
	
-- f) Mostre o nome da categoria e o total em estoque de cada produto agrupado por categoria.
select
	c.nome as categoria,
	sum(p.estoque) as quantidade 
		from produto as p
			inner join categoria as c
				on p.categoriaID = c.categoriaID
			group by 1;
				
-- g) Mostre o nome do produto com o nome do respectivo fornecedor.
select
	p.descricao as nome,
	f.nome as fornecedor
		from produto as p
			inner join fornecedor as f
				on p.fornecedorID = p.fornecedorID;
			
-- h) Para o cliente com id=01, mostre a data de todos os pedidos efetuados, classificados pela data do pedido.
select
	clienteID as ID,
	dataPedido as data
		from pedido as p
			where clienteID = 1
		order by dataPedido asc;

-- i) Liste a descrição e a quantidade pedida de cada produto.
	select 
		p.descricao as nome,
		pd.quantidade as Qtd
			from pedidoProduto as pd
				inner join produto as p
					on pd.produtoID = p.produtoID;

-- j) Na tabela Produto, insira um novo campo chamado preco do tipo decimal(5,2). Utilize o comando UPDATE e atribua 10% do valor do estoque do produto para este novo campo (preco), ou seja, para estoque igual a 100, o preco deverá ser de 10.
alter table produto add preco decimal(5,2);

update produto set preco = estoque * 0.10 where preco is null;

select * from produto;

-- k) Na tabela Produto, informe o maior valor de estoque.
select 
	descricao as produto,
	(estoque * preco) as valor_total
		from produto
order by 2 desc;
