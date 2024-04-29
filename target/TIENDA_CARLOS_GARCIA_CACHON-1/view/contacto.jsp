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
            <div class="col-md-4 col-xs-12 contact">
              <div class="location mb_50">
                <h5 class="capitalize mb_20"><strong>Our Location</strong></h5>
                <div class="address">Office address
                  <br> 124,Lorem Ipsum has been
                  <br> text ever since the 1500</div>
                <div class="call mt_10"><i class="fa fa-phone" aria-hidden="true"></i>+91-9987-654-321</div>
              </div>
              <div class="Career mb_50">
                <h5 class="capitalize mb_20"><strong>Careers</strong></h5>
                <div class="address">dummy text ever since the 1500s, simply dummy text of the typesetting industry. </div>
                <div class="email mt_10"><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:careers@yourdomain.com" target="_top">careers@yourdomain.com</a></div>
              </div>
              <div class="Hello mb_50">
                <h5 class="capitalize mb_20"><strong>Say Hello</strong></h5>
                <div class="address">simply dummy text of the printing and typesetting industry.</div>
                <div class="email mt_10"><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:info@yourdomailname.com" target="_top">info@yourdomailname.com</a></div>
              </div>
            </div>
            <div class="col-md-8 col-xs-12 contact-form mb_50">
              <!-- Contact FORM -->
              <div id="contact_form">
                <form id="contact_body" method="post" action="contact_me.php">
                  <!--                                <label class="full-with-form" ><span>Name</span></label>
-->
                  <input class="full-with-form " type="text" name="name" placeholder="Name" data-required="true" />
                  <!--                <label class="full-with-form" ><span>Email Address</span></label>
-->
                  <input class="full-with-form  mt_30" type="email" name="email" placeholder="Email Address" data-required="true" />
                  <!--                <label class="full-with-form" ><span>Phone Number</span></label>
-->
                  <input class="full-with-form  mt_30" type="text" name="phone1" placeholder="Phone Number" maxlength="15" data-required="true" />
                  <!--                <label class="full-with-form" ><span>Subject</span></label>
-->
                  <input class="full-with-form  mt_30" type="text" name="subject" placeholder="Subject" data-required="true">
                  <!--                                <label class="full-with-form" ><span>Attachment</span></label>
-->
                  <!--                                <label class="full-with-form" ><span>Message</span></label>
-->
                  <textarea class="full-with-form  mt_30" name="message" placeholder="Message" data-required="true"></textarea>
                  <button class="btn mt_30" type="submit">Send Message</button>
                </form>
                <div id="contact_results"></div>
              </div>
              <!-- END Contact FORM -->
            </div>
          </div>
          <!-- map  -->
          <div class="row">
            <div class="col-xs-12 map mb_80">
              <div id="map"></div>
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