<%@page import="java.util.ArrayList"%>
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
        <title> Admin | Company requests </title>
        <meta name="description" content="">
        <!-- <meta http-equiv="refresh" content="30"> --> <!--  This will reload the page after every given content seconds -->
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
                                    <h3 class="title"> Company Request                                     	
                                     	<div style="display:inline-block;width:40%;padding-left:2%;">
                                            <select class="form-control form-control-sm" onchange="selectzone(this)">
                                                <option selected hidden>Select zone</option>
                                                <option>All</option>
                                                <%
				                                    Connection cn=new DBUtil().getConnection();
				                                    String qry="select * from zone";
				                                    PreparedStatement st=cn.prepareStatement(qry);
				                                    ResultSet rs=st.executeQuery();
				                                    while(rs.next())
				                                    {
				                                %>
				                                        <option> <%=rs.getString(2) %></option>                                        
				                                <%
				                                    }
				                                    cn.close();
				                                %>
                                            </select>
                                        </div>
                                     </h3>                       
                                </div>
                            </div>
                        </div>
                        <div class="items-search">
                           <form class="form-inline">
                                <div class="input-group">                                	
                                	<label style="padding-top: 2px;cursor:pointer;padding-right: 20px;">
                                        <input onchange="radioData(this.value)" id="all" class="radio" name="inline-radios" value="all" type="radio">
                                        <span>All</span>
                                    </label>                                 	
                                	<label style="padding-top: 2px;cursor:pointer;padding-right: 20px;">
                                        <input onchange="radioData(this.value)" id="pending" class="radio" name="inline-radios" value="pending" type="radio">
                                        <span>Pending</span>
                                    </label>
                                    <label id="deactive" style="padding-top: 2px;cursor:pointer;padding-right: 20px;">
                                        <input onchange="radioData(this.value)" id="completed" class="radio" name="inline-radios" value="completed" type="radio">
                                        <span >Completed</span>
                                    </label>
                                </div>
                           </form>
                        </div>
                    </div>
                    <div class="card items">
                        <ul class="item-list striped">
                            <li class="item item-list-header">
                                <div class="item-row">                                   
                                    <div class="item-col item-col-header fixed item-col-img md" style="flex-grow:0.2;padding-right: 5px;">
                                        <div>
                                            <span>Request ID</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title" style="padding-right: 0px;flex-grow:1.2;padding-left:0px;">
                                        <div class="no-overflow" style="text-align: center;">
                                            <span>Company ID</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title" style="padding-right: 0px;flex-grow:1.2">
                                        <div class="no-overflow" style="text-align: center;">
                                            <span>Zone name</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title" style="padding-right: 0px;flex-grow:1.4">
                                        <div class="no-overflow" style="text-align: center;">
                                            <span>Zone area</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title" style="flex-grow:1.4;padding-right: 0px;">
                                        <div style="text-align: center;">
                                            <span>Quantity</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title" style="flex-grow:1.4;padding-right: 0px;">
                                        <div style="text-align: center;">
                                            <span>Payable amount</span>
                                        </div>
                                    </div>
                                     <div class="item-col item-col-header item-col-title" style="flex-grow:1.4;padding-right: 0px;">
                                        <div style="text-align: center;">
                                            <span>Status</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title" style="flex-grow:1.4;padding-right: 0px;">
                                        <div style="text-align: center;">
                                            <span>Payment mode</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title" style="flex-grow:1.4;padding-right: 0px;">
                                        <div style="text-align: center;">
                                            <span>Pickup Time</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title" style="flex-grow:1.2;padding-right: 0px;">
                                        <div style="text-align: center;">
                                            <span>Request date</span>
                                        </div>
                                    </div>                                                                   
                                    <div class="item-col item-col-header fixed item-col-actions-dropdown">
                                    </div>
                                </div>
                            </li>
                            
							<li class="item" id="userdata"></li>	<!-- Print the Company request Data -->
							
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
        	
        	var element = document.getElementById("request");
      	  	element.classList.add("active");
      	  	var element1 = document.getElementById("request");
    	  	element1.classList.add("open");
      	  	var element2 = document.getElementById("company_request");
   	  	 	element2.classList.add("active");
        	
   	  	 	<!-- Delete request of company -->
   	  		function deleteRequest(reqid){   	  			
	   	  		$.ajax({
					url : "AjaxCompanyRequest.jsp",
					method : "POST",
					data : {						
						action : "removerequest",
						requestid : reqid
					},
					success : function(data) {
						location.reload();
					}
				});
   	  		}
   	  	 	
   	  		<!-- Select zone -->
	  		function selectzone(a){
	  			var x = a.options[a.selectedIndex].text;
	   	  		$.ajax({
					url : "AjaxCompanyRequest.jsp",
					method : "POST",
					data : {						
						zonename : x,
						action : "getStatus"
					},
					success : function(data) {
						$('#userdata').html(data);
					}
				}); 
	  		}
	  		
			<!-- For changing the status of request -->
   	  		
	   	  	window.onload = function(){
	   	    	var queryString = location.search;
	   	    	let params = new URLSearchParams(queryString);
	   	    	var id = params.get("status");
	   	    	if(id==null){
	   	    		radioData();	   	    		
	   	    	}else{	   	    		
	   	    		let url = window.location.toString();	   	    			   	    			
   	    			radioData(id);	   	    			
   	    			if(id=="pending"){		   	    				
   	    				window.history.pushState('', '', url.replace('/request-company.jsp?status=pending', '/request-company.jsp'));   	    			
	   	    		}
	   	    		else if(id=="completed"){		   	    			
	   	    			window.history.pushState('', '', url.replace('/request-company.jsp?status=completed', '/request-company.jsp'));		   	    			
	   	    		} 
	   	    		else if(id=="all"){
	   	    			window.history.pushState('', '', url.replace('/request-company.jsp?status=all', '/request-company.jsp'));
	   	    		}
	   	    		else{
	   	    			window.history.pushState('', '', url.replace('/request-company.jsp?status=null', '/request-company.jsp'));
	   	    		}
	   	    	}		   	    	
	   	    }
	   	 	function radioData(tmp){	
	   	    	if(tmp==null || tmp=="null"){
	   	    		document.getElementById('all').checked = true;
	   	    		tmp='all';	   	    		
	   	    	}
	   	    	if(tmp=="all"){
	   	    		document.getElementById('all').checked = true;
	   	    	}
	   	    	if(tmp=="completed"){	   	    			   	    			   	    	
	   	    		$("input[value='completed']").prop("checked", true);	   	    		
	   	    	}
	   	    	if(tmp=="pending"){	   	    			   	    		
	   	    		document.getElementById('pending').checked = true;
	   	    	} 
	   	    	$.ajax({
					url : "AjaxCompanyRequest.jsp",
					method : "POST",
					data : {						
						radio : tmp,
						action : "getStatus"
					},
					success : function(data) {
						$('#userdata').html(data);
					}
				});
	   	    }
	  		
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>