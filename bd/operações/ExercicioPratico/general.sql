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
create trigger antes_update_pizza
after update on pizza
for each row
begin
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (old.id_pizza, old.sabor, old.ingredientes, user(), now(), 'update');
end $$
delimiter ;

delimiter $$
create trigger delete_pizza
before delete on pizza
for each row
begin
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (old.id_pizza, old.sabor, old.ingredientes, user(), now(), 'delete');
end $$
delimiter ;

drop trigger delete_pizza;
show triggers;

select * from au_pizza;
select * from pizza;

-- privileges 
grant select on pizzaria.au_pizza to 'luiz-maia'@'%';
grant insert on pizzaria.pizza to 'luiz-maia'@'%';
grant update on pizzaria.pizza to 'luiz-maia'@'%';
grant delete on pizzaria.pizza to 'luiz-maia'@'%';
flush privileges;