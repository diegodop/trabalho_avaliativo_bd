#quantidade de consultas realizadas por um médico (inner join contemplando duas tabelas)
create or replace view consultasRealizadasParaCadaMedico as 
select m.nome as nomeMedico, count(c.idPaciente) as qtd from medicos m
inner join consulta c on c.idMedico = m.id
group by m.nome;

#quantidade de consultas realizadas por um médico incluindo quem não fez nenhuma (right join contemplando duas tabelas)
create or replace view consultasRealizadasParaCadaMedicoIncluindoZero as 
select m.nome as nomeMedico, count(c.idPaciente) as qtd from consulta c
right join medicos m on m.id = c.idMedico
group by m.nome;

#quantidade de consultas que cada paciente fez (inner join contemplando duas tabelas)
create or replace view consultasRealizadasPorPaciente as 
select p.nome as nomePaciente, count(c.idPaciente) as qtd from pacientes p
inner join consulta c on c.idPaciente = p.id
group by p.nome order by p.nome;

#quantidade de consultas que cada paciente fez incluindo quem não fez nenhum (left join contemplando duas tabelas)
create or replace view consultasRealizadasPorPacienteIncluindoZero as 
select p.nome as nomePaciente, count(c.idPaciente) as qtd from pacientes p
left join consulta c on c.idPaciente = p.id
group by p.nome order by p.nome;

#retornar o nome do paciente e a quantidade de exames contanto que o paciente tenha feito pelo menos dois exames (inner join contemplando três tabelas)
create or replace view pacientesComPeloMenosDoisExames as 
select p.nome as nomePaciente, count(ce.idExame) as qtdExames from pacientes p 
inner join consulta c on c.idPaciente = p.id
inner join consulta_exames ce on ce.idMedico = c.idMedico and ce.idPaciente = c.idPaciente
group by p.nome
having count(distinct ce.idExame) >= 2;

#nome do médico, nome do paciente e remedios prescritos  (inner join contemplando cinco tabelas)
create or replace view consultasRemediosPrescritos as 
select m.nome as medico, p.nome as paciente, rem.nome from medicos m 
inner join consulta c on c.idMedico = m.id
inner join pacientes p on p.id = c.idPaciente
inner join receita rec on rec.idMedico = c.idMedico and rec.idPaciente = c.idPaciente
inner join remedios rem on rem.id = rec.idRemedio
order by m.nome;

# Listar o nome do médico e a data que foi realizada a última consulta
create or replace view MedicoUltimaConsulta as 
select m.nome, c.dataHora from medicos m
inner join consulta c on c.idMedico = m.id
and c.dataHora = (select max(dataHora) from consulta);

# Listar o nome do paciente e a data que foi realizada a primeira consulta
create or replace view PacientePrimeiraConsulta as 
select p.nome, c.dataHora from pacientes p, consulta c
where p.id = c.idPaciente and c.dataHora = (select min(dataHora) from consulta);
