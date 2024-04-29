<% session = request.getSession();%>
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
                            <h1>Shopping Cart</h1>
                            <ul>
                                <li><a href="AñadirProductoServlet">Home</a></li>
                                <li class="active">Shopping Cart</li>
                            </ul>
                        </div>
                    </div>
                    <!-- =====  BREADCRUMB END===== -->
                    <%@ include file="components/leftBanner.jsp" %>
                    <div class="col-sm-8 col-lg-9 mtb_20">
                        <form>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <td class="text-center">Image</td>
                                            <td class="text-left">Product Name</td>
                                            <td class="text-left">Model</td>
                                            <td class="text-left">Quantity</td>
                                            <td class="text-right">Unit Price</td>
                                            <td class="text-right">Total</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            session = request.getSession();
                                            double total;
                                            if (carrito != null) {
                                                for (HashMap.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
                                                    ProductoVO producto = entry.getKey();
                                                    Integer cantidad = entry.getValue();
                                                    total = +producto.getPrecio();
                                        %>
                                        <tr>
                                            <td class="text-center"><a href="#"><img src="webroot/images/product/70x84.jpg" alt="iPod Classic" title="iPod Classic"></a></td>
                                            <td class="text-left"><a href="product.html"><%=producto.getNombre()%></a></td>
                                            <td class="text-left"><%=producto.getDescripcion()%></td>
                                            <td class="text-left">
                                                <div style="max-width: 200px;" class="input-group btn-block">
                                                    <input type="number" class="form-control quantity" value="<%=cantidad%>" max="<%=producto.getStock()%>" min="1" onchange="actualizarCantidad('<%=producto.getId()%>', this)">
                                                    <span class="input-group-btn">
                                                        <button  class="btn btn-danger" title="" data-toggle="tooltip" type="button" data-original-title="Remove" onclick="eliminarProducto('<%=producto.getId()%>')"><i class="fa fa-times-circle"></i></button>
                                                    </span>
                                                 </div>
                                            </td>
                                            <td class="text-right"><%=producto.getPrecio()%></td>
                                            <td class="text-right"><%=(producto.getPrecio() * cantidad)%></td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                        <form action="AñadirProductoServlet">
                            <input class="btn pull-left mt_30" type="submit" value="Continue Shopping" />
                        </form>
                        <% if (carrito.size() > 0) { %>
                        <a href="GestionarPagoServlet" class="btn pull-right mt_30">Checkout</a>
                        <% }%>

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
                                          //location.reload();
                                          input.value = data;
                                      })
                                      .catch(error => {
                                          console.error('Error:', error);
                                      });
                          }
							
                          
                          function eliminarProducto(productoId) {
                            var url = "EliminarProductoServlet?productoId=" + productoId;
                           

                            fetch(url, {
                                method: 'POST'
                            })
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

                            console.log('Eliminando producto con ID:', productoId);
                        }

        </script>
    </body>

</html>