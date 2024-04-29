-- Desactivar restricciones de clave externa
SET foreign_key_checks = 0;

-- Eliminar las tablas
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS detalles_pedido;
DROP TABLE IF EXISTS opciones_menu;
DROP TABLE IF EXISTS configuracion;
DROP TABLE IF EXISTS valoraciones;
DROP TABLE IF EXISTS proveedores;
DROP TABLE IF EXISTS descuentos;
DROP TABLE IF EXISTS impuestos;
DROP TABLE IF EXISTS metodos_pago;

-- Reactivar restricciones de clave externa
SET foreign_key_checks = 1;
