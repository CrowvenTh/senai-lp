
use campeonatobrasileiro;

-- 01. Atualize na tabela evento as descrições 
-- DE "Substitution" PARA "Substituição"
-- DE "Woodwork" PARA "Bola na Trave"
-- DE "Cartão Vermelho (Second Yellow Card)" PARA "Cartão Vermelho (Segundo Cartão Amarelo)"

select * from campeonatobrasileiro.evento;
update campeonatobrasileiro.evento set descricao = "Substituição" where descricao = "Substitution";
update campeonatobrasileiro.evento set descricao = "Bola na Trave" where descricao = "Woodwork";
update campeonatobrasileiro.evento set descricao = "Cartão Vermelho (Segundo Cartão Amarelo)" where descricao = "Cartão Vermelho (Second Yellow Card)";

-- 02. Atualize o resultado das partidas do brasileirão
-- que já aconteceram e ainda não foi gravado o resultado.
select id_partida , rodada, tm.sigla, gol_mandante, tv.sigla, gol_visitante 
	from partida p 
	inner join time tm 
		on id_mandante = tm.id_time
	inner join time tv 
		on id_visitante = tv.id_time
	where gol_mandante is null or rodada >= 35
order by id_partida;

update partida set gol_mandante = 0, gol_visitante = 0 where id_partida = 0;
-- rodada 35
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 341;
update partida set gol_mandante = 0, gol_visitante = 1 where id_partida = 342;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 343;
update partida set gol_mandante = 2, gol_visitante = 2 where id_partida = 344;
update partida set gol_mandante = 4, gol_visitante = 1 where id_partida = 345;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 346;
update partida set gol_mandante = 3, gol_visitante = 1 where id_partida = 347;
update partida set gol_mandante = 0, gol_visitante = 0 where id_partida = 348;
update partida set gol_mandante = 0, gol_visitante = 0 where id_partida = 349;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 350;
-- rodada 36
update partida set gol_mandante = 2, gol_visitante = 3 where id_partida = 351;
update partida set gol_mandante = 3, gol_visitante = 1 where id_partida = 352;
update partida set gol_mandante = 1, gol_visitante = 2 where id_partida = 353;
update partida set gol_mandante = 2, gol_visitante = 4 where id_partida = 354;
update partida set gol_mandante = 2, gol_visitante = 2 where id_partida = 355;
update partida set gol_mandante = 2, gol_visitante = 1 where id_partida = 356;
update partida set gol_mandante = 3, gol_visitante = 2 where id_partida = 357;
update partida set gol_mandante = 2, gol_visitante = 0 where id_partida = 358;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 359;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 360;
-- rodada 37
update partida set gol_mandante = 0, gol_visitante = 1 where id_partida = 361;
update partida set gol_mandante = 1, gol_visitante = 2 where id_partida = 362;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 363;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 364; -- indefinido
update partida set gol_mandante = 2, gol_visitante = 0 where id_partida = 365;
update partida set gol_mandante = 3, gol_visitante = 0 where id_partida = 366;
update partida set gol_mandante = 1, gol_visitante = 2 where id_partida = 367;
update partida set gol_mandante = 0, gol_visitante = 1 where id_partida = 368; -- indefinido
update partida set gol_mandante = 3, gol_visitante = 1 where id_partida = 369;
update partida set gol_mandante = 0, gol_visitante = 3 where id_partida = 370;


-- 03. Elabore um relatório por minuto e a quantidade de gols (não contar "Gol anulado (Var)")
-- e ordene pela quantidade do maior para o menor
select * from evento;
select minuto, count(descricao) as Gols
	from evento
	where descricao like "Gol%" and descricao not like "Gol anulado (Var)"
	group by 1
order by 2 desc;

-- 04. Elabore um relatório por idade e quantidade de jogadores
show tables;
select (year(curdate()) - year(dt_nascimento)) as idade, 
		count(id_jogador) jogadores 
	from jogador
	group by 1;
-- order by idade desc;

-- 05. Elabore um relatório por jogador e quantidade de cartões, 
-- detalhar também a quantidade de Cartões Vermelho e Amarelo
-- ordene pela quantidade total de Cartões'.

select * from jogador;
select * from evento;
	-- count(if(e.descricao = "Cartão Amarelo")) as "Cartões Amarelos"
 	-- count(if(e.descricao = "Cartão Vermelho")) as "Cartões vermelhos", 
select j.nome,
		case
			when e.descricao = "Cartão Vermelho" then count(descricao) as "Cartões vermelhos"
			when e.descricao = "Cartão amarelo" then count(descricao) as "Cartões amarelos"		
		end
	from jogador j
		inner join evento e 
			on e.id_jogador = j.id_jogador
		group by 1
	order by 2 desc;
	