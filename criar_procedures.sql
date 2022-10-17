DELIMITER $$
create procedure pCadastrarMedico(in nomeMedico varchar(60))
begin
	declare msg varchar(100);
	insert into medicos(nome) values (nomeMedico);
	set msg = concat('Médico ',nomeMedico,' cadastrado com sucesso!');
    select msg;
end$$;
DELIMITER ;

call pCadastrarMedico('NOVO MÉDICO');
select * from medicos;

DELIMITER $$
create procedure pCadastrarEspecialidade(in descricaoEspecialidade varchar(60))
begin
	declare msg varchar(100);
	insert into especialidades(descricao) values (descricaoEspecialidade);
	set msg = concat('Especialidade ',descricaoEspecialidade,' cadastrada com sucesso!');
    select msg;
end$$;
DELIMITER ;

call pCadastrarEspecialidade('NOVA ESPECIALIDADE');
select * from especialidades;

DELIMITER $$
create procedure pCadastrarPaciente(in nomePaciente varchar(60))
begin
	declare msg varchar(100);
	insert into pacientes(nome) values (nomePaciente);
	set msg = concat('Paciente ',nomePaciente,' cadastrado com sucesso!');
    select msg;
end$$;
DELIMITER ;

call pCadastrarPaciente('NOVO PACIENTE');
select * from pacientes;

DELIMITER $$
create procedure pAlterarMedico(in nomeAtual varchar(60), in nomeNovo varchar(60))
begin
	declare qtd int;
    declare msg varchar(100);
    select count(id) into qtd from medicos where nome = nomeAtual;
	if qtd > 0 then
		update medicos set nome = nomeNovo where nome = nomeAtual;
        set msg = 'Médico alterado com sucesso!';
	else
		set msg = "O médico informado não existe.";
    end if;
end$$;
DELIMITER ;

call pAlterarMedico('NOVO MÉDICO', 'VELHO MÉDICO');
select * from medicos;

DELIMITER $$
create procedure pAlterarEspecialidade(in descAtual varchar(60), in descNova varchar(60))
begin
	declare qtd int;
    declare msg varchar(100);
    select count(id) into qtd from especialidades where descricao = descAtual;
	if qtd > 0 then
		update especialidades set descricao = descNova where descricao = descAtual;
        set msg = 'Especialidade alterada com sucesso!';
	else
		set msg = "A especialidade informada não existe.";
    end if;
end$$;
DELIMITER ;

call pAlterarEspecialidade('NOVA ESPECIALIDADE', 'VELHA ESPECIALIDADE');
select * from especialidades;
