DELIMITER $$
create trigger tr_altera_medico AFTER update On medicos
for each row
begin
	declare msg varchar(500);
	set msg = concat('O médico ',old.nome,' foi alterado para ', new.nome);
	insert into historico values(msg);
end$$
DELIMITER ;

DELIMITER $$
create trigger tr_altera_paciente AFTER update On pacientes
for each row
begin
	declare msg varchar(500);
	set msg = concat('O paciente ',old.nome,' foi alterado para ', new.nome);
	insert into historico values(msg);
end$$
DELIMITER ;