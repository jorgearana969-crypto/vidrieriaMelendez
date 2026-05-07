-- Base de Datos para Vidriería Melendes
-- Sistema de Gestión de Inventario

CREATE DATABASE IF NOT EXISTS vidrieria_melendes;
USE vidrieria_melendes;

-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nombre_completo VARCHAR(100),
    rol ENUM('admin', 'empleado') DEFAULT 'empleado',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Productos (PVC y Vidrio)
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL, -- PVC o Vidrio
    categoria VARCHAR(50),
    cantidad INT DEFAULT 0,
    unidad VARCHAR(20), -- metros, m², unidades
    precio DECIMAL(10, 2) NOT NULL,
    ubicacion VARCHAR(100),
    estado VARCHAR(20), -- Disponible, Bajo Stock, Agotado
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Inserción de Usuario Admin Inicial
-- La contraseña 'Pablomelendez' debería ser hasheada en una aplicación real
INSERT INTO usuarios (username, password, nombre_completo, rol) 
VALUES ('admin', 'Pablomelendez', 'Administrador del Sistema', 'admin');

-- Inserción de Datos Iniciales (Basados en data.js)
INSERT INTO productos (nombre, tipo, categoria, cantidad, unidad, precio, ubicacion, estado) VALUES
('Tubería PVC 1/2"', 'PVC', 'Tubería', 150, 'metros', 2.50, 'Almacén A-1', 'Disponible'),
('Vidrio Templado 6mm', 'Vidrio', 'Vidrio Plano', 25, 'm²', 45.00, 'Almacén B-2', 'Disponible'),
('Codo PVC 90° 3/4"', 'PVC', 'Accesorios', 8, 'unidades', 1.20, 'Almacén A-3', 'Bajo Stock'),
('Vidrio Laminado 8mm', 'Vidrio', 'Vidrio Laminado', 15, 'm²', 68.00, 'Almacén B-1', 'Disponible'),
('Tubería PVC 1"', 'PVC', 'Tubería', 0, 'metros', 4.20, 'Almacén A-1', 'Agotado'),
('Vidrio Esmerilado 4mm', 'Vidrio', 'Vidrio Decorativo', 40, 'm²', 32.00, 'Almacén B-3', 'Disponible'),
('Válvula PVC 1/2"', 'PVC', 'Accesorios', 35, 'unidades', 5.80, 'Almacén A-2', 'Disponible'),
('Espejo 5mm', 'Vidrio', 'Espejo', 12, 'm²', 28.50, 'Almacén B-2', 'Disponible');
