<%@page import="com.dao.UserCustomerDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin | View Company Request </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <!-- Place favicon.ico in the root directory -->
        <link rel="icon" href="../favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" type="text/css" href="css/app.css">
</head>
<body>
		<div class="main-wrapper">
            <div class="app" id="app">
            	<!-- Header -->
            	<%@ include file="header.jsp" %>
            	
            	<!-- Sidebar -->
            	<%@ include file="sidebar.jsp" %>
            	            	
            	<!-- Content -->
            <div class="sidebar-overlay" id="sidebar-overlay"></div>
			<div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
			<div class="mobile-menu-handle"></div>
			<article class="content item-editor-page">
                    <div class="title-block">
                        <h3 class="title"> View company details <span class="sparkline bar" data-type="bar"></span>
                        <a href="request-company.jsp"><i class="fa fa-times" style="position: absolute;right: 3%;"></i></a>
                        </h3>                  
                    </div>    
                    <%  int requestid = Integer.parseInt(request.getParameter("requestid")); 
                    	Connection cn = new DBUtil().getConnection();
	                    String qry = "select * from company_request where requestid=?";
	                    PreparedStatement st = cn.prepareStatement(qry);
	                    st.setInt(1, requestid);
	                    ResultSet rs = st.executeQuery();
	                    while(rs.next()){
						%>              
                        <div class="card card-block" style="width:68%;margin-left:auto;margin-right:auto;">
                            <div class="form-group">
                                <label class="control-label">Request ID</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getInt(1) %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Company ID</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getInt(2) %>" style="pointer-events: none;">
                            </div>         
                            <%
                            	String getDetail="select * from company_signup where companyid=?";
                            	st=cn.prepareStatement(getDetail);
                            	st.setInt(1,rs.getInt(2));
                            	ResultSet rs2=st.executeQuery();
                            	if(rs2.next())
                            	{
                            		String fullname=rs2.getString(2);
                            %>                                               
                            <div class="form-group">
                                <label class="control-label">Company name</label>
                                <input type="text" class="form-control underlined" value="<%=fullname %>" style="pointer-events: none;">
                            </div>  
                            <%
                            	}
                            %>    
                            <div class="form-group">
                                <label class="control-label">Zone name</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(5) %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Zone area</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(6) %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Quantity</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(7) %>" style="pointer-events: none;">
                            </div>                      
                            <div class="form-group">
                                <label class="control-label">Grand total</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(8) %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Payment mode</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(9) %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Pickup date</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(10) %>" style="pointer-events: none;">
                            </div>
                            <%		String date = rs.getString(11);
                                	String dt1[] = date.split("T",2);                                	                                	
                            %>
                            <div class="form-group">
                                <label class="control-label">Request date</label>
                                <input type="text" class="form-control underlined" value="<%=dt1[0]%> <%=dt1[1] %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Address</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(3) %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Phone number</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(4) %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Status</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(12) %>" style="pointer-events: none;">
                            </div>                                                       
                        </div>  
                        <%	                    	
	                    }
	                    cn.close();                                        
                    %>                    
                </article>
            	
            	<!-- Footer -->
            	<%@ include file="footer.jsp" %>
            </div>
        </div>
                
        	<script>
        	
        	var element = document.getElementById("request");
      	  	element.classList.add("active");
      	  	var element1 = document.getElementById("request");
    	  	element1.classList.add("open");
      	  	var element2 = document.getElementById("company_request");
   	  	 	element2.classList.add("active");
        	
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>