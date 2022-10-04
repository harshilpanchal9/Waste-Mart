<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Waste-Mart | Homepage</title>
  <link rel="stylesheet" href="assets/css/style-freedom.css">
  <link rel="stylesheet" href="assests/css/font-awesome.min.css">
  <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
  <!-- drop dpwn -->
</head>

<script src='js/jquery.min.js'></script><script src="js/monetization.js" type="text/javascript"></script>
<div id="codefund"><!-- fallback content --></div>
<script src="js/funder.js" async="async"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src='https://www.googletagmanager.com/gtag/js?id=UA-149859901-1'></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-149859901-1');
</script>

<script>
     window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
     ga('create', 'UA-149859901-1', 'demo.w3layouts.com');
     ga('require', 'eventTracker');
     ga('require', 'outboundLinkTracker');
     ga('require', 'urlChangeTracker');
     ga('send', 'pageview');
   </script>
<script  src='js/autotrack.js'></script>


<body>
	<!-- Demo bar start -->
 

	<!-- New toolbar-->
	

<%@include file="customer-header.jsp" %>

<!-- home -->
<section class="w3l-covers-9-main">
    <div class="covers-9">
        <div class="csslider infinity" id="slider1">
            <input type="radio" name="slides" checked="checked" id="slides_1" />
            <input type="radio" name="slides" id="slides_2" />
            <input type="radio" name="slides" id="slides_3" />
            <input type="radio" name="slides" id="slides_4" />
            <ul class="banner_slide_bg">
                <li>
                    <div class="wrapper">
                        <div class="cover-top-center-9">
                            <!-- <div class="w3ls_cover_txt-9">
                                <h6 class="tag-cover-9">Agriculture</h6>
                                <h3 class="title-cover-9">We Grow Best Food</h3>
                                <p class="para-cover-9">Once aute irure dolor in reprehenderit in voluptate velit
                                    esse cillum dolore eu fugiat nulla pariatur consectetur adipiscing elit.</p>
                                <a href="single.html" class="actionbg button-cover-9">Read More</a>
                            </div> -->
                        </div>
                    </div>
                </li>
                <li style="background:url('slider_assets/slide2 (1).jpg') no-repeat center; background-size: 100% 100%;">
                    <div class="wrapper">
                        <div class="cover-top-center-9">
                            <div class="w3ls_cover_txt-9">
                                <h6 class="tag-cover-9"></h6>
                                <h3 class="title-cover-9">Waste - Mart</h3>
                                <p class="para-cover-9">Dont be afraid to give up the good to go for the great.</p>
                               <!--  <a href="#" class="actionbg button-cover-9">Read More</a>  -->
                            </div>
                        </div>
                    </div>
                </li>
                <li style="background:url('slider_assets/slide3 (1).jpg') no-repeat center; background-size: 100% 100%;">
                    <div class="wrapper">
                        <div class="cover-top-center-9">
                             <div class="w3ls_cover_txt-9">
                                <h6 class="tag-cover-9"></h6>
                                <h3 class="title-cover-9">>Waste - Mart</h3>
                                <p class="para-cover-9">Our Executive will Pickup Your Scrape & give you best Price</p>
                                <!--  <a href="#" class="actionbg button-cover-9">Read More</a>  -->
                            </div> 
                        </div>
                    </div>
                </li>
                <li style="background:url('slider_assets/slide4.jpg') no-repeat center; background-size: 100% 100%;">
                    <div class="wrapper">
                        <div class="cover-top-center-9">
                            <div class="w3ls_cover_txt-9">
                                <h6 class="tag-cover-9"></h6>
                                <h3 class="title-cover-9">Waste - Mart</h3>
                                <p class="para-cover-9">Dont be afraid to give up the good to go for the great.</p>
                                <!--  <a href="#" class="actionbg button-cover-9">Read More</a>  -->
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <div class="arrows">
                <label for="slides_1"></label>
                <label for="slides_2"></label>
                <label for="slides_3"></label>
                <label for="slides_4"></label>
            </div>
            <div class="navigation">
                <div>
                    <label for="slides_1"></label>
                    <label for="slides_2"></label>
                    <label for="slides_3"></label>
                    <label for="slides_4"></label>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- //covers -->


 <!-- w3l-features-17 -->
	<section class="w3l-features-17">
			<div class="w3l-features-17_sur">
				   <div class="wrapper">
				     <div class="w3l-features-17-top_sur">
						<div class="w3l-features-17-left_sur">
							<h2>Committed to Sustainability</h2>
							<p>Our world is constantly changing. So we're constantly seeking to find the best ways to extract the most value from waste. It's what drives us every day, as individuals and as a company.</p>	
							<a href="#" class="btn fea_bt" style="background:#228B22; color:#ffffff; border-color:#228B22;">Meet our leadership team</a>	
						</div>
						<div class="w3l-features-17-right_sur">
							<div class="w3l-features-17-right-tp_sur">
									<!-- <span class="fa fa-viadeo"></span> --> <!-- fa fa-viadeo -->
								<img src = "assets/images/inclusion-diversity.svg" style="width:50px; height:50px;">
								<h5><a href="#">Inclusion & Diversity</a></h5>
								<p> We embrace and cultivate respect, trust, open communications and diversity of thought and people.</p>		
							</div>
							<div class="w3l-features-17-right-tp_sur">
								<img src = "assets/images/people.svg" style="width:50px; height:50px;">
								<h5><a href="#">Customers</a></h5>
								<p>We place our customers at the center of what we do and aspire to delight them every day.</p>		
							</div>
							<div class="w3l-features-17-right-tp_sur">
								<img src = "assets/images/environmental.svg" style="width:50px; height:50px;">
								 <h5><a href="#"> Environment</a></h5>
								<p>We are responsible stewards of the environment and champions for sustainability.</p>		
							</div>
							<div class="w3l-features-17-right-tp_sur">
								<img src="assets/images/integrity-scales.svg" style="width:50px; height:50px">
								<h5><a href="#">Success With Integrity</a></h5>
								<p>We place our customers at the center of what we do and aspire to delight them every day.</p>		
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
<!-- /w3l-features-17 -->


