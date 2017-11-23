Create database balonbases; 
use balonbases;
create table torneo (ID_torneo int not null auto_increment, nombre varchar(100) not null, 
	lugar varchar(100) not null, primary key (ID_torneo));
create table categoria(ID_categoria int not null auto_increment,
 genero varchar(30) not null, edad int not null, primary key (ID_categoria));

create table fixture (ID_fixture int not null auto_increment, 
descripcion varchar (1000) not null,
 primary key (ID_fixture));
alter table torneo 
add column ID_categoria int not null;
alter table torneo
add constraint FK_ID_categoria foreign key (ID_categoria)
references categoria (ID_categoria);
alter table torneo                                                                                                 
 add column ID_fixture int not null;
alter table torneo
add constraint FK_ID_fixture foreign key (ID_fixture)
references fixture (ID_fixture);

create table equipo
(ID_equipo int not null,
nombre varchar(100)not null,
color varchar(50)not null,
primary key(ID_equipo));


alter table equipo
add column ID_entrenador int not null;


create table entrenador (ID_entrenador int not null auto_increment, nombre varchar(100) not null, fechadenacimiento date not null, genero varchar(30) not null, cedula varchar(20) not null, primary key (ID_entrenador));

alter table equipo  add constraint FK_ID_entrenador foreign key (ID_entrenador) references entrenador (ID_entrenador);

create table jugador (ID_jugador int not null auto_increment, nombre varchar(100) not null, genero varchar(30) not null, fechanacimiento date not null, documento varchar(30) not null, ID_equipo int not null, primary key (ID_jugador));
alter table jugador 
add constraint FK_ID_equipo1 foreign key (ID_equipo)
references equipo(ID_equipo);

create table estadistica_indv(ID_estadistica_indv int not null auto_increment, faltas int not null, rebotes int not null, lanzamientos int not null, canastas int not null, dobles int not null, triples int not null, primary key (ID_estadistica_indv));
alter table estadistica_indv 
add column tiempo_jugado double not null;
alter table estadistica_indv  
add column precisio double not null;
alter table estadistica_indv
add column ID_jugador int not null;
 alter table estadistica_indv 
 add constraint FK_ID_jugador1 foreign key (ID_jugador)
 references jugador(ID_jugador);

create table partido(ID_partido int not null auto_increment, sede varchar(30) not null, duracion double not null, primary key (ID_partido));

create table equipo_partido (ID_equipo int not null, ID_partido int not null
,primary key (ID_equipo,ID_partido));

alter table equipo_partido 
add constraint FK_ID_equipo2 foreign key (ID_equipo)
references equipo (ID_equipo);

alter table equipo_partido  
add constraint FK_ID_partido1 foreign key (ID_partido) 
references partido (ID_partido);
alter table equipo_partido                                                                                        
add column resultado varchar(30) not null;
alter table equipo_partido
add column pts_favor int not null;
alter table equipo_partido 
add column pts_contra int not null;
	

create table raking_indv (ID_ranking_indv int not null auto_increment, descripcion varchar(1000) not null, primary key (ID_ranking_indv));
	rename table raking_indv to ranking_indv;


create table jugador_ranking_indv (ID_jugador int not null,ID_ranking_indv int not null, primary key(ID_jugador,ID_ranking_indv),puesto int not null);

alter table jugador_ranking_indv 
add constraint FK_ID_jugador foreign key(ID_jugador) references jugador (ID_jugador);


alter table jugador_ranking_indv 
add constraint FK_ID_ranking_indv foreign key (ID_ranking_indv) references ranking_indv (ID_ranking_indv);

 create table arbitro (ID_arbitro int not null auto_increment, nombre varchar (100) not null, cedula varchar(30) not null, primary key (ID_arbitro));
create table arbitro_partido (ID_arbitro int not null, ID_partido int not null,primary key (ID_arbitro,ID_partido));
alter table arbitro_partido
add constraint FK_ID_arbitro foreign key (ID_arbitro)
references arbitro (ID_arbitro);

alter table arbitro_partido 
add constraint FK_ID_partido foreign key (ID_partido) 
references partido(ID_partido);

create table estadistica_grupal(ID_estadistica_grupal int not null auto_increment, ID_equipo int not null, partidos_g int not null, partidos_p int not null, 
faltas int not null,
 puntos_anotados int not null, primary key (ID_estadistica_grupal));

create table ranking_grupal(ID_ranking_grupal int not null auto_increment, descripcion varchar(1000) not null, primary key (ID_ranking_grupal));

alter table estadistica_grupal 
add constraint FK_ID_equipo3 foreign key (ID_equipo)
references equipo(ID_equipo);

