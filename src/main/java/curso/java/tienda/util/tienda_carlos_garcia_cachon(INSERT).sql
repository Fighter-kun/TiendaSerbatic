-- INSERT para la tabla categorias
INSERT INTO categorias (nombre, descripcion) 
VALUES ('Relojes', 'Relojes de lujo multimarca.');

-- INSERT para la tabla roles
INSERT INTO roles (rol) 
VALUES ('Usuario');

-- INSERT para la tabla usuarios
INSERT INTO usuarios (id_rol, email, clave, nombre, apellido1, apellido2, direccion, provincia, localidad, telefono, dni) 
VALUES (1, 'usuario@example.com', 'clave123', 'Juan', 'Pérez', 'Gómez', 'Calle Principal 123', 'Madrid', 'Madrid', '123456789', '12345678A');

-- INSERT para la tabla productos
INSERT INTO productos (id_categoria, nombre, descripcion, precio, stock, fecha_alta, impuesto, imagen) 
VALUES (1, 'Rolex Submariner', 'Reloj de lujo submarino, resistente al agua hasta 300 metros. Movimiento automático suizo.', 10000.00, 10, NOW(), 0.21, 'rolex_submariner.jpg');

INSERT INTO productos (id_categoria, nombre, descripcion, precio, stock, fecha_alta, impuesto, imagen) 
VALUES (1, 'Omega Speedmaster', 'Reloj de lujo utilizado por la NASA en sus misiones espaciales. Cronógrafo con movimiento mecánico.', 8000.00, 15, NOW(), 0.21, 'omega_speedmaster.jpg');

INSERT INTO productos (id_categoria, nombre, descripcion, precio, stock, fecha_alta, impuesto, imagen) 
VALUES (1, 'Patek Philippe Nautilus', 'Reloj de lujo deportivo y elegante con movimiento automático y caja de acero inoxidable. Resistente al agua.', 15000.00, 5, NOW(), 0.21, 'patek_philippe_nautilus.jpg');

INSERT INTO productos (id_categoria, nombre, descripcion, precio, stock, fecha_alta, impuesto, imagen) 
VALUES (1, 'Audemars Piguet Royal Oak', 'Reloj de lujo icónico con caja octogonal de acero inoxidable y movimiento mecánico automático. Diseño audaz y elegante.', 18000.00, 8, NOW(), 0.21, 'audemars_piguet_royal_oak.jpg');

INSERT INTO productos (id_categoria, nombre, descripcion, precio, stock, fecha_alta, impuesto, imagen) 
VALUES (1, 'Cartier Santos', 'Reloj de lujo clásico y atemporal con caja de acero y oro. Movimiento automático y diseño distintivo.', 12000.00, 12, NOW(), 0.21, 'cartier_santos.jpg');


-- INSERT para la tabla pedidos
INSERT INTO pedidos (id_usuario, fecha, metodo_pago, estado, num_factura, total) 
VALUES (1, NOW(), 'Bizum', 'Pendiente', '123ABC', 50.99);

-- INSERT para la tabla detalles_pedido
INSERT INTO detalles_pedido (id_pedido, id_producto, precio_unidad, unidades, impuesto, total) 
VALUES (1, 1, 10.99, 2, 0.21, 21.98);

-- INSERT para la tabla opciones_menu
INSERT INTO opciones_menu (id_rol, nombre_opcion, url_opcion) 
VALUES (1, 'Inicio', '/inicio');

-- INSERT para la tabla configuracion
INSERT INTO configuracion (clave, valor, tipo) 
VALUES ('limite_stock', '10', 'int');

-- INSERT para la tabla valoraciones
INSERT INTO valoraciones (id_producto, id_usuario, valoracion, comentario) 
VALUES (1, 1, 5, 'Excelente producto, muy recomendable.');

-- INSERT para la tabla proveedores
INSERT INTO proveedores (nombre, direccion, localidad, provincia, telefono, cif, email) 
VALUES ('Proveedor XYZ', 'Calle Proveedor 123', 'Madrid', 'Madrid', '987654321', 'ABC123', 'proveedor@xyz.com');

-- INSERT para la tabla descuentos
INSERT INTO descuentos (codigo, descuento, fecha_inicio, fecha_fin) 
VALUES ('DESC10', 0.10, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));

-- INSERT para la tabla impuestos
INSERT INTO impuestos (impuesto) 
VALUES (0.21);

-- INSERT para la tabla metodos_pago
INSERT INTO metodos_pago (metodo_pago) 
VALUES ('Bizum');
