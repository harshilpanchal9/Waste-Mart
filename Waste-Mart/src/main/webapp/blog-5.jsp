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
                            <img src="Blog-images/slide5.jpg" class="img-responsive" style="width:1200px; height:400px;">
                            <h4 class="text-head-w3l-text-9"> The Chain of Recycling; Brief history
                             </h4>
                           <p class="sub-para" style="font-family: Georgia,serif; color: #000000">Waste management is a massive industry in India, still, it is the most unorganized sector.
							<br>New consumerism heaped atop rapid urbanization and population growth has left municipalities with overarching concerns regarding waste management.
							<br>Recycling has become a multi-billion industry worldwide.</p>  <p class="sub-para">This is part of a larger target set out by HH Sheikh Mohammed in his launch of the Dubai Clean Energy Strategy 2050. It was announced that Dubai would aim to obtain 7% of its energy from clean sources by 2022, 25% by 2030, and 75% by 2050.</p>
                                
                             <p class="sub-para" style="font-family: Georgia,serif; font-size: 2.2rem; line-height: 1.6em;">Current State of Collection</p>
<p class="sub-para" style="font-family: Georgia,serif; color: #000000">In the west, people recycle because of their awareness and concern of world declining global health, but in developing countries, waste management is still very difficult.
<br><br>Most of the waste generated at households goes into dump yards and landfills instead of recycling. People are aware of the generic recyclables like newspapers, iron, bottles etc., but there is much more stuff that can be recycled but is thrown because of lack of knowledge.

<br><br>In India, there are rag pickers who roam around nearby big garbage bins and collect the recyclables that they know of - like soft drink cans and bottles, plastic waste, etc. They then sell it to local vendors who have godowns to store it. There are also ‘feriwalas’ or street runners who run around in streets shouting for ‘kabaadi’ (scrap) and buy scrap from households at local rate. They again sell it to larger vendors at a little higher rate. From there it goes to large recycling plants.</p>

                               <p class="sub-para" style="font-family: Georgia,serif; font-size: 2.2rem; line-height: 1.6em;">A Brief History of Recycling</p>
 <p class="sub-para" style="font-family: Georgia,serif; color: #000000">The virtue of recycling has been appreciated for centuries. For thousands of years, metal items have been recycled by melting and reforming them into newer weapons or tools.
<br><br>It is said that the broken pieces of the Colossus of Rhodes, a statue deemed one of the seven wonders of the ancient world, were recycled from scrap.

<br><br>During the industrial revolution, recyclers began to form businesses and later, trade associations, dealing in the collection, trade, and processing of metals and paper. In the 1930s many people survived the Great Depression by peddling scraps of metal, rags, and other items. In those days reuse and recycling were often economic necessities. Recycling also played an important role during the second world war, when scrap metal was recycled into weapons.

<br><br>As industrial societies began to produce ever-growing quantities of garbage, recycling took on a new meaning. Rather than recycling materials for purely economic reasons, communities began to think about how to reduce the waste flow to landfills and incinerators. Around 1970 the environmental movement sparked the creation of America's first kerbside collection schemes, though it was another 20 years before such programs really took off.</p>
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