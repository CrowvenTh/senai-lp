show databases; -- visualizar as databases
drop database if exists campeonatobrasileiro;
create database campeonatobrasileiro; -- criar base de dados
use campeonatobrasileiro; -- entra em uma base de dados 
-- status; -- visualiza principais configurações

show tables; -- mostra as tabelas de uma base de dados

-- cria uma nova tabela
create table estadio(
id_estadio int primary key auto_increment,
nome varchar(150) not null,
endereco varchar(150),
capacidade int);
desc estadio; -- descreve a estrutura de uma tabela

create table time(
id_time int,
nome_completo varchar(150),
nome varchar(150),
sigla varchar(3),
cidade varchar(150),
estado varchar(150),
id_estadio int not null,
constraint PK_Time primary key(id_time),
constraint FK_EstadioTime foreign key(id_estadio) references estadio(id_estadio));
desc time;

create table jogador(
id_jogador int,
nome varchar(150),
numero int,
dt_nascimento date,
posicao varchar(150),
id_time int,
constraint PK_Jogador primary key(id_jogador),
constraint FK_JogadorTime foreign key(id_time) references time(id_time));
desc jogador;

create table partida(
id_partida int,
rodada int,
horario datetime,
gol_mandante int,
gol_visitante int,
id_mandante int,
id_visitante int,
id_estadio int,
constraint PK_Partida primary key(id_partida),
constraint FK_TimeMandante foreign key(id_mandante) references time(id_time),
constraint FK_TimeVisitante foreign key(id_visitante) references time(id_time),
constraint FK_PartidaEstadio foreign key(id_estadio) references estadio(id_estadio));
desc partida;

create table evento(
id_evento int,
minuto int,
descricao varchar(150),
id_partida int,
id_jogador int,
constraint PK_Evento primary key(id_evento),
constraint FK_EventoPartida foreign key(id_partida) references partida(id_partida),
constraint FK_EventoJogador foreign key(id_jogador) references jogador(id_jogador));
desc evento;

alter table evento modify id_evento int auto_increment;

 -- apagando a regra de chave estrangeira 
 alter table jogador drop constraint FK_JogadorTime;
 alter table partida drop constraint FK_TimeMandante;
 alter table partida drop constraint FK_TimeVisitante;
 -- incluindo o auto_increment
 alter table time modify id_time int auto_increment;
 -- incluir novamente a regra da chave estrangeira
 alter table jogador add constraint FK_JogadorTime foreign key(id_time) references time(id_time);
 alter table partida add constraint FK_TimeMandante foreign key(id_mandante) references time(id_time);
 alter table partida add constraint FK_TimeVisitante foreign key(id_visitante) references time(id_time);

 alter table evento drop constraint FK_EventoPartida;
 alter table partida modify id_partida int auto_increment;
 alter table evento add constraint FK_EventoPartida 
 foreign key(id_partida) references partida(id_partida);
 
 alter table evento drop constraint FK_EventoJogador;
 alter table jogador modify id_jogador int auto_increment;
 alter table evento add constraint FK_EventoJogador 
 foreign key(id_jogador) references jogador(id_jogador);

 -- insert para unica linha
insert into estadio(nome, endereco, capacidade)
value('Maracanã','Av. Pres. Castelo Branco, Portão 3 - Maracanã, Rio de Janeiro - RJ',78838);

