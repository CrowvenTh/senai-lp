-- 1
select * from mysql.user;
create user 'luiz-maia'@'%' identified by 'senai@123';
grant select, insert, update on pizzaria.pizza to 'luiz-maia'@'%';

-- 2
-- 172.16.3.212

-- 3 
use pizzaria;
select * from au_pizza;

-- 4
delimiter $$
create trigger antes_update_pizza
after update on pizza
for each row
begin
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (old.id_pizza, old.sabor, old.ingredientes, user(), now(), 'update');
end $$
delimiter ;

-- 5 
delimiter $$
create trigger delete_pizza
before delete on pizza
for each row
begin
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (old.id_pizza, old.sabor, old.ingredientes, user(), now(), 'delete');
end $$
delimiter ;

-- 6 
grant delete on pizzaria.pizza to 'luiz-maia'@'%';

-- 7
grant select on pizzaria.au_pizza to 'luiz-maia'@'%';
flush privileges;