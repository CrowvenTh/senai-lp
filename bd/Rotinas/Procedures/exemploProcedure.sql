use campeonatobrasileiro;

create table usuarios (
 id int not null auto_increment, 
 nome varchar(100) default null,
 email varchar(100) default null,
 	primary key (id)
);

-- drop procedure adicionar_usuario; -- deletando procedure

delimiter $$

create procedure adicionar_usuario(nome varchar(100), email varchar(100))
begin 
	insert into usuarios (nome, email) values (nome, email);
end$$

delimiter ;

call adicionar_usuario('João Silva','joao@gmail.com');
call adicionar_usuario('Luiz Felipe','luiz@gmail.com');
call adicionar_usuario('Elon Musk','elon@gmail.com');

select * from usuarios;

-- Exemplo com parâmetros de saida: Uma procedure que retorna a quantidade de usuarios em uma tabela:  

delimiter $$

create procedure contar_usuarios(out quantidade int)
begin 
	select count(*) into quantidade from usuarios; 
end$$

delimiter ;

call contar_usuarios(@total);
select @total;

-- exemplo com logica condicional, uma procedure que atualiza um registro somente se eke existir:

delimiter $$

create procedure atualizar_email(id_usuario int, novo_email varchar(100))
begin 
	if exists (select 1 from usuarios where id = id_usuario) then 
	update usuarios set email = novo_email where id = id_usuario;
	else
		signal sqlstate '45000' set message_text = 'Usuário não encontrado';
	end if;
end$$

delimiter ;

call atualizar_email(5, 'novo_email@gmail.com');
call atualizar_email(1, 'novo_email@gmail.com');

select * from usuarios;

-- atualizar gols da partida

delimiter $$

create procedure atualizar_gol_partida(m_sigla varchar(3), m_gol int, v_gol int, v_sigla varchar(3))
begin 
	declare idpartida int;
		set id_partida = (select id_partida from partida
			where id_mandante = (select id_time from time where sigla = m_sigla ) and 
					id_visitante = (select id_time from time where sigla = v_sigla));
				
				update partida set gol_mandante = m_gol, gol_visitante = v_gol where id_partida = idpartida;
end$$

delimiter ;

call atualizar_gol_partida('FLU', 0, 0, 'CRI');

select * from time;