-- insert para multiplas linhas
insert into estadio(nome, endereco, capacidade) values
('Morumbi (Estádio Cícero Pompeu de Toledo)','Praça Roberto Gomes Pedrosa, 1 - Morumbi, São Paulo - SP','66795'),
('Mineirão (Estádio Governador Magalhães Pinto)','Av. Antônio Abrahão Caram, 1001 - Pampulha, Belo Horizonte - MG','61846'),
('Arena do Grêmio','Av. Padre Leopoldo Brentano, 110 - Humaitá, Porto Alegre - RS','55662'),
('Allianz Parque','Av. Francisco Matarazzo, 1705 - Água Branca, São Paulo - SP','43713'),
('Beira-Rio (Estádio José Pinheiro Borda)','Av. Padre Cacique, 891 - Praia de Belas, Porto Alegre - RS','50128'),
('Arena Fonte Nova','Ladeira da Fonte das Pedras - Nazaré, Salvador - BA','47907'),
('Arena Castelão (Estádio Governador Plácido Castelo)','Av. Alberto Craveiro, 2901 - Castelão, Fortaleza - CE','63903'),
('Neo Química Arena','Av. Miguel Ignácio Curi, 111 - Artur Alvim, São Paulo - SP','49205'),
('Estádio Nilton Santos (Engenhão)','R. José dos Reis, 425 - Engenho de Dentro, Rio de Janeiro - RJ','46831'),
('Arena da Baixada (Estádio Joaquim Américo)','R. Buenos Aires, 1260 - Água Verde, Curitiba - PR','42372'),
('Arena Pantanal','Av. Agrícola Paes de Barros - Verdão, Cuiabá - MT','44000'),
('Estádio Serra Dourada','Av. Fued José Sebba - Jardim Goiás, Goiânia - GO','50049'),
('Arena Pernambuco','Av. Deus é Fiel, 1 - São Lourenço da Mata, Recife - PE','44300'),
('Estádio Couto Pereira','R. Ubaldino do Amaral, 37 - Alto da Glória, Curitiba - PR','40502'),
('Vila Belmiro (Estádio Urbano Caldeira)','R. Princesa Isabel, 77 - Vila Belmiro, Santos - SP','16068'),
('Estádio São Januário','R. Gen. Almério de Moura, 131 - Vasco da Gama, Rio de Janeiro - RJ','21880'),
('Estádio Independência (Arena Independência)','R. Pitangui, 3230 - Horto, Belo Horizonte - MG','23018'),
('Arena da Amazônia','Av. Constantino Nery, 5001 - Flores, Manaus - AM','44310'),
('Estádio Mané Garrincha','SRPN - Asa Norte, Brasília - DF','72788');

select * from estadio;

insert into time(nome_completo,nome,sigla,cidade,estado,id_estadio) values
('América Futebol Clube','América-MG','AME','Belo Horizonte','MG',1);

insert into time(nome_completo,nome,sigla,cidade,estado,id_estadio) values
('Club Athletico Paranaense','Athletico-PR','CAP','Curitiba','PR',1),
('Clube Atlético Mineiro','Atlético-MG','CAM','Belo Horizonte','MG',1),
('Esporte Clube Bahia','Bahia','BAH','Salvador','BA',1),
('Botafogo de Futebol e Regatas','Botafogo','BOT','Rio de Janeiro','RJ',1),
('Sport Club Corinthians Paulista','Corinthians','COR','São Paulo','SP',1),
('Coritiba Foot Ball Club','Coritiba','CFC','Curitiba','PR',1),
('Cruzeiro Esporte Clube','Cruzeiro','CRU','Belo Horizonte','MG',1),
('Cuiabá Esporte Clube','Cuiabá','CUI','Cuiabá','MT',1),
('Clube de Regatas do Flamengo','Flamengo','FLA','Rio de Janeiro','RJ',1),
('Fluminense Football Club','Fluminense','FLU','Rio de Janeiro','RJ',1),
('Fortaleza Esporte Clube','Fortaleza','FOR','Fortaleza','CE',1),
('Goiás Esporte Clube','Goiás','GOI','Goiânia','GO',1),
('Grêmio Foot-Ball Porto Alegrense','Grêmio','GRE','Porto Alegre','RS',1),
('Sport Club Internacional','Internacional','INT','Porto Alegre','RS',1),
('Sociedade Esportiva Palmeiras','Palmeiras','PAL','São Paulo','SP',1),
('Red Bull Bragantino','Bragantino','RBB','Bragança Paulista','SP',1),
('Santos Futebol Clube','Santos','SAN','Santos','SP',1),
('São Paulo Futebol Clube','São Paulo','SAO','São Paulo','SP',1),
('Club de Regatas Vasco da Gama','Vasco','VAS','Rio de Janeiro','RJ',1);

select * from time;

update time set id_estadio = 18 where id_time = 1;
update time set id_estadio = 11 where id_time = 2;
update time set id_estadio = 3  where id_time = 3;
update time set id_estadio = 7  where id_time = 4;
update time set id_estadio = 10 where id_time = 5;
update time set id_estadio = 9  where id_time = 6;
update time set id_estadio = 2  where id_time = 7;
update time set id_estadio = 3  where id_time = 8;
update time set id_estadio = 12 where id_time = 9;
update time set id_estadio = 1  where id_time = 10;
update time set id_estadio = 1  where id_time = 11;
update time set id_estadio = 8  where id_time = 12;
update time set id_estadio = 13 where id_time = 13;
update time set id_estadio = 4  where id_time = 14;
update time set id_estadio = 6  where id_time = 15;
update time set id_estadio = 5  where id_time = 16;
update time set id_estadio = 2  where id_time = 17;
update time set id_estadio = 16 where id_time = 18;
update time set id_estadio = 2  where id_time = 19;
update time set id_estadio = 17 where id_time = 20;

