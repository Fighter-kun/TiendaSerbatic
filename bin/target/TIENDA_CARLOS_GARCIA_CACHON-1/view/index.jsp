<%@page import="curso.java.tienda.model.VO.ProductoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List"%>
<% session = request.getSession();%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tienda</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <h1>CATALOGO</h1>

    <a href="CarritoServlet"><i class="fas fa-shopping-cart">
        <%
            Object totalCarrito = session.getAttribute("totalCarrito");
            out.println(totalCarrito != null ? totalCarrito : "");
        %>
    </i></a>

    <%
        List<ProductoVO> catalogo = (List<ProductoVO>) request.getAttribute("catalogo");
        for (ProductoVO producto : catalogo) {
    %>
    <div>
        <h2>Descripción: <%=producto.getDescripcion()%></h2>
        <h3>Nombre: <%=producto.getNombre()%></h3>
        <h3>Precio: <%=producto.getPrecio()%></h3>
        <h3>Stock: <%=producto.getStock()%></h3>
        <img src="<%=producto.getImagen()%>" alt="Imagen del producto">
        <a href="AñadirProductoServlet?id=<%=producto.getId()%>">Comprar</a>
    </div>
    <%
        }
    %>
</body>
</html>