create table equipo_ranking_grupal (ID_equipo int not null, ID_ranking_grupal int not null, puesto int not null,primary key (ID_equipo,ID_ranking_grupal));
alter table equipo_ranking_grupal add constraint FK_ID_equipo foreign key (ID_equipo) references equipo (ID_equipo);

alter table equipo_ranking_grupal add constraint FK_ID_ranking_grupal foreign key (ID_ranking_grupal) references ranking_grupal (ID_ranking_grupal);

create table resultado_general (ID_equipo int not null, ID_torneo int not null, puesto int not null);

alter table resultado_general
add constraint FK_ID_equipo5 foreign key (ID_equipo)
references equipo(ID_equipo);
alter table resultado_general 
add constraint FK_ID_torneo2 
foreign key (ID_torneo) references torneo(ID_torneo);
alter table resultado_general
add primary key (ID_equipo, ID_torneo);


alter table equipo
add column ID_torneo int not null;
alter table equipo add constraint 
FK_ID_torneo3 foreign key (ID_torneo) 
references torneo (ID_torneo);
alter table estadistica_grupal
add column posesion double not null;










insert into fixture (ID_fixture,descripcion)values(1,	"Todos contra todos");
insert into fixture (ID_fixture,descripcion)values(2,	"Eliminacion directa");




insert into  categoria(ID_categoria, genero , edad) values(1,		"masculino", 	20);
insert into  categoria(ID_categoria, genero , edad) values(2,		"femenino", 	20);
insert into  categoria(ID_categoria, genero , edad) values(3,		"masculino", 	15);


insert into  torneo (ID_torneo, nombre ,lugar ,ID_categoria,ID_fixture) values(	1,	"Suramericana", "Mexico", 1,	1	);
insert into  torneo (ID_torneo, nombre ,lugar,ID_categoria,ID_fixture ) values(	2,	"Liga promaster", "Colombia", 2,	2	);
insert into  torneo (ID_torneo, nombre ,lugar ,ID_categoria,ID_fixture) values(	3,	"BBA", "Bolivia", 3,	1	);
	insert into  torneo (ID_torneo, nombre ,lugar ,ID_categoria,ID_fixture) values(	4,	"Warirors", "Argentina", 3,	2	);



insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	1,	"LEONARDO MORENO", 	"1957-02-12",	"MASCULINO", 	1020832229	);
insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	2,	"ANDRES TORRES", "1953-07-01",	"MASCULINO", 	2015118874	);
insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	3,	"LUIS BUITRAGO", 	"1955-04-10",	"MASCULINO", 	1574581245	);
insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	4,	"CRISTHIAN ROZO", 	"1960-01-11",	"MASCULINO", 	2090593132	);
insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	5,	"SEBASTIAN DUQUE", 	"1961-02-05",	"MASCULINO", 	2367467640	);
insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	6,	"PEPITO PERZ", "1962-09-07",	"MASCULINO", 	2644342148	);
insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	7,	"PABLO GOMEZ", 	"1959-11-02",	"MASCULINO", 	2921216656	);
insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	8,	"SEBASTIAN ROZO", 	"1965-12-10",	"MASCULINO", 	3198091164	);
insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	9,	"SOL SOLEDAD", 	"1955-03-13",	"FEMENINO", 	3474965672	);
insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	10,	"JULIANA CASAS", 	"1960-09-24",	"FEMENINO", 	3751840180	);
insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	11,	"ROSA MELCACHO", 	"1952-10-27","FEMENINO", 	4028714688	);
insert into entrenador (ID_entrenador , nombre , fechadenacimiento , genero , cedula) values (	12,	"VALENTINA PARDO", 	"1968-05-23",	"FEMENINO", 	4305589196	);
						
insert into entrenador (ID_entrenador, nombre, fechadenacimiento, genero, cedula) values (13, 'Isis Luchetti', '2017-09-12 ', 'MASCULINO', 35527903960);
insert into entrenador (ID_entrenador, nombre, fechadenacimiento, genero, cedula) values (14, 'Hayley Vynall', '2017-05-03 ', 'MASCULINO', 6331109914712);
insert into entrenador (ID_entrenador, nombre, fechadenacimiento, genero, cedula) values (15, 'Dulce McCloy', '2017-08-22 ', 'FEMENINO', 500235953182);
insert into entrenador (ID_entrenador, nombre, fechadenacimiento, genero, cedula) values (16, 'Susanne Smedmore', '2017-04-04 ', 'MASCULINO', 35817280271);
insert into entrenador (ID_entrenador, nombre, fechadenacimiento, genero, cedula) values (17, 'Evelyn Daubeny', '2017-09-22 ', 'FEMENINO',677150142154787);
insert into entrenador (ID_entrenador, nombre, fechadenacimiento, genero, cedula) values (18, 'Sayers Tarling', '2017-02-03', 'FEMENINO',677180236898909);
insert into entrenador (ID_entrenador, nombre, fechadenacimiento, genero, cedula) values (19, 'Cary Hollingdale', '2017-03-06 ', 'MASCULINO', 20187347045);
insert into entrenador (ID_entrenador, nombre, fechadenacimiento, genero, cedula) values (20, 'Chery Whiting', '2017-06-13 ', 'FEMENINO', 358901811556);


