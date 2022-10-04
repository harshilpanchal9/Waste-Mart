<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Waste - Mart | Feedback</title>
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
                <h3>Feedback Form</h3>
                <li><a href="index-2.html">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Feedback</li>
            </ul>
        </div>
    </div>
</section>
<!-- contacts -->
<section class="w3l-contacts-9-main">
    <div class="contacts-9">
        <div class="wrapper">
                <div class="map-content-9">
                        <h5>We would love to here your thoughts,suggestions,concerns or problems with anything so we can improve !</h5>
                    <form action="ContactUsController" method="post">
                            <div class="twice-two">
                                <input type="text" name="name" id="w3lName"  placeholder="Name" required>
                                <input type="email" name="email" id="email" placeholder="Email" required>
                                <input type="text" name="subject" id="w3lName"  placeholder="Subject.." required>
                               
                            </div>
                            <div>
                            <textarea type="text" id="w3lMessage" name="description" placeholder="Description..." required></textarea>
                            </div>
                            <button class="btn" name="btn" value="feedback" type="submit">Send</button>
                        </form>
                    </div>
            </div>
        </div>
    
</section>
<!-- //contacts -->
  <%@include file="footer.jsp" %>


</body>
</html>