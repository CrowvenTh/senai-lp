use pizzaria;

insert into pizza(sabor, ingredientes) values
("calabresa premium","calabresa, presunto, borda recheada, aceitona, cebola, mussarela");

update pizza set 
		sabor = "calabresa premium",
        ingredientes = "calabresa, presunto, borda recheada, aceitona, cebola, mussarela"
	where id_pizza = 4;

delete from pizza where id_pizza = 1;

select * from pizza;

select * from au_pizza;	