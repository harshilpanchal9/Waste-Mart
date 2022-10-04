<%@page import="com.dao.ZoneDao"%>
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
                            <h3 class="title">Edit Zone area <span class="sparkline bar" data-type="bar"></span>
                            <a href="zone.jsp"><i class="fa fa-times" style="position: absolute;right: 3%;"></i></a>                                   
                            </h3>                         
                        </div>                                                
                    </div>
                    <!-- Zone Form -->
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-6">
                                <div class="card card-block" style="margin-bottom:15px;">
                                    <form role="form" action="../ZoneController" onsubmit="return submitNameValidation()" method="post">
                                        <div class="form-group has-error">
                                            <label>Zone area</label>
                                            <div class="form-group has-error">
                                            	<select name="zoneid" class="form-control" id="dropdownid">	                                                
	                                                <%
	                                                	Connection cn = new DBUtil().getConnection();
	                                                	int zoneareaid = Integer.parseInt(request.getParameter("zoneareaid")); 
	                                                	System.out.println(zoneareaid);
	                                                	String zonename = new ZoneDao().getZoneName(zoneareaid);
	                                                	System.out.println(zonename);
	                                                	int flag = 0;
	                                                	String qry = "select * from zone";
	                                                	PreparedStatement st = cn.prepareStatement(qry);
	                                                	ResultSet rs = st.executeQuery();
	                                                	if(!rs.first()){
	                                                		%>
	                                                			<option disabled>No any zone.</option>
	                                                		<%
	                                                	}
	                                                	rs.relative(-1);
	                                                	while(rs.next()){
	                                                		if(zonename.equalsIgnoreCase(rs.getString(2))){
	                                                			flag=1;
	                                                		}
	                                                		if(flag==1){
	                                                			%>
	                                                				<option selected value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
	                                                	 		<%
	                                                	 		flag=0;
	                                                		}
	                                                		else{
	                                                			%>
	                                                				<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
	                                                			<%
	                                                		}	
	                                                	}
	                                                	cn.close();
	                                                %>		
                                            	</select>                                            	
                                        	</div>
                                        	<%
                                        		Connection cn1 = new DBUtil().getConnection();
                                        		String qry1 = "select * from zone_area where zoneareaid=?";
                                            	PreparedStatement st1 = cn1.prepareStatement(qry1);
                                            	st1.setInt(1,zoneareaid);
                                            	ResultSet rs1 = st1.executeQuery();
                                            	while(rs1.next()){
											%>
                                            	<input id="zonearea" type="text" name="zonearea" class="form-control" value="<%=rs1.getString(3) %>" placeholder="Enter zone area" onkeyup="areaValidation()">
                                            	<span class="has-error" id="zoneareaerror"style="visibility:hidden"></span>
                                            <%
                                          		}
                                   				cn1.close();
                                   			%>
                                        </div>                                        
                                        <div class="form-group">
                                        	<input type = "hidden" name="zoneareaid" value="<%=zoneareaid%>">
                                            <button type="submit" name="btn" value="updatearea" class="btn btn-primary">Update area</button>
                                        </div>                                        
                                    </form>                                   
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
	 			var name = document.getElementById("zonearea").value; 
	 			
	 			if(name.length == 0){
	 				document.getElementById("zoneareaerror").innerHTML="Zone area can not be a empty.";
	  				document.getElementById("zoneareaerror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				
	  				return false;
	 			}
	 			
	 			<!-- Item name -->
	 			var regEx = /^[a-zA-Z\s]*$/;
	 			var temp=regEx.test(name);
	 			if(name.length == 0){
	 				document.getElementById("zoneareaerror").innerHTML="Zone area can not be a empty.";
	  				document.getElementById("zoneareaerror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				
	  				return false;
	 			}
	 			else{
		 			if(temp!=false)
		 			{
		 				document.getElementById("zoneareaerror").innerHTML="";
	 	  				document.getElementById("zoneareaerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  					 	  				
		 			}
		 			else
		 			{
		 				document.getElementById("zoneareaerror").innerHTML="Zone area must be in a characters.";
	 	  				document.getElementById("zoneareaerror").style.visibility="visible";
	 	  				document.getElementById("zoneareaerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  						 	  						 	  				
	 	  				return false;
		 			}
	 			}
      	  }
  	  	
      	<!-- onkeyup validation -->
 		function areaValidation()
 		{
 		    var name=document.getElementById("zonearea").value;  	
 		    var regEx = /^[a-zA-Z\s]*$/;
 			var temp=regEx.test(name);  	 			 
 			if(temp)
 			{
 				document.getElementById("zoneareaerror").innerHTML="";
 	  			document.getElementById("zoneareaerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 	
 			}
 			else
 			{
 				document.getElementById("zoneareaerror").innerHTML="Zone area must be in a characters.";
 	  			document.getElementById("zoneareaerror").style.visibility="visible";
 	  			document.getElementById("zoneareaerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  				
 			}
 		}
      	  
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>