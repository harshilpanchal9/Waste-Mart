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
        <title> Admin | Company Cart </title>
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
            	<article class="content items-list-page">
                    <div class="title-search-block">
                        <div class="title-block">
                            <h3 class="title"> Customer cart 
                            <a href="request-company.jsp"><i class="fa fa-times" style="position: absolute;right: 3%;"></i></a>
                			</h3>                                    
                        </div>  
                    </div>
		            <section class="section">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-block">
                                        <div class="card-title-block">
                                            <h3 class="title">Cart Detail</h3>
                                        </div>
                                        <section class="example">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Company ID</th>
                                                            <th>Category</th>
                                                            <th>Price</th>
                                                            <th>Quanity</th>
                                                            <th>Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <%
                                                    	int companyid=Integer.parseInt(request.getParameter("companyid"));
                                                    	Connection cn=new DBUtil().getConnection();
	                                                    String qry = "select * from company_cart_print where companyid=?";
                                                    	PreparedStatement st=cn.prepareStatement(qry);
                                                    	st.setInt(1, companyid);
	                                                	ResultSet rs = st.executeQuery();
	                                                	if(!rs.first()){
	                                                		%>
	                                                			<tr>
                                                            		<td colspan="5" style="text-align:center;">No any cart items.</td>                                                                                                                     
                                                        		</tr>
	                                                		<%
	                                                	}
	                                                	rs.relative(-1);
	                                                	while(rs.next()){
	                                                		%>
	                                                			<tr>
		                                                            <td><%=rs.getInt(2) %></td>
		                                                            <td><%=rs.getString(4) %></td>
		                                                            <td><%=rs.getString(5) %></td>
		                                                            <td><%=rs.getString(6) %></td>
		                                                            <td><%=rs.getString(7) %></td>
		                                                		</tr>		
	                                                		<%
	                                                	}
                                                    %>                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>  
                    </article>
                    </div>
                    </div>
	<script>
        	
        	var element = document.getElementById("request");
      	  	element.classList.add("active");
      	  	var element1 = document.getElementById("request");
    	  	element1.classList.add("open");
      	  	var element2 = document.getElementById("customer_request");
   	  	 	element2.classList.add("active");
	</script>	
</body>
</html>