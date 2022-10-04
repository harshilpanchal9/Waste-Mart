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
        <title> Admin | Company </title>
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
            	
            	<article class="content items-list-page">
                    <div class="title-search-block">
                        <div class="title-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="title"> Company                                    
                                    	<button type="button" id="discard" class="btn btn-pill-right btn-danger-outline" onclick="deleteitems()" style="display:none;" data-toggle="modal" data-target="#confirm-modal">Deactive</button>                                    
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
	                                    <input id="searchbar" name="searchbar" style="border-right:0px;" list="category_list" autocomplete="off" type="text" class="form-control boxed rounded-s" placeholder="Search username here..." onkeyup="showCancel(this.value)">
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
                                    <div class="item-col fixed item-col-check">
                                        <label class="item-check">
                                            <input type="checkbox" id="selectAll" class="checkbox" onchange="SelectAll(this)">
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="item-col item-col-header fixed item-col-img md">
                                        <div>
                                            <span>Image</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-author" style="padding-right: 20px;flex-grow:2.6">
                                        <div class="no-overflow" style="text-align: center;">
                                            <span>Company Name</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title" style="flex-grow:4.3;padding-right: 0px;">
                                        <div style="text-align: center;">
                                            <span>Email</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-sales" style="flex-grow: 2;padding-right: 0px;padding-left:26px">
                                        <div style="text-align: center;">
                                            <span>Contact</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-category" style="padding-right: 7px;flex-grow: 2.2;padding-left:5px">
                                        <div class="no-overflow" style="text-align: center;">
                                            <span>Registration Date</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-category" style="flex-grow: 2;padding-right: 5px;">
                                        <div class="no-overflow"style="text-align: center;">
                                            <span>Last Login Time</span>
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
                             <li class="item" id="userdata"></li>	<!-- Print the company Data -->
                        </ul>
                    </div>            
                    <nav class="text-right">
                        <ul class="pagination">                            
                        </ul>
                    </nav>                           
                </article>
            	
            	<!-- Footer -->
            	<%@ include file="footer.jsp" %>
            	<!-- Alert Box -->            	
				<div class="modal fade" id="confirm-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="margin-left: -1px;border-top-left-radius: 0;border-top-right-radius: 0;">
                                <h4 class="modal-title"><i class="fa fa-warning"></i> Warning</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Do you want to deactive this company profile ?</p>
                            </div>
                            <div class="modal-footer">
                            	<form action="../UserCompanyController">                            		
                            			<span id="checkboxcatid"></span>
                                		<button type="submit" name="btn" value="deactivecompany" class="btn btn-primary">Yes</button>                                	     
                                </form>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            </div>
                        </div>
                    </div>
                </div>
				<!--------------->
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
      	  	var element2 = document.getElementById("company");
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
   	  	 	
	   	  	<!-- pagination variable -->
	   	 	var numberOfRecords;
			var numberOfPagesRequired;
			var maximumRecordsPerPage;
			var currentPage = 1;
			var temp;
			var search = "";
			
			function searchUser(){
		   		currentPage = 1;
		   	 	var searchinput = document.getElementById("searchbar").value;
		   	 	search = searchinput;
		   	 	fetchRecord();
		   	 }
			<!------------------------->
   	  	 	// Submit Active Radio button call servlet
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
	   	    				window.history.pushState('', '', url.replace('/company.jsp?status=Active&all=All', '/company.jsp'));   	    			
		   	    		}
		   	    		else if(id=="Deactive"){		   	    			
		   	    			window.history.pushState('', '', url.replace('/company.jsp?status=Deactive&all=All', '/company.jsp'));		   	    			
		   	    		}
	   	    		}else
	   	    		{	   	    			
	   	    			radioData(id);
	   	    			if(id=="Active"){	   	    			
		   	    			window.history.pushState('', '', url.replace('/company.jsp?status=Active&all=null', '/company.jsp'));		   	    			
		   	    		}
		   	    		else if(id=="Deactive"){		   	    			
		   	    			window.history.pushState('', '', url.replace('/company.jsp?status=Deactive&all=null', '/company.jsp'));		   	    			
		   	    		}	
	   	    		}	   	    				   	    	
	   	    	}		   	    	
	   	    }
	   	    function radioData(tmp){	 
	   	    	currentPage=1;
	   	    	if(tmp==null){
	   	    		document.getElementById('all').checked = true;
	   	    		tmp='all';	   	    		
	   	    	}
	   	    	if(tmp=="All"){
	   	    		document.getElementById('all').checked = true;
	   	    	}
	   	    	if(tmp=="Deactive"){	   	    			   	    			   	    	
	   	    		$("input[value='deactive']").prop("checked", true);
	   	    	}
	   	    	if(tmp=="Active"){	   	    			   	    		
	   	    		document.getElementById('active').checked = true;
	   	    	}	   
	   	    	temp = tmp;
	   	    	fetchRecord();
	   	    }
		   	function fetchRecord(){
	   			data_counter();
	   			$.ajax({
					url : "AjaxCompany.jsp",
					method : "POST",
					data : {						
						radio : temp,
						search : search,
						pagenumber: currentPage
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
	  		if ($('input[value=deactive]:checked').length > 0) {
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
	   	    
	  	 <!--- Pagination code --->
	  	 function data_counter() {
			$.ajax({
				url : "AjaxCompany.jsp",
				method : "GET",
				data : {						
					radio : temp,
					search : search,
					action : "counter"
				},					
				success : function(data) {
					var totalconsumers = parseInt((data.split('<body>'))[1].split('<script>'));
					numberOfRecords = totalconsumers;
					console.log("numberOfRecords : " + numberOfRecords);
					maximumRecordsPerPage = 10;
					numberOfPagesRequired = Math.ceil(numberOfRecords/maximumRecordsPerPage);
					var pagination = document.getElementsByClassName("pagination");
					var previousElement = "<li id='previous' class='page-item'><a class='page-link' style='text-decoration:none;' onclick='displayPreviousPage()' href='#'>Previous</a></li>";
					var nextElement = "<li id='next' class='page-item'><a class='page-link' style='text-decoration:none;' onclick='displayNextPage()' href='#'>next</a></li>";
					pagination[0].innerHTML = previousElement;
					for(let i=1;i<=numberOfPagesRequired;i++)
					{
						var pageElement = "<li class='page-item'><a class='page-link' style='text-decoration:none;' onclick='displayRecords(this)' href='#'>"+i+"</a></li>";
						pagination[0].innerHTML += pageElement;
					}
					pagination[0].innerHTML += nextElement;
					var allPages = document.getElementsByClassName("page-item");
					for(let i=0;i<allPages.length;i++)
					{
						var pages = parseInt(allPages[i].innerText);
						if(pages == currentPage)
						{
							allPages[i].className = "page-item active";
						}
					}
					checkPreviousNextPage();
				}
			});
		 }		  	
	  	 <!----------------------->
            
        <%@ include file="js/pagination.js"%>
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>