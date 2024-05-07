<%@page import="java.util.Base64"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="curso.java.tienda.model.VO.ProductoVO"%>
<%@page import="curso.java.tienda.model.VO.UsuarioVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:setLocale value="${locale}" scope="session" />
<fmt:setBundle basename="messages" scope="session" />
<header id="header">
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-4">
                    <div class="header-top-left">
                        <div class="contact"><span class="hidden-xs hidden-sm hidden-md"><fmt:message key="scheduleContact" /></span></div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-8">
                    <ul class="header-top-right text-right">
                        <li class="language dropdown"> <span class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button"><fmt:message key="language" /> <span class="caret"></span> </span>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="SeleccionIdioma?idioma=es">Castellano</a></li>
                                <li><a href="SeleccionIdioma?idioma=en">English</a></li>
                            </ul>
                        </li>
                        <%
                            if (session.getAttribute("usuario") != null) {
                                UsuarioVO u = (UsuarioVO) session.getAttribute("usuario");%>
                        <li class="dropdown"> <span class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button"><a href="PerfilServlet"><%=u.getEmail()%></a> <span class="caret"></span> </span>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="PerfilServlet"><fmt:message key="perfil" /></a></li>
                                <li><a href="HistorialPedidosServlet"><fmt:message key="historialPedidos" /></a></li>
                            </ul>
                        </li>
                        <span aria-haspopup="true" aria-expanded="false" role="button"><a href="LogoutServlet"><fmt:message key="logout" /></a> </span> 
                        <%
                                    } else { %> 
                        <li class="account"><a href="LoginServlet"><fmt:message key="account" /></a></li>
                            <% } %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="navbar-header col-xs-6 col-sm-4"> <a class="navbar-brand" href="AñadirProductoServlet"> <img alt="themini" src="webroot/images/logo1.png"> </a> </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="main-search mt_40">
                    </div>
                </div>

                <div class="col-xs-6 col-sm-4 shopcart">
                    <div id="cart" class="btn-group btn-block mtb_40">
                        <button type="button" class="btn" data-target="#cart-dropdown" data-toggle="collapse" aria-expanded="true">
                            <span id="shippingcart"><fmt:message key="carrito" /></span>
                            <span id="cart-total">
                                <% HashMap<ProductoVO, Integer> carrito = (HashMap<ProductoVO, Integer>) session.getAttribute("carrito");
                                %> ( <%=carrito.size() > 0 ? carrito.size() : "0"%> )
                            </span> 
                        </button>
                    </div>
                    <div id="cart-dropdown" class="cart-menu collapse">
                        <ul>
                            <li>
                                <form action="CarritoServlet" method="post">
                                    <ul>
                                        <%
                                            if (carrito != null) {
                                                for (Map.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
                                                    ProductoVO producto = entry.getKey();
                                                    Integer cantidad = entry.getValue();
                                        %>
                                        <li>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <a href="DetalleProductoServlet?id=<%=producto.getId()%>"> <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(producto.getImagen())%>" alt="<%= producto.getNombre()%>" style="max-width: 100px; max-height: 100px;"></a>
                                                    </td>
                                                    <td>
                                                        <span>Producto: <%= producto.getNombre()%></span><br>
                                                        <span>Unidades: <%= cantidad%></span><br>
                                                        <span>Precio: <%= producto.getPrecio() * cantidad%> €</span><br>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br><hr><br>
                                        </li>
                                        <% }
                                        } %>
                                    </ul>
                                    <input class="btn pull-left mt_9" value="View cart" type="submit">
                                </form>
                                <% if (carrito.size() > 0) { %>
                                <a href="GestionarPagoServlet" class="btn pull-right mt_19">Checkout</a>
                                <% }%>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <nav class="navbar">
                <p>menu</p>
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse"> <span class="i-bar"><i class="fa fa-bars"></i></span></button>
                <div class="collapse navbar-collapse js-navbar-collapse">
                    <ul id="menu" class="nav navbar-nav">
                        <li> <a href="AñadirProductoServlet"><fmt:message key="casa" /></a></li>
                        <li> <a href="ContactoServlet"><fmt:message key="contacto" /></a></li>
                        <li> <a href="ListadoProductosServlet"><fmt:message key="relojes" /></a></li>
                    </ul>
                </div>
                <!-- /.nav-collapse -->
            </nav>
        </div>
    </div>
</header>