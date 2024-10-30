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

create table partida (
    id_partida int,
    rodada int,
    horario datetime,
    gol_mandante int not null,
    gol_visitante int not null,
    id_estadio int not null,
    id_mandante int not null,
    id_visitante int not null,
        constraint PK_partida primary key(id_partida),
        constraint FK_estadio foreign key (id_estadio) references estadio(id_estadio),
        constraint FK_time_mandante foreign key (id_mandante) references time(id_time),
        constraint FK_time_visitante foreign key (id_visitante) references time(id_time)
);
create table evento (
    id_evento int,
    minuto int,
    descricao varchar(100).
    id_jogador int not null,
    id_partida int not null,
        constraint PK_evento primary key(id_evento),
        constraint FK_evento_jogador foreign key (id_jogador) references jogador(id_jogador),
        constraint FK_evento_partida foreign key (id_partida) references partida(id_partida)
);