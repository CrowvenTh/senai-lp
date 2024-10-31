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

select * from medico;
desc medico;
