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

#agregar datos cliente
INSERT INTO cliente (nombre_cliente, correo)
VALUES ("Susana Henriquez", "su@gmail.com");

INSERT INTO cliente (nombre_cliente, correo)
VALUES ("Yatamis Spolman", "yatamis@gmail.com");

INSERT INTO cliente (nombre_cliente, correo)
VALUES ("Daniela Corral", "dani@gmail.com");

INSERT INTO cliente (nombre_cliente, correo)
VALUES ("Nicolás Aravena", "nico@gmail.com");

#agregar datos tabla boleta
INSERT INTO boleta (cliente_id, fecha, producto_id, cantidad, precio_unidad)
VALUES (1, 2020, 4, 2, 500);

INSERT INTO boleta (cliente_id, fecha, producto_id, cantidad, precio_unidad)
VALUES (3, 2023, 6, 1, 3200);

INSERT INTO boleta (cliente_id, fecha, producto_id, cantidad, precio_unidad)
VALUES (2, 2023, 6, 1, 3200);

#olvide agregarle el total a la tabla boleta
UPDATE boleta
SET total = 1000
WHERE boleta_id=1;

UPDATE boleta
SET total = 3200
WHERE boleta_id=2;

UPDATE boleta
SET total = 3200
WHERE boleta_id=3;




#1ra consulta de datos de tabla que me muestre los productos de categoria Higiene

SELECT nombre_producto 
FROM producto
WHERE tipoProducto_id = 3;

#2da consulta de datos de tabla Que me muestre los productos y el precio de la categoria bebestibles

SELECT nombre_producto, precio 
FROM producto
WHERE tipoProducto_id = 5;


#Consulta con JOIN donde le pido que me muestre todas las clientas que compraron un desodorante
#tengo qeu unir cliente, producto y boleta para obtener la informacion
SELECT nombre_cliente, correo, nombre_producto
FROM cliente
JOIN boleta ON cliente.cliente_id = boleta.cliente_id
JOIN producto ON boleta.producto_id = producto.producto_id
WHERE producto.nombre_producto = "Desodorante";

#me suma las ventas del año 2023 que son 2, pero no me muestra el año :c no lo logre

SELECT YEAR(fecha) AS anio, SUM(total) AS ganancia_anual
FROM boleta
WHERE fecha = 2023
GROUP BY YEAR(fecha);
