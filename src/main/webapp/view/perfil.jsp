<%@page import="java.util.HashMap"%>
<%@page import="curso.java.tienda.model.VO.ProductoVO"%>
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
            <!-- =====  CONTAINER START  ===== -->
            <div class="container">
                <div class="row ">
                    <!-- =====  BANNER STRAT  ===== -->
                    <div class="col-sm-12">
                        <div class="breadcrumb ptb_20">
                            <h1>Perfil</h1>
                            <ul>
                                <li><a href="AñadirProductoServlet">Home</a></li>
                                <li class="active">Perfil</li>
                            </ul>
                        </div>
                    </div>
                    <!-- =====  BREADCRUMB END===== -->
                    <%@ include file="components/leftBanner.jsp" %>
                    <div class="col-sm-8 col-lg-9 mtb_20">
                        <form method="post" action="PerfilServlet">
					        <%
					        UsuarioVO usuario = (UsuarioVO) session.getAttribute("usuario");
					        %>
					        <label for="nombre">Nombre:</label>
					        <input class="form-control"  type="text" id="nombre" name="nombre" value="<%= (usuario != null && usuario.getNombre() != null) ? usuario.getNombre() : "" %>">
					
					        <label for="apellido1">Primer Apellido:</label>
					        <input class="form-control" type="text" id="apellido1" name="apellido1" value="<%= (usuario != null && usuario.getApellido1() != null) ? usuario.getApellido1() : "" %>">
					
					        <label for="apellido2">Segundo Apellido:</label>
					        <input class="form-control" type="text" id="apellido2" name="apellido2" value="<%= (usuario != null && usuario.getApellido2() != null) ? usuario.getApellido2() : "" %>">
					        					
					        <label for="direccion">Dirección:</label>
					        <input class="form-control" type="text" id="direccion" name="direccion" value="<%= (usuario != null && usuario.getDireccion() != null) ? usuario.getDireccion() : "" %>">
					
					        <label for="dni">DNI:</label>
					        <input class="form-control" type="text" id="dni" name="dni" value="<%= (usuario != null && usuario.getDni() != null) ? usuario.getDni() : "" %>">
					
					        <label for="localidad">Localidad:</label>
					        <input class="form-control" type="text" id="localidad" name="localidad" value="<%= (usuario != null && usuario.getLocalidad() != null) ? usuario.getLocalidad() : "" %>">
					
					        <label for="provincia">Provincia:</label>
					        <input class="form-control" type="text" id="provincia" name="provincia" value="<%= (usuario != null && usuario.getProvincia() != null) ? usuario.getProvincia() : "" %>">
					
					        <label for="telefono">Teléfono:</label>
					        <input class="form-control" type="text" id="telefono" name="telefono" value="<%= (usuario != null && usuario.getTelefono() != null) ? usuario.getTelefono() : "" %>"><br><br>
                            
                            <button type="submit" type="button" class="btn">Confirmar Cambios</button>    <a href="CambiarClaveServlet" class="btn">Cambiar Contraseña</a> <a href="AñadirProductoServlet" class="btn">Salir</a>
                        </form>
                    </div>
                </div>
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
        <script src="webroot/js/custom.js"></script>
        <script type="text/javascript">
                          $('input[name=\'payment_address\']').on('change', function () {
                              if (this.value == 'new') {
                                  $('#payment-existing').hide();
                                  $('#payment-new').show();
                              } else {
                                  $('#payment-existing').show();
                                  $('#payment-new').hide();
                              }
                          });
                          $('input[name=\'shipping_address\']').on('change', function () {
                              if (this.value == 'new') {
                                  $('#shipping-existing').hide();
                                  $('#shipping-new').show();
                              } else {
                                  $('#shipping-existing').show();
                                  $('#shipping-new').hide();
                              }
                          });
        </script>
    </body>

</html>