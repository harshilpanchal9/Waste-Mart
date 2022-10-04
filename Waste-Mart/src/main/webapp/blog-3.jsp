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
                             <img src="Blog-images/slide3.jpg" class="img-responsive" style="width:1200px; height:400px;">
                            <h4 class="text-head-w3l-text-9">Bad Air, Worse City: Air Pollution In Delhi </h4>
                            
                 		 <p class="sub-para" style="font-family: Georgia,serif; color: #000000">Even the Supreme Court can't stop the threesome of Delhi, Diwali and firecrackers, producing the unbelievable air pollution in Delhi.

<br><br>There are some days where you can understand exactly why Indians prefer a strong leader, and are even (hypothetically) <b>cool with military rule.</b> It is because if left on their own, they will break and bribe every rule they can.

<br><br>On November 25, 2016, a three-judge bench read out its judgement regarding a petition filed by three infants (filed through their parents, duh). Just days prior to it, Delhi had gasped through one of its worst Diwalis, air quality-wise. The order was read out;<b> a ban on the sale of firecrackers</b> in Delhi-NCR was issued. Of course, the fireworks factory people appealed against it.

<br><br>An year later, in September, the Court read out its order. This time, the Court had taken into account the workers at the fireworks factories. The resultant order changed its earlier decision; it lifted the ban on licenses already granted, while imposing certain conditions on the sale of crackers. But wait, it was not over yet. For in October 2017, the SC upheld its earlier order, banning sale of crackers in Delhi-NCR, again.

<br><br>Despite that, people came out and burst crackers. Diwali night and the morning the day after were witness to the smoky aftermath of it. Air pollution in Delhi was a reality, again.

<br><br>Crackers have been documented to produce pollution much, much higher than the prescribed limit. A research study calculated pollution levels produced by various crackers, and the results were stunning. And to imagine, we call this force-fed air pollution in Delhi our 'tradition'.

<br><br>It is important to talk about this, because the latest ban provoked a new argument, that of religion. As nonsencical as it may sound, we need to be on guard for it. There are many other types of pollution, and many other issues which are a part of it. We absolutely cannot call killing ourselves a part of 'divine tradition'.
                               </p>
  											 
       
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
					</div>
			</div>
</section>

</body>
</html>