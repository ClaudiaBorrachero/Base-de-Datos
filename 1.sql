create table cliente(
    id_cliente int primary key not null,
    nombre varchar(45) not null,
    apellido varchar(45) not null,
    fecha_nac date not null,
    direccion int not null
    );
create table direccion(
	id_direccion int primary key not null,
	direccion varchar(45) not null,
	ciudad varchar(45) not null,
	pais varchar(45) not null
	);
create table alquiler(
	id_alquiler int primary key not null auto_increment,
	fech_alquiler date,
	fech_devolucion date,
	cliente int not null,
	inventario int not null
	);
create table categoria(
	id_categoria int primary key not null auto_increment,
	nombre varchar(45) not null
	);
create table pelicula(
	id_pelicula int primary key not null auto_increment,
	nombre varchar(45) not null,
	duracion int not null,
	descripcion blob,
	año int not null,
	categoria int not null
	);
create table inventario(
	id_inventario int primary key not null auto_increment,
	disponible tinyint(1) default 1,
	pelicula int not null
	);

alter table cliente
	add foreign key (direccion) references direccion(id_direccion)
	on delete cascade;
alter table alquiler
	add foreign key (cliente) references cliente(id_cliente),
	add foreign key (inventario) references inventario(id_inventario)
	on delete cascade;
alter table pelicula
	add foreign key (categoria) references categoria(id_categoria)
	on delete cascade;
alter table inventario
	add foreign key (pelicula) references pelicula(id_pelicula)
	on delete cascade;

insert into direccion values(1, 'Urgel,11','Valencia','España');
insert into direccion values(2, 'Casanovas,15','Talavera','España');
insert into direccion values(3, 'Muntaner,20','Madrid','España');
insert into direccion values(4, 'Madrid,20','Zaragoza','España');

insert into cliente values(1,'María','Arnal','1970-11-07',1);
insert into cliente values(2,'Pedro','Arnal','1968-06-15',1);
insert into cliente values(3,'Andrés','Arnal','1990-11-07',1);
insert into cliente values(4,'Teresa','Aliaga','1959-05-01',2);
insert into cliente values(5,'Tomás','Martín','1980-05-18',3);
insert into cliente values(6,'Claudio','Pesto','1947-12-28',4);
insert into cliente values(7,'Petra','Pesto','1973-01-29',4);

insert into alquiler values(1,'2003-04-07','2003-04-21',2,3);
insert into alquiler values(2,'2003-06-14','2003-04-28',2,2);
insert into alquiler values(3,'2003-06-10','2003-06-24',2,1);
insert into alquiler values(4,'2003-06-14','2003-06-24',2,3);
insert into alquiler values(5,'2003-08-05','2003-08-29',2,2);

insert into categoria values(1,'Infantil');
insert into categoria values(2,'Comedia');
insert into categoria values(3,'Thriller');
insert into categoria values(4,'Miedo');
insert into categoria values(5,'Clásica');
insert into categoria values(6,'Musical');

insert into pelicula values(1,'El resplandor',146,null,1980,4);
insert into pelicula values(2,'Grease',110,null,1978,6);
insert into pelicula values(3,'Cabaret',123,null,1972,6);
insert into pelicula values(4,'Cars',116,null,2006,1);
insert into pelicula values(5,'Los otros',104,'Pais:España',2001,3);

insert into inventario values(1,1,3);
insert into inventario values(2,1,5);
insert into inventario values(3,1,4);
insert into inventario values(4,1,2);
insert into inventario values(5,0,1);	