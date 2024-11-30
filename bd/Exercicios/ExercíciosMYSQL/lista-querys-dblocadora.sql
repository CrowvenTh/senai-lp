/*LISTA DE BANCO DE DADOS COM SAKILA TRADUZIDO PARA PORTUGUÊS*/

use locadora;

/*1. Quais os países cadastrados?*/
select pais from pais;

/*2. Quantos países estão cadastrados?*/
select count(pais_id) from pais;

/*3. Quantos países que terminam com a letra "A" estão cadastrados?*/
select count(pais_id) from pais where pais like '%A';

/*4. Listar, sem repetição, os anos que houveram lançamento de filme.*/
select distinct ano_de_lancamento from filme;

/*5. Alterar o ano de lançamento igual 2007 para filmes que iniciem com a Letra "B".*/
update filme set ano_de_lancamento = 2007 where titulo like '%B';
select * from filme where ano_de_lancamento = 2007;

/*6. Listar os filmes que possuem duração do filme maior que 100 e classificação igual a "G". */
select titulo, duracao_do_filme, classificacao from filme where duracao_do_filme > 100 and classificacao = "G";

/*7. Alterar o ano de lançamento igual 2008 para filmes que possuem duração da locação menor que 4 e classificação igual a "PG". */
update filme set ano_de_lancamento = 2008 where duracao_da_locacao < 4 and classificacao = "PG";
select titulo, ano_de_lancamento, duracao_da_locacao, classificacao from filme where ano_de_lancamento = 2008 and duracao_da_locacao < 4 and classificacao = "PG";

/*8. Listar a quantidade de filmes que estejam classificados como "PG-13" e preço da locação maior que 2.40.*/
select count(*) from filme where classificacao = "PG-13" and preco_da_locacao > 2.40;

/*9. Quais os idiomas que possuem filmes cadastrados? */
select titulo, nome 
	from filme f 
		inner join idioma i
			on f.idioma_id = i.idioma_id;

/*10. Alterar o idioma para "GERMAN" dos filmes que possuem preço da locação maior que 4.*/
update filme, idioma set idioma_id = 6 where preco_da_locacao > 4;

select f.titulo, f.idioma_id, i.nome from filme f
	inner join idioma i
		on f.idioma_id = i.idioma_id  
			where f.idioma_id = 6 and f.preco_da_locacao > 4;

/*11. Alterar o idioma para "JAPANESE" dos filmes que possuem preço da locação igual 0.99.*/
update filme set idioma_id = 3 where preco_da_locacao = 0.99;

select f.titulo, f.idioma_id, i.nome from filme f
	inner join idioma i
		on f.idioma_id = i.idioma_id  
			where f.idioma_id = 3 and f.preco_da_locacao = 0.99;

/*12. Listar a quantidade de filmes por classificação.*/
select classificacao, count(filme_id) as filmes from filme group by classificacao;

/*13. Listar, sem repetição, os preços de locação dos filmes cadastrados.*/
select * from filme;
select distinct preco_da_locacao from filme where filme_id is not null; -- filme_id > 0

/*14. Listar a quantidade de filmes por preço da locação.*/
select preco_da_locacao, count(filme_id) from filme group by preco_da_locacao order by preco_da_locacao desc;

/*15. Listar os precos da locação que possuam mais de 340 filmes.*/
select preco_da_locacao, count(filme_id) from filme group by preco_da_locacao having count(*) > 340;

/*16. Listar a quantidade de atores por filme ordenando por quantidade de atores crescente.*/
select f.titulo, count(a.ator_id) as atores
	from filme f
		inner join filme_ator fa
			on f.filme_id = fa.filme_id
				inner join ator a
					on a.ator_id = fa.ator_id
						group by f.titulo
-- 							order by count(a.ator_id) asc;
                            order by 2 asc;

/*17. Listar a quantidade de atores para os filmes que possuem mais de 5 atores ordenando por quantidade de atores decrescente.*/
select f.titulo, count(a.ator_id) as atores
	from filme f
		inner join filme_ator fa
			on f.filme_id = fa.filme_id
				inner join ator a
					on a.ator_id = fa.ator_id
						group by f.titulo 
                            having count(a.ator_id) > 5
								order by 2 desc;
                                
