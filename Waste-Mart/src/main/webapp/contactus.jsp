<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Waste - Mart | ContactUs</title>
<link rel="stylesheet" href="assets/css/style-freedom.css">
</head>
<body>
<!-- inner banner -->
<!-- header -->
<header>
	<%@include file="header2.jsp" %> 
    </header>
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Contact Us</h3>
                <li><a href="index.jsp">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Contact</li>
            </ul>
        </div>
    </div>
</section>
<!-- contacts -->
<section class="w3l-contacts-9-main">
    <div class="contacts-9">
        <div class="wrapper">
                <div class="top-map">
                <div class="cont-details" style="background-color:#228b22;">
                        <h5 style="font-color:#ffffff;">Address</h5>
                    
                        <address>
                            <p style="color:#ffffff;">2nd floor,Gujrat Bhavan</p>
                            <p style="color:#ffffff;">Opp MJ Library,Ellisbridge</p>
                            <p style="color:#ffffff;">Ahmedabad, Gujrat-380006</p>
                        </address>
                        <p style="color:#ffffff;">Email: <a style="color:#ffffff;" href="mailto:wastemart3@gmail.com">wastemart3@gmail.com</a></p>
                        <p style="color:#ffffff;">Tel: <a style="color:#ffffff;" href="tel:+1-800-999-800"> +91 7990454543</a></p>
                    </div>
          
                    <div class="map-content-9">
                        <h5 style="color:#ffffff;">Send Your Request and we will get in touch with you as soon as possible</h5>
                    <form action="ContactUsController" method="post">
                            <div class="twice-two">
                                <input type="text" name="name" id="w3lName"  placeholder="Name" required>
                                <input type="email" name="email" id="email" placeholder="Email" required>
                            </div>
                            <textarea type="text" id="w3lMessage" name="message" placeholder="Message" required></textarea>
                            <button class="btn" name="btn" style="background:#228B22; color:#ffffff;" value="contact" type="submit">Send</button>
                        </form>
                    </div>
            </div>
        </div>
    </div>
</section>
<!-- //contacts -->
  <%@include file="footer.jsp" %>


</body>
</html>