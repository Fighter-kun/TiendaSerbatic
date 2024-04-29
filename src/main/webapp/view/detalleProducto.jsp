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
                                <li><a href="category_page.html">Products</a></li>
                                <li class="active"><%= request.getAttribute("nombre")%></li>
                            </ul>
                        </div>
                    </div>
                    <!-- =====  BREADCRUMB END===== -->
                    <%@ include file="components/leftBanner.jsp" %>
                    <div class="col-sm-8 col-lg-9 mtb_20">
                        <div class="row mt_10 ">
                            <div class="col-md-6">
                                <div><a class="thumbnails"> <img data-name="product_image" src="webroot/images/product/product1.jpg" alt="" /></a></div>
                                <div id="product-thumbnail" class="owl-carousel">
                                    <div class="item">
                                        <div class="image-additional"><a class="thumbnail" href="webroot/images/product/product1.jpg" data-fancybox="group1"> <img src="webroot/images/product/product1.jpg" alt="" /></a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 prodetail caption product-thumb">
                                <h4 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem"><%= request.getAttribute("nombre")%></a></h4>
                                <div class="rating">
                                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span>
                                </div>
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
                                       	<div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                        <div class="compare"><a href="#"><span>Compare</span></a></div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div id="exTab5" class="mtb_30">
                                    <ul class="nav nav-tabs">
                                        <li class="active"> <a href="#1c" data-toggle="tab">Overview</a> </li>
                                        <li><a href="#2c" data-toggle="tab">Reviews (1)</a> </li>
                                        <li><a href="#3c" data-toggle="tab">Solution</a> </li>
                                    </ul>
                                    <div class="tab-content ">
                                        <div class="tab-pane active pt_20" id="1c">
                                            <p>CLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis malesuada mi id tristique. Sed ipsum nisi, dapibus at faucibus non, dictum a diam. Nunc vitae interdum diam. Sed finibus, justo vel maximus facilisis, sapien turpis euismod tellus, vulputate semper diam ipsum vel tellus.</p>
                                        </div>
                                        <div class="tab-pane" id="2c">
                                            <form class="form-horizontal">
                                                <div id="review"></div>
                                                <h4 class="mt_20 mb_30">Write a review</h4>
                                                <div class="form-group required">
                                                    <div class="col-sm-12">
                                                        <label class="control-label" for="input-name">Your Name</label>
                                                        <input name="name" value="" id="input-name" class="form-control" type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <div class="col-sm-12">
                                                        <label class="control-label" for="input-review">Your Review</label>
                                                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                                                        <div class="help-block"><span class="text-danger">Note:</span> HTML is not translated!</div>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <div class="col-md-6">
                                                        <label class="control-label">Rating</label>
                                                        <div class="rates"><span>Bad</span>
                                                            <input name="rating" value="1" type="radio">
                                                            <input name="rating" value="2" type="radio">
                                                            <input name="rating" value="3" type="radio">
                                                            <input name="rating" value="4" type="radio">
                                                            <input name="rating" value="5" type="radio">
                                                            <span>Good</span></div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="buttons pull-right">
                                                            <button type="submit" class="btn btn-md btn-link">Continue</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="tab-pane pt_20" id="3c">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis malesuada mi id tristique. Sed ipsum nisi, dapibus at faucibus non, dictum a diam. Nunc vitae interdum diam. Sed finibus, justo vel maximus facilisis, sapien turpis euismod tellus, vulputate semper diam ipsum vel tellus.applied clearfix to the tab-content to rid of the gap between the tab and the content</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="heading-part text-center mb_10">
                                    <h2 class="main_title mt_50">Related Products</h2>
                                </div>
                                <div class="related_pro box">
                                    <div class="product-layout  product-grid related-pro  owl-carousel mb_50 ">
                                        <div class="item">
                                            <div class="product-thumb">
                                                <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product7.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product7-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                    <div class="button-group text-center">
                                                        <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                        <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                        <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                        <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                    </div>
                                                </div>
                                                <div class="caption product-detail text-center">
                                                    <h6 data-name="product_name" class="product-name mt_20"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Video Recording</a></h6>
                                                    <div class="rating">
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span>
                                                    </div>
                                                    <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="product-thumb">
                                                <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product8.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product8-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                    <div class="button-group text-center">
                                                        <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                        <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                        <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                        <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                    </div>
                                                </div>
                                                <div class="caption product-detail text-center">
                                                    <h6 data-name="product_name" class="product-name mt_20"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Video Recording</a></h6>
                                                    <div class="rating">
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span>
                                                    </div>
                                                    <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="product-thumb">
                                                <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product9.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product9-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                    <div class="button-group text-center">
                                                        <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                        <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                        <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                        <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                    </div>
                                                </div>
                                                <div class="caption product-detail text-center">
                                                    <h6 data-name="product_name" class="product-name mt_20"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Video Recording</a></h6>
                                                    <div class="rating">
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span>
                                                    </div>
                                                    <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
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
    </body>

</html>