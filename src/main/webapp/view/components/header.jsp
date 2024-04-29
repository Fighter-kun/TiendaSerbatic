<%@page import="java.util.HashMap"%>
<%@page import="curso.java.tienda.model.VO.ProductoVO"%>
<%@page import="curso.java.tienda.model.VO.UsuarioVO"%>
<%@ page import="java.util.ResourceBundle" %>
<%ResourceBundle i18n = (ResourceBundle) request.getAttribute("messages") ;%>
<header id="header">
                <div class="header-top">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-4">
                                <div class="header-top-left">
                                    <div class="contact"><span class="hidden-xs hidden-sm hidden-md">Days a week from 9:00 am to 7:00 pm</span></div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8">
                                <ul class="header-top-right text-right">
                                    <li class="language dropdown"> <span class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button"><%= i18n.getString("language") %> <span class="caret"></span> </span>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                        	<li><a href="SeleccionIdioma?idioma=es">Castellano</a></li>
        									<li><a href="SeleccionIdioma?idioma=en">English</a></li>
                                        </ul>
                                    </li>
                                    <li class="currency dropdown"> <span class="dropdown-toggle" id="dropdownMenu12" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">Currency <span class="caret"></span> </span>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu12">
                                            <li><a href="#">€ Euro</a></li>
                                            <li><a href="#">£ Pound Sterling</a></li>
                                            <li><a href="#">$ US Dollar</a></li>
                                        </ul>
                                    </li>
                                    <%
                                        if (session.getAttribute("usuario") != null) {
                                            UsuarioVO u = (UsuarioVO) session.getAttribute("usuario");%>
                                    <li class="dropdown"> <span class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button"><a href="PerfilServlet"><%=u.getEmail()%></a> <span class="caret"></span> </span>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                            <li><a href="PerfilServlet">Profile</a></li>
                                            <li><a href="HistorialPedidosServlet">Orders history</a></li>
                                        </ul>
                                    </li>
                                    <span aria-haspopup="true" aria-expanded="false" role="button"><a href="LogoutServlet">Logout</a> </span> 
                                    <%
                                    } else { %> 
                                    <li class="account"><a href="LoginServlet"><%= i18n.getString("account") %></a></li>
                                        <% } %>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header">
                    <div class="container">
                        <div class="row">
                        <div class="navbar-header col-xs-6 col-sm-4"> <a class="navbar-brand" href="AñadirProductoServlet"> <img alt="themini" src="webroot/images/logo.png"> </a> </div>
                            <div class="col-xs-12 col-sm-4">
                                <div class="main-search mt_40">
                                    </div>
                            </div>
                            
                            <div class="col-xs-6 col-sm-4 shopcart">
                                <div id="cart" class="btn-group btn-block mtb_40">
                                    <button type="button" class="btn" data-target="#cart-dropdown" data-toggle="collapse" aria-expanded="true"><span id="shippingcart">Shopping cart</span><span id="cart-total">
                                            <% HashMap<ProductoVO, Integer> carrito = (HashMap<ProductoVO, Integer>) session.getAttribute("carrito");
                                            %> ( <%=carrito.size() > 0 ? carrito.size() : "0"%> )</span> </button>
                                </div>
                                <div id="cart-dropdown" class="cart-menu collapse">
                                    <ul>
                                        <li>
                                            <form action="CarritoServlet" method="post">
                                                <input class="btn pull-left mt_10" value="View cart" type="submit">
                                            </form>
                                            <!-- <form action="pago.html">
                                              <input class="btn pull-right mt_10" value="Checkout" type="submit">
                                            </form> -->
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
                                    <li> <a href="index.html">Home</a></li>
                                    <li class="dropdown mega-dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Collection </a>
                                        <ul class="dropdown-menu mega-dropdown-menu row">
                                            <li class="col-md-3">
                                                <ul>
                                                    <li class="dropdown-header">Women's</li>
                                                    <li><a href="#">Unique Features</a></li>
                                                    <li><a href="#">Image Responsive</a></li>
                                                    <li><a href="#">Auto Carousel</a></li>
                                                    <li><a href="#">Newsletter Form</a></li>
                                                    <li><a href="#">Four columns</a></li>
                                                    <li><a href="#">Four columns</a></li>
                                                    <li><a href="#">Good Typography</a></li>
                                                </ul>
                                            </li>
                                            <li class="col-md-3">
                                                <ul>
                                                    <li class="dropdown-header">Man's</li>
                                                    <li><a href="#">Unique Features</a></li>
                                                    <li><a href="#">Image Responsive</a></li>
                                                    <li><a href="#">Four columns</a></li>
                                                    <li><a href="#">Auto Carousel</a></li>
                                                    <li><a href="#">Newsletter Form</a></li>
                                                    <li><a href="#">Four columns</a></li>
                                                    <li><a href="#">Good Typography</a></li>
                                                </ul>
                                            </li>
                                            <li class="col-md-3">
                                                <ul>
                                                    <li class="dropdown-header">Children's</li>
                                                    <li><a href="#">Unique Features</a></li>
                                                    <li><a href="#">Four columns</a></li>
                                                    <li><a href="#">Image Responsive</a></li>
                                                    <li><a href="#">Auto Carousel</a></li>
                                                    <li><a href="#">Newsletter Form</a></li>
                                                    <li><a href="#">Four columns</a></li>
                                                    <li><a href="#">Good Typography</a></li>
                                                </ul>
                                            </li>
                                            <li class="col-md-3">
                                                <ul>
                                                    <li id="myCarousel" class="carousel slide" data-ride="carousel">
                                                        <div class="carousel-inner">
                                                            <div class="item active"> <a href="#"><img src="webroot/images/menu-banner1.jpg" class="img-responsive" alt="Banner1"></a></div>
                                                            <!-- End Item -->
                                                            <div class="item"> <a href="#"><img src="webroot/images/menu-banner2.jpg" class="img-responsive" alt="Banner1"></a></div>
                                                            <!-- End Item -->
                                                            <div class="item"> <a href="#"><img src="webroot/images/menu-banner3.jpg" class="img-responsive" alt="Banner1"></a></div>
                                                            <!-- End Item -->
                                                        </div>
                                                        <!-- End Carousel Inner -->
                                                    </li>
                                                    <!-- /.carousel -->
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li> <a href="category_page.html">Shop</a></li>
                                    <li> <a href="blog_page.html">Blog</a></li>
                                    <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages </a>
                                        <ul class="dropdown-menu">
                                            <li> <a href="CarritoServlet">Cart</a></li>
                                            <% 
                                                if (!carrito.isEmpty()) {
                                                %>
                                                    <li> <a href="GestionarPagoServlet">Checkout</a></li>
                                                <% } %>
                                            
                                        </ul>
                                    </li>
                                    <li> <a href="about.html">About us</a></li>
                                    <li> <a href="ContactoServlet">Contact us</a></li>
                                </ul>
                            </div>
                            <!-- /.nav-collapse -->
                        </nav>
                    </div>
                </div>
            </header>