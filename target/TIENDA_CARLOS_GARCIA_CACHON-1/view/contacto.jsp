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
  <link rel="shortcut icon" href="webroot/images/favicon.png">
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
            <div class="col-md-4 col-xs-12 contact">
              <div class="location mb_50">
                <h5 class="capitalize mb_20"><strong>Our Location</strong></h5>
                <ul>
                    <li>Cronos Luxe,</li>
                    <li>C. Cortinas San Miguel, 10, 49003 Zamora</li>
                </ul>
              </div>
            </div>
            <div class="col-md-8 col-xs-12 contact-form mb_50">
              <!-- Contact FORM -->
              <div id="contact_form">
                <form method="post" action="ContactoServlet">
                    <input class="full-with-form" type="text" name="name" placeholder="Nombre" data-required="true" required value="${nombre}" />
                    <input class="full-with-form mt_30" type="email" name="email" placeholder="Correo" data-required="true" required value="${email}" />
                    <input class="full-with-form mt_30" type="text" name="number" placeholder="Numero" maxlength="15" data-required="true" required value="${numero}" />
                    <input class="full-with-form mt_30" type="text" name="subject" placeholder="Asunto" data-required="true" required>
                    <textarea class="full-with-form mt_30" name="message" data-required="true" required></textarea>
                    <button class="btn mt_30" type="submit">Enviar</button>
                </form>
                  <div id="contact_results">
                      <% String mensajeConfirmacion = (String) request.getAttribute("mensajeConfirmacion"); %>
                        <% if (mensajeConfirmacion != null) { %>
                            <p><%= mensajeConfirmacion %></p>
                        <% } %>
                  </div>
              </div>
              <!-- END Contact FORM -->
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
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAT3mI0RI16q19Oxv93gSxN0cF0wfxWN6w">
  </script>
  <script src="webroot/js/map.js"></script>
  <script src="webroot/js/mail.js"></script>
</body>

</html>