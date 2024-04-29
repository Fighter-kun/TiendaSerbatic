<% session = request.getSession();%>
<%@page import="java.util.List"%>
<%@page import="curso.java.tienda.model.VO.PedidoVO"%>
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
						<ul class="nav text-right">
						    <li>
						        <form id="ascendenteForm" action="HistorialPedidosServlet" method="post">
						            <input type="radio" name="orden" value="ascendente" id="ascendente">
						            <label for="ascendente">Ascendente</label>
						        </form>
						    </li>
						    <li>
						        <form id="descendenteForm" action="HistorialPedidosServlet" method="post">
						            <input type="radio" name="orden" value="descendente" id="descendente">
						            <label for="descendente">Descendente</label>
						        </form>
						    </li>
						</ul>
                        <form>
                            <div class="table-responsive">
                                <table class="table table-bordered">
							    <thead>
							        <tr>
							            <td class="text-center">Fecha</td>
							            <td class="text-center">Metodo Pago</td>
							            <td class="text-center">Estado</td>
							            <td class="text-center">Nº.Factura</td>
							            <td class="text-center">Total</td>
							            <td class="text-center">Líneas de pedido</td>
							        </tr>
							    </thead>
							    <tbody>
							        <% 
							        List<PedidoVO> listadoPedidos = (List<PedidoVO>) request.getAttribute("listadoPedidos");
							        if (listadoPedidos != null) {
							            for (PedidoVO pedido : listadoPedidos) {
							        %>
							        <tr>
							            <td class="text-center"><%= pedido.getFecha() %></td>
							            <td class="text-center"><%= pedido.getMetodoPago() %></td>
							            <td class="text-center"><%= pedido.getEstado() %></td>
							            <td class="text-center"><%= pedido.getNumFactura() %></td>
							            <td class="text-center"><%= pedido.getTotal() %></td>
							            <td class="text-center"><a href="#" onclick="mostrarDetallePedido(<%= pedido.getId() %>)">...</a></td>
							        </tr>
							        <% 
							            }
							        } else {
							        %>
							        <tr>
							            <td class="text-center" colspan="5">No hay pedidos disponibles.</td>
							        </tr>
							        <% 
							        }
							        %>
							    </tbody>
							</table>
                            </div>
                        </form>
                        <div class="modal fade" id="pedidoDetalleModal" tabindex="-1" role="dialog" aria-labelledby="pedidoDetalleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="pedidoDetalleModalLabel">Líneas de Pedido</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!-- Aquí se mostrarán las líneas de pedido -->
                                    <div id="pedidoDetalleContenido"></div>
                                </div>
                            </div>
                        </div>
                    </div>
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
		    function mostrarDetallePedido(idPedido) {
		    $.ajax({
		        url: 'HistorialPedidosServlet',
		        type: 'GET',
		        data: {
		            idPedido: idPedido
		        },
		        success: function(data) {
		            // Actualizar el contenido del modal con los detalles del pedido
		            $('#pedidoDetalleContenido').html(data);
		            // Mostrar el modal
		            $('#pedidoDetalleModal').modal('show');
		        },
		        error: function(xhr, status, error) {
		            console.error('Error al obtener los detalles del pedido:', error);
		        }
		    });
		}
		
		</script>
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