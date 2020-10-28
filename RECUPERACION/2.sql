create table provincias(
	cod_provi int(2) primary key,
	nombre varchar(25) not null,
	pais varchar(25)
);
create table testprovincias as
	select cod_provi,nombre,pais
	from provincias
	where pais like 'España' or pais like 'Portugal'
	or pais like 'Italia';


create table empresas(
	cod_empre int(2) primary key,
	nombre varchar(25) not null default 1,
	fecha_crea date,  
	cod_provin int(2)
);
ALTER TABLE empresas
ADD FOREIGN KEY (cod_provin) REFERENCES provincias(cod_provi);


create table continentes( 
	cod_conti int primary key,
	nombre varchar(20) default 'Europa' not null
);


create table alumnos(
	codigo int(3) primary key,
	nombre varchar(21) not null,
	apellido varchar(30) not null,
	curso int,
	fecha_matri timestamp default CURRENT_TIMESTAMP
);
create table testalumnos as
	select codigo,nombre,upper(apellido),curso,fecha_matri
	from alumnos
	where curso in(1,2,3);


create table empleados(
	cod_emple int(2) primary key,
	nombre varchar(20) not null,
	apellido varchar(25),
	salario decimal(7),
	CHECK (salario>0)
);