/*18. Listar o título e a quantidade de atores para os filmes que possuem o idioma "JAPANESE" e mais de 10 atores ordenando por ordem alfabética de título e ordem crescente de quantidade de atores.*/
select f.titulo, count(fa.ator_id) as atores, i.nome as idioma from filme f
	inner join filme_ator fa
		on f.filme_id = fa.filme_id
			inner join idioma i
				on i.idioma_id = f.idioma_id
					where i.nome = 'JAPANESE'
						group by f.titulo
							having count(fa.ator_id) > 10
								order by 1 asc, count(fa.ator_id) asc;
					
/*19. Qual a maior duração da locação dentre os filmes?*/
select max(duracao_da_locacao) as 'duracao (horas)'
	from filme 
		order by 1 desc;

/*20. Quantos filmes possuem a maior duração de locação?*/
select count(filme_id), duracao_da_locacao
	from filme 
		group by 2
			having max(duracao_da_locacao) = 7;
            
	select count(*) qt from filme where duracao_da_locacao in (select max(duracao_da_locacao) from filme);

/*21. Quantos filmes do idioma "JAPANESE" ou "GERMAN" possuem a maior duração de locação?*/
select count(*) qt from filme as f 
inner join idioma as i on f.idioma_id = i.idioma_id
where lower(nome) in ('german', 'japanese')
and duracao_Da_locacao = (select max(duracao_da_locacao) from filme);

/*22. Qual a quantidade de filmes por classificação e preço da locação?*/
select classificacao, preco_da_locacao, count(*) qt from filme
group by classificacao, preco_da_locacao
order by classificacao, preco_da_locacao asc;

/*23. Qual o maior tempo de duração de filme por categoria?*/
select max(f.duracao_do_filme) as 'Duração', c.nome as Categoria
	from filme as f
		inner join filme_categoria as fc 
			on f.filme_id = fc.filme_id
				inner join categoria as c
					on c.categoria_id = fc.categoria_id
						group by 2
							order by 1 desc;
                
/*24. Listar a quantidade de filmes por categoria.*/
select c.nome as Categoria, count(*) Quantidade
	from filme as f
		inner join filme_categoria as fc 
			on f.filme_id = fc.filme_id
				inner join categoria as c
					on c.categoria_id = fc.categoria_id
						group by 1
							order by 2 desc;

/*25. Listar a quantidade de filmes classificados como "G" por categoria.*/
select f.classificacao, count(*) Quantidade, c.nome as categoria from filme as f
	inner join filme_categoria as fc
		on f.filme_id = fc.filme_id
			inner join categoria as c
				on c.categoria_id = fc.categoria_id
					where f.classificacao in ("G")
						group by c.nome;
						
/*26. Listar a quantidade de filmes classificados como "G" OU "PG" por categoria.*/
select c.nome Categoria, count(*) Quantidade -- ,f.classificacao
	from filme f
		inner join filme_categoria fc
			on f.filme_id = fc.filme_id
				inner join categoria c
					on c.categoria_id = fc.categoria_id
						where f.classificacao in ("PG", "G")
							group by 1; -- ,3
								-- order by 3 asc;

/*27. Listar a quantidade de filmes por categoria e classificação.*/
select count(*) as filmes, c.nome categoria, f.classificacao 
	from filme f
		inner join filme_categoria fc
			on f.filme_id = fc.filme_id
				inner join categoria c
					on c.categoria_id = fc.categoria_id
						group by 2,3 
							order by 1 asc;

/*28. Qual a quantidade de filmes por Ator ordenando decrescente por quantidade?*/
select count(*) filmes, a.primeiro_nome
	from filme f
		inner join filme_ator fa
			on f.filme_id = fa.filme_id
				inner join ator a
					on a.ator_id = fa.ator_id
						group by 2 
							order by 1 desc;
                            
/*29. Qual a quantidade de filmes por ano de lançamento ordenando por quantidade crescente?*/
select count(*) as filmes, ano_de_lancamento as "lançamento"
	from filme 
		group by 2 
			order by 1 asc;
            
/*30. Listar os anos de lançamento que possuem mais de 400 filmes?*/
select count(*) as filmes, ano_de_lancamento as "lançamento"
	from filme 
		group by 2 
			having count(*) > 400
				order by 1 asc;
            
