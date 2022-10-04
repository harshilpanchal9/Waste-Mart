<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Waste-Mart | About Us</title>
<link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
</head>
<body>
<%@include file="customer-header.jsp" %>
<!-- about us -->
<!-- inner banner -->
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-image: url('assets/images/slider1.png');background-size:auto;">
        <div class="wrapper" >
            
            <ul class="breadcrumbs-custom-path">
                <h3>About</h3>
                <li><a href="customer-homepage.jsp">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">About</li>
            </ul>
        </div>
    </div>
</section>
<!-- //covers -->
<!-- content-with-photo4 block -->
<section class="w3l-content-with-photo-4">
    <div id="content-with-photo4-block">
        <div class="wrapper">
            <div class="cwp4-two">
                <div class="cwp4-text">
                    <h4>About Us</h4>
                    <p> A technology driven company working on SaaS (Software as a Service) based model for the technology platform to make Smart Waste Management system. Our platform helps to find and map assets that streamline the collection of post-consumer waste, schedule efficient & cost-effective pickups and incorporates them into Recycling/vendor network.
                    </p>
                    
                </div>
                <div class="cwp4-image">
                    <img src="services/about.jpg" class="img-responsive" alt="" />
                </div>
            </div>
        </div>
    </div>
</section>
<section class="w3l-content-with-photo-4">
    <div id="content-with-photo4-block">
        <div class="wrapper">
            <div class="cwp4-two">
                <div class="cwp4-text">
                
                    <h4>Innovative Organisation</h4>        
				    <p>This System is an Innovative organisation providing the facility for people to sell their waste online and user get paid for it. We provide the easiest way to people to sell your waste/scrap at their doorstep for offices, institutions, households and schools to dispose of their waste and further supply this waste to authorized recycling centres, ensuring safety and sustainability.</p>
               		<h4>Key Motto</h4>
               		<p>We are providing a platform for our customer to book an order by the call as well as from our website. We have verified agents who arrive at customer doorstep as per the scheduled time. Our agents will be armed with eco-friendly carry bags and an electronic weighing machine to give the customer exact weight as transparency is our key motto.</p>
                	<h4>Solving loopholes</h4>
                	<p>This system enters into online Scrap market to organize the process related to Buy & Sell of waste from the customers online. As there are many loopholes in the existing scrap/kabaad system. We made a wider impact in our flourishing waste management industry by forming our own team and collaborating with all the vendors to form a profitable chain management with a hassle-free online pick up pre-arrangement for our customers through a dedicated website & a vendor purposed mobility solution to crack down nerve free communication between customers and vendors where we have our dedicated team to monitor all the web process for a smooth functioning.</p>
               		<h4>Our Concern</h4>
               		<p>Our dedicated teamwork on the request and deliver the best service and solution for the request. Buying product online is easy, getting rid of them when it becomes useless/redundant/old is not. We provide the service for the same. We buy old products junk material. We clean house, apartment, city & world. Our concern is to take care of people concern i.e. Clean India Digital India.</p>
                </div>
             </div>
        </div>
    </div>
</section>
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
                            <button class="btn" name="btn" style="background:#228B22; color:#ffffff;" value="feedback" type="submit">Send</button>
                        </form>
                    </div>
            </div>
        </div>
    
</section>
<%@ include file="footer.jsp" %>

</body>
</html>