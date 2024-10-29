create database campeonatoBrasileiro;

show databases;

status; -- configurações principais
use campeonatoBrasileiro;

create table estadio(
	id_estadio int auto_increment primary key,
    nome varchar(150) not null,
    endereco varchar(150),
    capacidade int
);

select * from estadio;

desc estadio; -- descreve a estrutura de uma tabela

create table time (
    id_time int,
    nome_completo varchar(150),
    nome varchar(150),
    sigla varchar(3),
    cidade varchar(150),
    estado varchar(150),
    id_estadio int not null,
    constraint PK_time primary key (id_time),
    constraint FK_estadioTime foreign key (id_estadio) references estadio(id_estadio)
);

create table jogador (
    id_jogador int,
    nome varchar(150),
    numero int,
    dt_nascimento date,
    posicao varchar(150),
    id_time int not null,
    constraint PK_jogador primary key(id_jogador),
    constraint FK_jogadorTime foreign key (id_time) references time(id_time)
);