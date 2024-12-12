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