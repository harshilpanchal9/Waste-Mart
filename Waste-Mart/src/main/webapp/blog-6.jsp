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
                            <img src="Blog-images/slide6.jpg" class="img-responsive">
                            <h4 class="text-head-w3l-text-9">Who Is Included in "Sensitive Groups"?	
                             </h4>
                           <p class="sub-para" style="font-family: Georgia,serif; color: #000000">Breathing polluted air is not healthy for anyone, but for some individuals including children, seniors, adults who are active outdoors (such as manual laborers), and people with heart disease, lung disease (such as asthma, emphysema, and bronchitis), or diabetes doing so can be especially harmful.
                            </p>
                                <p class="sub-para" style="font-family: Georgia,serif; color: #000000">People with respiratory illness, for example, may struggle to breathe as deeply as normal, and could experience coughing, wheezing, shortness of breath, and fatigue as a result of particle pollution that triggers inflammation of their airways and lungs.</p>
                                <p class="sub-para" style="font-family: Georgia,serif; color: #000000">Children are at increased risk from air pollution primarily because they spend prolonged periods of time outdoors. What are more, much of this time is spent playing sports or games, meaning children are not only exposed to unhealthy air for longer periods of time than adults, but also at higher rates. (The more strenuous the activity, the more air intake is required, thus the more unhealthy air that is breathed in.) Since kids lungs are still developing, high levels of pollutant exposure can go so far as to cause irreversible damage, including decreased lung-function growth.1 The fact that about 1 in 14 children (7%) have asthma also puts youth at increased risk.</p>
                                
                                <p class="sub-para" style="font-family: Georgia,serif; color: #000000">Older adults (those 65-years-old and up) are not only more susceptible to environmental hazards because they are more likely to have a pre-existing condition, but also because the aging process makes their bodies less resilient to external stressors.</p>
                                <p class="sub-para" style="font-family: Georgia,serif; color: #000000">The link between air pollution and heart disease is more subtle. Extremely small pollution particles known as PM2.5 are the most hazardous to those with cardiovascular disease because they can pass into the bloodstream, irritating blood vessels. This in turn can cause blood vessels to rupture, triggering a heart attack or stroke
                                </p>
                                <p class="sub-para" style="font-family: Georgia,serif; color: #000000">As for the link between air pollution and diabetes, medical studies show that pollutants can impair glucose metabolism and insulin resistance.8 Those who have or are at risk of developing type 2 diabetes should take extra care to limit exposure when the dominant daily AQI pollutant falls under that category.</p>
                                <p class="sub-para" style="font-family: Georgia,serif; color: #000000">Healthy adults who do not identify with any of the above groups but who spend significant amounts of time outdoors are also included in the sensitive groups category, since their routine activities result in higher exposure rates than someone who spends the occasional hour outdoors.</p>
                                 
                              
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
</section>

</body>
</html>