-- Identificar e realizar o update dos 3 times que não estão na serie A atualmente.
-- Necessário fazer o update dos times..
insert into estadio (nome, endereco, capacidade) values
('Estádio Antônio Accioly','Goiânia, Goiás',12500),
('Estádio Heriberto Hülse','Criciúma, Santa Catarina',19300),
('Estádio Alfredo Jaconi','Caxias do Sul, Rio Grande do Sul',19700),
('Estádio Manoel Barradas (Barradão)','Salvador, Bahia',30000);

select * from time where nome in ('América-MG','Coritiba','Goiás','Santos');
-- Atlético Clube Goianiense	Atlético-GO	ACG	Goiânia	        GO	Estádio Antônio Accioly
-- trocar (serie B)América-MG	-> Atlético-GO (serie A)
update time set 
    nome_completo = 'Atlético Clube Goianiense',
    nome = 'Atlético-GO',
    sigla = 'ACG',
    cidade = 'Goiânia',
    estado = 'GO',
    id_estadio = 21
where id_time = 1;

-- Criciúma Esporte Clube	    Criciúma	CRI	Criciúma	    SC	Estádio Heriberto Hülse
-- trocar (serie B)Coritiba	-> Criciúma    (serie A)
update time set 
    nome_completo = 'Criciúma Esporte Clube',
    nome = 'Criciúma',
    sigla = 'CRI',
    cidade = 'Criciúma',
    estado = 'SC',
    id_estadio = 22
where id_time = 7;

-- Esporte Clube Juventude	    Juventude	JUV	Caxias do Sul	RS	Estádio Alfredo Jaconi
-- (serie B)Goiás	    -> Juventude   (serie A)
update time set 
    nome_completo = 'Esporte Clube Juventude',
    nome = 'Juventude',
    sigla = 'JUV',
    cidade = 'Caxias do Sul',
    estado = 'RS',
    id_estadio = 23
where id_time = 13;

-- Esporte Clube Vitória	    Vitória 	VIT	Salvador	    BA	Estádio Manoel Barradas (Barradão)
-- (serie B)Santos	    -> Vitória     (serie A)
update time set 
    nome_completo = 'Esporte Clube Vitória',
    nome = 'Vitória',
    sigla = 'VIT',
    cidade = 'Salvador',
    estado = 'BA',
    id_estadio = 24
where id_time = 18;

select * from time where id_time in (1,7,13,18);

-- insert partidas

