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
        <title> ModularAdmin - Free Dashboard Theme | HTML Version </title>
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
            	
            	<!--  content  -->
        <div class="sidebar-overlay" id="sidebar-overlay"></div>
                <div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
                <div class="mobile-menu-handle"></div>
                <article class="content items-list-page">
                    <div class="title-search-block">
                        <div class="title-block">
                            <!-- <div class="row">
                                <div class="col-md-6"> -->
                                    <h3 class="title"> Edit Zoner Information
                                    <a href="zonerviewregistration.jsp"><i class="fa fa-times" style="position: absolute;right: 3%;"></i></a>
                                       <!--  <div class="action dropdown">
                                            <button class="btn  btn-sm rounded-s btn-secondary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> More actions... </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                <a class="dropdown-item" href="#"><i class="fa fa-pencil-square-o icon"></i>Mark as a draft</a>
                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#confirm-modal"><i class="fa fa-close icon"></i>Delete</a>
                                            </div>
                                        </div> -->
                                    </h3>                                    
                                <!-- </div>
                            </div> -->
                        </div>
                     </div>
               <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-6">
                                <div class="card card-block sameheight-item">
                                    <div class="title-block">
                                        <h3 class="title"> Zoner Information </h3>
                                    </div>
                                    
                                    <form method="post" action="../UserZonerController" class="signin-form">
                                    <%
                                    	int zonerid=Integer.parseInt(request.getParameter("zonerid"));
                                    	Connection cn=new DBUtil().getConnection();
                                    	String qry="select * from  zoner_signup where zonerid=?";
                                    	PreparedStatement st=cn.prepareStatement(qry);
                                    	st.setInt(1, zonerid);
                                    	ResultSet rs=st.executeQuery();
                                    	while(rs.next())
                                    	{
                                    %>
                                    <input type="hidden" name="zonerid" value="<%=rs.getInt(1)%>" />
								
                                     	<div class="form-group">
                                            <label for="exampleInputEmail1">First Name</label>
                                            <input type="text" class="form-control" name="firstname" value="<%=rs.getString(2)%>" >                                        
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Last Name</label>
                                            <input type="text" class="form-control" name="lastname" value="<%=rs.getString(3) %>" >                                           
                                        </div>
                                         <div class="form-group">
                                            <label for="exampleInputEmail1">Address</label>
                                            <%-- <input type="textarea" class="form-control" name="address" value="<%=rs.getString(4) %>"> --%>   
                                        	<textarea rows="3" class="form-control boxed" name="address"><%=rs.getString(4) %></textarea>
                                        </div>
                                         <div class="form-group">
                                            <label for="exampleInputEmail1">Phone No</label>
                                            <input type="text" class="form-control" name="phoneno" value="<%=rs.getString(5) %>" >                                           
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input type="email" class="form-control" name="email" value="<%=rs.getString(6)%>">                                            
                                        </div>
                                        <div  class="form-group">
                                        <label for="exampleInput">Zone Name</label>
                                            <input type="text" class="form-control" name="zonename" value="<%=rs.getString(7)%>" >                                            
										</div>                                        
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input type="password" class="form-control" name="password" value="<%=rs.getString(9)%>">
                                        </div>
                                        <%
                                    	}
                                    	cn.close();
                                        %>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary" name="btn" value="update">Update</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
            			</div>
            		</section>            	
            	</article>
            	<!-- Footer -->
            	<%@ include file="footer.jsp" %>
            </div>
        </div>
        
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        	</div>
        	<script>
        	
        	var element = document.getElementById("users");
      	  	element.classList.add("active");
      	  	var element1 = document.getElementById("users");
    	  	element1.classList.add("open");
      	  	var element2 = document.getElementById("zoner");
   	  	 	element2.classList.add("active");
        	
        </script>
       <script src="js/vendor.js"></script>
    	   <script src="js/app.js"></script>
</body>
</html>