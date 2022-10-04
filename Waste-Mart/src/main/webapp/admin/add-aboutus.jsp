<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin | Add AboutUs-Information </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <!-- Place favicon.ico in the root directory -->
        <link rel="stylesheet" href="css/vendor.css">
        <!-- Theme initialization -->
        <script>
            var themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
            {};
            var themeName = themeSettings.themeName || '';
            if (themeName)
            {
                document.write('<link rel="stylesheet" id="theme-style" href="css/app-' + themeName + '.css">');
            }
            else
            {
                document.write('<link rel="stylesheet" id="theme-style" href="css/app.css">');
            }            
        </script>    

</head>
<body>
<div class="main-wrapper">
            <div class="app" id="app">
            <!-- Header -->
			<%@include file="header.jsp" %>
			<!-- Sidebar -->
			<%@include file="sidebar.jsp" %>
			


			<!-- Content -->
			<div class="sidebar-overlay" id="sidebar-overlay"></div>
			<div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
			<div class="mobile-menu-handle"></div>
						<article class="content item-editor-page">
                    <div class="title-block">
                        <h3 class="title"> Add AboutUs-Information <span class="sparkline bar" data-type="bar"></span>
                        </h3>
                    </div>
                    <form method="post" action="../CustomerServiceController"  enctype="multipart/form-data">
                        <div class="card card-block">
                 			 <div class="form-group row">
                                <label class="col-sm-2 form-control-label text-xs-right"> Add Title: </label>
                                <div class="col-sm-10">
                                    <input type="text" name="title" class="form-control boxed" placeholder="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 form-control-label text-xs-right">Enter Content:</label>
                                <div class="col-sm-10" >                                	                            
                                   <textarea  name="content" rows="10" cols="100" style="resize:none;"></textarea>                                                        
                                </div>
                            </div>
                            
                           
                     		 <div class="form-group row">
                                <div class="col-sm-10 col-sm-offset-2">
                                    <button type="submit" name="btn" value="addaboutus" class="btn btn-primary"> Add </button>
                                </div>
                            </div>
                        </div>
                    </form>
    <div class="title-block">
                        <h3 class="title"> Delete Customer-Services <span class="sparkline bar" data-type="bar"></span>
                        </h3>
                     </div>
                        <form method="post" action="../CustomerServiceController" name="item">
                        <div class="card card-block">
                        	                            
                            <div class="form-group row">
                                <label class="col-sm-2 form-control-label text-xs-right"> Select Category: </label>
                                <div class="col-sm-10">
                                    <select name="id" class="c-select form-control boxed">
                                       <option selected>Select Title</option>                                     
                                    <%
                                    Connection cn=new DBUtil().getConnection();
                                    String qry="select * from aboutus";
                                    PreparedStatement st=cn.prepareStatement(qry);
                                    ResultSet rs=st.executeQuery();
                                    while(rs.next())
                                    {
                                    %>
                                        <option value="<%= rs.getInt(1)%>"> <%=rs.getString(2) %></option>                                        
                                    <%
                                    }
                                    cn.close();
                                    %>                                        
                                     </select>
                                </div>
                            </div>                            
                            <div class="form-group row">
                                <div class="col-sm-10 col-sm-offset-2">
                                    <button type="submit" name="btn" value="deleteaboutus" class="btn btn-primary"> Delete Title </button>
                                </div>
                            </div>
                        </div>
                    </form>
                
                </article>
 
			</div>
</div>
           <!-- Reference block for JS -->
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>
        
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>   

</body>
</html>