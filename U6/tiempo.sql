create table tiempo(
	fecha date not null primary key,
	dia int not null,
	dia_semana varchar(20) not null,
	mes int not null,
	cuarto_anyo int not null
	);
create table venta(
	id_venta int not null primary key,
	fecha date not null,
	producto varchar(20),
	unidades_vendidas int not null,
	precio_unitario int not null,
	constraint fk_fecha_venta
	foreign key (fecha)
	references tiempo.tiempo(fecha)
	);