use softblue_exercicios;

-- Módulo 6 - Funções Especiais e Subqueries

select * from pedido;

-- Selecione os nomes de todos os alunos que já fizeram alguma matrícula, sem repetição
select distinct nome_aluno from aluno;

-- Exiba o nome do aluno mais antigo
select a.nome_aluno, p.datahora
from aluno as a
inner join pedido as p
on a.id_aluno = p.id_aluno
order by p.datahora limit 1;

-- Exiba o nome do aluno mais recente
select a.nome_aluno, p.datahora
from aluno as a
inner join pedido as p
on a.id_aluno = p.id_aluno
order by p.datahora desc limit 1;

-- Exiba o nome do terceiro aluno mais antigo
select distinct(a.nome_aluno)
from aluno as a
inner join pedido as p
on a.id_aluno = p.id_aluno
order by p.datahora desc limit 1 offset 2;

select distinct(a.nome_aluno)
from aluno as a
inner join pedido as p
on a.id_aluno = p.id_aluno
order by p.datahora desc limit 2, 1;

-- Exiba a quantidade de cursos que já foram vendidos
select count(*) from detalhe_pedido;

select c.nome_curso, count(dp.id_curso) as qde 
from curso as c
left join detalhe_pedido as dp
on c.id_curso = dp.id_curso
group by nome_curso 
order by qde desc;

-- Exiba o valor total já arrecadado pelos cursos vendidos

select sum(valor) from detalhe_pedido;

-- Exiba o valor médio cobrado por curso para o pedido cujo CODIGO é 2
select avg(valor)
from detalhe_pedido
where id_pedido = 2;

-- Exiba o valor do curso mais caro e o mais barato
select nome_curso, max(valor) from curso;
select nome_curso, min(valor) from curso;

-- Exiba o valor total de cada pedido realizado
select id_pedido, sum(valor) 
from detalhe_pedido
group by id_pedido;

-- Exiba os nomes dos instrutores da e a quantidade de cursos que cada um tem sob sua responsabilidade
select i.nome_instrutor, count(c.instrutor) as qde
from instrutor as i
inner join curso as c
on i.id_instrutor = c.instrutor
group by instrutor;

-- Exiba o número do pedido, nome do aluno e valor para todos os pedidos realizados cujo valor total sejam maiores que 500
select dp.id_pedido, sum(dp.valor) as total, a.nome_aluno
from detalhe_pedido as dp
inner join pedido as p
on dp.id_pedido = p.id_pedido
inner join aluno as a
on p.id_aluno = a.id_aluno
group by dp.id_pedido
having total > 500
order by total desc;

-- Exiba o número do pedido, nome do aluno e quantos cursos foram comprados no pedido para todos os pedidos realizados que compraram dois ou mais cursos
select dp.id_pedido, a.nome_aluno, count(dp.id_pedido) as qde
from detalhe_pedido as dp
inner join pedido as p
on dp.id_pedido = p.id_pedido
inner join aluno as a
on p.id_aluno = a.id_aluno
group by dp.id_pedido
having qde >= 2
order by qde desc;

-- Exiba uma lista com os nomes dos cursos informando para cada curso qual o seu menor valor de venda já praticado
select nome_curso, (select min(valor) from detalhe_pedido as dp where c.id_curso = dp.id_curso) as valor
from curso as c
order by valor; 

-- Exiba os nomes dos cursos disponibilizados cujo tipo de curso seja 'Programação'
select nome_curso
from curso
where tipo_curso 
in (select id_tipo from tipo where tipo_curso = 'Programação');

-- 	Exiba uma lista com os nomes dos instrutores e ao lado o total acumulado das vendas referente aos cursos pelo qual o instrutor é responsáve
select nome_instrutor, (select sum(dp.valor) 
						from detalhe_pedido as dp
                        inner join curso as c
                        on dp.id_curso = c.id_curso
                        where c.instrutor = i.id_instrutor) as total
from instrutor as i
group by nome_instrutor;

-- Crie uma visão que exiba os nomes dos alunos e quanto cada um já comprou em cursos
create view aluno_valor as
select nome_aluno, (select sum(dp.valor)
					from detalhe_pedido as dp
                    inner join pedido as p
                    on dp.id_pedido = p.id_pedido
                    where p.id_aluno = a.id_aluno) as valor_pago
from aluno as a
group by nome_aluno;

select * from aluno_valor;