-- EXEMPLO --
use campeonatobrasileiro;

delimiter $$
create procedure exemplo_while()
begin 
	declare contador int default 1;
	while contador <= 5 do
		select concat('Contador: ', contador);
		set contador = contador + 1;
	end while;
end$$

delimiter ;
call exemplo_while();

-- Exercicio 01 --

show tables;
desc classificacao;
select * from classificacao;

delimiter $$
create procedure gerar_resultado_aleatorio()
begin
	declare contador int default 1;
		while contador <= 380 do
			update partida set gol_mandante = valor_aleatorio(0, 6),
				gol_visitante = valor_aleatorio(0, 6)
				where id_partida = contador;
			set contador = contador + 1;
			end while;
end $$
delimiter ;

select * from classificacao;
call gerar_resultado_aleatorio(); 

-- EXERCICIO 2 -- 

select * from classificacao;

with partidas as (
select 
	rodada,
	id_mandante as id_time,
	gol_mandante as gol_feito,
	gol_visitante as gol_sofrido
from partida
union all
select 
	rodada,
	id_visitante,
	gol_visitante,
	gol_mandante
from partida ),
resultados as (
select 
	rodada, 
	sigla,
	nome, 
	gol_feito,
	gol_sofrido,
	gol_feito - gol_sofrido as saldo_gols,
	if (gol_feito > gol_sofrido, 3, if(gol_feito = gol_sofrido, 1, 0)) pontos,
	if (gol_feito > gol_sofrido, 1, 0) V,
	if (gol_feito = gol_sofrido, 1, 0) E,
	if (gol_feito < gol_sofrido, 1, 0) D
	from partidas as p 
		inner join time as t 
			on p.id_time = t.id_time)
select
	sigla,
	nome,
	sum(gol_feito) as gol_feito,
	sum(gol_sofrido) as gol_sofrido,
	sum(saldo_gols) as saldo_gols,
	sum(pontos) as pontos,
	sum(V) as V,
	sum(E) as E,
	sum(D) as D
from resultados
group by 
	sigla, 
	nome;