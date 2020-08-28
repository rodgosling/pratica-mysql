use softblue_exercicios;

-- Módulo 4 - Populando as tabelas
insert into tipo
values
	(1, 'Banco de dados'), 
    (2, 'Programação'), 
    (3, 'Modelagem de dados');
    
select * from tipo;

insert into instrutor (nome_instrutor, telefone)
values
	('André Milani', '1111-1111'), 
    ('Carlos Tosin', '1212-1212');
    
select * from instrutor;

insert into curso (nome_curso, tipo_curso, instrutor, valor)
values
	('Java Fundamentos', 2, 2, 270), 
    ('Java Avançado', 2, 2, 330), 
    ('SQL Completo', 1, 1, 170), 
    ('Php Básico', 2, 1, 270);
    
select * from curso;

insert into aluno (nome_aluno, endereco, email)
values
	('José', 'Rua XV de Novembro 72', 'jose@softblue.com.br'), 
    ('Wagner', 'Av. Paulista', 'wagner@softblue.com.br'), 
    ('Emílio', 'Rua Lajes 103, ap: 701', 'emilio@softblue.com.br'), 
    ('Cris', 'Rua Tauney 22', 'cris@softblue.com.br'), 
    ('Regina', 'Rua Salles 305', 'regina@softblue.com.br'), 
    ('Fernando', 'Av. Central 30', 'fernando@softblue.com.br');

select * from aluno;

insert into pedido
values
	(1, 2, '2010-04-15 11:23:32'),
    (2, 2, '2010-04-15 14:36:21'), 
    (3, 3, '2010-04-16 11:17:45'), 
    (4, 4, '2010-04-17 14:27:22'), 
    (5, 5, '2010-04-18 11:18:19'),
	(6, 6, '2010-04-19 13:47:35'),
	(7, 6, '2010-04-20 18:13:44');
    
select * from pedido;

insert into detalhe_pedido
values
	(1, 1, 270),
	(1, 2, 330),
	(2, 1, 270),
	(2, 2, 330),
	(2, 3, 170),
	(3, 4, 270),
	(4, 2, 330),
	(4, 4, 270),
	(5, 3, 170),
	(6, 3, 170),
	(7, 4, 270);

select * from detalhe_pedido;

-- Exibir somente o título de cada curso
select nome_curso from curso;

-- Exibir somente o título e valor de cada curso cujo preço seja maior que 200;
select nome_curso, valor 
from curso
where valor > 200;

-- Exibir somente o título e valor de cada curso cujo preço seja maior que 200 e menor que 300
select nome_curso, valor 
from curso
where valor between 200 and 300;

-- Exibir as informações da tabela PEDIDOS para os pedidos realizados entre 15/04/2010 e 18/04/2010;
select * 
from pedido
where datahora between '2010-04-15' and '2010-04-18';

-- Altere o endereço do aluno JOSÉ para 'Av. Brasil 778';
update aluno
set endereco = 'Av. Brasil 778'
where id_aluno = 1;

-- Altere o e-mail do aluno CRIS para 'cristiano@softblue.com.br'
update aluno
set email = 'cristiano@softblue.com.br'
where id_aluno = 4;

-- Aumente em 10% o valor dos cursos abaixo de 300;
update curso	
set valor = valor * 1.1
where valor < 300;
