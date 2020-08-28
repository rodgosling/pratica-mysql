use softblue_exercicios;

-- Módulo 3 - Criando as tabelas
create table tipo
(
	id_tipo int unsigned auto_increment not null,
	tipo_curso varchar (30) not null,
	primary key (id_tipo)
);

create table instrutor
(
	id_instrutor int unsigned auto_increment not null,
    nome_instrutor varchar (50) not null,
    telefone varchar (15) not null,
    primary key (id_instrutor)
);

create table curso
( 
	id_curso int unsigned auto_increment not null,
    nome_curso varchar (30) not null,
    tipo_curso int unsigned not null,
    instrutor int unsigned not null,
    valor double not null,
    primary key (id_curso),
    index fk_tipo (tipo_curso),
    index fk_instrutor (instrutor),
    foreign key (tipo_curso) references tipo (id_tipo),
    foreign key (instrutor) references instrutor (id_instrutor)
    );
    
create table aluno
(
	id_aluno int unsigned auto_increment not null,
    nome_aluno varchar (50) not null,
    endereco varchar (200),
    email varchar (50),
    primary key (id_aluno)
);

create table pedido
(
	id_pedido int unsigned auto_increment not null,
    id_aluno int unsigned not null,
    datahora datetime,
    primary key (id_pedido),
    index fk_id_aluno (id_aluno),
    foreign key (id_aluno) references aluno (id_aluno)
    );

create table detalhe_pedido
(
	id_pedido int unsigned not null,
    id_curso int unsigned not null,
	valor double not null,
	index fk_id_pedido (id_pedido),
    index fk_id_curso (id_curso),
    foreign key (id_pedido) references pedido (id_pedido),
    foreign key (id_curso) references curso (id_curso)
);

-- Inclua a coluna DATA_NASCIMENTO na tabela ALUNO do tipo string, de tamanho 10 caracteres
alter table aluno
add data_nascimento varchar (10);

select * from aluno;

-- Altere a coluna DATA_NASCIMENTO para NASCIMENTO e seu tipo de dado para DATE;
alter table aluno
change data_nascimento data_nascimento date null;

-- Inclua o campo EMAIL na tabela INSTRUTOR, com tamanho de 100 caracteres;
alter table instrutor
add email varchar (100);

select * from instrutor;

-- Remova o campo EMAIL da tabela INSTRUTOR;
alter table instrutor
drop email;
