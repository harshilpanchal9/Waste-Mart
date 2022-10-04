<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBUtil"%>
<%@page import="com.dao.CategoryDao"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin | Edit Item </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <!-- Place favicon.ico in the root directory -->
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/admin/css/vendor.css">
        <!-- Theme initialization -->
        <script>
            var themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
            {};
            var themeName = themeSettings.themeName || '';
            if (themeName)
            {
                document.write('<link rel="stylesheet" type="text/css" id="theme-style" href="<%= request.getContextPath() %>/admin/css/app-' + themeName + '.css">');
            }
            else
            {
                document.write('<link rel="stylesheet" type="text/css" id="theme-style" href="<%= request.getContextPath() %>/admin/css/app.css">');
            }                          
        </script>  
</head>
<body>
			<div class="main-wrapper">
            <div class="app" id="app">
            <!-- Header -->
			<%@include file="/admin/header.jsp" %>
			<!-- Sidebar -->
			<!-- In sidebar dropdown is not working -->
			<%@include file="/admin/requested-sidebar.jsp" %>
			<!-- Content -->
			<div class="sidebar-overlay" id="sidebar-overlay"></div>
			<div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
			<div class="mobile-menu-handle"></div>
			<article class="content item-editor-page">
                    <div class="title-block">
                        <h3 class="title"> Edit Item <span class="sparkline bar" data-type="bar"></span>
                        <a href="<%= request.getContextPath() %>/admin/viewsubcategory.jsp"><i class="fa fa-times" style="position: absolute;right: 3%;"></i></a>
                        </h3>                  
                    </div>
                    <form method="post" action="CategoryController" name="item">
                    <input type="hidden" name="catid" value="${model.catid}">
                    <input type="hidden" name="subcatid" value="${model.subcatid}">
                        <div class="card card-block">
                        	                            
                            <div class="form-group row">
                                <label class="col-sm-2 form-control-label text-xs-right"> Select Category: </label>
                                <div class="col-sm-10">
                                    <select name="catid" class="c-select form-control boxed">                                                                                                          
                                   <%
                                    Connection cn=new DBUtil().getConnection();
                                    int catid =Integer.parseInt(request.getAttribute("catid").toString());
                                    String catname = new CategoryDao().getCategoryName(catid);
                                    int flag=0;
                                    String qry="select * from Category";
                                    PreparedStatement st=cn.prepareStatement(qry);
                                    ResultSet rs=st.executeQuery();
                                    while(rs.next())
                                    {
                                    	if(catname.equalsIgnoreCase(rs.getString(2)))
                                    	{
                                    		flag=1;
                                    	}
                                    	if(flag == 1)
                                    	{
                                    		%>                                    	
                                        		<option selected value="<%= rs.getInt(1)%>"> <%=rs.getString(2) %></option>                                        
                                    		<%
                                    		flag=0;
                                    	}
                                    	else
                                    	{
                                    		%>                                    	
                                    			<option value="<%= rs.getInt(1)%>"> <%=rs.getString(2) %></option>                                        
                                			<%
                                    	}
                                    }
                                    cn.close();
                                    %>                                         
                                     </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 form-control-label text-xs-right"> Item Name: </label>
                                <div class="col-sm-10">
                                    <input type="text" name="itemname" class="form-control boxed" placeholder="" value="${model.itemname}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 form-control-label text-xs-right"> Item Price / KG: </label>
                                <div class="col-sm-10" >                                	                            
                                   <input type="text" name="itemprice" class="form-control boxed" placeholder="&#8377" value="${model.itemprice}">                                                         
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label class="col-sm-2 form-control-label text-xs-right"> Item Images: </label>
                                <div class="col-sm-10">
                                    <input type="file" name="itemimage" class="form-control boxed" value="null" value="${model.itemimage}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 form-control-label text-xs-right"> Stock: </label>
                                <div class="col-sm-10" >                                	                            
                                   <input type="text" name="itemstock" value="00" class="form-control boxed" placeholder="Anything (Kilogram,Tones,LBS)" value="${model.itemstock}">                                                         
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <div class="col-sm-10 col-sm-offset-2">
                                    <button type="submit" name="btn" value="UpdateItem" class="btn btn-primary"> Add Item </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </article>
                <!-- Footer -->        
				<%@ include file="/admin/footer.jsp" %>				
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
        <script src="${pageContext.request.contextPath}/js/vendor.js"></script>
        <script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>