use softblue_exercicios;

-- Módulo 5 - Relacionamentos e views

select * from curso;

-- Exiba uma lista com os títulos dos cursos e o tipo de curso ao lado
select c.id_curso, c.nome_curso, c.instrutor, c.valor, t.tipo_curso
from curso as c
left join tipo as t
on c.tipo_curso = t.id_tipo;

-- Exiba uma lista com os títulos dos cursos, tipo do curso, nome do instrutor responsável pelo mesmo e telefone
select c.nome_curso, i.nome_instrutor, i.telefone, t.tipo_curso 
from curso as c
left join instrutor as i
on c.instrutor = i.id_instrutor
left join tipo as t
on c.tipo_curso = t.id_tipo;

-- Exiba uma lista com o código e data e hora dos pedidos e os códigos dos cursos de cada pedido
select dp.id_pedido, dp.id_curso, dp.id_curso, p.datahora
from detalhe_pedido as dp
left join pedido as p
on dp.id_pedido = p.id_pedido;

-- Exiba uma lista com o código e data e hora dos pedidos, nome do aluno e os títulos dos cursos de cada pedido
select dp.id_pedido, p.datahora, a.nome_aluno, c.nome_curso 
from detalhe_pedido as dp
left join pedido as p
on dp.id_pedido = p.id_pedido
left join aluno as a
on p.id_aluno = a.id_aluno
left join curso as c
on dp.id_curso = c.id_curso;

-- Crie uma visão que traga o título e preço somente dos cursos de programação
create view titulo_preco as
select nome_curso, valor
from curso
where nome_curso = 'Programação';

select * from titulo_preco;

-- Crie uma visão que traga os títulos dos cursos, tipo do curso e nome do instrutor;
create view titulo_tipo_instrutor as
select c.nome_curso, t.tipo_curso, i.nome_instrutor
from curso as c
left join tipo as t
on c.tipo_curso = t.id_tipo
left join instrutor as i
on c.instrutor = i.id_instrutor; 

select * from titulo_tipo_instrutor;