<%@page import="java.util.Base64"%>
<%@page import="curso.java.tienda.model.VO.ProductoVO"%>
<%@page import="curso.java.tienda.model.VO.UsuarioVO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List"%>
<% session = request.getSession();%>
<!DOCTYPE html>
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
    <!--<![endif]-->

    <head>
        <!-- =====  BASIC PAGE NEEDS  ===== -->
        <meta charset="utf-8">
        <title>Dark look E-commerce Bootstrap Template</title>
        <!-- =====  SEO MATE  ===== -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="distribution" content="global">
        <meta name="revisit-after" content="2 Days">
        <meta name="robots" content="ALL">
        <meta name="rating" content="8 YEARS">
        <meta name="Language" content="en-us">
        <meta name="GOOGLEBOT" content="NOARCHIVE">
        <!-- =====  MOBILE SPECIFICATION  ===== -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="viewport" content="width=device-width">
        <!-- =====  CSS  ===== -->
        <link rel="stylesheet" type="text/css" href="webroot/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="webroot/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="webroot/css/style.css">
        <link rel="stylesheet" type="text/css" href="webroot/css/magnific-popup.css">
        <link rel="stylesheet" type="text/css" href="webroot/css/owl.carousel.css">
        <link rel="shortcut icon" href="webroot/images/favicon.png">
        <link rel="apple-touch-icon" href="webroot/images/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="webroot/images/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="webroot/images/apple-touch-icon-114x114.png">
    </head>

    <body>
        <!-- =====  LODER  ===== -->
        <div class="loder"></div>
        <div class="wrapper">
            <!-- =====  HEADER START  ===== -->
            <%@ include file="components/header.jsp" %>
            <!-- =====  HEADER END  ===== -->
            <!-- =====  BANNER STRAT  ===== -->
            <div class="banner">
                <div class="main-banner owl-carousel">
                    <div class="item"><a href="DetalleProductoServlet?id=1"><img src="webroot/images/main_banner1.jpg" alt="Main Banner" class="img-responsive" /></a></div>
                </div>
            </div>
            <!-- =====  BANNER END  ===== -->
            <!-- =====  CONTAINER START  ===== -->
            <div class="container">
                <!-- =====  SUB BANNER  STRAT ===== -->
                <div class="row ">
                    <div class="col-sm-12 mt_30">
                        <!-- =====  PRODUCT TAB  ===== -->
                        <div id="product-tab" class="mt_10">
                            <div class="heading-part mb_10 ">
                                <h2 class="main_title">Featured Products</h2>
                            </div>
                            <ul class="nav text-right">
							    <li>
							        <form id="nuevosForm" action="" method="post">
							            <input type="radio" name="orden" value="nuevos" id="nuevos">
							            <label for="nuevos">Nuevos</label>
							        </form>
							    </li>
							    <li>
							        <form id="precioAscForm" action="" method="post">
							            <input type="radio" name="orden" value="precio_asc" id="precio_asc">
							            <label for="precio_asc">Precio Ascendente</label>
							        </form>
							    </li>
							    <li>
							        <form id="precioDescForm" action="" method="post">
							            <input type="radio" name="orden" value="precio_desc" id="precio_desc">
							            <label for="precio_desc">Precio Descendente</label>
							        </form>
							    </li>
							</ul>
                            <div class="tab-content clearfix box">
                                <div class="tab-pane active" id="nArrivals">
                                    <div class="nArrivals owl-carousel">
                                        <%
                                            List<ProductoVO> catalogo = (List<ProductoVO>) request.getAttribute("catalogo");
                                            for (ProductoVO producto : catalogo) {
                                        %>
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb">
                                                    <div class="image product-imageblock"> <a href="DetalleProductoServlet?id=<%=producto.getId()%>"><img src="data:image/jpeg;base64, <%= new String(Base64.getEncoder().encode(producto.getImagen())) %>" alt="Imagen del producto"/> <img src="data:image/jpeg;base64, <%= new String(Base64.getEncoder().encode(producto.getImagen())) %>" alt="Imagen del producto"/>  </a>
                                                        <div class="button-group text-center">
                                                            <div><a href="AñadirProductoServlet?id=<%=producto.getId()%>"><span></span>Add to cart</a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        
                                                        <h6 data-name="product_name" class="product-name"><%=producto.getNombre()%></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span><%=producto.getPrecio()%></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <!-- =====  PRODUCT TAB  END ===== -->
                    </div>
                </div>
                <!-- =====  SUB BANNER END  ===== -->
                <%@ include file="components/brandLogo.jsp" %>
            </div>
            <!-- =====  CONTAINER END  ===== -->
            <!-- =====  FOOTER START  ===== -->
            <%@ include file="components/footer.jsp" %>
            <!-- =====  FOOTER END  ===== -->
        </div>
        <a id="scrollup"></a>
        <script src="webroot/js/jQuery_v3.1.1.min.js"></script>
        <script src="webroot/js/owl.carousel.min.js"></script>
        <script src="webroot/js/bootstrap.min.js"></script>
        <script src="webroot/js/jquery.magnific-popup.js"></script>
        <script src="webroot/js/jquery.firstVisitPopup.js"></script>
        <script src="webroot/js/custom.js"></script>
        <script>
		    const radios = document.querySelectorAll('input[type="radio"]');
		    radios.forEach(radio => {
		        radio.addEventListener('change', function() {
		            radios.forEach(otherRadio => {
		                if (otherRadio !== this) {
		                    otherRadio.checked = false;
		                }
		            });
		            this.form.submit();
		        });
		    });
		</script>
		<script>
		    window.onload = function() {
		        var orden = "<%= request.getParameter("orden") %>";
		        var radios = document.getElementsByName("orden");
		        for (var i = 0; i < radios.length; i++) {
		            if (radios[i].value === orden) {
		                radios[i].checked = true;
		                break;
		            }
		        }
		    };
		</script>
    </body>

</html>