select * from partida order by gol_visitante desc;
-- id_partida, , id_estadio
insert into partida(rodada, horario, gol_mandante, gol_visitante, id_mandante, id_visitante, id_estadio) values
(1,'2024-04-13T18:30',2,1,15,4,6),
(1,'2024-04-13T18:30',1,1,7,13,22),
(1,'2024-04-13T21:00',2,2,11,17,1),
(1,'2024-04-13T21:00',1,2,19,12,2),
(1,'2024-04-14T16:00',2,1,20,14,17),
(1,'2024-04-14T16:00',0,0,6,3,9),
(1,'2024-04-14T16:00',4,0,2,9,11),
(1,'2024-04-14T16:00',1,2,1,10,21),
(1,'2024-04-14T17:00',3,2,8,5,3),
(1,'2024-04-14T18:30',0,1,18,16,24),
(2,'2024-04-16T21:30',2,1,4,11,7),
(2,'2024-04-17T19:00',2,0,14,2,4),
(2,'2024-04-17T19:00',2,1,17,20,2),
(2,'2024-04-17T20:00',1,1,3,7,3),
(2,'2024-04-17T20:00',0,1,16,15,5),
(2,'2024-04-17T20:00',1,1,12,8,8),
(2,'2024-04-17T20:00',2,0,13,6,23),
(2,'2024-04-17T21:30',2,1,10,19,1),
(2,'2024-04-18T21:30',1,0,5,1,10),
(2,'2024-06-05T20:00',0,0,9,18,12),
(3,'2024-04-20T16:00',2,1,11,20,1),
(3,'2024-04-20T18:30',1,0,14,9,4),
(3,'2024-04-20T18:30',1,0,17,6,2),
(3,'2024-04-20T21:00',3,0,3,8,3),
(3,'2024-04-21T16:00',2,2,18,4,24),
(3,'2024-04-21T16:00',0,0,16,10,5),
(3,'2024-04-21T16:00',1,0,2,15,11),
(3,'2024-04-21T18:30',5,1,5,13,10),
(3,'2024-04-21T18:30',0,3,1,19,21),
(3,'2024-07-24T19:00',1,1,7,12,22),
(4,'2024-04-27T16:00',0,4,20,7,17),
(4,'2024-04-27T18:30',0,3,9,3,12),
(4,'2024-04-27T21:00',1,0,4,14,7),
(4,'2024-04-28T11:00',0,2,10,5,1),
(4,'2024-04-28T16:00',3,1,8,18,3),
(4,'2024-04-28T16:00',3,0,6,11,9),
(4,'2024-04-28T18:30',1,1,12,17,8),
(4,'2024-04-28T18:30',1,1,13,2,23),
(4,'2024-04-28T20:00',1,1,15,1,6),
(4,'2024-04-29T20:00',0,0,19,16,2),
(5,'2024-05-04T16:00',2,2,11,3,1),
(5,'2024-05-04T18:30',1,1,17,10,2),
(5,'2024-05-04T21:00',0,0,6,12,9),
(5,'2024-05-05T16:00',1,3,18,19,24),
(5,'2024-05-05T16:00',1,0,2,20,11),
(5,'2024-05-05T18:30',1,2,5,4,10),
(5,'2024-05-05T18:30',0,2,9,16,12),
(5,'2024-06-05T19:00',1,0,13,1,23),
(5,'2024-08-28T19:30',0,0,8,15,3),
(5,'2024-09-25T19:00',1,2,14,7,4),
(6,'2024-05-11T16:00',2,0,10,6,1),
(6,'2024-05-12T16:00',0,2,16,2,5),
(6,'2024-05-12T16:00',1,1,12,5,8),
(6,'2024-05-12T16:00',0,1,1,8,21),
(6,'2024-05-12T18:30',1,0,4,17,7),
(6,'2024-05-12T18:30',2,1,20,18,17),
(6,'2024-05-13T20:00',2,1,19,11,2),
(6,'2024-06-09T16:00',2,5,7,9,22),
(6,'2024-08-14T19:30',2,1,15,13,6),
(6,'2024-10-09T19:30',2,1,3,14,3),
(7,'2024-06-01T16:00',0,2,14,17,4),
(7,'2024-06-01T16:00',0,2,18,1,24),
(7,'2024-06-01T18:30',1,1,11,13,1),
(7,'2024-06-01T18:30',0,1,9,15,12),
(7,'2024-06-01T21:00',0,1,6,5,9),
(7,'2024-06-02T16:00',1,1,3,4,3),
(7,'2024-06-02T16:00',1,6,20,10,17),
(7,'2024-06-02T16:00',1,2,7,16,22),
(7,'2024-06-02T18:30',2,0,19,8,2),
(7,'2024-06-02T18:30',1,0,12,2,8),
(8,'2024-06-11T19:00',2,2,1,6,21),
(8,'2024-06-11T19:00',1,1,13,18,23),
(8,'2024-06-11T20:00',1,0,5,11,10),
(8,'2024-06-11T21:30',1,2,17,3,2),
(8,'2024-06-13T19:00',2,1,8,9,3),
(8,'2024-06-13T20:00',0,0,15,19,6),
(8,'2024-06-13T20:00',2,1,10,14,1),
(8,'2024-06-13T20:00',3,1,2,7,11),
(8,'2024-06-13T21:30',1,0,4,12,7),
(8,'2024-06-13T21:30',2,0,16,20,5),
(9,'2024-06-15T18:30',2,1,17,13,2),
(9,'2024-06-15T21:00',1,2,11,1,1),
(9,'2024-06-16T16:00',2,1,18,15,24),
(9,'2024-06-16T16:00',2,2,6,19,9),
(9,'2024-06-16T16:00',1,1,2,10,11),
(9,'2024-06-16T18:30',1,2,14,5,4),
(9,'2024-06-16T18:30',0,0,20,8,17),
(9,'2024-06-16T18:30',5,0,9,12,12),
(9,'2024-06-16T18:30',2,2,7,4,22),
(9,'2024-06-17T20:30',0,4,3,16,3),
(10,'2024-06-19T19:00',1,1,5,2,10),
(10,'2024-06-19T19:00',1,2,1,7,21),
(10,'2024-06-19T20:00',0,1,19,9,2),
(10,'2024-06-19T20:00',1,0,12,14,8),
(10,'2024-06-19T20:00',2,0,13,20,23),
(10,'2024-06-19T21:30',1,0,15,6,6),
(10,'2024-06-19T21:30',2,0,8,11,3),
(10,'2024-06-20T18:30',4,2,18,3,24),
(10,'2024-06-20T20:00',2,1,10,4,1),
(10,'2024-06-20T21:30',2,1,16,17,5),
(11,'2024-06-22T16:00',2,1,7,5,22),
(11,'2024-06-22T17:30',0,1,14,15,4),
(11,'2024-06-22T18:30',0,0,9,1,12),
(11,'2024-06-22T21:30',4,1,20,19,17),
(11,'2024-06-23T16:00',4,1,4,8,7),
(11,'2024-06-23T16:00',0,1,11,10,1),
(11,'2024-06-23T16:00',1,1,2,6,11),
(11,'2024-06-23T18:30',1,1,3,12,3),
(11,'2024-06-23T18:30',3,1,16,13,5),
(11,'2024-06-23T18:30',2,1,17,18,2),
(12,'2024-06-26T19:00',2,0,8,2,3),
(12,'2024-06-26T19:00',2,1,5,17,10),
(12,'2024-06-26T20:00',1,1,6,9,9),
(12,'2024-06-26T20:00',1,1,1,14,21),
(12,'2024-06-26T20:00',2,1,13,10,23),
(12,'2024-06-26T21:30',1,2,15,3,6),
(12,'2024-06-26T21:30',2,1,4,20,7),
(12,'2024-06-26T21:30',3,0,12,16,8),
(12,'2024-06-27T19:00',0,1,11,18,1),
(12,'2024-06-27T20:00',2,1,19,7,2),
(13,'2024-06-29T18:30',1,1,20,5,17),
(13,'2024-06-29T18:30',1,1,9,17,12),
(13,'2024-06-30T11:00',1,1,3,1,3),
(13,'2024-06-30T16:00',1,0,14,11,4),
(13,'2024-06-30T16:00',3,1,19,4,2),
(13,'2024-06-30T16:00',2,1,12,13,8),
(13,'2024-06-30T18:30',0,1,18,2,24),
(13,'2024-06-30T18:30',2,1,10,8,1),
(13,'2024-06-30T18:30',1,1,7,15,22),
(13,'2024-07-01T20:00',2,0,16,6,5),
(14,'2024-07-03T19:00',1,2,9,5,12),
(14,'2024-07-03T20:00',2,0,20,12,17),
(14,'2024-07-03T20:00',1,0,7,8,22),
(14,'2024-07-03T21:30',2,4,3,10,3),
(14,'2024-07-03T21:30',3,1,17,1,2),
(14,'2024-07-03T21:30',1,2,2,19,11),
(14,'2024-07-04T19:00',2,2,14,16,4),
(14,'2024-07-04T19:00',2,0,4,13,7),
(14,'2024-07-04T20:00',1,1,11,15,1),
(14,'2024-07-04T20:00',3,2,6,18,9),
(15,'2024-07-06T20:00',1,1,10,9,1),
(15,'2024-07-06T20:00',2,0,19,17,2),
(15,'2024-07-07T16:00',3,0,8,6,3),
(15,'2024-07-07T16:00',1,0,12,11,8),
(15,'2024-07-07T16:00',3,0,13,14,23),
(15,'2024-07-07T18:00',1,2,15,20,6),
(15,'2024-07-07T18:30',2,1,18,7,24),
(15,'2024-07-07T18:30',2,0,16,4,5),
(15,'2024-07-07T18:30',1,2,1,2,21),
(15,'2024-07-07T20:30',3,0,5,3,10),
(16,'2024-07-10T18:30',0,2,14,8,4),
(16,'2024-07-10T19:00',2,0,20,6,17),
(16,'2024-07-10T19:00',1,3,2,4,11),
(16,'2024-07-11T19:30',3,1,16,1,5),
(16,'2024-07-11T20:00',1,2,10,12,1),
(16,'2024-07-11T20:00',1,1,7,11,22),
(16,'2024-07-11T21:30',2,1,3,19,3),
(16,'2024-07-11T21:30',0,1,18,5,24),
(16,'2024-09-05T20:00',0,0,9,13,12),
(16,'2024-09-25T19:00',2,2,17,15,2),
(17,'2024-07-13T16:00',2,1,8,17,3),
(17,'2024-07-13T16:00',1,2,4,9,7),
(17,'2024-07-16T19:00',1,1,13,3,23),
(17,'2024-07-16T21:00',2,1,6,7,9),
(17,'2024-07-17T19:00',0,1,1,20,21),
(17,'2024-07-17T20:00',1,0,19,14,2),
(17,'2024-07-17T21:30',1,0,5,16,10),
(17,'2024-07-17T21:30',3,1,12,18,8),
(17,'2024-10-22T19:30',1,0,11,2,1),
(17,'2024-10-30T19:00',1,1,15,10,6),
(18,'2024-07-20T16:00',2,1,10,7,1),
(18,'2024-07-20T18:30',1,0,5,15,10),
(18,'2024-07-20T21:00',2,0,16,8,5),
(18,'2024-07-21T11:00',2,0,14,18,4),
(18,'2024-07-21T16:00',2,0,3,20,3),
(18,'2024-07-21T16:00',0,1,4,6,7),
(18,'2024-07-21T18:30',1,0,17,2,2),
(18,'2024-07-21T18:30',3,1,12,1,8),
(18,'2024-07-21T18:30',0,0,13,19,23),
(18,'2024-07-21T20:00',0,1,9,11,12),
(19,'2024-07-24T19:00',2,0,8,13,3),
(19,'2024-07-24T19:30',2,2,19,5,2),
(19,'2024-07-24T20:00',1,2,18,10,24),
(19,'2024-07-24T21:30',1,0,11,16,1),
(19,'2024-07-24T21:30',1,1,1,4,21),
(19,'2024-07-25T20:00',2,2,6,14,9),
(19,'2024-08-28T19:30',1,0,7,17,22),
(19,'2024-09-11T19:30',2,1,15,12,6),
(19,'2024-10-24T19:00',1,0,20,9,17),
(19,'2024-11-16T18:30',null,null,2,3,11),
(20,'2024-07-27T19:00',0,2,16,18,5),
(20,'2024-07-27T19:00',1,2,13,7,23),
(20,'2024-07-27T20:00',1,1,4,15,7),
(20,'2024-07-27T21:30',0,3,5,8,10),
(20,'2024-07-27T21:30',1,0,12,19,8),
(20,'2024-07-28T11:00',0,1,17,11,2),
(20,'2024-07-28T16:00',2,0,10,1,1),
(20,'2024-07-28T19:00',1,0,14,20,4),
(20,'2024-07-28T19:00',2,1,3,6,3),
(20,'2024-07-28T19:00',1,2,9,2,12),
(21,'2024-08-03T16:00',1,0,18,9,24),
(21,'2024-08-03T19:00',2,2,20,17,17),
(21,'2024-08-03T20:00',1,4,1,5,21),
(21,'2024-08-03T20:00',2,1,7,3,22),
(21,'2024-08-03T21:30',1,0,19,10,2),
(21,'2024-08-04T16:00',1,0,11,4,1),
(21,'2024-08-04T16:00',1,1,6,13,9),
(21,'2024-08-04T16:00',0,2,2,14,11),
(21,'2024-08-04T17:00',1,1,15,16,6),
(21,'2024-08-05T21:00',1,2,8,12,3),
(22,'2024-08-10T16:00',1,0,12,7,8),
(22,'2024-08-10T19:00',1,3,9,14,12),
(22,'2024-08-10T21:30',0,0,8,3,3),
(22,'2024-08-10T21:30',2,0,20,11,17),
(22,'2024-08-10T21:30',1,1,6,17,9),
(22,'2024-08-11T11:00',3,2,13,5,23),
(22,'2024-08-11T16:00',2,0,4,18,7),
(22,'2024-08-11T16:00',1,1,10,16,1),
(22,'2024-08-11T16:00',1,0,19,1,2),
(22,'2024-08-11T19:00',2,2,15,2,6),
(23,'2024-08-17T16:00',0,2,14,4,4),
(23,'2024-08-17T16:00',1,1,3,9,3),
(23,'2024-08-17T18:30',1,2,17,12,2),
(23,'2024-08-17T21:00',0,0,11,6,1),
(23,'2024-08-18T16:00',2,1,16,19,5),
(23,'2024-08-18T16:00',1,0,1,15,21),
(23,'2024-08-18T16:00',2,2,7,20,22),
(23,'2024-08-18T18:30',4,1,5,10,10),
(23,'2024-08-18T18:30',1,2,2,13,11),
(23,'2024-08-19T20:00',2,2,18,8,24),
(24,'2024-08-24T16:00',2,1,1,13,21),
(24,'2024-08-24T18:30',5,0,16,9,5),
(24,'2024-08-24T21:00',0,2,3,11,3),
(24,'2024-08-25T16:00',0,0,4,5,7),
(24,'2024-08-25T16:00',1,0,12,6,8),
(24,'2024-08-25T16:00',0,1,7,14,22),
(24,'2024-08-25T18:30',2,1,19,18,2),
(24,'2024-08-25T19:00',1,0,15,8,6),
(24,'2024-08-25T20:00',2,1,10,17,1),
(24,'2024-08-26T21:00',2,1,20,2,17),
(25,'2024-08-31T18:30',2,1,9,7,12),
(25,'2024-08-31T21:00',2,0,5,12,10),
(25,'2024-09-01T11:00',2,3,14,3,4),
(25,'2024-09-01T11:00',3,1,8,1,3),
(25,'2024-09-01T16:00',2,1,6,10,9),
(25,'2024-09-01T18:30',0,1,18,20,24),
(25,'2024-09-01T18:30',2,0,11,19,1),
(25,'2024-09-01T18:30',2,1,17,4,2),
(25,'2024-09-01T18:30',0,2,2,16,11),
(25,'2024-09-01T18:30',1,3,13,15,23),
(26,'2024-09-14T16:00',0,2,1,18,21),
(26,'2024-09-14T18:30',1,1,2,12,11),
(26,'2024-09-14T21:00',2,1,5,6,10),
(26,'2024-09-15T16:00',5,0,16,7,5),
(26,'2024-09-15T16:00',2,2,17,14,2),
(26,'2024-09-15T16:00',2,1,13,11,23),
(26,'2024-09-15T18:30',0,1,8,19,3),
(26,'2024-09-15T18:30',3,0,4,3,7),
(26,'2024-09-15T18:30',1,1,10,20,1),
(26,'2024-09-16T20:00',3,0,15,9,6),
(27,'2024-09-21T16:00',1,0,18,13,24),
(27,'2024-09-21T16:00',3,0,6,1,9),
(27,'2024-09-21T18:30',0,1,11,5,1),
(27,'2024-09-21T21:00',4,1,12,4,8),
(27,'2024-09-22T16:00',3,0,3,17,3),
(27,'2024-09-22T16:00',0,1,20,16,17),
(27,'2024-09-22T18:30',3,2,14,10,4),
(27,'2024-09-22T18:30',1,3,19,15,2),
(27,'2024-09-22T18:30',0,0,9,8,12),
(27,'2024-09-22T20:00',0,0,7,2,22),
(28,'2024-09-28T18:30',2,1,16,3,5),
(28,'2024-09-28T21:00',0,0,5,14,10),
(28,'2024-09-29T11:00',1,1,13,17,23),
(28,'2024-09-29T16:00',3,1,19,6,2),
(28,'2024-09-29T16:00',1,0,12,9,8),
(28,'2024-09-29T16:00',1,0,1,11,21),
(28,'2024-09-29T18:30',3,1,15,18,6),
(28,'2024-09-29T18:30',1,1,8,20,3),
(28,'2024-09-29T18:30',1,0,4,7,7),
(28,'2024-09-29T20:00',1,0,10,2,1),
(29,'2024-10-03T19:00',2,0,7,1,22),
(29,'2024-10-03T21:30',1,0,11,8,1),
(29,'2024-10-04T21:30',3,1,14,12,4),
(29,'2024-10-05T16:30',2,2,3,18,3),
(29,'2024-10-05T16:30',0,0,17,16,2),
(29,'2024-10-05T16:30',0,1,2,5,11),
(29,'2024-10-05T19:00',0,2,4,10,7),
(29,'2024-10-05T19:00',2,2,6,15,9),
(29,'2024-10-05T19:00',2,0,9,19,12),
(29,'2024-10-05T21:00',1,1,20,13,17),
(30,'2024-10-16T21:45',3,0,19,20,2),
(30,'2024-10-16T21:45',1,1,12,3,8),
(30,'2024-10-17T20:00',0,2,10,11,1),
(30,'2024-10-17T20:00',5,2,6,2,9),
(30,'2024-10-18T19:00',0,0,1,9,21),
(30,'2024-10-18T20:00',1,1,5,7,10),
(30,'2024-10-18T21:30',1,1,8,4,3),
(30,'2024-10-19T16:00',1,0,15,14,6),
(30,'2024-10-19T16:00',1,0,18,17,24),
(30,'2024-10-20T20:00',3,5,13,16,23),
(31,'2024-10-26T16:30',3,1,14,1,4),
(31,'2024-10-26T16:30',2,1,18,11,24),
(31,'2024-10-26T16:30',4,2,10,13,1),
(31,'2024-10-26T16:30',2,2,16,12,5),
(31,'2024-10-26T18:30',3,0,2,8,11),
(31,'2024-10-26T19:00',1,3,3,15,3),
(31,'2024-10-26T19:00',0,1,17,5,2),
(31,'2024-10-26T21:00',1,1,7,19,22),
(31,'2024-10-28T19:00',0,1,9,6,12),
(31,'2024-10-28T21:00',3,2,20,4,17),
(32,'2024-11-01T21:00',2,2,11,14,1),
(32,'2024-11-02T16:00',0,0,17,9,2),
(32,'2024-11-02T18:30',1,2,2,18,11),
(32,'2024-11-02T18:30',0,3,13,12,23),
(32,'2024-11-04T20:00',2,0,6,16,9),
(32,'2024-11-05T21:30',2,0,15,7,6),
(32,'2024-11-05T21:30',0,3,4,19,7),
(32,'2024-11-05T21:30',3,0,5,20,10),
(32,'2024-11-06T21:00',0,1,8,10,3),
(32,'2024-11-06T21:00',1,0,1,3,21),
(33,'2024-11-08T19:00',null,null,15,11,6),
(33,'2024-11-08T21:30',null,null,16,14,5),
(33,'2024-11-09T16:30',null,null,18,6,24),
(33,'2024-11-09T16:30',null,null,5,9,10),
(33,'2024-11-09T19:00',null,null,8,7,3),
(33,'2024-11-09T19:00',null,null,12,20,8),
(33,'2024-11-09T19:00',null,null,1,17,21),
(33,'2024-11-09T19:00',null,null,13,4,23),
(33,'2024-11-09T21:00',null,null,19,2,2),
(33,'2024-11-13T20:00',null,null,10,3,1),
(34,'2024-11-20T11:00',null,null,6,8,9),
(34,'2024-11-20T16:30',null,null,17,19,2),
(34,'2024-11-20T16:30',null,null,2,1,11),
(34,'2024-11-20T16:30',null,null,7,18,22),
(34,'2024-11-20T19:00',null,null,14,13,4),
(34,'2024-11-20T19:00',null,null,9,10,12),
(34,'2024-11-20T20:00',null,null,4,16,7),
(34,'2024-11-20T21:30',null,null,3,5,3),
(34,'2024-11-21T20:00',null,null,20,15,17),
(34,'2024-11-22T21:30',null,null,11,12,1),
(35,'2024-11-23T19:30',null,null,5,18,10),
(35,'2024-11-23T19:30',null,null,1,16,21),
(35,'2024-11-23T19:30',null,null,13,9,23),
(35,'2024-11-23T21:30',null,null,19,3,2),
(35,'2024-11-24T16:00',null,null,15,17,6),
(35,'2024-11-24T16:00',null,null,4,2,7),
(35,'2024-11-24T16:00',null,null,6,20,9),
(35,'2024-11-26T19:00',null,null,11,7,1),
(35,'2024-11-26T19:00',null,null,12,10,8),
(35,'2024-11-27T21:00',null,null,8,14,3),
(36,'2024-11-26T21:30',null,null,3,13,3),
(36,'2024-11-26T21:30',null,null,16,5,5),
(36,'2024-11-30T19:30',null,null,9,4,12),
(36,'2024-11-30T19:30',null,null,7,6,22),
(36,'2024-11-30T21:30',null,null,20,1,17),
(36,'2024-12-01T16:00',null,null,14,19,4),
(36,'2024-12-01T16:00',null,null,10,15,1),
(36,'2024-12-01T18:30',null,null,18,12,24),
(36,'2024-12-01T18:30',null,null,17,8,2),
(36,'2024-12-01T18:30',null,null,2,11,11),
(37,'2024-12-04T12:00',null,null,15,5,6),
(37,'2024-12-04T12:00',null,null,8,16,3),
(37,'2024-12-04T12:00',null,null,18,14,24),
(37,'2024-12-04T12:00',null,null,11,9,1),
(37,'2024-12-04T12:00',null,null,20,3,17),
(37,'2024-12-04T12:00',null,null,6,4,9),
(37,'2024-12-04T12:00',null,null,19,13,2),
(37,'2024-12-04T12:00',null,null,2,17,11),
(37,'2024-12-04T12:00',null,null,1,12,21),
(37,'2024-12-04T12:00',null,null,7,10,22),
(38,'2024-12-08T12:00',null,null,14,6,4),
(38,'2024-12-08T12:00',null,null,3,2,3),
(38,'2024-12-08T12:00',null,null,4,1,7),
(38,'2024-12-08T12:00',null,null,10,18,1),
(38,'2024-12-08T12:00',null,null,5,19,10),
(38,'2024-12-08T12:00',null,null,16,11,5),
(38,'2024-12-08T12:00',null,null,17,7,2),
(38,'2024-12-08T12:00',null,null,12,15,8),
(38,'2024-12-08T12:00',null,null,9,20,12),
(38,'2024-12-08T12:00',null,null,13,8,23);

select * from partida;