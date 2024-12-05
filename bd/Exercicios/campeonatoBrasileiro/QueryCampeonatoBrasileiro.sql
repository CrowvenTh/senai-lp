use campeonatobrasileiro;

show tables;

select * from campeonatobrasileiro.estadio;
select * from campeonatobrasileiro.evento;
select * from campeonatobrasileiro.jogador;
select * from campeonatobrasileiro.partida;
select * from campeonatobrasileiro.time;

create view vw_visitante as (
	select 
		t.sigla, 
		p.gol_mandante,
		p.gol_visitante,
			if(p.gol_mandante > p.gol_visitante, 3, 
				if (p.gol_mandante = p.gol_visitante, 1, 0)) pontos
		from campeonatobrasileiro.partida p
			inner join campeonatobrasileiro.time t
				on p.id_mandante = t.id_time
	where gol_mandante is not null and gol_mandante is not null 
) as tb;


create view classificacao as (
select 
	sigla,
		sum(pontos) pontos,
		sum(qt_partidaas) J,
		sum(vitoria) V,
		sum(saldo_gols) SG,
		concat(sum(gols), ':', sum(gols_sofridos)) Gol,
		sum(empate) E,
		sum(derrota) D
	from (
		select * from vw_mandante
			union all
		select * from vw_visitante) as tb
	group by sigla
order by pontos desc, v desc, sum(gols) desc);

select * from classificacao order by 1;
		
	