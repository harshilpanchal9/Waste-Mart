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
        <title> Admin | Zone </title>
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
                            <h3 class="title">Edit Zone  <span class="sparkline bar" data-type="bar"></span>
                            <a href="zone.jsp"><i class="fa fa-times" style="position: absolute;right: 3%;"></i></a>                                   
                            </h3>                         
                        </div>                                                
                    </div>
                    <!-- Zone Form -->
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-6">
                                <div class="card card-block sameheight-item" style="margin-bottom:15px;">
                                    <%
                                    	int zoneid = Integer.parseInt(request.getParameter("zoneid"));
                                      	Connection cn = new DBUtil().getConnection();
                                      	String qry = "select * from zone where zoneid=?";
                                      	PreparedStatement st = cn.prepareStatement(qry);
                                      	st.setInt(1, zoneid);
                                      	ResultSet rs = st.executeQuery();                                      	
                                      	while(rs.next()){
                                      		%>
			                                    <form role="form" action="../ZoneController" onsubmit="return submitNameValidation()" method="post">                                    
				                                        <div class="form-group has-error">	                                        	                                        
				                                            <label>Zone name</label>
				                                           	<div class="form-inline">	
				                                           		<input type="hidden" name="zoneid" value="<%=rs.getInt(1)%>">                                           	
				                                           		<input type="text" id="zonename" name="zonename" style="width:76%;flex-grow:0.8;" class="form-control" placeholder="Enter zone name" value="<%=rs.getString(2)%>" onkeyup="nameValidation()">	                                           		
				                                           		<button type="submit" name="btn" value="updatezone" class="btn btn-primary" style="margin-left:15px;flex-grow:1;margin-bottom:0px;">Update</button>                                            		                                           	
				                                           	</div>
				                                           	<span class="has-error" id="zonenameerror" style="visibility:hidden"></span>	                                           		                                           	                                            
				                                        </div>                                        
			                                    </form>
                                    		<%
                                      	  }	  
                                      	cn.close();
                                      %>
                                </div>
                            </div>                            
                        </div>
                    </section>
                    <!--------------->                                
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
        	
        	var element = document.getElementById("zone");
      	  	element.classList.add("active");
        	
      	  	  <!-- Submit button validation -->
	      	  function submitNameValidation(){
		 			var name = document.getElementById("zonename").value; 
		 			
		 			if(name.length == 0){
		 				document.getElementById("zonenameerror").innerHTML="Zone name can not be a empty.";
		  				document.getElementById("zonenameerror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				
		  				return false;
		 			}
		 			
		 			<!-- Item name -->
		 			var regEx = /^[a-zA-Z\s]*$/;
		 			var temp=regEx.test(name);
		 			if(name.length == 0){
		 				document.getElementById("zonenameerror").innerHTML="Zone name can not be a empty.";
		  				document.getElementById("zonenameerror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				
		  				return false;
		 			}
		 			else{
			 			if(temp!=false)
			 			{
			 				document.getElementById("zonenameerror").innerHTML="";
		 	  				document.getElementById("zonenameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  					 	  				
			 			}
			 			else
			 			{
			 				document.getElementById("zonenameerror").innerHTML="Zone name must be in a characters.";
		 	  				document.getElementById("zonenameerror").style.visibility="visible";
		 	  				document.getElementById("zonenameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  						 	  						 	  				
		 	  				return false;
			 			}
		 			}
	      	  }
      	  	
	      	<!-- onkeyup validation -->
  	 		function nameValidation()
  	 		{
  	 		    var name=document.getElementById("zonename").value;  	
  	 		    var regEx = /^[a-zA-Z\s]*$/;
  	 			var temp=regEx.test(name);  	 			 
  	 			if(temp)
  	 			{
  	 				document.getElementById("zonenameerror").innerHTML="";
  	 	  			document.getElementById("zonenameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 	
  	 			}
  	 			else
  	 			{
  	 				document.getElementById("zonenameerror").innerHTML="Zone name must be in a characters.";
  	 	  			document.getElementById("zonenameerror").style.visibility="visible";
  	 	  			document.getElementById("zonenameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  				
  	 			}
  	 		}
	      	
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>