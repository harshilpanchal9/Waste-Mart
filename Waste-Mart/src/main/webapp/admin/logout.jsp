<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin | Logout </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <!-- Place favicon.ico in the root directory -->
        <link rel="icon" href="../favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" type="text/css" href="css/app.css">                      
</head>
<body>
<%
if(request.getSession(true)!=null)
{
	System.out.println("inside java code");
	session.setAttribute("userid", null);
	System.out.println("userid: "+session.getAttribute("userid"));
	System.out.println("Session: "+request.getSession());
	request.getSession(false);
	session.invalidate();
	session=null;
	System.out.println("Session: "+request.getSession());
	response.sendRedirect("login.jsp");
} 
%>
<script type="text/javascript">
	var element = document.getElementById("logout");
	element.classList.add("active");
	
	history.pushState(null, null, location.href);
	window.onpopstate = function () {
	  history.go(1);
	};
	    
</script>
</body>
</html>