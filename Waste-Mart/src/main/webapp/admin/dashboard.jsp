<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin | Dashboard </title>
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
			<%@include file="header.jsp" %>
			<!-- Sidebar -->
			<%@include file="sidebar.jsp" %>
			<!-- Content -->  
			<%@include file="dashboard-content.jsp" %>          
			<!-- Footer -->        
			<%@include file="footer.jsp" %>                               

            </div>
        </div>
        
        <!-- Reference block for JS -->
        <!-- Color of Chart and Map -->
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>
        
        <script>
        	  var element = document.getElementById("dashboard");
        	  element.classList.add("active");
        
           /*  (function(i, s, o, g, r, a, m)
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
            })(window, document, 'script', 'js/analytics.js', 'ga');
            ga('create', 'UA-80463319-4', 'auto');
            ga('send', 'pageview'); */
            <%@include file="js/search.js"%>
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>    
</body>
</html>