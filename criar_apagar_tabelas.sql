#create schema db_medicos_pacientes;

 use db_medicos_pacientes;
 
 create table medicos (
	id int primary key auto_increment,
    nome varchar(60)
 );
 
 create table especialidades (
	id int primary key auto_increment,
    descricao varchar(45)
 );
 
 create table medicos_especialidades (
	idMedico int not null,
    idEspecialidade int not null,
    constraint FK_medicos foreign key (idMedico)
        references medicos(id),
    constraint FK_especialidades foreign key (idEspecialidade)
        references especialidades(id),
    primary key (idMedico, idEspecialidade)
 );
 
  create table pacientes (
	id int primary key auto_increment,
    nome varchar(60)
 );
 
 create table consulta (
	idMedico int not null,
    idPaciente int not null,
    dataHora datetime,
    constraint FK_consulta_medicos foreign key (idMedico)
        references medicos(id),
    constraint FK_consulta_pacientes foreign key (idPaciente)
        references pacientes(id),
    primary key (idMedico, idPaciente)
 );
 
 create table remedios (
	id int primary key auto_increment,
    nome varchar(45)
 );
 
 create table receita (
	idMedico int not null,
    idPaciente int not null,
    idRemedio int not null,
    observacao varchar(100),
    constraint FK_receita_consulta foreign key (idMedico, idPaciente)
        references consulta(idMedico, idPaciente),
    constraint FK_receita_remedios foreign key (idRemedio)
        references remedios(id),
    primary key (idMedico, idPaciente, idRemedio)
 );
 
 create table exames (
	id int primary key auto_increment,
    nome varchar(45)
 );
 
  create table consulta_exames (
	idMedico int not null,
    idPaciente int not null,
    idExame int not null,
    constraint FK_consulta_exames_consulta foreign key (idMedico, idPaciente)
        references consulta(idMedico, idPaciente),
    constraint FK_consulta_exames foreign key (idExame)
        references exames(id),
    primary key (idMedico, idPaciente, idExame)
 );
 
  create table procedimentos (
	id int primary key auto_increment,
    nome varchar(45)
 );
 
   create table consulta_procedimentos (
	idMedico int not null,
    idPaciente int not null,
    idProcedimento int not null,
    constraint FK_consulta_procedimento_consulta foreign key (idMedico, idPaciente)
        references consulta(idMedico, idPaciente),
    constraint FK_consulta_procedimentos foreign key (idProcedimento)
        references procedimentos(id),
    primary key (idMedico, idPaciente, idProcedimento)
 );
 

 # apagar todas as tabelas
 /*
 drop table receita;
 drop table consulta_exames;
 drop table consulta_procedimentos;
 drop table consulta;
 drop table medicos_especialidades;
 drop table medicos;
 drop table especialidades;
 drop table pacientes;
 drop table remedios;
 drop table exames;
 drop table procedimentos;
*/