insert into equipo(ID_equipo,nombre,color,ID_entrenador, ID_torneo) values(	1,	"leones", 	"negro", 	1,	1	);
insert into equipo(ID_equipo,nombre,color,ID_entrenador, ID_torneo) values(	2,	"real bañil", 	"rojo", 	2,	1	);
insert into equipo(ID_equipo,nombre,color,ID_entrenador, ID_torneo) values(	3,	"santa fe", 	"azul", 	3,	1	);
insert into equipo(ID_equipo,nombre,color,ID_entrenador, ID_torneo) values(	4,	"real sociedad", 	"amarillo", 	4,	1	);
insert into equipo (ID_equipo, nombre, color,ID_entrenador,ID_torneo) values (5, 'Becka', 'amarillo',5,2);
insert into equipo (ID_equipo, nombre, color,ID_entrenador,ID_torneo)values (6, 'Kerstin', 'purpura',6,2);
insert into equipo (ID_equipo, nombre, color,ID_entrenador,ID_torneo) values (7, 'Balduin', 'cafe',7,2);
insert into equipo (ID_equipo, nombre, color,ID_entrenador,ID_torneo) values (8, 'Harriot', 'Violeta',8,2);
insert into equipo (ID_equipo, nombre, color,ID_entrenador,ID_torneo) values (9, 'Petifelas', 'purpura',9,3);
insert into equipo (ID_equipo, nombre, color,ID_entrenador,ID_torneo) values (10, 'Elwood', 'azul',10,3);
insert into equipo (ID_equipo, nombre, color,ID_entrenador,ID_torneo) values (11, 'Jeffy', 'naranja',11,3);
insert into equipo (ID_equipo, nombre, color,ID_entrenador,ID_torneo) values (12, 'Galen', 'negro',12,3);
insert into equipo (ID_equipo, nombre, color,ID_entrenador,ID_torneo) values (13, 'TAPITAS', 'negro',13,4);
	insert into equipo (ID_equipo, nombre, color,ID_entrenador,ID_torneo) values (14, 'Mejores', 'negro',14,4);
		insert into equipo (ID_equipo, nombre, color,ID_entrenador,ID_torneo) values (15, 'Extancia', 'negro',15,4);









insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	1,	"MAURICIO MARTINEZ", 	"masculino", 	"1997-10-11",	1875962482,	1	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	2,	"JULIAN RODRIGUEZ", 	"masculino", 	"1998-08-10",	1257963482,	1	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	3,	"MATEO GOMEZ", 	"masculino", 	"1998-04-28",	1789654238,	1	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	4,	"ALEJANDRO MERLO", 	"masculino", 	"1997-03-11",	7895463255,	1	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	5,	"DYLAN MARTINEZ", 	"masculino", 	"1998-03-11",	2015489637,	1	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	6,	"JUAN VARGAS", 	"masculino", 	"1997-02-10",	2014789563,	1	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	7,	"CRISTIAN LUGO", 	"masculino", 	"1998-04-07",	7904725489,	1	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	8,	"DANIEL PULIDO", 	"masculino", 	"1997-01-11",	5223671548,	1	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	9,	"MICHAEL JORDAN", 	"masculino", 	"1997-10-11",	6504172418,	1	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	10,	"ARMANDO CASAS", 	"masculino", 	"1998-08-10",	7116829631,	1	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	11,	"BENITO CAMELAS", 	"masculino", 	"1998-04-28",	7729486843,	2	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	12,	"ALAN CACERES", 	"masculino", 	"1997-03-11",	8342144056,	2	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	13,	"ANDRES CORTES", 	"masculino", 	"1998-03-11",	8954801268,	2	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	14,	"DANIEL SOCHA", 	"masculino", 	"1998-03-11",	9567458481,	2	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	15,	"KEVIN ROJAS", 	"masculino", 	"1997-02-10",	10180115694,	2	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	16,	"DADDY GOMEZ", 	"masculino", 	"1998-04-07",	10792772906,	2	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	17,	"SAMUEL SANABRIA", 	"masculino", 	"1997-01-11",	11405430119,	2	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	18,	"OZZUNA PEREZ", 	"masculino", 	"1997-10-11",	12018087331,	2	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	19,	"OMAR PEREZ", 	"masculino", 	"1998-08-10",	12630744544,	2	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	20,	"DANDE RICO", 	"masculino", 	"1998-04-28",	13243401756,	2	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	21,	"NICOLAS YAM", 	"masculino", 	"1997-03-11",	13856058969,	3	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	22,	"JEY FERNANDEZ", 	"masculino", 	"1998-03-11",	14468716181,	3	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	23,	"YUSTIN TORRES", 	"masculino", 	"1997-02-10",	15081373394,	3	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	24,	"SEBASTIAN VILLALOBOS", 	"masculino", 	"1998-04-07",	15694030606,	3	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	25,	"MARIO CASAS", 	"masculino", 	"1997-01-11",	16306687819,	3	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	26,	"NICOLAS ARRIETE", 	"masculino", 	"1997-10-11",	16919345032,	3	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	27,	"JUAN DAVID GONZALEZ", 	"masculino", 	"1998-08-10",	17532002244,	3	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	28,	"ALEJANDRO GONZALEZ", 	"masculino", 	"1998-04-28",	18144659457,	3	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	29,	"MICKE BAHIA", 	"masculino", 	"1997-03-11",	18757316669,	3	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	30,	"VICENTE FERNANDOS", 	"masculino", 	"1998-03-11",	19369973882,	3	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	31,	"OMAR DON", 	"masculino", 	"1997-02-10",	19982631094,	4	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	32,	"TORETO DOMINIC", 	"masculino", 	"1998-04-07",	20595288307,	4	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	33,	"BRAHIAN MAYERS", 	"masculino", 	"1997-01-11",	21207945519,	4	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	34,	"LUIS TORRES", 	"masculino", 	"1997-10-11",	21820602732,	4	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	35,	"GEORGE ALVARADO", 	"masculino", 	"1998-08-10",	22433259944,	4	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	36,	"MARIO RUIZ", 	"masculino", 	"1998-04-28",	23045917157,	4	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	37,	"BRUNO MARS", 	"masculino", 	"1997-03-11",	23658574370,	4	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	38,	"MALUMA MORENO", 	"masculino", 	"1998-03-11",	24271231582,	4	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	39,	"FALCAO LOPEZ", 	"masculino", 	"1997-02-10",	24883888795,	4	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	40,	"JAMES RODRIGUEZ", 	"masculino", 	"1998-04-07",	25496546007,	4	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	41,	"ESPERANZA GOLEZ", 	"femenino", 	"1997-01-11",	26109203220,	5	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	42,	"ALEXIS TEXAS", 	"femenino", 	"1997-10-11",	26721860432,	5	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	43,	"MIA CALIFA", 	"femenino", 	"1998-08-10",	27334517645,	5	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	44,	"DILION JARPER", 	"femenino", 	"1998-04-28",	27947174857,	5	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	45,	"SOFIA VERGARA", 	"femenino", 	"1997-03-11",	28559832070,	5	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	46,	"AMABRAD PEREZ", 	"femenino", 	"1998-03-11",	29172489282,	5	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	47,	"VALENTINA ZARATE", 	"femenino", 	"1997-02-10",	29785146495,	5	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	48,	"AKIRA LOPEZ", 	"femenino", 	"1998-04-07",	303978037086,	5	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	49,	"SAMANTHA TORRES", 	"femenino", 	"1997-01-11",	31010460920,	5	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	50,	"ALEXANDRA MUÑOZ", 	"femenino", 	"1997-10-11",	31623118133,	5	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	51,	"CRISTINA AGUILERA", 	"femenino", 	"1998-08-10",	32235775345,	6	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	52,	"MICHEL OBAMA", 	"femenino", 	"1998-04-28",	32848432558,	6	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	53,	"CRISTINA ALVARADO", 	"femenino", 	"1997-03-11",	33461089770,	6	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	54,	"LUISA TORRES", 	"femenino", 	"1998-03-11",	34073746983,	6	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	55,	"SAMUELA SANABRIO", 	"femenino", 	"1997-02-10",	34686404195,	6	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	56,	"DANIELA PULIDA", 	"femenino", 	"1998-04-07",	35299061408,	6	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	57,	"JUANA VERGARA", 	"femenino", 	"1997-01-11",	35911718620,	6	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	58,	"ERIKA MARTINEZ", 	"femenino", 	"1998-08-10",	36524375833,	6	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	59,	"DAYANA PANTANO", 	"femenino", 	"1998-04-28",	37137033046,	6	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	60,	"MARIANA GOMEZ", 	"femenino", 	"1997-03-11",	37749690258,	6	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	61,	"ROSA PERDOMO", 	"femenino", 	"1998-03-11",	38362347471,	7	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	62,	"MARIA MAGDALENA ", 	"femenino", 	"1997-02-10",	38975004683,	7	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	63,	"ELISA CUELLAR", 	"femenino", 	"1998-04-07",	39587661896,	7	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	64,	"LAURA CARREÑO", 	"femenino", 	"1997-01-11",	40200319108,	7	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	65,	"EDUARDA GOMEZ", 	"femenino", 	"1997-10-11",	40812976321,	7	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	66,	"ERIKA GALINDO", 	"femenino", 	"1998-08-10",	41425633533,	7	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	67,	"ROSA GOMEZ", 	"femenino", 	"1998-04-28",	42038290746,	7	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	68,	"ROSARIO TIJERA", 	"femenino", 	"1997-03-11",	42650947959,	7	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	69,	"MARBEL LARA", 	"femenino", 	"1998-03-11",	43263605171,	7	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	70,	"PAULINA VEGA", 	"femenino", 	"1997-02-10",	43876262384,	7	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	71,	"BLANCA SEPULVEDA", 	"femenino", 	"1998-04-07",	44488919596,	8	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	72,	"VALERY PEDRAZA", 	"femenino", 	"1997-01-11",	45101576809,	8	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	73,	"ANDREA TOVAR", 	"femenino", 	"1997-10-11",	45714234021,	8	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	74,	"MELISA MARTINEZ", 	"femenino", 	"1998-08-10",	46326891234,	8	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	75,	"ANGELICA LEMUR", 	"femenino", 	"1998-04-28",	46939548446,	8	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	76,	"DAYANA PERDOMO", 	"femenino", 	"1997-03-11",	47552205659,	8	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	77,	"LAURA LOPEZ", 	"femenino", 	"1998-03-11",	48164862871,	8	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	78,	"MARIANA GUTIERREZ", 	"femenino", 	"1997-02-10",	48777520084,	8	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	79,	"MANUELA PEREZ", 	"femenino", 	"1998-04-07",	49390177297,	8	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	80,	"PAULA MARTINEZ", 	"femenino", 	"1997-01-11",	50002834509,	8	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	81,	"ALBERTO PEREZ", 	"masculino", 	"2002-10-09",	50615491722,	9	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	82,	"JHONY RIVERA", 	"masculino", 	"2003-11-09",	51228148934,	9	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	83,	"DARIO GOMEZ", 	"masculino", 	"2002-04-03",	51840806147,	9	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	84,	"DARIO RIVERO", 	"masculino", 	"2005-01-03",	52453463359,	9	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	85,	"TIMMY TORNER", 	"masculino", 	"2003-04-28",	53066120572,	9	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	86,	"STIVE AOCKI", 	"masculino", 	"2003-04-28",	53678777784,	9	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	87,	"DIMITRI VEGAS", 	"masculino", 	"2003-05-13",	54291434997,	9	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	88,	"LIKE MIKE", 	"masculino", 	"2002-12-05",	54904092209,	9	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	89,	"TOMAS GOMEZ", 	"masculino", 	"2003-08-07",	55516749422,	9	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	90,	"ESTEBAN PERDOMO", 	"masculino", 	"2002-10-09",	56129406635,	9	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	91,	"EDUARDO CABRERA", 	"masculino", 	"2003-11-09",	56742063847,	10	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	92,	"SAMUEL ALVARADO", 	"masculino", 	"2002-04-03",	57354721060,	10	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	93,	"DANIEL TORRES", 	"masculino", 	"2005-01-03",	57967378272,	10	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	94,	"JUAN PERDOMO", 	"masculino", 	"2003-05-13",	58580035485,	10	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	95,	"SEBASTIAN PERDOMO", 	"masculino", 	"2002-12-05",	59192692697,	10	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	96,	"ALEJANDRO PINO", 	"masculino", 	"2003-08-07",	59805349910,	10	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	97,	"FELIPE PERDOMO", 	"masculino", 	"2002-10-09",	60418007122,	10	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	98,	"CAMILO ZARABANDA", 	"masculino", 	"2003-11-09",	61030664335,	10	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	99,	"EDUARDO PERES", 	"masculino", 	"2002-04-03",	61643321547,	10	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	100,"EUDGENIO VARGAR", 	"masculino", 	"2005-01-03",	62255978760,	10	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	101,	"VICENTE FERNANDEZ", 	"masculino", 	"2003-04-28",	62868635973,	11	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	102,	"MANUEL PEREZ", 	"masculino", 	"2003-05-13",	63481293185,	11	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	103,	"ALVARO URIBE", 	"masculino", 	"2002-12-05",	64093950398,	11	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	104,	"MANUEL SANTOS", 	"masculino", 	"2003-08-07",	64706607610,	11	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	105,	"RICARDO GOMEZ", 	"masculino", 	"2002-10-09",	65319264823,	11	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	106,	"dANUEL SALAZAR", 	"masculino", 	"2003-11-09",	65931922035,	11	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	107,	"SERGIO RAMES", 	"masculino", 	"2002-04-03",	66544579248,	11	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	108,	"fERNANDO TORRES", 	"masculino", 	"2005-01-03",	67157236460,	11	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	109,	"FERMANDO GEURRERO", 	"masculino", 	"2003-04-28",	67769893673,	11	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	110,	"SANTIAGO ARIAS", 	"masculino", 	"2003-05-13",	68382550886,	11	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	111,	"TONY RIVERO", 	"masculino", 	"2002-12-05",	68995208098,	12	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	112,	"ALEX OCAMPO", 	"masculino", 	"2003-08-07",	69607865311,	12	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	113,	"JACKI CHAN", 	"masculino", 	"2002-10-09",	70220522523,	12	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	114,	"SHIN PAPEL", 	"masculino", 	"2003-11-09",	70833179736,	12	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	115,	"DANIEL NEMPEQUE", 	"masculino", 	"2002-04-03",	71445836948,	12	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	116,	"ANGIE RODRIGUEZ", 	"masculino", "2005-01-03",	72058494161,	12	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	117,	"EUDGENIO SANABRIA", 	"masculino", 	"2003-04-28",	72671151373,	12	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	118,	"HUMBERTO TORRES", 	"masculino", 	"2003-05-13",	73283808586,	12	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	119,	"RAFAEL MUÑOZ", 	"masculino", 	"2002-12-05",	73896465798,	12	);
insert into  jugador (ID_jugador, nombre, genero , fechanacimiento , documento, ID_equipo) values(	120,	"CARLOS ZAPATA", 	"masculino", 	"2003-08-07",	74509123011,	12	);


insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (1, 1, 22, 74, 93, 14, 51, 48, 12, 141);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (2, 2, 18, 33, 81, 14, 27, 89, 2, 144);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (3, 3, 39, 30, 32, 14, 8, 5, 13, 90);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (4, 4, 20, 81, 64, 12, 87, 92, 1, 79);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (5, 5, 17, 15, 68, 23, 84, 14, 30, 29);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (6, 6, 16, 47, 90, 36, 49, 21, 7, 35);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (7, 7, 3, 28, 12, 46, 33, 48, 26, 86);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (8, 8, 6, 8, 47, 12, 100, 26, 28, 30);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (9, 9, 32, 19, 46, 40, 96, 63, 16, 142);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (10, 10, 37, 52, 40, 23, 28, 34, 6, 143);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (11, 11, 13, 65, 29, 11, 55, 44, 21, 86);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (12, 12, 33, 76, 9, 30, 21, 72, 3, 78);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (13, 13, 48, 39, 28, 50, 10, 43, 17, 133);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (14, 14, 23, 30, 98, 5, 93, 27, 29, 117);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (15, 15, 45, 1, 87, 50, 59, 12, 17, 52);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (16, 16, 38, 16, 54, 44, 74, 46, 4, 125);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (17, 17, 9, 53, 45, 38, 18, 37, 17, 9);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (18, 18, 11, 88, 91, 19, 96, 63, 20, 74);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (19, 19, 35, 11, 63, 4, 47, 6, 4, 80);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (20, 20, 1, 62, 89, 24, 12, 95, 13, 35);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (21, 21, 31, 35, 8, 16, 61, 42, 5, 87);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (22, 22, 10, 57, 7, 14, 72, 30, 22, 59);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (23, 23, 9, 93, 87, 6, 76, 22, 20, 81);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (24, 24, 13, 40, 79, 48, 56, 28, 18, 70);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (25, 25, 2, 82, 84, 23, 78, 63, 1, 125);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (26, 26, 23, 23, 92, 29, 74, 67, 9, 80);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (27, 27, 17, 100, 37, 16, 77, 68, 11, 112);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (28, 28, 6, 48, 12, 35, 5, 2, 29, 88);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (29, 29, 48, 28, 50, 21, 67, 14, 14, 128);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (30, 30, 18, 97, 24, 37, 8, 2, 2, 126);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (31, 31, 20, 12, 63, 7, 51, 6, 14, 104);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (32, 32, 28, 91, 19, 40, 89, 8, 9, 68);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (33, 33, 41, 73, 75, 46, 59, 53, 23, 23);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (34, 34, 23, 70, 37, 28, 97, 98, 18, 148);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (35, 35, 22, 36, 85, 38, 89, 9, 13, 139);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (36, 36, 13, 52, 9, 25, 57, 76, 12, 97);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (37, 37, 25, 27, 7, 14, 29, 62, 26, 106);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (38, 38, 50, 26, 7, 47, 72, 49, 12, 72);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (39, 39, 34, 4, 97, 12, 59, 55, 19, 34);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (40, 40, 29, 14, 58, 6, 64, 60, 25, 148);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (41, 41, 16, 57, 57, 40, 97, 48, 26, 146);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (42, 42, 5, 79, 28, 6, 85, 32, 3, 92);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (43, 43, 7, 54, 68, 23, 5, 14, 13, 148);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (44, 44, 22, 75, 61, 38, 9, 93, 5, 75);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (45, 45, 30, 71, 77, 49, 19, 39, 16, 114);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (46, 46, 48, 5, 25, 39, 16, 15, 19, 119);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (47, 47, 20, 78, 49, 36, 81, 71, 11, 100);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (48, 48, 42, 81, 40, 10, 48, 79, 30, 133);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (49, 49, 41, 47, 92, 11, 32, 56, 3, 1);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (50, 50, 17, 85, 22, 37, 31, 18, 28, 116);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (51, 51, 49, 61, 55, 22, 98, 49, 23, 137);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (52, 52, 50, 59, 92, 38, 60, 43, 5, 101);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (53, 53, 14, 36, 84, 23, 42, 73, 26, 110);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (54, 54, 4, 12, 15, 2, 12, 27, 15, 20);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (55, 55, 39, 22, 27, 35, 55, 18, 4, 13);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (56, 56, 1, 80, 16, 26, 77, 47, 13, 82);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (57, 57, 31, 16, 75, 31, 80, 9, 6, 39);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (58, 58, 41, 44, 67, 38, 52, 6, 2, 36);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (59, 59, 37, 71, 13, 25, 60, 40, 25, 9);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (60, 60, 7, 19, 22, 23, 79, 38, 4, 97);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (61, 61, 22, 3, 63, 15, 18, 55, 23, 127);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (62, 62, 45, 79, 6, 40, 96, 21, 24, 105);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (63, 63, 34, 12, 27, 16, 68, 24, 19, 87);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (64, 64, 46, 65, 100, 16, 46, 40, 21, 120);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (65, 65, 42, 1, 40, 31, 84, 17, 17, 57);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (66, 66, 12, 7, 14, 6, 12, 50, 15, 148);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (67, 67, 38, 73, 92, 5, 94, 89, 11, 102);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (68, 68, 47, 87, 28, 14, 32, 56, 1, 105);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (69, 69, 36, 47, 14, 15, 95, 70, 21, 55);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (70, 70, 13, 83, 44, 41, 82, 52, 10, 142);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (71, 71, 14, 86, 43, 8, 22, 45, 3, 4);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (72, 72, 20, 78, 41, 25, 95, 9, 25, 121);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (73, 73, 13, 64, 77, 23, 63, 77, 30, 98);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (74, 74, 45, 98, 32, 12, 71, 29, 27, 62);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (75, 75, 27, 5, 65, 14, 27, 14, 10, 27);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (76, 76, 27, 95, 51, 20, 78, 82, 29, 47);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (77, 77, 7, 37, 40, 26, 67, 45, 14, 27);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (78, 78, 42, 34, 75, 39, 11, 22, 3, 97);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (79, 79, 23, 91, 42, 40, 37, 43, 5, 18);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (80, 80, 19, 14, 51, 25, 63, 60, 25, 70);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (81, 81, 2, 87, 54, 17, 52, 61, 22, 114);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (82, 82, 9, 86, 30, 3, 42, 98, 4, 37);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (83, 83, 21, 45, 26, 1, 97, 74, 1, 42);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (84, 84, 24, 43, 18, 34, 10, 64, 26, 3);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (85, 85, 3, 66, 12, 33, 61, 14, 12, 116);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (86, 86, 42, 54, 69, 40, 40, 52, 22, 22);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (87, 87, 17, 65, 92, 37, 5, 27, 24, 29);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (88, 88, 36, 99, 14, 10, 11, 58, 17, 95);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (89, 89, 6, 16, 27, 44, 48, 62, 28, 125);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (90, 90, 34, 76, 25, 12, 56, 82, 4, 116);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (91, 91, 38, 79, 50, 37, 27, 87, 21, 1);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (92, 92, 50, 34, 9, 40, 79, 92, 19, 106);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (93, 93, 8, 69, 24, 10, 22, 19, 3, 1);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (94, 94, 4, 57, 5, 27, 32, 66, 26, 46);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (95, 95, 28, 38, 52, 39, 29, 54, 27, 69);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (96, 96, 26, 20, 85, 31, 9, 38, 8, 80);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (97, 97, 14, 1, 50, 26, 5, 51, 9, 147);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (98, 98, 47, 58, 3, 30, 87, 14, 21, 24);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (99, 99, 40, 91, 1, 50, 74, 95, 19, 99);
insert into estadistica_indv (ID_jugador, ID_estadistica_indv, rebotes, canastas, lanzamientos, dobles,  triples, precisio, faltas, tiempo_jugado) values (100, 100, 36, 95, 74, 16, 93, 18, 11, 89);


insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados ,posesion) values(	1,	1,	4,	1,	82,	461,70	);
insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados ,posesion) values(	2,	2,	2,	3,	177,499	,40);
insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados ,posesion) values(	3,	3,	4,	1,	167,469	,60);
insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados,posesion ) values(	4,	4,	3,	2,	157,665	,70);
insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados,posesion ) values(	5,	5,	2,	3,	143,1243,80);
insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados,posesion ) values(	6,	6,	4,	1,   21,	124	,50);
insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados ,posesion) values(	7,	7,	5,  3,	40,	125	,70);
insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados ,posesion) values(	8,	8,	3,	2,	36,	159	,60);
insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados ,posesion) values(	9,	9,	2,	3,	7,	175	,40);
insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados ,posesion) values(	10,	10,	1,	4,	39,	134	,60);
insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados ,posesion) values(	11,	11,	4,	1,	16,	154	,70);
insert into estadistica_grupal(ID_estadistica_grupal, ID_equipo, partidos_g , partidos_p , faltas , puntos_anotados ,posesion) values(	12,	12,	4,	1,	36,	179	,10);

INSERT INTO ranking_indv (ID_ranking_indv,descripcion)values (1,"se muestra el mejor  jugador entre todas las ligas");


