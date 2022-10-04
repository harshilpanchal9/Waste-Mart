<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    Zoner | Billing
  </title>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="css/nucleo-icons.css" rel="stylesheet" />
  <link href="css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="../../../kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="css/material-dashboard2513.css?v=3.0.0" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%
		
		int zonerid=(Integer)session.getAttribute("zonerid");
		String zonename="";
		String areaname="";
		Connection cn=new DBUtil().getConnection();
		String getarea="select * from zoner_signup where zonerid=?";
		PreparedStatement st=cn.prepareStatement(getarea);
		st.setInt(1, zonerid);
		ResultSet rs=st.executeQuery();
		while(rs.next())
		{
			zonename=rs.getString(7);
			areaname=rs.getString(8);
		}
		
%>

<%@include file="dashboard.jsp" %>

 <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
   <div class="container-fluid py-4">
      <div class="row">
        <div class="col-md-7 mt-4">
          <div class="card" style="box-shadow: 0 10px 16px 1px rgb(0 0 0 / 20%), 0 2px 4px -3px rgb(0 0 0 / 6%);">
            <div class="card-header pb-0 px-3">
              <h6 class="mb-0">Work List</h6>
            </div>
            <div class="card-body pt-4 p-3">
              <ul class="list-group">
              <%
              	
              	cn=new DBUtil().getConnection();
              	String str="select * from customer_request where status=? and zonename=? and zonearea=?";
              	st=cn.prepareStatement(str);
              	st.setString(1,"Pending");
              	st.setString(2,zonename);
              	st.setString(3,areaname);
              	rs=st.executeQuery();
              	if(!rs.first())
              	{
              		%>
              		<li class="list-group-item border-0 d-flex bg-gray-100 border-radius-lg" style="font-size:20px;justify-content:center;">
                    	<div class="d-flex flex-column">
                    		<h5 style="margin-bottom:0px; font-size:17px;">Your worklist is empty.</h5>
                    	</div>
                    </li>
                    <%
              	}
              	rs.relative(-1);
              	while(rs.next())
              	{
              		String pickupDate=rs.getString(10);              	
              %>
                <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                  <div class="d-flex flex-column">
               <%
               			String getDetail="select * from customer_signup where customerid=?";
               			PreparedStatement st2=cn.prepareStatement(getDetail);
               			st2.setInt(1, rs.getInt(2));
               			ResultSet rs2=st2.executeQuery();
               			while(rs2.next())
               			{
               				String fullname=rs2.getString(2)+" "+rs2.getString(3);
               %>
                    <h6 class="mb-3 text-sm"><%=fullname%></h6>
                    <span class="mb-2 text-xs">Email Id: <span class="text-dark font-weight-bold ms-sm-2"><%=rs2.getString(5) %></span></span>

                <%
               			}
                %>
                    <span class="mb-2 text-xs">Address: <span class="text-dark font-weight-bold ms-sm-2"><%=rs.getString(3) %></span></span>
                    <span class="mb-2 text-xs">Area: <span class="text-dark ms-sm-2 font-weight-bold"><%=rs.getString(6) %></span></span>
                    <span class="text-xs">Phoneno Number: <span class="text-dark ms-sm-2 font-weight-bold"><%=rs.getString(4) %></span></span>
                  </div>
                  <div class="ms-auto text-end">
                    <a class="btn btn-link text-danger text-gradient px-3 mb-0" href="cart-detail.jsp?custid=<%=rs.getInt(2)%>"><i class="material-icons text-sm me-2">shopping_cart</i>Cart</a>
                  </div>
                </li>
                <%
              	}
              	cn.close();
                %>
              </ul>
            </div>
          </div>
        </div>
  	</div>
    </div>
</main>
	<script>
   		var element = document.getElementById("billing");
		element.classList.add("bg-gradient-primary");
		var element1 = document.getElementById("billing");
   		element1.classList.add("active");
   </script>
</body>
</html>