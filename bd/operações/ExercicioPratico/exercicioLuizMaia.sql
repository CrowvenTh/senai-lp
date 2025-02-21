-- 1
select * from mysql.user;
create user 'luiz-maia'@'%' identified by 'senai@123';
grant insert, select, update on pizzaria.pizza to 'luiz-maia'@'%';

-- 2
-- 172.16.3.212

-- 3 
use pizzaria;
select * from au_pizza;

-- 4
DELIMITER $$
CREATE TRIGGER depois_insert_pizza
AFTER INSERT ON pizza
FOR EACH ROW
BEGIN
	INSERT INTO au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    VALUES (NEW.id_pizza, NEW.sabor, NEW.ingredientes, user(), now(), 'insert');
END$$

DELIMITER ;

show triggers;
drop trigger antes_insert_pizza