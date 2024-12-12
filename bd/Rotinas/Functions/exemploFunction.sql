use campeonatobrasileiro;

delimiter $$

create function quadrado(num int)
returns int
deterministic 
begin 
	return num * num;
end $$

delimiter ;

select quadrado(5);

-- segundo exemplo 

delimiter $$

create function parOuImpar(numero int)
returns varchar(10)
deterministic 
begin 
	if numero % 2 = 0 then 
			return 'Par';
		else 
			return 'Impar';
	end if;
end $$

delimiter ;

select parOuImpar(21);

-- terceiro exemplo

delimiter $$

create function DescobreIdade(idade date)
returns int 
not deterministic 
reads sql data
begin
	return datediff(curdate(), idade) div 365.25;
end $$
delimiter ;

select DescobreIdade(2004-08-21);