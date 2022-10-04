<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Waste-Mart | Subcategory</title>
  <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
  <link rel="stylesheet" href="assets/css/style-freedom.css">

</head>
<style>
.addtocart_btn{
cursor: pointer;
    background:#228B22;;
    font-size: 16px;
    color: #ffffff;
    border: 1px solid var(--btn-color);
    font-weight: 600;
    outline: none;
    border-radius: 0px;
    padding: 6px 12px;
    display: inline-block;
    margin-top: 10px;
    border-radius: 0.25rem;
}
</style>
<body>

<%@include file="customer-header.jsp" %>
<!-- inner banner -->
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Ecommerce Single</h3>
                <li><a href="index-2.html">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Ecommerce Single</li>
            </ul>
        </div>
    </div>
</section>
<!-- //covers -->

<!-- w3l-features-photo-7 -->
 <section class="w3l-features-photo-7">
	<div class="w3l-features-photo-7_sur">
		<div class="wrapper">
			<div class="w3l-features-photo-7_top">
					<div class="w3l-features-photo-7_top-right">
							<div class="galleryContainer">
							<%
									Connection cn2=new DBUtil().getConnection();
									String catname="";
									int imgid=Integer.parseInt(request.getParameter("catid"));
									String imgqry="select * from category where catid=?";
									PreparedStatement st2=cn2.prepareStatement(imgqry);
									st2.setInt(1, imgid);
									ResultSet rs2=st2.executeQuery();
									while(rs2.next())
									{
										 catname=rs2.getString(2);
										
											
							
							%> 
								<div class="gallery">
									<input type="radio" name="controls" id="c1" checked><img class="galleryImage" id="i1" src="category/<%=rs2.getString(3) %>" class="img-responsive" alt="">
									<input type="radio" name="controls" id="c2"><img class="galleryImage" id="i2" src="assets/images/e2.jpg" class="img-responsive" alt="">
									<input type="radio" name="controls" id="c3"><img class="galleryImage" id="i3" src="assets/images/e3.jpg" class="img-responsive" alt="">
									<input type="radio" name="controls" id="c4"><img class="galleryImage" id="i4" src="assets/images/e4.jpg" class="img-responsive" alt="">
								</div>
								
								
							<%
							
									}
									cn2.close();
							%>
							</div>
						</div>
				<div class="w3l-features-photo-7_top-left">
					
					<h1 style="font-size:40px;text-align:center;"><%=catname %></h1>
								
					<div class="color-quality-right">
					 </div>
					 <br>
					 <div class="buttons">
						<a href="category.jsp" style="margin-left:270px;background:#228B22;font-size: 16px;color: #ffffff;border:none;" class="actionbg1">Back to Category</a>
						
					</div>
					</div>
				
			</div>
		</div>
	</div>
</section>
<!-- //w3l-features-photo-7 -->

<!-- products -->

<section class="w3l-products-17 w3l-products-1">
	<div class="products17">
		<div class="wrapper">
			<div class="products17-content">
		
		
		<%
		
			
			int catid=Integer.parseInt(request.getParameter("catid"));
		
			Connection cn=new DBUtil().getConnection();
			String qry="select * from customer_subcategory where catid=?";
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, catid);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
			
			
		%>
				
				<div class="column pro">
				<form action="CustomerRegistrationController" method="post" enctype="multipart/form-data">
					<a href="#"><img  src="subcategory/<%=rs.getString(5) %>" class="img-responsive" alt="" /></a>
					<h4><a href="#"><%=rs.getString(3) %></a></h4>
					
					<p>&#x20B9;&nbsp;<%=rs.getString(4) %>.00</p>
					<input type="hidden" name="customerid" value="<%=session.getAttribute("customerid") %>"/>
					<input type="hidden" name="subcatid" value="<%=rs.getString(1) %>" />
					<input type="hidden" name="subcatname" value="<%=rs.getString(3) %>" />
					<input type="hidden" name="price" value="<%=rs.getString(4) %>" />
					<input type="hidden" name="catimage" value="<%=rs.getString(5) %>" /> 
					<input type="hidden" name="catid" value="<%=catid %>" /> 
					<input type="submit" name="btn" class="addtocart_btn" value="Add to Cart"><a  class="addbtn"></a>
					
	
					</form>
				</div>
				
			
			
			<%
			
			}
		
			cn.close();
			
			%>
			</div>
		</div>
	</div>
</section>
</body>
</html>