-- drop database dbmaternidade;

create schema if not exists dbmaternidade default character set utf8;
use dbmaternidade;

create table if not exists mae (
	id_mae int auto_increment,
    rg varchar(10),
    endereco varchar(200),
    telefone varchar(20),
    dt_nascimento date,
		constraint PK_mae primary key(id_mae)
)Engine = InnoDB;

alter table mae add nome varchar(120);

-- select * from mae;
-- desc mae;

create table if not exists medico (
	crm int,
    nome varchar(120),
    telefone varchar(20),
    especialidade varchar(100),
		constraint PK_medico primary key(crm)
)Engine = InnoDB;

-- select * from medico;
-- desc medico;

create table if not exists bebe (
	id_bebe int auto_increment,
    nome varchar(100),
    dt_nascimento date,
    peso decimal(5,2),
    altura int,
    crm int not null,
    id_mae int not null,
		constraint PK_bebe primary key (id_bebe),
		constraint FK_medico foreign key(crm) references medico(crm),
        constraint FK_mae foreign key (id_mae) references mae(id_mae)
)Engine = InnoDB;


select * from bebe;
desc bebe;