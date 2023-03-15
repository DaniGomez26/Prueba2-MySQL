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

#agregar datos a la tabla tipoProducto

INSERT INTO tipoProducto(nombre_tipoProducto)
VALUES ("Abarrotes");

INSERT INTO tipoProducto(nombre_tipoProducto)
VALUES ("Aseo");

INSERT INTO tipoProducto(nombre_tipoProducto)
VALUES ("Higiene");

INSERT INTO tipoProducto(nombre_tipoProducto)
VALUES ("Verduras");

INSERT INTO tipoProducto(nombre_tipoProducto)
VALUES ("Bebestibles");

#agregar datos a la tabla producto

INSERT INTO producto (nombre_producto, precio, tipoProducto_id)
VALUES ("Fideos", 900, 1);

INSERT INTO producto (nombre_producto, precio, tipoProducto_id)
VALUES ("Arroz", 1100, 1);

INSERT INTO producto (nombre_producto, precio, tipoProducto_id)
VALUES ("Cera", 1500, 2);

INSERT INTO producto (nombre_producto, precio, tipoProducto_id)
VALUES ("Paño", 500, 2);

INSERT INTO producto (nombre_producto, precio, tipoProducto_id)
VALUES ("Cepillo de Dientes", 1200, 3);

INSERT INTO producto (nombre_producto, precio, tipoProducto_id)
VALUES ("Desodorante", 3200, 3);

INSERT INTO producto (nombre_producto, precio, tipoProducto_id)
VALUES ("Lechuga", 900, 4);

INSERT INTO producto (nombre_producto, precio, tipoProducto_id)
VALUES ("Tomate", 1100, 4);

INSERT INTO producto (nombre_producto, precio, tipoProducto_id)
VALUES ("Jugo", 2500, 5);

INSERT INTO producto (nombre_producto, precio, tipoProducto_id)
VALUES ("Bebida", 1800, 5);

#agregar datos a proveedor

INSERT INTO proveedor (nombre_proveedor, correo, tipoProducto_id)
VALUES ("Doña Juanita", "juanita@gmail.com", 1);

INSERT INTO proveedor (nombre_proveedor, correo, tipoProducto_id)
VALUES ("Donde Javiera", "javiera@gmail.com", 2);

INSERT INTO proveedor (nombre_proveedor, correo, tipoProducto_id)
VALUES ("Don Juan", "juanito@gmail.com", 3);

INSERT INTO proveedor (nombre_proveedor, correo, tipoProducto_id)
VALUES ("Verdulería Ale", "alejita@gmail.com", 4);

INSERT INTO proveedor (nombre_proveedor, correo, tipoProducto_id)
VALUES ("Fruticola", "fruticola@gmail.com", 5);









