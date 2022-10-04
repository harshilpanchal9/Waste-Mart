<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Waste-Mart</title>
  <link rel="icon" href="waste-mart.ico" type="image/x-icon">
  <link rel="stylesheet" href="assets/css/style-freedom.css">
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
</head>
<style>

li:after{
	display:block;
  	content: '';
  	border-bottom: solid 3px green;  
  	transform: scaleX(0);  
  	transition: transform 350ms ease-in-out
}
li:hover:after{
	 transform: scaleX(1);
}

</style>
<body>


<!-- header -->
<div class="w3l-headers-9">
    <header>
        <div class="wrapper">
            <div class="header">             
                <div>
                    <h1>
						<a class="logo" href="index.jsp">
							<img src="category/Waste-Mart-Logo.png" alt="Your logo" title="Your logo" style="height:70px; width:100px; margin-left:10px;" />
						</a> 
                    </h1>
                </div>
                <div class="bottom-menu-content" style="margin:auto;">
                    <input type="checkbox" id="nav" />
                    <label for="nav" class="menu-bar"></label>
                    <nav>
                        <ul class="menu">
                            <li><a href="home.jsp" style="color:#228B22;" class="link-nav">Home</a></li>
                            <li><a href="about.jsp" style="color:#228B22;" class="link-nav">About</a></li>
                            <li>
                                <a href="blog.jsp" style="color:#228B22;" class="link-nav dropdown-toggle">Blog </a>
                            </li>
                            <li><a href="contactus.jsp" style="color:#228B22;" class="link-nav">Contact Us</a></li>
                           
                            <li>
                                <label for="drop-3" style="color:#228B22;" class="toggle toogle-2">Login <span class="fa fa-caret-down"
                                        aria-hidden="true"></span></label>
                                <a href="#blog" class="link-nav dropdown-toggle" style="color:#228B22;">Login <span class="fa fa-caret-down"
                                        aria-hidden="true"></span></a>
                                <input type="checkbox" id="drop-3" />
                                <ul>
                                    <li><a href="customer-login.jsp" style="color:#228B22;">Customer</a></li>
                                    <li><a href="company-login.jsp" style="color:#228B22;">Company</a></li>
                                    <li><a href="zoner-login.jsp" style="color:#228B22;">Zoner</a></li>
                                </ul>
                            </li>
                            
                             <li>
                                <label for="drop-3" class="toggle toogle-2" style="color:#228B22;">Sign Up <span class="fa fa-caret-down"
                                        aria-hidden="true"></span></label>
                                <a href="#blog" class="link-nav dropdown-toggle" style="color:#228B22;">Sign Up <span class="fa fa-caret-down"
                                        aria-hidden="true"></span></a>
                                <input type="checkbox" id="drop-3" />
                                <ul>
                                    <li><a href="customer-registration.jsp" style="color:#228B22;">Customer</a></li>
                                    <li><a href="company-registration.jsp" style="color:#228B22;">Company</a></li>
                                  
                                </ul>
                            </li>
                            
                           
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- //header -->
</div>
<!-- covers -->

</body>
</html>