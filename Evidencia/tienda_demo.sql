-- ============================================== -- 1. CREAR LA BASE DE DATOS -- ============================================== 
DROP DATABASE IF EXISTS tienda_demo; 
CREATE DATABASE tienda_demo; 
USE tienda_demo; -- ============================================== -- 2. CREAR TABLAS -- ============================================== -- Tabla: clientes 
CREATE TABLE clientes ( 
cliente_id INT AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50), 
correo VARCHAR(50), 
telefono VARCHAR(15) 
); -- Tabla: productos 
CREATE TABLE productos ( 
producto_id INT AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50), 
descripcion VARCHAR(100), 
precio DECIMAL(10,2), 
stock INT 
); -- Tabla: ventas 
CREATE TABLE ventas ( 
venta_id INT AUTO_INCREMENT PRIMARY KEY, 
cliente_id INT, 
fecha DATETIME, 
total DECIMAL(10,2), 
FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) 
); -- Tabla: detalle_ventas 
CREATE TABLE detalle_ventas ( 
detalle_id INT AUTO_INCREMENT PRIMARY KEY, 
venta_id INT, 
producto_id INT, 
cantidad INT, 
subtotal DECIMAL(10,2), 
FOREIGN KEY (venta_id) REFERENCES ventas(venta_id), 
FOREIGN KEY (producto_id) REFERENCES productos(producto_id) 
); 
-- Tabla: proveedores 
CREATE TABLE proveedores ( 
proveedor_id INT AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50), 
telefono VARCHAR(15), 
email VARCHAR(50) 
); 