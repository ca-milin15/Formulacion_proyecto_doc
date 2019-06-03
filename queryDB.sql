create database ordenar_movil;
use ordenar_movil;

create table recurso(
	id bigInt not null,
    nombre varchar(50) not null,
    codigo varchar(10) not null,
    ruta varchar(100),
    primary key(id)
);

create table perfil(
	id bigInt not null,
    nombre varchar(50) not null,
    codigo varchar(10) not null,
	tipoPerfil char(3) not null,
	recursoId bigInt not null,
    primary key(id),
    foreign key(recursoId) references recurso(id)
);

create table usuario(
	id bigInt not null,
    usuario varchar(30) not null,
    clave varchar(60) not null,
	perfilId bigInt not null,
	fechaCreacion date,
	creadoPor bigInt,
    primary key(id),
    foreign key(perfilId) references perfil(id),
    foreign key(creadoPor) references usuario(id)
);

create table producto(
	id bigInt not null,
    nombre varchar(50) not null,
    codigo varchar(20) not null,
	imagen longblob,
	precio double not null,
	creadoPor bigInt,
	fechaCreacion date,
    primary key(id),
    foreign key(creadoPor) references usuario(id)
);

create table pedido(
	id bigInt not null,
    iva double not null,
    valor double not null,
	valorTotal double not null,
	direccionEnvio varchar(60) not null,
	celularEnvio varchar(20) not null,
	ciudad varchar(50) not null,
	observacion varchar(500),
	estado char(3),
	creadoPor bigInt,
	fechaCreacion date,
    primary key(id),
    foreign key(creadoPor) references usuario(id)
);

create table pedidoDetalle(
	id bigInt not null,
	pedidoId bigInt not null,
	productoId bigInt not null,
	cantidad integer not null,
    iva double not null,
    valor double not null,
    valorTotal double not null,
    primary key(id),
    foreign key(pedidoId) references pedido(id),
    foreign key(productoId) references producto(id)
);

ALTER TABLE pedido ADD CONSTRAINT foreign key(pedidoDetalleId) references pedidoDetalle(id);