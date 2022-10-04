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
  <title>Waste-Mart | Category</title>
  <link rel="stylesheet" href="assets/css/style-freedom.css">
<link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
</head>
<body>
<%@include file="customer-header.jsp" %>
<!-- inner banner -->
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Ecommerce</h3>
                <li><a href="index-2.html">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Ecommerce</li>
            </ul>
        </div>
    </div>
</section>
<!-- //covers -->

<section class="w3l-products-1">
	<div class="products1">
		<div class="wrapper">
			<div class="products1-content">
			<%
				Connection cn=new DBUtil().getConnection();
				String qry="select * from category";
				PreparedStatement st=cn.prepareStatement(qry);
				ResultSet rs=st.executeQuery();
				while(rs.next())
				{
			%>
			<div class="column">
						<a href="ecommerce-single.html"><img src="category/<%=rs.getString(3) %>" class="img-responsive" alt="" width="200" height="200" /></a>
					<h4><a href="ecommerce-single.html"><%=rs.getString(2) %></a></h4>
					<!-- <p>$30.00</p> -->
					
						<a href="customer-subcategory.jsp?catid=<%=rs.getInt(1) %>" style="background:#228B22; color:#ffffff;" class="btn ecom_bt">Choose Items</a>
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