INSERT INTO jugador_ranking_indv (ID_ranking_indv,ID_jugador,puesto)
SELECT  1,j.ID_jugador,1
from jugador j inner join estadistica_indv e on j.Id_jugador =e.Id_jugador 
  where e.canastas= (select max(e.canastas)from estadistica_indv e) ;



INSERT INTO ranking_grupal (ID_ranking_grupal,descripcion)values (1,"se muestra el mejor equipo  entre todas las ligas");

INSERT INTO equipo_ranking_grupal(ID_ranking_grupal,ID_equipo,puesto)
SELECT  1,j.ID_equipo,1
from equipo j inner join estadistica_grupal e on j.ID_equipo =e.ID_equipo
  where e.partidos_g= (select max(e.partidos_g) from estadistica_grupal e ) ;

insert into arbitro (ID_arbitro, nombre, cedula) values (1, 'Graig Sussems', 2550758);
insert into arbitro (ID_arbitro, nombre, cedula) values (2, 'Matteo Lowndsbrough', 3172320);
insert into arbitro (ID_arbitro, nombre, cedula) values (3, 'Blane Quesne', 4329413);
insert into arbitro (ID_arbitro, nombre, cedula) values (4, 'Garold Penreth', 9197695);
insert into arbitro (ID_arbitro, nombre, cedula) values (5, 'Susannah McAllen', 4776817);
insert into arbitro (ID_arbitro, nombre, cedula) values (6, 'Fifine Worthy', 5361415);
insert into arbitro (ID_arbitro, nombre, cedula) values (7, 'Zak Carnilian', 5898057);
insert into arbitro (ID_arbitro, nombre, cedula) values (8, 'Henrie Petrello', 9552743);
insert into arbitro (ID_arbitro, nombre, cedula) values (9, 'Niels Thams', 9005204);
insert into arbitro (ID_arbitro, nombre, cedula) values (10, 'Ranee Gottschalk', 2960559);
insert into arbitro (ID_arbitro, nombre, cedula) values (11, 'Ashil Warry', 3072764);
insert into arbitro (ID_arbitro, nombre, cedula) values (12, 'Nelson de Villier', 9069111);
insert into arbitro (ID_arbitro, nombre, cedula) values (13, 'Westbrook Guice', 2875198);
insert into arbitro (ID_arbitro, nombre, cedula) values (14, 'Arlana Troop', 1625817);
insert into arbitro (ID_arbitro, nombre, cedula) values (15, 'Kakalina Ickovici', 5491563);
insert into arbitro (ID_arbitro, nombre, cedula) values (16, 'Gavrielle Colnett', 8475050);
insert into arbitro (ID_arbitro, nombre, cedula) values (17, 'Jeanine Furmonger', 9192047);
insert into arbitro (ID_arbitro, nombre, cedula) values (18, 'Blayne Burgwin', 4612291);
insert into arbitro (ID_arbitro, nombre, cedula) values (19, 'Sheryl Burgon', 9187615);
insert into arbitro (ID_arbitro, nombre, cedula) values (20, 'Kilian McGaffey', 4083308);	









