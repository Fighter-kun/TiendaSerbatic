<%@page import="java.util.HashMap"%>
<%@page import="curso.java.tienda.model.VO.ProductoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seleccionar Método de Pago</title>
</head>
<body>
	<h1>Seleccionar Método de Pago</h1>
	<script>
            function actualizarCantidad(productoId, input) {
                var cantidad = parseInt(input.value);
                var url = "ActualizarCantidadServlet?productoId=" + productoId + "&cantidad=" + cantidad;
                fetch(url)
                        .then(response => {
                            if (response.ok) {
                                return response.text();
                            }
                            throw new Error('Error en la solicitud');
                        })
                        .then(data => {
                            // Actualizar la cantidad en la vista si la respuesta es exitosa
                            input.value = data;
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
            }
            function eliminarProducto(productoId) {
                if (confirm("¿Estás seguro de que quieres eliminar este producto del carrito?")) {
                    var url = "EliminarProductoServlet?productoId=" + productoId;
                    fetch(url)
                        .then(response => {
                            if (response.ok) {
                                // Recargar la página para reflejar los cambios después de eliminar el producto
                                location.reload();
                            } else {
                                throw new Error('Error en la solicitud');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                }
            }
        </script>
	<%
	session = request.getSession();
	HashMap<ProductoVO, Integer> carrito = (HashMap<ProductoVO, Integer>) session.getAttribute("carrito");
	if (carrito != null) {
		for (HashMap.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
			ProductoVO producto = entry.getKey();
			Integer cantidad = entry.getValue();
	%>
	<form>
		<input type="text" value="<%=producto.getNombre()%>" disabled>
		<input type="number" value="<%=cantidad%>"
			max="<%=producto.getStock()%>" min="1"
			onchange="actualizarCantidad('<%=producto.getId()%>', this)">
		<button type="button"
			onclick="eliminarProducto('<%=producto.getId()%>')">Eliminar</button>
	</form>
	<%
	}
	}
	%>

	<form action="GestionarPagoServlet" method="post">
		<label><input type="radio" name="metodoPago" value="paypal">
			PayPal</label><br> <label><input type="radio" name="metodoPago"
			value="bizum" checked> Bizum</label><br> <label><input
			type="radio" name="metodoPago" value="tarjeta"> Tarjeta de
			Crédito</label><br> <input type="submit" value="Continuar">
	</form>
	<a href="CarritoServlet">Volver</a>
</body>
</html>