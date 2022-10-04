<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Waste-Mart | Blog</title>
<link rel="stylesheet" href="assets/css/style-freedom.css">
<link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
</head>
<body>
<!-- header -->
<header>
	<%@include file="header2.jsp" %> 
    </header>
    <!-- inner banner -->
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Blog </h3>
                <li><a href="home.jsp">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Blog </li>
            </ul>
        </div>
    </div>
</section>
<section class="w3l-text-9">
    <div class="text-element-9">
        <div class="wrapper">
        <div class="d-grid grid-w3l-text-9">
                    <div class="right-w3l-text-9">
                   
                             <img src="Blog-images/slide4.jpg" class="img-responsive" style="width:1200px; height:400px;">
                            <h4 class="text-head-w3l-text-9">Where To Sell Plastic Waste Online?
                             </h4>
                             
                           
                                <p class="sub-para" style="font-family: Georgia,serif; color: #000000">So where can a citizen of India<b> sell plastic waste </b>online? Here is a list of some online service providers which do buy Waste - Mart, right from your home!
                                
                                                            
                                                               <div class="leave-coment-form">
                                                    
                                                    <h6 class="heading-small-w3l-text-9">Leave a Reply</h6>
                                                    <form action="BlogReplyController" method="post">
                                                        <div class="leave-coment">
                                                            <div class="leave-coment-left">
                                                                <input type="text" name="name"  class="form-control" placeholder="Name.." required="">
                                                            </div>
                                                            <div class="leave-coment-right">
                                                                <input type="email" name="email" class="form-control" placeholder="Email.." required>
                                                            </div>
                                                        </div>
                                                        <div class="leave-coment-btm">
                                                            <textarea type="text" name="message" class="" placeholder="Your comment here..." required=""></textarea>
                                                        </div>
                                                        <div class="mm_single_submit">
                                                            <button  name="btn" type="submit" value="Add">Post Comment</button>
                                                        </div>
                                                    </form>
                                                </div>
                                                
                                            </div>
									</div>
				</div>
</section>

</body>
</html>