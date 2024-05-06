<%@page import="java.util.List"%>
<!DOCTYPE html>
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
    <!--<![endif]-->

    <head>
        <!-- =====  BASIC PAGE NEEDS  ===== -->
        <meta charset="utf-8">
        <title>Cronos Luxe</title>
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
        <link rel="stylesheet" type="text/css" href="webroot/css/jquery-ui.css">
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
                            <h1>Products</h1>
                            <ul>
                                <li><a href="AñadirProductoServlet">Home</a></li>
                                <li class="active">Products</li>
                            </ul>
                        </div>
                    </div>
                    <!-- =====  BREADCRUMB END===== -->
                    <div class="col-12 mtb_20">
                        <div class="category-page-wrapper mb_30">
                            <div class="list-grid-wrapper pull-left">
                                <div class="btn-group btn-list-grid">
                                    <button type="button" id="grid-view" class="btn btn-default grid-view active"></button>
                                    <button type="button" id="list-view" class="btn btn-default list-view"></button>
                                </div>
                            </div>
                            <!-- 
                            <div class="page-wrapper pull-right">
                                <label class="control-label" for="input-limit">Show :</label>
                                <div class="limit">
                                    <select id="input-limit" class="form-control">
                                        <option value="8" selected="selected">08</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="75">75</option>
                                        <option value="100">100</option>
                                    </select>
                                </div>
                                <span><i class="fa fa-angle-down" aria-hidden="true"></i></span>
                            </div>
                            <div class="sort-wrapper pull-right">
                                <label class="control-label" for="input-sort">Sort By :</label>
                                <div class="sort-inner">
                                    <select id="input-sort" class="form-control">
                                        <option value="ASC" selected="selected">Default</option>
                                        <option value="ASC">Name (A - Z)</option>
                                        <option value="DESC">Name (Z - A)</option>
                                        <option value="ASC">Price (Low &gt; High)</option>
                                        <option value="DESC">Price (High &gt; Low)</option>
                                        <option value="DESC">Rating (Highest)</option>
                                        <option value="ASC">Rating (Lowest)</option>
                                        <option value="ASC">Model (A - Z)</option>
                                        <option value="DESC">Model (Z - A)</option>
                                    </select>
                                </div>
                                <span><i class="fa fa-angle-down" aria-hidden="true"></i></span>
                            </div>
                            -->
                        </div>
                        <div class="row">
                            <% List<ProductoVO> catalogo = (List<ProductoVO>) request.getAttribute("catalogo");
                for (ProductoVO producto : catalogo) {%>

                            <div class="product-layout product-grid col-md-4 col-xs-6 ">
                                <div class="item">
                                    <div class="product-thumb clearfix mb_30">
                                        <div class="image product-imageblock"> <a href="DetalleProductoServlet?id=<%=producto.getId()%>"><img src="data:image/jpeg;base64, <%= new String(Base64.getEncoder().encode(producto.getImagen())) %>" alt="Imagen del producto"/> <img src="data:image/jpeg;base64, <%= new String(Base64.getEncoder().encode(producto.getImagen())) %>" alt="Imagen del producto"/>  </a>
                                            <div class="button-group text-center">
                                                <div><a href="AñadirProductoServlet?id=<%=producto.getId()%>"><span></span>Add to cart</a></div>
                                            </div>
                                        </div>
                                        <div class="caption product-detail text-center">
                                            <h6 data-name="product_name" class="product-name mt_20"><%= producto.getNombre()%></h6>
                                            <span class="price"><span class="amount"><span class="currencySymbol">$</span><%= producto.getPrecio()%></span></span>
                                            <p class="product-desc mt_20 mb_60"><%= producto.getDescripcion()%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <% }%>

                        </div>
                        <!--  
                        <div class="pagination-nav text-center mt_50">
                            <ul>
                                <li><a href="#"><i class="fa fa-angle-left"></i></a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                            </ul>
                        </div>
                        -->
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
        <script src="webroot/js/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#slider-range").slider({
                    range: true,
                    min: 0,
                    max: 500,
                    values: [75, 300],
                    slide: function (event, ui) {
                        $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
                    }
                });
                $("#amount").val("$" + $("#slider-range").slider("values", 0) +
                        " - $" + $("#slider-range").slider("values", 1));
            });
        </script>
    </body>

</html>