<section class="_w3l-cover-3">
    <div class="cover top-bottom">
 <div class="cover-overlay">
 
    <div class="wrapper">
      <div class="middle-section text-center">
       
        <div class="section-width">
          <h2>Leading the Way</h2>
        </div>
        <div class="link-list-menu">
          <p>Our leadership serves with a focus on maximizing resource value while minimizing environmental impact so that both our economy and environment can thrive.</p>
        </div>
        <a href="about.jsp " class="btn" style="background:#228B22; color:#ffffff; border-color:#228B22;">Read More</a>
      </div>
    </div>
  </div>
</div>
</section>

<section class="w3l-content-18">
    <div class="content-main">
        <div class="wrapper">
            <div class="content-info">
                <h3 class="content-title">Circular economy</h3>
                <p class="content-text">The world is moving towards circular economy and it is responsibility of the corporates to increase proportion of recycled material. We will help to collect scrap from your customers so that it can be recycled and reused by you.</p>
            </div>
        </div>
    </div>
</section>


<!-- services 1-->
<section class="w3l-services-2">
	<div class="services2">
		<div class="wrapper">
			
			<div class="services2-content">
				<div class="column">
					
					<a href="#" class="img-responsive"><i class="fa fa-truck"  style="color:#228B22;font-size:140px;margin-left:100px;" ></i></a>
						<div class="service-info">
							<h4><a href="#" style="color:#228B22">Scrap Pickup</a></h4>
							<p>Our team will be available at your door step on the schedule date/time slot for the trash/scrap pickup.</p>
							
						</div>
					
				</div>
				<div class="column">
					
					<a href="#"><i  class="fa fa-balance-scale" style="color:#228B22;font-size:140px;margin-left:100px;"></i></a>
						<div class="service-info">
							<h4><a href="#" style="color:#228B22">WEIGHING</a></h4>
							<p>Our team will further segregate your trash/scrap and weigh it infront of you, as per the rate chart and fix the amount.</p>
							
						</div>
					
				</div>
				<div class="column">
					
					<a href="#"><i  class="fa fa-money" style="color:#228B22;font-size:140px;margin-left:100px;"></i></a>
						<div class="service-info">
							<h4><a href="#" style="color:#228B22">EARN CASH</a></h4>
							<p>On completion of the weighing process the team will pick the scrap/trash and settle the payment by cash/transfer then and there.</p>
							
						</div>
					
				</div>
			
			</div>
		</div>
	</div>
