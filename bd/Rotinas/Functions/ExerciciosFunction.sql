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

-- -- -- 

-- RESOLUÇÃO 03 --

-- -- --
