<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Company Request-Status</title>
<link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
<style>
.container {
  
  margin-left: auto;
  margin-right: auto;
  
  
  padding-top:100px;;
}

h2 {
  font-size: 26px;
  margin: 20px 0;
  text-align: center;
}
h2 small {
  font-size: 0.5em;
}

.responsive-table li {
  border-radius: 3px;
  padding: 25px 30px;
  display: flex;
  justify-content: space-between;
  margin-bottom: 25px;
}
.responsive-table .table-header {
  background-color: #228B22;
  color:#ffffff;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 0.03em;
}
.responsive-table .table-row {
  background-color: #ffffff;
  box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
}
.responsive-table .col-1 {
  flex-basis: 10%;
}
.responsive-table .col-2 {
  flex-basis: 50%;
}
.responsive-table .col-3 {
  flex-basis: 25%;
}
.responsive-table .col-4 {
  flex-basis: 25%;
}
@media all and (max-width: 767px) {
  .responsive-table .table-header {
    display: none;
  }
  .responsive-table li {
    display: block;
  }
  .responsive-table .col {
    flex-basis: 100%;
  }
  .responsive-table .col {
    display: flex;
    padding: 10px 0;
  }
  .responsive-table .col:before {
    color: #6C7A89;
    padding-right: 10px;
    content: attr(data-label);
    flex-basis: 50%;
    text-align: right;
  }
}
</style>
</head>
<body>
<%@include file="company-header.jsp" %>
<!-- inner banner -->
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Request Status</h3>
                <li><a href="company-homepage.jsp">Customer <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li>Request Status</li>
            </ul>
        </div>
    </div>
</section>

<div class="container">
  
  <ul class="responsive-table">
    <li class="table-header">
      <div class="col col-3">Request Id</div>
      <div class="col col-3">Customer Id</div>
      <div class="col col-2" style="text-align:center;">Address</div>
      <div class="col col-4">Phoneno</div>
      <div class="col col-3">Zonename</div>
      <div class="col col-3">Zonearea</div>
      <div class="col col-3">Quantity</div>
      <div class="col col-3">Total</div>
      <div class="col col-3">PickupDate</div>
      <div class="col col-3">PaymentMode</div>
      <div class="col col-3">Status</div>
    </li>
    <%
	    Connection cn=new DBUtil().getConnection();
    	String qry="select * from company_request where companyid=?";
    	PreparedStatement st=cn.prepareStatement(qry);
    	st.setInt(1,(Integer)session.getAttribute("companyid"));
    	ResultSet rs=st.executeQuery();
    	while(rs.next())
    	{
    %>
    <li class="table-row">
      <div class="col col-3" data-label="Job Id"><%=rs.getInt(1) %></div>
      <div class="col col-3" data-label="Customer Name"><%=rs.getInt(2) %></div>
      <div class="col col-2" data-label="Amount"><%=rs.getString(3) %></div>
      <div class="col col-4" data-label="Payment Status"><%=rs.getString(4) %></div>
      <div class="col col-3" data-label="Job Id"><%=rs.getString(5) %></div>
      <div class="col col-3" data-label="Customer Name"><%=rs.getString(6) %></div>
      <div class="col col-3" data-label="Amount"><%=rs.getString(7) %></div>
      <div class="col col-3" data-label="Payment Status"><%=rs.getString(8) %></div>
      <div class="col col-3" data-label="Payment Status"><%=rs.getString(9) %></div>
      <div class="col col-3" data-label="Payment Status"><%=rs.getString(10) %></div>
      <div class="col col-3" data-label="Payment Status"><%=rs.getString(12) %></div>
      </li>
    <%
    	}
    	cn.close();
    %>
  </ul>
</div>
</body>
</html>