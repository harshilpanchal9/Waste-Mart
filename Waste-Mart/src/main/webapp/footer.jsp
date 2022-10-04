<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Footer</title>
<script src ="http:/fonts.googleapis.com/css?family=Open+Sans:400,700"></script> 
</head>
<body>
<section class="_w3l-footer-22">
	<!-- w3l-footer-22 -->
	<div class="footer">
		<div class="wrapper">
			<div class="text-txt">
				<div class="left-side">
					<h3><a href="index.jsp" style="color:#6d8c0d;">Waste - Mart </a></h3>
					<p> We create possiblities for the connected world.</p>

					<div class="subscride-link">
						<h4>Subscribe </h4>
						<form action="FooterController" class="subscribe-footer-19"  method="post">
							<input type="email" name="subscribe_email" placeholder="Your email..." >
							<button class="btn" name="btn" value="footer" style="background-color:#6d8c0d;"><span class="fa fa-paper-plane" ></span> </button>
						</form>
					</div>

				</div>
				

				<div class="right-side">
					
					<h4>  Aim of system is we are trying to help people to make their life easier by 
providing online Waste-Mart system</h4>
				 <div id="content-with-photo4-block">
        <div class="wrapper">
            <div class="cwp4-two">
                <div class="cwp4-text">
               
					 <div class="sub-columns">
						<div class="sub-one-left">
							
							<h4>Visit</h4>
							
					 <p> <i class="fa fa-lg fa-map-marker" style="color:#ffffff;"></i>   2nd Floor, Gujarat Bhavan, Opp MJ Library, Ellisbridge, Ashram Road,
						Ahmedabad, Gujarat 380006.</p> 
								
						
						</div>
						<div class="sub-two-right">
							
							<p><i class="fa fa-lg fa-phone" style="color:#ffffff;"></i>   PHONE +91 8663550120</p>
							
							<a href="mailto:wastemart3@gmail.com"><p><i class="fa fa-lg fa-envelope" style="color:#ffffff;"></i>  wastemart3@gmail.com</p></a>
					</div>
					</div>
				</div>
				
			</div>
			</div>
			</div>
			<div class="below-section">
				<div class="columns">
					<ul class="jst-link">
						<li><a href="privacy&policy.jsp">Privacy policy </a> </li>
						<li><a href="terms&condition.jsp">Term of service</a></li>
						
					</ul>
				</div>
				<div class="columns">
					<ul class="social">
						<li><a href="https://www.facebook.com/getting_started/"><span class="fa fa-facebook fot" style="color:#6d8c0d;"></span></a></li>
						<li><a href="https://twitter.com/home/"><span class="fa fa-twitter fot" style="color:#6d8c0d;"></span></a></li>
						<li><a href="https://www.instagram.com/"><span class="fa fa-instagram fot" style="color:#6d8c0d;"></span></a></li>
							</ul>
				</div> -->
				<div class="columns copy-right">
					<p>@2022 All Rights Reserved.</p>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	<!-- //titels-5 -->
	<!-- move top -->
    <button onclick="topFunction()" id="movetop" title="Go to top">
		<span class="fa fa-angle-up"></span>
		   </button>
		   <script>
			   // When the user scrolls down 20px from the top of the document, show the button
			   window.onscroll = function () {
				   scrollFunction()
			   };
		
			   function scrollFunction() {
				   if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
					   document.getElementById("movetop").style.display = "block";
				   } else {
					   document.getElementById("movetop").style.display = "none";
				   }
			   }
		
			   // When the user clicks on the button, scroll to the top of the document
			   function topFunction() {
				   document.body.scrollTop = 0;
				   document.documentElement.scrollTop = 0;
			   }
		   </script>
		   <!-- /move top -->
</section>
</body>

</html>