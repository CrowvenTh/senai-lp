use campeonatoBrasileiro;

create table teste (
col01 float(5,2)
);

select * from teste;

drop table teste;
create table teste(
	id int primary key auto_increment,
    col01 decimal(5,2) not null,
    col02 int not null check(col02 > 10),
    col03 int check (col03 < 20),
    col04 int check (col04 > 1 and col04 < 5),
    col05 varchar(100) default ('alguma coisa'),
    col06 varchar(100) unique
);

select * from teste;
insert into teste (col01) value (5.9);
insert into teste (col01, col02) value (5.9,11);
insert into teste(col01, col02,col03,col04) value (5.9,11,-44,3);
insert into teste(col02,col01,col04,col03) value (15.9,11,4,3);
insert into teste(col01, col02,col05,col06) value (0,100,'mesma coisa','senai');
insert into teste(col01, col02,col05,col06) value (0,100,'outra coisa','SENAI02');