/*31. Listar os anos de lançamento dos filmes que possuem mais de 100 filmes com preço da locação maior que a média do preço da locação dos filmes da categoria "Children"?*/
    select ano_de_lancamento, count(*) qt_filme from filme 
    where preco_da_locacao > (
        select avg(preco_da_locacao) from filme as f 
        inner join filme_categoria as fc on f.filme_id = fc.filme_id
        inner join categoria as c on c.categoria_id = fc.categoria_id
        where c.nome = 'Children')
    group by ano_de_lancamento
    having count(*) > 100;

/*32. Quais as cidades e seu pais correspondente que pertencem a um país que inicie com a Letra “E”?*/
select c.cidade, p.pais 
	from cidade c
		inner join pais p
			on c.pais_id = p.pais_id
				where p.pais like 'E%';

/*33. Qual a quantidade de cidades por pais em ordem decrescente?*/
select count(c.cidade), p.pais 
	from cidade c
		inner join pais p
			on c.pais_id = p.pais_id
				group by 2
					order by 1 desc;

/*34. Qual a quantidade de cidades que iniciam com a Letra “A” por pais em ordem crescente?*/
select count(c.cidade) cidades, p.pais 
	from cidade c
		inner join pais p
			on c.pais_id = p.pais_id
		where cidade in (c.cidade like 'A%')
	group by 2
order by 1 asc;

/*35. Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A”?*/
select p.pais, count(c.cidade) cidades
	from pais p
		inner join cidade c
			on c.pais_id = p.pais_id
		where c.cidade like 'A%' 
		group by 1
			having cidades > 3	
		order by 2;
                        
/*36. Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A” ou tenha "R" ordenando por quantidade crescente?*/
select p.pais, count(c.cidade) cidades
	from pais p
		inner join cidade c
			on c.pais_id = p.pais_id
			where c.cidade like 'A%' or c.cidade like 'R%'
		group by 1
			having cidades > 3
		order by 2 asc;
                        
/*37. Quais os clientes moram no país “United States”?*/
-- select cl.primeiro_nome, p.pais
select concat_ws(' ',cl.primeiro_nome, cl.ultimo_nome) as nome, p.pais
	from cliente cl
		inner join endereco e
			on cl.endereco_id = e.endereco_id
		inner join cidade c
			on c.cidade_id = e.cidade_id	
		inner join pais p
			on p.pais_id = c.pais_id
where p.pais = 'United States';
						
/*38. Quantos clientes moram no país “Brazil”?*/
select count(cl.primeiro_nome) clientes, p.pais 
	from cliente cl
		inner join endereco e
			on cl.endereco_id = e.endereco_id
		inner join cidade c
			on c.cidade_id = e.cidade_id	
		inner join pais p
			on p.pais_id = c.pais_id
	where p.pais = 'Brazil'
group by 2;
						
/*39. Qual a quantidade de clientes por pais?*/
select distinct count(*) over(partition by p.pais) clientes, p.pais
	from cliente cl
		inner join endereco e
			on cl.endereco_id = e.endereco_id
		inner join cidade c
			on c.cidade_id = e.cidade_id	
		inner join pais p
			on p.pais_id = c.pais_id
		order by 1 desc;
            
/*40. Quais países possuem mais de 10 clientes?*/

-- consultar
        
/*41. Qual a média de duração dos filmes por idioma?*/
select i.nome, avg(duracao_do_filme) media 
	from filme f
		inner join idioma i
			on f.idioma_id = i.idioma_id
		group by i.nome;
        
/*42. Qual a quantidade de atores que atuaram nos filmes do idioma “English”?*/
select count(distinct fa.ator_id) atores, i.nome
	from filme f
		inner join idioma i
			on f.idioma_id = i.idioma_id
		inner join filme_ator fa
			on fa.filme_id = f.filme_id
		group by i.nome
			having i.nome = 'english';
        
/*43. Quais os atores do filme “BLANKET BEVERLY”?*/
select concat_ws(' ',a.primeiro_nome, ultimo_nome) atores
	from filme f
		inner join filme_ator fa
			on fa.filme_id = f.filme_id
		inner join ator a
			on a.ator_id = fa.ator_id
            where f.titulo = 'BLANKET BEVERLY';
        
