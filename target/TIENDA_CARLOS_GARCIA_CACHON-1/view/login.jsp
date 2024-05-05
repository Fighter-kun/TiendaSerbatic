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
            <!-- =====  CONTAINER START  ===== -->
            <div class="container mt_30">
                <div class="row ">
                    <%@ include file="components/leftBanner.jsp" %>
                    <div class="col-sm-8 col-lg-9 mtb_20">
                        <!-- contact  -->
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <div class="panel-login panel">
                                    <div class="panel-heading">
                                        <div class="row mb_20">
                                            <div class="col-xs-6">
                                                <a href="#" class="active" id="login-form-link">Login</a>
                                            </div>
                                            <div class="col-xs-6">
                                                <a href="#" id="register-form-link">Register</a>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <form id="login-form" action="LoginServlet" method="post">
                                                    <div class="form-group">
                                                        <input type="text" name="email" id="email" tabindex="1" class="form-control" placeholder="Email" value="">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="password" name="clave" id="clave" tabindex="2" class="form-control" placeholder="Password">
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-sm-6 col-sm-offset-3">
                                                                <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-sm-6 col-sm-offset-3">
                                                                <%
                                                                    String errorMessage = (String) request.getAttribute("error");
                                                                    if (errorMessage != null) {
                                                                %>
                                                                <p style="color: red;"><%=errorMessage%></p>
                                                                <%
                                                                    }
                                                                %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <form id="register-form" action="RegistroServlet" method="post">
												    <div class="form-group">
												        <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="<%= request.getAttribute("emailError") != null ? request.getAttribute("emailError") : "Email Address" %>" value="<%= request.getAttribute("emailValue") != null ? request.getAttribute("emailValue") : "" %>" >
												    </div>
												    <div class="form-group">
												        <input type="password" name="password" id="password2" tabindex="2" class="form-control" placeholder="<%= request.getAttribute("passwordError") != null ? request.getAttribute("passwordError") : "Password" %>" >
												    </div>
												    <div class="form-group">
												        <input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="<%= request.getAttribute("confirmPasswordError") != null ? request.getAttribute("confirmPasswordError") : "Confirm Password" %>" >
												    </div>
												    <div class="form-group">
												        <div class="row">
												            <div class="col-sm-6 col-sm-offset-3">
												                <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
												            </div>
												        </div>
												    </div>
												</form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Blog  -->
        <!-- End Blog   -->
        <!-- =====  CONTAINER END  ===== -->
        <!-- =====  FOOTER START  ===== -->
        <%@ include file="components/footer.jsp" %>
        <!-- =====  FOOTER END  ===== -->
        <a id="scrollup"></a>
        <script src="webroot/js/jQuery_v3.1.1.min.js"></script>
        <script src="webroot/js/owl.carousel.min.js"></script>
        <script src="webroot/js/bootstrap.min.js"></script>
        <script src="webroot/js/jquery.magnific-popup.js"></script>
        <script src="webroot/js/custom.js"></script>
	</body>
</html>