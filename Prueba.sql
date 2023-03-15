CREATE SCHEMA minimarketDonJose;

USE minimarketDonJose;

#ordene la creacion de las tablas segun las que no tienen FK primero y las que van conteniendo a las otras
create table tipoProducto (
tipoProducto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_tipoProducto VARCHAR(20)
);

create table cliente (
cliente_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_cliente VARCHAR(25),
correo VARCHAR(50)
);

#cada producto pertenece a un tipoProducto
create table producto (
producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_producto VARCHAR (20),
precio DOUBLE,
tipoProducto_id INTEGER
);

#asuminedo que cada proveedor trae solo un tipo de producto 
create table proveedor (
proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_proveedor VARCHAR (20),
correo VARCHAR(50),
tipoProducto_id INTEGER
);


##esta sería mi tabvla relacional entre producto y cliente
create table boleta (
boleta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
cliente_id INTEGER,
fecha YEAR,
producto_id INTEGER,
cantidad INTEGER,
precio_unidad DOUBLE,
total DOUBLE
);




#AGREGAR FK A CADA TABLA

ALTER TABLE boleta
ADD FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
ADD FOREIGN KEY (producto_id) REFERENCES producto(producto_id);

ALTER TABLE proveedor
ADD FOREIGN KEY (tipoProducto_id) REFERENCES tipoProducto(tipoProducto_id);

ALTER TABLE producto
ADD FOREIGN KEY (tipoProducto_id) REFERENCES tipoProducto(tipoProducto_id);

#agregar datos a las tablas, producto, tipoProducto , proveedor