/*44. Quais categorias possuem mais de 60 filmes cadastrados?*/
select  c.nome, count(*) quantidade
	from filme f
		inner join filme_categoria fc 
			on f.filme_id = fc.filme_id
		inner join categoria c
			on c.categoria_id = fc.categoria_id
		group by 1
	having quantidade > 60;

/*45. Quais os filmes alugados (sem repetição) para clientes que moram na “Argentina”?*/
create or replace view filme_cliente_pais as (
select f.titulo, p.pais from pais p
	inner join cidade as c
		on p.pais_id = c.pais_id
	inner join endereco as e
		on e.cidade_id = c.cidade_id
	inner join cliente as cl
		on cl.endereco_id = e.endereco_id 
	inner join aluguel a
		on a.cliente_id = cl.cliente_id
	inner join inventario as i
		on i.inventario_id = a.inventario_id
	inner join filme as f
		on f.filme_id = i.filme_id
        order by f.titulo);
        
select distinct titulo 	
	from filme_cliente_pais
where pais = 'Argentina';
         
/*46. Qual a quantidade de filmes alugados por Clientes que moram na “Chile”?*/

/*47. Qual a quantidade de filmes alugados por funcionario?*/

/*48. Qual a quantidade de filmes alugados por funcionario para cada categoria?*/

/*49. Quais Filmes possuem preço da Locação maior que a média de preço da locação?*/

select * 
	from filme 
where preco_da_locacao > (select avg(preco_da_locacao) from filme);

/*50. Qual a soma da duração dos Filmes por categoria?*/
select c.nome, sum(duracao_do_filme) soma_duracao 
	from filme f
		inner join filme_categoria fc
			on f.filme_id = fc.filme_id
		inner join categoria c
			on c.categoria_id = fc.categoria_id
		group by 1;
        
/*51. Qual a quantidade de filmes locados mês a mês por ano? */
select count(f.filme_id) filmes, year(a.data_de_aluguel) ano,
	case
    WHEN MONTH(a.data_de_aluguel) = 1 THEN 'Janeiro'
    WHEN MONTH(a.data_de_aluguel) = 2 THEN 'Fevereiro'
    WHEN MONTH(a.data_de_aluguel) = 3 THEN 'Março'
    WHEN MONTH(a.data_de_aluguel) = 4 THEN 'Abril'
    WHEN MONTH(a.data_de_aluguel) = 5 THEN 'Maio'
    WHEN MONTH(a.data_de_aluguel) = 6 THEN 'Junho'
    WHEN MONTH(a.data_de_aluguel) = 7 THEN 'Julho'
    WHEN MONTH(a.data_de_aluguel) = 8 THEN 'Agosto'
    WHEN MONTH(a.data_de_aluguel) = 9 THEN 'Setembro'
    WHEN MONTH(a.data_de_aluguel) = 10 THEN 'Outubro'
    WHEN MONTH(a.data_de_aluguel) = 11 THEN 'Novembro'
    WHEN MONTH(a.data_de_aluguel) = 12 THEN 'Dezembro'
end as 'mês'
	from filme f
		inner join inventario i
			on f.filme_id = i.filme_id
		inner join aluguel a
			on a.inventario_id = i.inventario_id
            group by 2, 3
				order by 2 asc;

/*52. Qual o total pago por classificação de filmes alugados no ano de 2006?*/
select sum(p.valor) total, f.classificacao
	from filme f
		inner join inventario i
			on f.filme_id = i.filme_id
		inner join aluguel a
			on a.inventario_id = i.inventario_id
		inner join pagamento p
			on p.aluguel_id = a.aluguel_id
            where date_format(a.data_de_aluguel, "%Y") = 2006
		group by 2
	order by 1 desc;
            
/*53. Qual a média mensal do valor pago por filmes alugados no ano de 2005?*/
select f.titulo, sum(p.valor), f.classificacao
	from filme f
		inner join inventario i
			on f.filme_id = i.filme_id
		inner join aluguel a
			on a.inventario_id = i.inventario_id
		inner join pagamento p
			on p.aluguel_id = a.aluguel_id
            where ano_de_lancamento = "2006"
		group by 1, 3;
    
/*54. Qual o total pago por filme alugado no mês de Junho de 2006 por cliente? -----    CORRIGIR  */

-- =====================================================
-- EXtras ----------------------------------------------
-- =====================================================
/*
Formatando nome de datas pra PT-BR:
	set lc_time_names=pt_BR;


*/