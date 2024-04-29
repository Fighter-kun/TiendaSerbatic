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
            <div id="subscribe-me" class="modal animated fade in" role="dialog" data-keyboard="true" tabindex="-1">
                <div class="newsletter-popup"> <img class="offer" src="webroot/images/newsbg.jpg" alt="offer">
                    <div class="newsletter-popup-static newsletter-popup-top">
                        <div class="popup-text">
                            <div class="popup-title">50% <span>off</span></div>
                            <div class="popup-desc">
                                <div>Sign up and get 50% off your next Order</div>
                            </div>
                        </div>
                        <form onsubmit="return  validatpopupemail();" method="post">
                            <div class="form-group required">
                                <input type="email" name="email-popup" id="email-popup" placeholder="Enter Your Email" class="form-control input-lg" required />
                                <button type="submit" class="btn btn-default btn-lg" id="email-popup-submit">Subscribe</button>
                                <label class="checkme">
                                    <input type="checkbox" value="" id="checkme" /> Dont show again</label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- =====  HEADER START  ===== -->
            <%@ include file="components/header.jsp" %>
            <!-- =====  HEADER END  ===== -->
            <!-- =====  BANNER STRAT  ===== -->
            <div class="banner">
                <div class="main-banner owl-carousel">
                    <div class="item"><a href="#"><img src="webroot/images/main_banner1.jpg" alt="Main Banner" class="img-responsive" /></a></div>
                    <div class="item"><a href="#"><img src="webroot/images/main_banner2.jpg" alt="Main Banner" class="img-responsive" /></a></div>
                </div>
            </div>
            <!-- =====  BANNER END  ===== -->
            <!-- =====  CONTAINER START  ===== -->
            <div class="container">
                <!-- =====  SUB BANNER  STRAT ===== -->
                <div class="row">
                    <div class="col-sm-3 mt_20 cms-icon ">
                        <div class="feature-i-left ptb_30 ">
                            <div class="icon-right Shipping"></div>
                            <h6>Free Shipping</h6>
                            <p>Free dedlivery worldwide</p>
                        </div>
                    </div>
                    <div class="col-sm-3 mt_20 cms-icon ">
                        <div class="feature-i-left ptb_30 ">
                            <div class="icon-right Order"></div>
                            <h6>Order Onlivne</h6>
                            <p>Hours : 8am - 11pm</p>
                        </div>
                    </div>
                    <div class="col-sm-3 mt_20 cms-icon ">
                        <div class="feature-i-left ptb_30 ">
                            <div class="icon-right Save"></div>
                            <h6>Shop And Save</h6>
                            <p>For All Spices & Herbs</p>
                        </div>
                    </div>
                    <div class="col-sm-3 mt_20 cms-icon ">
                        <div class="feature-i-left ptb_30 ">
                            <div class="icon-right Safe"></div>
                            <h6>Safe Shoping</h6>
                            <p>Ensure genuine 100%</p>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-sm-12 mt_30">
                        <!-- =====  PRODUCT TAB  ===== -->
                        <div id="product-tab" class="mt_10">
                            <div class="heading-part mb_10 ">
                                <h2 class="main_title">Featured Products</h2>
                            </div>
                            <ul class="nav text-right">
                                <li class="active"> <a href="#nArrivals" data-toggle="tab">New Arrivals</a> </li>
                                <li><a href="#Bestsellers" data-toggle="tab">Bestsellers</a> </li>
                                <li><a href="#Featured" data-toggle="tab">Featured</a> </li>
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
                                                    <div class="image product-imageblock"> <a href="DetalleProductoServlet?id=<%=producto.getId()%>"> <img data-name="product_image" src="webroot/images/product/product1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product1-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div><a href="AñadirProductoServlet?id=<%=producto.getId()%>"><span></span>Add to cart</a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem"><%=producto.getNombre()%></a></h6>
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
                                <div class="tab-pane" id="Bestsellers">
                                    <div class="Bestsellers owl-carousel">
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product1-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product3.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product3-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product5.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="images/product/product5-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product6.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product6-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product8.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product8-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product10.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product10-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="Featured">
                                    <div class="Featured owl-carousel">
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product2.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product2-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product4.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product4-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product6.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product6-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product8.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product8-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="images/product/product10.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="images/product/product10-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                        <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-grid">
                                            <div class="item">
                                                <div class="product-thumb  mb_30">
                                                    <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product2.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product2-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                        <div class="button-group text-center">
                                                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                        </div>
                                                    </div>
                                                    <div class="caption product-detail text-center">
                                                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                        <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
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
                        <!-- =====  PRODUCT TAB  END ===== -->
                    </div>
                </div>
                <div class="row">
                    <div class="cms_banner">
                        <div class="col-xs-12 mt_60">
                            <div id="subbanner4" class="sub-hover">
                                <div class="sub-img"><a href="#"><img src="webroot/images/sub5.jpg" alt="Sub Banner5" class="img-responsive"></a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 mtb_10">
                        <!-- =====  PRODUCT TAB  ===== -->
                        <div class="mt_60">
                            <div class="heading-part mb_10 ">
                                <h2 class="main_title">Deals of the Week</h2>
                            </div>
                            <div class="latest_pro box">
                                <div class="latest owl-carousel">
                                    <div class="product-grid">
                                        <div class="item">
                                            <div class="product-thumb">
                                                <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product2.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product2-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                    <div class="button-group text-center">
                                                        <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                        <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                        <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                        <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                    </div>
                                                </div>
                                                <div class="caption product-detail text-center">
                                                    <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                    <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                    <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-grid">
                                        <div class="item">
                                            <div class="product-thumb">
                                                <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product4.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product4-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                    <div class="button-group text-center">
                                                        <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                        <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                        <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                        <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                    </div>
                                                </div>
                                                <div class="caption product-detail text-center">
                                                    <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                    <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                    <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-grid">
                                        <div class="item">
                                            <div class="product-thumb">
                                                <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product6.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product6-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                    <div class="button-group text-center">
                                                        <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                        <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                        <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                        <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                    </div>
                                                </div>
                                                <div class="caption product-detail text-center">
                                                    <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                    <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                    <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-grid">
                                        <div class="item">
                                            <div class="product-thumb">
                                                <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product8.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="images/product/product8-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                    <div class="button-group text-center">
                                                        <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                        <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                        <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                        <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                    </div>
                                                </div>
                                                <div class="caption product-detail text-center">
                                                    <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                    <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                    <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-grid">
                                        <div class="item">
                                            <div class="product-thumb">
                                                <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product10.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product10-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                    <div class="button-group text-center">
                                                        <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                        <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                        <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                        <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                    </div>
                                                </div>
                                                <div class="caption product-detail text-center">
                                                    <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                    <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
                                                    <span class="price"><span class="amount"><span class="currencySymbol">$</span>70.00</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-grid">
                                        <div class="item">
                                            <div class="product-thumb">
                                                <div class="image product-imageblock"> <a href="product_detail_page.html"> <img data-name="product_image" src="webroot/images/product/product2.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="webroot/images/product/product2-1.jpg" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a>
                                                    <div class="button-group text-center">
                                                        <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                                                        <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                                                        <div class="compare"><a href="#"><span>Compare</span></a></div>
                                                        <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                                                    </div>
                                                </div>
                                                <div class="caption product-detail text-center">
                                                    <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                                                    <h6 data-name="product_name" class="product-name"><a href="#" title="Casual Shirt With Ruffle Hem">New LCDScreen and HD Vide..</a></h6>
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
                    <div class="col-sm-12 mtb_10">
                        <!-- =====  Blog ===== -->
                        <div id="Blog" class="mt_50">
                            <div class="heading-part mb_10 ">
                                <h2 class="main_title">Latest News</h2>
                            </div>
                            <div class="blog-contain box">
                                <div class="blog owl-carousel ">
                                    <div class="item">
                                        <div class="box-holder">
                                            <div class="thumb post-img"><a href="#"> <img src="webroot/images/blog/blog_img_01.jpg" alt="themini"> </a>
                                                <div class="date-time text-center">
                                                    <div class="day"> 11</div>
                                                    <div class="month">Aug</div>
                                                </div>
                                                <div class="post-image-hover"> </div>
                                                <div class="post-info">
                                                    <h6 class="mb_10 text-uppercase"> <a href="single_blog.html">Fashions fade, style is eternal</a> </h6>
                                                    <p>Aliquam egestas pellentesque est. Etiam a orci Nulla id enim feugiat ligula ullamcorper scelerisque. Morbi eu luctus nisl.</p>
                                                    <div class="view-blog">
                                                        <div class="write-comment pull-left"> <a href="single_blog.html"> 0 Comments</a> </div>
                                                        <div class="read-more pull-right"> <a href="single_blog.html"> <i class="fa fa-link"></i> read more</a> </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="box-holder">
                                            <div class="thumb post-img"><a href="#"> <img src="webroot/images/blog/blog_img_02.jpg" alt="themini"> </a>
                                                <div class="date-time text-center">
                                                    <div class="day"> 11</div>
                                                    <div class="month">Aug</div>
                                                </div>
                                                <div class="post-image-hover"> </div>
                                                <div class="post-info">
                                                    <h6 class="mb_10 text-uppercase"> <a href="single_blog.html">Fashions fade, style is eternal</a> </h6>
                                                    <p>Aliquam egestas pellentesque est. Etiam a orci Nulla id enim feugiat ligula ullamcorper scelerisque. Morbi eu luctus nisl.</p>
                                                    <div class="view-blog">
                                                        <div class="write-comment pull-left"> <a href="single_blog.html"> 0 Comments</a> </div>
                                                        <div class="read-more pull-right"> <a href="single_blog.html"> <i class="fa fa-link"></i> read more</a> </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="box-holder">
                                            <div class="thumb post-img"><a href="#"> <img src="webroot/images/blog/blog_img_03.jpg" alt="themini"> </a>
                                                <div class="date-time text-center">
                                                    <div class="day"> 11</div>
                                                    <div class="month">Aug</div>
                                                </div>
                                                <div class="post-image-hover"> </div>
                                                <div class="post-info">
                                                    <h6 class="mb_10 text-uppercase"> <a href="single_blog.html">Fashions fade, style is eternal</a> </h6>
                                                    <p>Aliquam egestas pellentesque est. Etiam a orci Nulla id enim feugiat ligula ullamcorper scelerisque. Morbi eu luctus nisl.</p>
                                                    <div class="view-blog">
                                                        <div class="write-comment pull-left"> <a href="single_blog.html"> 0 Comments</a> </div>
                                                        <div class="read-more pull-right"> <a href="single_blog.html"> <i class="fa fa-link"></i> read more</a> </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="box-holder">
                                            <div class="thumb post-img"><a href="#"> <img src="images/blog/blog_img_04.jpg" alt="themini"> </a>
                                                <div class="date-time text-center">
                                                    <div class="day"> 11</div>
                                                    <div class="month">Aug</div>
                                                </div>
                                                <div class="post-image-hover"> </div>
                                                <div class="post-info">
                                                    <h6 class="mb_10 text-uppercase"> <a href="single_blog.html">Fashions fade, style is eternal</a> </h6>
                                                    <p>Aliquam egestas pellentesque est. Etiam a orci Nulla id enim feugiat ligula ullamcorper scelerisque. Morbi eu luctus nisl.</p>
                                                    <div class="view-blog">
                                                        <div class="write-comment pull-left"> <a href="single_blog.html"> 0 Comments</a> </div>
                                                        <div class="read-more pull-right"> <a href="single_blog.html"> <i class="fa fa-link"></i> read more</a> </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- =====  Blog end ===== -->
                        </div>
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
    </body>

</html>