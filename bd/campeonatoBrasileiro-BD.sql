create database campeonatoBrasileiro;

show databases;

use campeonatoBrasileiro;

create table estadio(
	id_estadio int auto_increment primary key,
    nome varchar(150) not null,
    endereco varchar(150),
    capacidade int
);

select * from estadio;
desc estadio;

create table time (
    id_time int,
    nome_completo varchar(150),
    nome varchar(150),
    sigla varchar(3),
    cidade varchar(150),
    estado varchar(150),
    constraint PK_time primary key (id_time),
    constraint FK_estadioTime foreign key (id_estadio) references estadio(id_estadio)
);