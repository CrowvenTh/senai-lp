-- RESOLUÇÃO 01 -- 

drop function valor_aleatorio;

delimiter $$

create function valor_aleatorio(valorMin int, valorMax int)
returns int 
not deterministic
reads sql data
begin 
	return round(rand() * (valorMax - valorMin)) + valorMin;
end$$

delimiter ;

select valor_aleatorio(5, 15) as "valor aleatorio";
select valor_aleatorio(15, 20) as "valor aleatorio";
select valor_aleatorio(1, 5) as "valor aleatorio";

-- -- -- 

-- RESOLUÇÃO 02 --
delimiter $$
create function data_br(dataBr date)
returns varchar(20)
deterministic 
begin
	return date_format(dataBr,'%d/%m/%Y');
end$$

delimiter ;

select data_br(curdate()) as 'Dia de hoje';
select data_br('2004-08-21');

-- -- -- 

-- RESOLUÇÃO 03 --

-- -- --
