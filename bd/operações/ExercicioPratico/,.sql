use pizzaria;
SET SQL_SAFE_UPDATES=0;

select * from pizza;
select * from regiao;
select * from estado;

ALTER TABLE pizza ADD COLUMN preco decimal(5,2);

create table regiao (
id_regiao int auto_increment primary key,
sigla varchar(5),
nome varchar(20)
);

create table estado (
id_estado int auto_increment primary key,
sigla varchar(3),
nome varchar(30),
	id_regiao int,
	foreign key (id_regiao) references regiao(id_regiao)
);

create table municipio (
id_municipio int auto_increment primary key,
nome varchar(100),
id_regiao int,
id_estado int,

	foreign key (id_regiao) references regiao(id_regiao),
    foreign key (id_estado) references estado(id_estado)
);