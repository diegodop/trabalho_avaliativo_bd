use db_medicos_pacientes;

insert into especialidades (descricao) values 
('Acupuntura'),
('Anestesiologia'),
('Cardiologia'),
('Cirurgia Geral'),
('Dermatologia'),
('Endocrinologia'),
('Geriatria'),
('Homeopatia'),
('Infectologia'),
('Neurologia');

insert into medicos (nome) values 
('João Ricardo'),
('Nino Paraíba'),
('Luis Otávio'),
('Gabriel Lacerda'),
('Bruno Pachêco'),
('Richard Coelho'),
('Victor Luís'),
('Iury Castilho'),
('Michel Macedo'),
('Vinicius Goes');

insert into remedios (nome) values 
('Amoxicilina'),
('Bactrim'),
('Calcitran D3'),
('Flancox'),
('Clavulin'),
('Enterogermina'),
('Dipirona'),
('Omeprazol'),
('Allegra'),
('Buscopan Composto');

insert into exames (nome) values 
('Hemograma'),
('Colesterol'),
('Glicemia'),
('Raio X'),
('Ultrassonografia'),
('Ressonância Magnética'),
('TSH'),
('Beta HCG'),
('T4 Livre'),
('Exame de Urina');

insert into procedimentos (nome) values 
('Fisioterapia'),
('Cirurgia'),
('Infiltração'),
('Medicação na veia'),
('Biópsia'),
('Cateterismo'),
('Hemodiálise'),
('Terapia'),
('T4 Livre'),
('Transplante');

insert into medicos_especialidades (idMedico, idEspecialidade) values 
(1,3),
(1,8),
(2,1),
(3,4),
(4,8),
(5,7),
(6,2),
(7,5),
(8,10),
(9,9);

insert into pacientes (nome) values 
('João Carlos'),
('Alan Empereur'),
('Rafael Gava'),
('Igor Cariús'),
('André Luis'),
('Joaquim Henrique'),
('Daniel Guedes'),
('Gabriel Pirani'),
('Kelvin Osorio'),
('Felipe Marques');

insert into consulta (idMedico, idPaciente, datahora) values 
(1,10,'2022-10-02 08:00:00'),
(1,3,'2022-10-02 10:00:00'),
(1,7,'2022-10-02 17:00:00'),
(2,10,'2022-10-15 09:00:00'),
(3,10,'2022-09-14 10:00:00'),
(4,1,'2022-10-01 11:00:00'),
(5,2,'2022-10-05 16:00:00'),
(6,5,'2022-10-06 14:00:00'),
(7,6,'2022-10-07 11:00:00'),
(9,7,'2022-10-08 16:00:00');

insert into receita (idMedico, idPaciente, idRemedio, observacao) values
(1,10,2,'tomar uma vez ao dia durante 5 dias'),
(1,3,3,'tomar um comprimido ao dia durante 15 dias'),
(1,7,8,'tomar de 12 em 12 horas por 5 dias'),
(2,10,7,'2022-10-15 09:00:00'),
(3,10,9,'2022-09-14 10:00:00'),
(4,1,6,'2022-10-01 11:00:00'),
(5,2,2,'tomar uma vez ao dia durante 5 dias'),
(6,5,1,'12/12hs por 7 dias'),
(7,6,5,''),
(9,7,4,'');

insert into consulta_exames (idMedico, idPaciente, idExame) values
(1,10,2),
(1,3,3),
(1,7,8),
(2,10,7),
(3,10,9),
(4,1,6),
(5,2,2),
(6,5,1),
(7,6,5),
(9,7,4);

insert into consulta_procedimentos (idMedico, idPaciente, idProcedimento) values
(1,10,2),
(1,3,3),
(1,7,8),
(2,10,7),
(3,10,9),
(4,1,6),
(5,2,2),
(6,5,1),
(7,6,5),
(9,7,4);