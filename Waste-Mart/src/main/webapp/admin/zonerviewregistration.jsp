<%@page import="com.util.DBUtil"%>
<%-- <%@page import="com.dao.AdminuserDao"%> --%>
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
        <title> Admin | Zoner </title>
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
				<div class="sidebar-overlay" id="sidebar-overlay"></div>
                <div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
                <div class="mobile-menu-handle"></div>
                <article class="content items-list-page">
                    <div class="title-search-block">
                        <div class="title-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="title"> Zoner <a href="zonerregistration.jsp" class="btn btn-primary btn-sm rounded-s"> Add New Zoner</a>	                                    
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
                                        <input onchange="radioData(this.value)" id="active" class="radio" name="inline-radios" value="active" type="radio">
                                        <span>Active</span>
                                    </label>
                                    <label id="deactive" style="padding-top: 2px;cursor:pointer;padding-right: 20px;">
                                        <input onchange="radioData(this.value)" id="deactive" class="radio" name="inline-radios" value="deactive" type="radio">
                                        <span >Deactive</span>
                                    </label>
                                	<div class="input-group">		                                	
	                                    <input id="searchbar" name="searchbar" style="border-right:0px;" list="category_list"  autocomplete="off" type="text" class="form-control boxed rounded-s" placeholder="Search username here..." onkeyup="showCancel(this.value)">
	                                    <span class="input-group-append boxed" style="background-color:white;border-top: 1px solid #ced4da;border-bottom: 1px solid #ced4da;" onclick="clearSearch()">
	                                   		<span class="input-group-text fa fa-times" id="searchicon" style="cursor:pointer;visibility:hidden;background-color:white;border:none;"></span>
	                               		</span>
	                                    <span class="input-group-btn">
	                                        <button type="button" name="btn" value="searchCustomerUser" class="btn btn-secondary rounded-s" style="padding-bottom: 7.5px;" type="button" onclick="searchUser()">
	                                            <i class="fa fa-search" style="padding-top: 5px;"></i>
	                                        </button>
	                                    </span>                                    
	                                </div>
                                </div>
                            </form>
                        </div>
                    </div>
                     <div class="card items">
                        <ul class="item-list striped">
                            <li class="item item-list-header">
                                <div class="item-row">
                                    <div class="item-col item-col-header fixed item-col-img md">
                                        <div>
                                            <span>Image</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-author" style="padding-right: 0px;flex-grow:2.9">
                                        <div class="no-overflow" style="text-align: center;">
                                            <span>Name</span>
                                        </div>
                                    </div>                                    
                                    <div class="item-col item-col-header item-col-date" style="flex-grow: 2.1;padding-right: 0px;">
                                        <div style="text-align: center;">
                                            <span>Zone Name</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-date" style="flex-grow: 2.1;padding-right: 0px;padding-left:18px;">
                                        <div style="text-align: center;">
                                            <span>Zone Area</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title" style="flex-grow:4.3;padding-right: 0px;padding-left:20px;">
                                        <div style="text-align: center;">
                                            <span>Email</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-sales" style="flex-grow: 2.2;padding-right: 0px;padding-left:16px;">
                                        <div style="text-align: center;">
                                            <span>Phone No</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-category" style="padding-right: 7px;flex-grow: 2.2;padding-left:5px">
                                        <div class="no-overflow" style="text-align: center;">
                                            <span>Registration Time</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-date" style="flex-grow: 2.1;">
                                        <div style="text-align: center;">
                                            <span>Password</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-date" style="flex-grow: 1.6;">
                                        <div style="text-align: center;">
                                            <span>Status</span>
                                        </div>
                                    </div>                                    
                                    <div class="item-col item-col-header fixed item-col-actions-dropdown">
                                    </div>
                                </div>
                   
                            </li>                           	
                               
                             <li class="item" id="userdata"></li>	<!-- Print the Zone Data -->
                                                       
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
        	
        	 var element = document.getElementById("users");
       	  	 element.classList.add("active");
       	  	 var element1 = document.getElementById("users");
    	  	 element1.classList.add("open");
       	  	 var element2 = document.getElementById("zoner");
    	  	 element2.classList.add("active");
        	
    	  	<!-- Searchbar code -->
  		  
		  	 function showCancel(input){
		  		 if(input == ""){
		  			document.getElementById("searchicon").style.visibility = "hidden";
		  		 }else{
		  			document.getElementById("searchicon").style.visibility = "visible"; 
		  		 }    	  		 
		  	 }
		  	 function clearSearch(){
		  		document.getElementById("searchbar").value="";
		  		document.getElementById("searchicon").style.visibility = "hidden";
		  	 }
		  	 <!-------------------->
    	  	 
 	   	<!-- Submit Active Radio button call servlet -->
	   	    window.onload = function(){	   	    		   	    	
	   	    	var queryString = location.search;
	   	    	let params = new URLSearchParams(queryString);
	   	    	var id = params.get("status");
	   	    	var all = params.get("all");
	   	    	if(id==null){
	   	    		radioData();
	   	    	}else{	   	    		
	   	    		let url = window.location.toString();
	   	    		if(all!="null"){	   	    			
	   	    			radioData();	   	    			
	   	    			if(id=="Active"){		   	    				
	   	    				window.history.pushState('', '', url.replace('/zonerviewregistration.jsp?status=Active&all=All', '/zonerviewregistration.jsp'));   	    			
		   	    		}
		   	    		else if(id=="Deactive"){		   	    			
		   	    			window.history.pushState('', '', url.replace('/zonerviewregistration.jsp?status=Deactive&all=All', '/zonerviewregistration.jsp'));		   	    			
		   	    		}
	   	    		}else
	   	    		{	   	    			
	   	    			radioData(id);
	   	    			if(id=="Active"){	   	    			
		   	    			window.history.pushState('', '', url.replace('/zonerviewregistration.jsp?status=Active&all=null', '/zonerviewregistration.jsp'));		   	    			
		   	    		}
		   	    		else if(id=="Deactive"){		   	    			
		   	    			window.history.pushState('', '', url.replace('/zonerviewregistration.jsp?status=Deactive&all=null', '/zonerviewregistration.jsp'));		   	    			
		   	    		}	
	   	    		}	   	    				   	    	
	   	    	}	   	    	
	   	    }
	   	 	var search = "";			
			function searchUser(){		   		
		   	 	var searchinput = document.getElementById("searchbar").value;
		   	 	search = searchinput;
		   	 	var radio = document.getElementsByName("inline-radios");
		   	 	for(i = 0; i < radio.length; i++) {
	                if(radio[i].checked)
	                {
	                	radioData(radio[i].value);
	                }
	            }		   	 	
		   	 }
	   	    function radioData(temp){	 	   	    	
	   	    	if(temp==null){
	   	    		document.getElementById('all').checked = true;
	   	    		temp='all';	   	    		
	   	    	}
	   	    	if(temp=="All"){
	   	    		document.getElementById('all').checked = true;
	   	    	}
	   	    	if(temp=="Deactive"){	   	    			   	    			   	    	
	   	    		$("input[value='deactive']").prop("checked", true);	   	    		
	   	    	}
	   	    	if(temp=="Active"){	   	    			   	    		
	   	    		document.getElementById('active').checked = true;
	   	    	}	   	    	
	   	    	$.ajax({
					url : "AjaxZoner.jsp",
					method : "POST",
					data : {						
						radio : temp,
						search : search
					},
					success : function(data) {
						$('#userdata').html(data);
					}
				}); 
	   	    }
	   	    
	   	 <!-- Check Box -->   
	  	 const id=[];
	  	 var MainCB;
	  	 function SelectAll(cb){	  		 	  		
	  		if ($('input[value=deactive]:checked').length > 0) {
	  			document.getElementById("discard").disabled = true;
	  			document.getElementById("discard").style.cursor = "not-allowed";
	  		}else{
	  			document.getElementById("discard").disabled = false;
	  		}	  		
	  		var discardbtn = document.getElementById("discard");
	  		var singlecb = document.getElementsByName('company_id');
	  		console.log(singlecb);
	  		if(cb.checked){
	  			while(id.length){
	  				id.pop();
	  			}	  			
 	  		 	for(var i = 0;i<singlecb.length;i++){
 	  		 		var a = parseInt(singlecb[i].value);
 	  				id.push(a);
 	  		 	}
 	  			discardbtn.style.display = 'inline-block';
	  		 }    
	  		 else
	  			 {
		  			while(id.length){
		  				id.pop();
		  			}
		  			discardbtn.style.display = 'none';
	  			 }
	  		 $('body input[type="checkbox"]').prop('checked',cb.checked);    
	  		 console.log(id);
	  	 }    	  	 
	  	 
	  	 function removeitem(ids){
	  		if($('input[value=deactive]:checked').length > 0) {
	  			document.getElementById("discard").disabled = true;
	  			document.getElementById("discard").style.cursor = "not-allowed";
	  		}else{
	  			document.getElementById("discard").disabled = false;
	  		}
	  		 var counter = document.getElementById("count").value;		  		 
	  		 var item = document.getElementById("discard");    	  		 
	  		 var index = id.indexOf(ids);
	  		 if(index === -1){
	  			 id.push(ids);
	  		 }
	  		 else{
	  			 var del = id.splice(index,1);    	  			
	  		 }
	  		
	  		 if(id.length > 0){
	  			 item.style.display = 'inline-block';
	  		 }    	  		 
	  		 else{
	  			item.style.display = 'none';
	  		 }
	  		 
	  		 var selectall = document.getElementById("selectAll");			  		 
	  		 if(id.length==counter){
	  			 console.log("Inside if");
	  			 selectall.checked = true;
	  		 }else{
	  			 console.log("inside Else");
	  			 selectall.checked = false;
	  		 }      	  		 
	  	 }		  	 
	  	 function deleteitems(){        	  		 
  	  		 for(var i = 0; i < id.length; i++){
  	  			 var temp = "<input type=\"hidden\" name=\"checkboxid\" value=\"" + id[i] + "\"</input>";    	  			    	  			
  	  			 $("#checkboxcatid").append(temp);
  	  		 }
	  	 } 
	  	 <!-- Checkbox code completed -->
	   	   
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>