select * from mysql.user;

create user 'novo-usuario'@'localhost' identified by 'senai@123';

create database pizzaria;

grant all privileges on pizzaria.* to 'novo-usuario'@'localhost';

revoke create on pizzaria.* from 'novo-usuario'@'localhost';

show grants for 'novo-usuario'@'localhost';

use pizzaria;
create table au_pizza(
	id_aupizza int auto_increment primary key,
    id_pizza int,
    sabor varchar(250),
    ingredientes varchar(250));

delimiter $$
create trigger antes_insert_pizza
before insert on pizza
for each row
begin
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (new.id_pizza, new.sabor, new.ingredientes, user(), now(), 'insert');
end $$
delimiter ;

-- drop trigger antes_insert_pizza;
show triggers;
