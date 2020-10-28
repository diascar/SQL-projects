create table if not exists Aluno (
matricula char(10) primary key not null unique,
nome varchar(25) not null,
sobrenome varchar(100) not null,
email varchar(100) not null unique,
telefone varchar(15),
habilitacao_id smallint,
total_creditos smallint not null);

create table if not exists Habilitacao (
habilitacao_id smallint primary key not null unique,
nome varchar(50) not null unique);

create table if not exists Disciplina (
codigo_disciplina char(6) primary key not null unique,
nome varchar(100) not null unique,
ementa text);

alter table disciplina add column creditos smallint not null;

create table if not exists Professor (
professor_id char(10) primary key not null unique,
nome varchar(25) not null,
sobrenome varchar(100) not null,
email varchar(100) not null unique,
telefone varchar(15));

alter table aluno 
add constraint aluno_fk foreign key (habilitacao_id) references habilitacao (habilitacao_id);

create table if not exists Turma (
codigo_disciplina char(6) not null,
ano date not null,
professor_id char(10) not null,
semestre smallint not null check (semestre = 1 or semestre = 2),
constraint cod_disc_fk foreign key (codigo_disciplina) references Disciplina (codigo_disciplina),
constraint prof_fk foreign key (professor_id) references Professor (professor_id),
constraint turma_pk primary key (codigo_disciplina, ano, professor_id));

create table if not exists AlunoTurma (
matricula char(10) not null,
codigo_disciplina char(6) not null,
ano date not null,
professor_id char(10) not null,
constraint altu_pk primary key (matricula, codigo_disciplina, ano));


alter table alunoturma
add constraint altur_mat_fk foreign key (matricula) references Aluno (matricula),
add	constraint altur_cdis_fk foreign key (codigo_disciplina) references Disciplina (codigo_disciplina),
add	constraint altur_prid_fk foreign key (professor_id) references Professor (professor_id);
