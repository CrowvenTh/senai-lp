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