use campeonatobrasileiro;

show tables;

select * from campeonatobrasileiro.estadio;
select * from campeonatobrasileiro.evento;
select * from campeonatobrasileiro.jogador;
select * from campeonatobrasileiro.partida;
select * from campeonatobrasileiro.time;

select * from (
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
) as tb_mandante;