</section>
<!-- //services 1 -->

 <div class="w3l-features-15">
        <!-- features15 block -->
        <section id="features15-block">
            <div class="feaa-overlay">
            <div class="wrapper">
                    <div class="content-info">
                            <h3 class="content-title">WE DON'T JUST MANAGE WASTE WE PROVIDE SOLUTION</h3>
                            <h3 class="content-title">SCRAP DELEAR AND BUYER</h3>
                        </div>
                <div class="d-grid features15-col-3">
                   <div class="feat-lft">
                        <div class="features15-col-text d-grid">
                            <div class="features15-info">
                               <!--  <span class="fa fa-leaf"></span> -->
                               <img src="assets/images/K1.png" width="50" height="50">
                            </div>
                            <div class="features15-para">
                                <h4><a href="#">ON-DEMAND PICKUP OF SCRAP</a></h4>
                                <p>Let us know when and where and we will be there, offering a wide range of services.</p>
                            </div>
                        </div>
                        <div class="features15-col-text d-grid">
                            <div class="features15-info">
                                <!-- <span class="fa fa-heartbeat"></span> -->
                                <img src="assets/images/K2.png" width="40" height="40">
                            </div>
                            <div class="features15-para">
                                    <h4><a href="#">KNOW PRICING BEFORE HAND</a></h4>
                                <p>Nothing better than knowing your profits before hand! We offer you exactly that and nothing less.</p>
                            </div>
                        </div>
                        <div class="features15-col-text d-grid">
                            <div class="features15-info">
                                <!-- <span class="fa fa-pagelines"></span> -->
                                 <img src="assets/images/K3.png" width="40" height="40">
                            </div>
                            <div class="features15-para">
                                    <h4><a href="#">AUTHENTICATED RAGMEN</a></h4>
                                <p>Instill in us your trust and we promise that we will offer the best of professionals to come and cater to you.</p>
                            </div>
                        </div>
                    </div>
                    <div class="feat-mid">
                          <img src="assets/images/center.png" class="img-responsive" alt="">
                     </div>
                     <div class="feat-rgt">
                            <div class="features15-col-text d-grid">
                                <div class="features15-info">
                                   <!--  <span class="fa fa-thumbs-up"></span> -->
                                   <img src="assets/images/K4.png" width="40" height="40">
                                </div>
                                <div class="features15-para">
                                        <h4><a href="#">ACCURATE WEIGHT</a></h4>
                                    <p>Whether it Is metals or newspapers, you can always have our word on being fair.</p>
                                </div>
                            </div>
                            <div class="features15-col-text d-grid">
                                <div class="features15-info">
                                   <!--  <span class="fa fa-heart"></span> -->
                                    <img src="assets/images/K5.png" width="40" height="40">
                                </div>
                                <div class="features15-para">
                                        <h4><a href="#">10AM TO 5AM SUPPORT, 7 DAYS</a></h4>
                                    <p>Constant Support, Constant Services along with the added benefits.</p>
                                </div>
                            </div>
                            <div class="features15-col-text d-grid">
                                    <div class="features15-info">
                                        <!-- <span class="fa fa-gift"></span> -->
                                        <img src="assets/images/K6.png" width="40" height="40">
                                    </div>
                                    <div class="features15-para">
                                            <h4><a href="#">SANITISED PROCESS</a></h4>
                                        <p>We do care about our customers and an integral part of it being not threatening your health. We always ensure that Ragmen are always absolutely safe to be around.</p>
                                    </div>
                                </div>
                    </div> 
                </div>
            </div>
        </div>
        </section>
    </div>
        <!-- features15 block -->
        
    <section class="w3l-content-18">
    <div class="content-main">
        <div class="wrapper">
            <div class="content-info">
                <h3 class="content-title">What our clients says </h3>
                <p class="content-text">Proin vulputate semper odio quam. Nulla commodo gravida porttitor Aenean posuere lacus quis.</p>
            </div>
        </div>
    </div>
</section>

<div class="w3l-customer-2">
	<section class="customer2">
		<div class="wrapper">
			<div class="customer">
				<a href="#"><span class="fa fa-instagram"></span></a>
				<a href="#"><span class="fa fa-dribbble"></span></a>
				<a href="#"><span class="fa fa-github-alt"></span></a>
			</div>
			<div class="customer-text">
				<p>Proin vulputate semper odio quam. Nulla commodo gravida porttitor Aenean posuere lacus quis. Once aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu </p>
			</div>
			<div class="custom">
				<img src="assets/images/te_2.jpg" class="img-responsive" alt=""/>
				<p>Adam Glichrist</p>
			</div>
		</div>
	</section>	
</div>

<%@ include file="footer.jsp" %>

<!--  <section class="w3l-inner-banner-main">
    <div class="about-inner">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>About</h3>
                <li><a href="index-2.html">Customer <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li><a href="customer-homepage.jsp">Home</a></li>
                 <li><a href="customer-resetpassword.jsp">Reset Password<span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li><a href="CustomerRegistrationController?action=update&customerid=">update profile<span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li><a href="CustomerRegistrationController?action=delete&customerid=">Delete record<span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
            	<li><a href="customer-request.jsp">Raise Request</a></li>
            	
            </ul>
        </div>
    </div>
</section>-->
</body>
</html>