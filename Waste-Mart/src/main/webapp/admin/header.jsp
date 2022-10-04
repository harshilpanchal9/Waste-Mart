<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Waste Mart </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <!-- Place favicon.ico in the root directory -->
        <link rel="icon" href="../favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" type="text/css" href="css/app.css">
</head>
<body>
		<header class="header">
            <div class="header-block header-block-collapse d-lg-none d-xl-none">
                <button class="collapse-btn" id="sidebar-collapse-btn">
                    <i class="fa fa-bars"></i>
                </button>
            </div>
            <div class="header-block header-block-search">  
                <div class="input-container">
                    <i class="fa fa-search"></i>                                
                    <input id="searchfile" type="search" style="max-width:100%" placeholder="Search" onclick="searchPages()">
                    <div class="underline"></div>
                </div>
            </div>
            <div class="header-block header-block-nav">
                <ul class="nav-profile">                            
                    <li class="profile">
                        <a class="nav-link" href="#">                                    
                            <span class="name" style="cursor:default;"> Administrator </span>
                        </a>                        
                    </li>
                </ul>
            </div>
        </header>   
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>  
        <script>
        	//$("#searchfile"). prop('onclick',null);
        	<%@ include file="js/search.js" %>
        </script>   
</body>
</html>