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