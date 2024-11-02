-- drop dbclinica
create schema if not exists dbclinica default character set utf8;

use dbclinica;

create table if not exists medicos(
	crm int,
    nome varchar(40) not null,
    idade int check(idade > 23),
    especialidade char(20) not null default('Ortopedia'),
    cpf varchar(15) unique not null,
    data_emissao date,
		constraint PK_medico primary key (crm)
)Engine = InnoDB;

create table if not exists sala (
		numero_sala int check(numero_sala > 1 and numero_sala < 50),
        andar int not null check( andar < 12),
        crm int unique not null,
			constraint PK_sala primary key(numero_sala),
            constraint FK_sala_medico foreign key (crm) references medicos(crm)
)Engine= InnoDB;

create table if not exists pacientes(
	cpf varchar(11),
    nome varchar(40) not null,
    data_nascimento date,
    cidade char(30) default('Taguatinga'),
    doenca varchar(40) not null,
    plano_saude varchar(40) not null default ('SUS'),
		constraint PK_paciente primary key (cpf)
)Engine = InnoDB;

create table if not exists funcionarios(
	matricula int auto_increment,
    nome varchar(40) not null,
    data_nascimento date not null,
    data_admissao date not null,
    cargo varchar(40) not null default ('Assistente medico'),
    salario decimal(5,2) not null default ('1510.00'),
		constraint PK_funcionario primary key (matricula)
)Engine = InnoDB;

create table if not exists consultas(
	codigo_consulta int auto_increment,
    data_horario datetime,
    crm int unique not null,
    cpf varchar(11) unique not null,
		constraint PK_consulta primary key(codigo_consulta),
        constraint FK_consulta_medico foreign key (crm) references medicos(crm),
        constraint FK_consulta_paceinte foreign key (cpf) references pacientes(cpf)
)Engine = InnoDB;
