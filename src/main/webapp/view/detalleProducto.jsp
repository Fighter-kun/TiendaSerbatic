<%@page import="java.util.Base64"%>
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

    <body class="shop-detail">
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
                            <h1><%= request.getAttribute("nombre")%></h1>
                            <ul>
                                <li><a href="AñadirProductoServlet">Home</a></li>
                                <li><a href="ListadoProductosServlet">Products</a></li>
                                <li class="active"><%= request.getAttribute("nombre")%></li>
                            </ul>
                        </div>
                    </div>
                    <!-- =====  BREADCRUMB END===== -->
                    <%@ include file="components/leftBanner.jsp" %>
                    <div class="col-sm-8 col-lg-9 mtb_20">
                        <div class="row mt_10 ">
                            <div class="col-md-6">
                                <div><a class="thumbnails"><img src="data:image/jpeg;base64, <%= request.getAttribute("imagen") %>" alt="Imagen del producto"/> </a></div>
                            </div>
                            <div class="col-md-6 prodetail caption product-thumb">
                                <h4 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem"><%= request.getAttribute("nombre")%></a></h4>
                                <span class="price mb_20"><span class="amount"><span class="currencySymbol">$</span><%= request.getAttribute("precio")%></span>
                                </span>
                                <hr>
                                <ul class="list-unstyled product_info mtb_20">
                                    <li>
                                        <label>Category:</label>
                                        <span> <a href="#"><%= request.getAttribute("categoria")%></a></span></li>
                                    <li>
                                        <label>Product Code:</label>
                                        <span><%= request.getAttribute("id")%></span></li>
                                    <li>
                                        <label>Stock:</label>
                                        <span><%= request.getAttribute("stock")%></span></li>
                                </ul>
                                <hr>
                                <p class="product-desc mtb_30"><%= request.getAttribute("descripcion")%></p>
                                <div id="product">
                                 <form method="post" action="AñadirProductoServlet?id=<%=request.getAttribute("id")%>">
                                    <div class="qty mt_30 form-group2">
                                        <label id="ud">Qty</label>
                                        <input name="ud" id="ud" min="1" value="1" max="<%= request.getAttribute("stock")%>" type="number">
                                    </div>
                                    <div class="button-group mt_30">
                                        <div><button type="submit" class="add-to-cart" ><span>Add to cart</span></button></div>
                                    </div>
                                    </form>
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
    </body>

</html>