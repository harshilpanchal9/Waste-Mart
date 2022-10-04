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
        <title> Admin | View Customer </title>
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
                        <h3 class="title"> View customer details <span class="sparkline bar" data-type="bar"></span>
                        <a href="customer.jsp"><i class="fa fa-times" style="position: absolute;right: 3%;"></i></a>
                        </h3>                  
                    </div>    
                    <%  int custid = Integer.parseInt(request.getParameter("custid")); 
                    	System.out.println("Custid: "+custid);                    
	                    Connection cn = new DBUtil().getConnection();
	                    String qry = "select * from customer_signup where customerid=?";
	                    PreparedStatement st = cn.prepareStatement(qry);
	                    st.setInt(1, custid);
	                    ResultSet rs = st.executeQuery();
	                    while(rs.next()){
						%>              
                        <div class="card card-block" style="width:68%;margin-left:auto;margin-right:auto;">
                        	<div class="form-group row">
                                <div class="col-sm-12" style="display:flex;justify-content: center;">
                                    <div class="images-container">
                                        <div class="image-container" style="border-radius: 50%;">                                            
                                            <div class="image" style="background-image:url('../customer-images/<%=rs.getString(8)%>')"></div>
                                        </div>                                        
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Customer ID</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getInt(1) %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">First name</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(2) %>" style="pointer-events: none;">
                            </div>                            
                            <div class="form-group">
                                <label class="control-label">Last name</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(3) %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Email</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(5) %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Phone number</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(4) %>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Password</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(6) %>" style="pointer-events: none;">
                            </div>
                            <%		String date = rs.getString(7);
                                	String dt[] = date.split("T",2);
                                	String d=dt[0],t=dt[1];                                	
                            %>
                            <div class="form-group">
                                <label class="control-label">Registration date</label>                                
                                <input type="text" class="form-control underlined" value="<%=dt[0]%>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Registration Time</label>                                
                                <input type="text" class="form-control underlined" value="<%=dt[1]%>" style="pointer-events: none;">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Status</label>
                                <input type="text" class="form-control underlined" value="<%=rs.getString(10) %>" style="pointer-events: none;">
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
        	
        	var element = document.getElementById("users");
      	  	element.classList.add("active");
      	  	var element1 = document.getElementById("users");
    	  	element1.classList.add("open");
      	  	var element2 = document.getElementById("customer");
   	  	 	element2.classList.add("active");
        	
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>