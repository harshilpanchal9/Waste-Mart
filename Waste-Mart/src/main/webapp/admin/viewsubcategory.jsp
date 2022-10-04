<%@page import="com.dao.CategoryDao"%>
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
        <title> Admin | Items </title>
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
                <article class="content items-list-page">
                    <div class="title-search-block">
                        <div class="title-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="title"> Items <a href="subcategory.jsp" class="btn btn-primary btn-sm rounded-s"> Add New Item</a>
	                                    <div class="action dropdown">
                                            <button class="btn  btn-sm rounded-s btn-secondary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> More actions... </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                <a class="dropdown-item" href="#"><i class="fa fa-pencil-square-o icon"></i>Mark as a draft</a>
                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#confirm-modal"><i class="fa fa-close icon"></i>Delete</a>
                                            </div>
                                        </div>
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <div class="items-search">
                            <form class="form-inline">
                                <div class="input-group">
                                    <input type="text" class="form-control boxed rounded-s" placeholder="Search for...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-secondary rounded-s" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="card items">
                        <ul class="item-list striped">
                            <li class="item item-list-header">
                                <div class="item-row">
                                    <div class="item-col fixed item-col-check">
                                        <label class="item-check" id="select-all-items">
                                            <input type="checkbox" class="checkbox">
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="item-col item-col-header fixed item-col-img md">
                                        <div>
                                            <span>Select All</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-author">
                                        <div class="no-overflow" style="text-align: center;">
                                            <span>Category</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title" style="flex-grow: 9">
                                        <div style="text-align: center;">
                                            <span>Item Name</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-author">
                                        <div class="no-overflow" style="text-align: center;">
                                            <span>&nbsp;&nbsp;Stock</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-author">
                                        <div class="no-overflow" style="text-align: center;">
                                            <span>Price</span>
                                        </div>
                                    </div>                                 
                                    <div class="item-col item-col-header item-col-author">
                                        <div class="no-overflow" style="text-align: center;">
                                            <span>Sales</span>
                                        </div>
                                    </div>                                    
                                    <div class="item-col item-col-header fixed item-col-actions-dropdown">
                                    </div>
                                </div>
                            </li>
                            <%
                               	Connection cn=new DBUtil().getConnection();
                                String qry="select * from subcategory";
                                PreparedStatement st=cn.prepareStatement(qry);
                                ResultSet rs=st.executeQuery();
                                while(rs.next())
                                {
                            %> 
                            <li class="item item-list-header">
                                <div class="item-row">                                	                                        
                                    <div class="item-col fixed item-col-check">
                                        <label class="item-check" id="select-all-items">
                                            <input type="checkbox" class="checkbox">
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="item-col fixed item-col-img md">
                                        <a href="item-editor.html">
                                            <div class="item-img rounded" style="background-image: url(../../s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg)"></div>
                                        </a>
                                    </div>
                                    
                                    <div class="item-col item-col-category no-overflow">
                                        <div class="item-heading">Category</div>
                                        <div style="text-align: center;">
                                               <%= new CategoryDao().getCategoryName(rs.getInt(2)) %>
                                        </div>
                                    </div>
                                    <!-- <div class="item-col item-col-header item-col-title"> -->
                                    <div class="item-col fixed pull-left item-col-title" style="flex-grow: 7;margin-right: -111px;">
                                        <div class="item-heading">Item Name</div>
                                        <div style="position: relative;text-align: center;width: 264px;left: 35px;">                                           
                                                <%= rs.getString(3) %>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-sales">
                                        <div class="item-heading">Stock</div>
                                        <div name="itemsales"style="position: relative;left: 69px;text-align: center;"> 
                                        	<%= rs.getString(6) %>
                                        </div>
                                    </div>                                    
                                    <div class="item-col item-col-stats">
                                        <div class="item-heading">Item Price</div>
                                        <div class="itemsales"style="position: relative;left: 69px;text-align: center;">
                                            <%= rs.getString(4) %>
                                        </div>
                                    </div>    
                                    <div class="item-col item-col-stats" style="padding-right: 84px">
                                        <div class="item-heading">Item Price</div>
                                        <div class="itemsales"style="position: relative;left: 69px;text-align: center;">
                                            <%-- <%= rs.getString(4) %> --%>
                                        </div>
                                    </div>                                                                     
                                    <div class="item-col fixed item-col-actions-dropdown">
                                        <div class="item-actions-dropdown">
                                            <a class="item-actions-toggle-btn">
                                                <span class="inactive">
                                                    <i class="fa fa-cog"></i>
                                                </span>
                                                <span class="active">
                                                    <i class="fa fa-chevron-circle-right"></i>
                                                </span>
                                            </a>
                                            <div class="item-actions-block">
                                                <ul class="item-actions-list">
                                                    <li>
                                                        <a class="remove" href="../CategoryController?action=deletesubitem&subcatid=<%=rs.getInt(1) %>">
                                                            <i class="fa fa-trash-o "></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a class="edit" href="../CategoryController?action=editsubitem&subcatid=<%=rs.getInt(1) %>">
                                                            <i class="fa fa-pencil"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                            </li>
                            <%  }
                                cn.close();
                            %>                           
                        </ul>
                    </div>                    
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
        	
        	 var element = document.getElementById("item");
       	  	 element.classList.add("active");
       	  	 var element1 = document.getElementById("item");
    	  	 element1.classList.add("open");
       	  	 var element2 = document.getElementById("viewsubcategory");
    	  	 element2.classList.add("active");
        	
            (function(i, s, o, g, r, a, m)
            {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function()
                {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '../../www.google-analytics.com/analytics.js', 'ga');
            ga('create', 'UA-80463319-4', 'auto');
            ga('send', 'pageview');
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>