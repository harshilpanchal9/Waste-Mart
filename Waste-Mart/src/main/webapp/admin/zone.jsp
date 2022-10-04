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
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="title"> Zoner </h3>                                    
                                </div>                                
                            </div>                            
                        </div>                                                
                    </div>
                    <!-- Zone Form -->
                   <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-6">
                                <div class="card card-block" style="margin-bottom:15px;">
                                    <form role="form" action="../ZoneController" method="post">                                    
	                                        <div class="form-group has-error">	                                        	                                        
	                                            <label>Zone name</label>
	                                           	<div class="form-inline">		                                           	
	                                           		<input type="text" id="zonename" name="zonename" style="width:76%;flex-grow:0.8;" class="form-control" placeholder="Enter zone name" onkeyup="return nameValidation()">	                                           		
	                                           		<button type="submit" name="btn" value="addzone" class="btn btn-primary" onclick="return validateZone()" style="margin-left:15px;flex-grow:1;margin-bottom:0px;">Add</button>                                            		                                           	
	                                           	</div>	  
	                                           	<span class="has-error" id="zonenameerror"style="visibility:hidden"></span>                                         		                                           	                                            
	                                        </div>
                                        <div class="form-group has-error">
                                            <label>Zone area</label>
                                            <div class="form-group has-error">
                                            	<select name="zoneid" class="form-control" id="dropdownid" onchange="selectZone(this)">
	                                                <option selected disabled hidden>Select zone</option>
	                                                <%
	                                                	Connection cn = new DBUtil().getConnection();
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
	                                                		%>
	                                                			<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
	                                                		<%
	                                                	}	                                                	
	                                                %>
                                            	</select>
                                            	<span class="has-error" id="dropdownerror"style="visibility:hidden"></span>
                                        	</div>
                                            <input id="zonearea" type="text" name="zonearea" class="form-control" placeholder="Enter zone area" onkeyup="areaValidation()" disabled>
                                            <span class="has-error" id="zoneareaerror"style="visibility:hidden"></span>
                                        </div>                                        
                                        <div class="form-group">
                                            <button type="submit" name="btn" value="addarea" class="btn btn-primary" onclick="return validateArea()">Submit</button>
                                        </div>                                        
                                    </form>
                                </div>
                            </div>                            
                        </div>
                    </section>
                    <!--------------->
                      
                                 	                        
                <!-- </article>
            	<article class="content responsive-tables-page"> -->
                    
                    <section class="section">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-block">
                                        <div class="card-title-block">
                                            <h3 class="title">Zone Name</h3>
                                        </div>
                                        <section class="example">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Zone ID</th>
                                                            <th>Zone name</th>
                                                            <th style="width:11%;text-align:center;">Edit zone</th>                                                            
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <%
	                                                    qry = "select * from zone";
	                                                	st = cn.prepareStatement(qry);
	                                                	rs = st.executeQuery();
	                                                	if(!rs.first()){
	                                                		%>
	                                                			<tr>
                                                            		<td colspan="3" style="text-align:center;">No any zone yet.</td>                                                                                                                     
                                                        		</tr>
	                                                		<%
	                                                	}
	                                                	rs.relative(-1);
	                                                	while(rs.next()){
	                                                		%>
	                                                			<tr>
		                                                            <td><%=rs.getInt(1) %></td>
		                                                            <td><%=rs.getString(2) %></td>
		                                                            <td style="text-align:center;">
		                                                            	<a href="zoneedit.jsp?zoneid=<%=rs.getInt(1)%>">
	                                                            			<button type="button" class="btn btn-oval btn-primary btn-sm" style="margin-bottom:0px;">Edit</button></a>
	                                                            		&nbsp;	                                                            			                                                            		
                                                            			<button type="button" name="action" value="deletezone" onclick="getZoneId(<%=rs.getInt(1)%>)" class="btn btn-oval btn-danger btn-sm" style="margin-bottom:0px;right:0px;" data-toggle="modal" data-target="#confirm-modal">Delete</button>		                                                            		
		                                                            </td>                                                            
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
                    <section class="section">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-block">
                                        <div class="card-title-block">
                                            <h3 class="title">Zone Area</h3>
                                        </div>
                                        <section class="example">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Zone area ID</th>
                                                            <th>Zone name ID</th>
                                                            <th>Zone area</th>                                                            
                                                            <th style="width:11%;text-align:center;">Edit zone area</th>                                                            
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
	                                                    qry = "select * from zone_area";
	                                                	st = cn.prepareStatement(qry);
	                                                	rs = st.executeQuery();
	                                                	if(!rs.first()){
	                                                		%>
	                                                			<tr>
                                                            		<td colspan="4" style="text-align:center;">No any zone area yet.</td>                                                                                                                     
                                                        		</tr>
	                                                		<%
	                                                	}
	                                                	rs.relative(-1);
	                                                	while(rs.next()){
	                                                		%>
	                                                			<tr>
		                                                            <td><%=rs.getInt(1) %></td>
		                                                            <td><%=rs.getString(2) %></td>
		                                                            <%
		                                                            %>
		                                                            <td><%=rs.getString(3) %></td>	
		                                                            	                                                            		                                                            
		                                                            <td style="text-align:center;">
		                                                            	<a href="zoneareaedit.jsp?zoneareaid=<%=rs.getInt(1)%>">
	                                                            			<button type="button" class="btn btn-oval btn-primary btn-sm" style="margin-bottom:0px;">Edit</button></a>
	                                                            		&nbsp;	                                                            			                                                            		
                                                            			<button type="button" name="action" value="deletezonearea" onclick="getZoneAreaId(<%=rs.getInt(1)%>)" class="btn btn-oval btn-danger btn-sm" style="margin-bottom:0px;right:0px;" data-toggle="modal" data-target="#confirm-modal-area">Delete</button>		                                                            		
		                                                            </td>                                                            
                                                        		</tr>		
	                                                		<%
	                                                	}
	                                                	cn.close();
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
                <!-- Alert Box for deleting Zone -->
				<div class="modal fade" id="confirm-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="margin-left: -1px;border-top-left-radius: 0;border-top-right-radius: 0;">
                                <h4 class="modal-title"><i class="fa fa-warning"></i> Delete</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure want to delete this Zone ?</p>
                            </div>
                            <div class="modal-footer">
                            	<form action="../ZoneController">                            		
                            		<input type="hidden" id="zoneid" name="zoneid">
                                	<button type="submit" name="action" value="deletezone" class="btn btn-primary">Yes</button>                                	
                                </form>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            </div>
                        </div>
                    </div>
                </div>
				<!--------------->
				<!-- Alert Box for deleting Zone Area -->
				<div class="modal fade" id="confirm-modal-area">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="margin-left: -1px;border-top-left-radius: 0;border-top-right-radius: 0;">
                                <h4 class="modal-title"><i class="fa fa-warning"></i> Delete</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure want to delete this Area from the zone ?</p>
                            </div>
                            <div class="modal-footer">
                            	<form action="../ZoneController">                            		
                            		<input type="hidden" id="zoneareaid" name="zoneareaid">
                                	<button type="submit" name="action" value="deletezonearea" class="btn btn-primary">Yes</button>                                	
                                </form>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            </div>
                        </div>
                    </div>
                </div>
				<!--------------->
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
        	
      	  	function selectZone(a){
      	  		var x = a.options[a.selectedIndex].text;
      	  		if(x == "Select zone"){
	      	  		document.getElementById("zonearea").disabled  = true;
	      	  		document.getElementById("dropdownerror").innerHTML="Please select any zone.";
					document.getElementById("dropdownerror").style.visibility="visible";
					document.getElementById("dropdownerror").setAttribute("style","visibility: visible;font-size: 16px;");
      	  		}else{
	      	  		document.getElementById("zonearea").disabled  = false;
	      	  		document.getElementById("dropdownerror").innerHTML="";
	  				document.getElementById("dropdownerror").setAttribute("style","visibility: visible;font-size: 16px;");
      	  		}
      	  	}
      	  	
      	  	<!-- Getting id of current zoneid and assign to alert box -->
      	  	function getZoneId(id){      	  		
      	  		document.getElementById("zoneid").value = id;      	  		
      	  	}
      	  	
      	  <!-- Getting id of current zone area id and assign to alert box -->
    	  	function getZoneAreaId(id){     
    	  		document.getElementById("zoneareaid").value = id;      	  		
    	  	}
      	  	
      	  <!-- Validations -->
      	  <!-- Zonename validation -->
      	  	function validateZone(){
		      	if (document.getElementById("zonename").value.length == 0) {    
		      		document.getElementById("zonenameerror").innerHTML="Zone name can not be a empty.";
 	  				document.getElementById("zonenameerror").style.visibility="visible";
 	  				document.getElementById("zonenameerror").setAttribute("style","visibility: visible;font-size: 16px;");
		            return false;    
		        }   
		      	var zonename = document.getElementById("zonename").value;
      	  		var regEx = /^[a-zA-Z\s]*$/;
	 			var temp=regEx.test(zonename);
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
      	  	function nameValidation(){
      	  		var zonename = document.getElementById("zonename").value;
      	  		var regEx = /^[a-zA-Z\s]*$/;
	 			var temp=regEx.test(zonename);
	      	  	if(zonename.length == 0){
						document.getElementById("zonenameerror").innerHTML="";
		  				document.getElementById("zonenameerror").setAttribute("style","visibility: visible;font-size: 16px;");		  				
				}else{  
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
      	  	}
      	  	<!-- Area validation -->
      	  	function validateArea(){    
      	  		console.log(document.getElementById("zonearea").disabled);
      	  		if(document.getElementById("zonearea").disabled  == true){	
	      	  		document.getElementById("dropdownerror").innerHTML="Please select any zone.";
					document.getElementById("dropdownerror").style.visibility="visible";
					document.getElementById("dropdownerror").setAttribute("style","visibility: visible;font-size: 16px;");
			      	return false;
      	  		}
	      	  	if (document.getElementById("zonearea").value.length == 0) {    
		      		document.getElementById("zoneareaerror").innerHTML="Zone area can not be a empty.";
	  				document.getElementById("zoneareaerror").style.visibility="visible";
	  				document.getElementById("zoneareaerror").setAttribute("style","visibility: visible;font-size: 16px;");
		            return false;    
		        }
	      	    var zonearea = document.getElementById("zonearea").value;
    	  		var regEx = /^[a-zA-Z\s]*$/;
	 			var temp=regEx.test(zonearea);
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
      	    function areaValidation(){
      		 	var zonearea = document.getElementById("zonearea").value;
   	  		 	var regEx = /^[a-zA-Z\s]*$/;
	 			var temp=regEx.test(zonearea);
	      	  	if(zonearea.length == 0){
						document.getElementById("zoneareaerror").innerHTML="";
		  				document.getElementById("zoneareaerror").setAttribute("style","visibility: visible;font-size: 16px;");
				}else{  
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
      	   }
      	  	<!----------------->
            
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>