create database etl_ibge;
use etl_ibge;

SET SQL_SAFE_UPDATES=0;

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

select * from etl_ibge.regiao;
select * from etl_ibge.estado;
select * from etl_ibge.municipio;

select
	e.sigla, e.nome, r.sigla, r.nome, m.nome 
	from municipio as m 
		inner join 
			regiao as r
				on m.id_regiao = r.id_regiao
					inner join estado as e
						on m.id_estado = e.id_estado
							where r.nome = "NORTE";
