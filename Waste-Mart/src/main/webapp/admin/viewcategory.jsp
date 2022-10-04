<%@page import="com.dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin | Category </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <!-- Place favicon.ico in the root directory -->
        <link rel="icon" href="../favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/vendor.css">
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/app.css">
        <style>        	
        	input::-webkit-calendar-picker-indicator {
			   opacity: 0;
			}
			.form-control.boxed:focus {
			    border: 1px solid #ced4da;;
			}
        </style>
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
                                    <h3 class="title"> Category 
                                    	<a href="category.jsp" class="btn btn-primary btn-sm rounded-s" style="height: 33px;padding-top: 7px;margin-right: 10px;"> Add New Category</a>                                    	
                                    	<button type="button" id="discard" class="btn btn-pill-right btn-primary" onclick="deleteitems()" style="display:none;" data-toggle="modal" data-target="#confirm-modal"><i class="fa fa-times"></i>&nbsp;&nbsp;Discard</button>
                                    </h3>                                                
                                </div>                            	    
                            </div>                            
                        </div>
                        <div class="items-search">
                            <form class="form-inline" action="../SearchController" method="post">
                                <div class="input-group">
                                	<%String search = request.getParameter("search");
                                		if(search == null || search.equalsIgnoreCase("null")){
                                			search = "";
                                		}
                                	%>
                                    <input id="searchbar" name="searchbar" style="border-right:0px;" list="category_list" value="<%=search%>" autocomplete="off" type="text" class="form-control boxed rounded-s" placeholder="Search category here..." onkeyup="showCancel(this.value)">
                                    <span class="input-group-append boxed" style="background-color:white;border-top: 1px solid #ced4da;border-bottom: 1px solid #ced4da;" onclick="clearSearch()">
                                   		<span class="input-group-text fa fa-times" id="searchicon" style="cursor:pointer;visibility:hidden;background-color:white;border:none;"></span>
                               		</span>
                                    <span class="input-group-btn">
                                        <button type="submit" name="btn" value="searchCategory" class="btn btn-secondary rounded-s" style="padding-bottom: 7.5px;" type="button">
                                            <i class="fa fa-search" style="padding-top: 5px;"></i>
                                        </button>
                                    </span>
                                    <datalist id="category_list">
                                    <%
                                    	ArrayList<String> allcategory = new CategoryDao().getAllCategoryName();
                                    	for(String catname : allcategory){
                                    %>
                                    	<option value="<%=catname%>">
                                    <%
                                    	}
                                    %>
                                    </datalist>
                                </div>
                            </form>
                        </div>
                    </div>                   
                    <div class="card items">
                        <ul class="item-list striped">
                         
                            <li class="item item-list-header">
                                <div class="item-row">
                                    <div class="item-col fixed item-col-check">
                                        <label class="item-check" >
                                            <input type="checkbox" id="selectAll" class="checkbox" onchange="SelectAll(this)">
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="item-col item-col-header fixed item-col-img md">
                                        <div>
                                            <span>Select All</span>
                                        </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title">
                                        <div style="text-align: left;padding-left: 90px;">
                                            <span>Category Name</span>
                                        </div>
                                    </div>                                    
                                </div>
                            </li>
                            <%
                            	int count=0,flag=0;
		                        Connection cn=new DBUtil().getConnection();
		                        String qry=null;
		                        String searchvalue = request.getParameter("search");
		                        if(searchvalue != null){
		                        	if(searchvalue.equalsIgnoreCase("null")){
		                        		qry="select * from category where catname like '%'";
		                        	}else{
		                        		qry = "select * from category where catname like '"+searchvalue+"%'";
		                        		flag=1;
		                        	}		                        	
		                        }
		                        else{
		                        	qry="select * from category";
		                        }
		                        PreparedStatement st=cn.prepareStatement(qry);
		                        ResultSet rs=st.executeQuery();
		                        if(!rs.first())
                                {
                                	%>
                                		<li class="item item-list-header" style="color: rgb(153 153 153);font-size: 15px;font-weight: 700 !important;font-style: italic;justify-content: center;height:60px">
                                		<div class="item-row" style="justify-content: center;">
                                		<script>
                                			document.getElementById("selectAll").disabled = true; 
                                		</script>
                                		<%
                                			if(flag==1){
                                				%>
                                					<i class="fa fa-frown-o" style='font-size:25px;margin-top:auto;margin-bottom:auto;'></i>&nbsp;&nbsp;Sorry, No category found
                                				<%
                                			}else{
                                				%>
                                					<i class="fa fa-warning" style='font-size:25px;margin-top:auto;margin-bottom:auto;'></i>&nbsp;&nbsp;Please add some Category                                					
                                				<%
                                			}                                			
                                		%>
                                			</div>
                                		</li>
                                	<%                                
                                }  
                                rs.relative(-1);
		                        while(rs.next())
		                        {
		                        	count++;
		                        	
                    		%>
                            <li class="item">
                                <div class="item-row">
                                    <div class="item-col fixed item-col-check">
                                        <label class="item-check">
                                        	<input type="checkbox" class="checkbox" id="checkcategory" onchange="removeitem(<%=rs.getInt(1)%>)">
                                            <span></span>
                                        </label>
                                    </div>
                                    <div class="item-col fixed item-col-img ">
                                        <a href="#">
                                            <div class="item-img rounded" style="background-image: url('../category/<%=rs.getString(3)%>')" alt="Image not available"></div>                                            
                                        </a>
                                    </div>
                                    <div class="item-col fixed pull-left item-col-title">
                                        <div class="item-heading">Category Name</div>
                                        <div style="width: 204px;margin-left: 35px;text-align: center;">		                                        
		                                	<h4 class="item-title"><%=rs.getString(2)%></h4>                                        		                                                                                                                                                                           
                                        </div>
                                    </div>                                    
                                    <div class="item-col fixed item-col-actions-dropdown">
                                        <div class="item-actions-dropdown">
                                            <a class="item-actions-toggle-btn">
                                                <span class="inactive">
                                                    <i class="fa fa-cog"></i>
                                                </span>
                                                <span class="active">
                                                    <i class="fa fa-chevron-circle-right"></i>
                                                </span>
                                            </a>
                                            <div class="item-actions-block">
                                                <ul class="item-actions-list">
                                                    <li>
                                                    	<input type="hidden" name="catid" value="<%=rs.getInt(1)%>">
                                                    	<a class="remove" href="#" onclick="deleteitem(<%=rs.getInt(1)%>)" data-toggle="modal" data-target="#confirm-modal">
                                                            <i class="fa fa-trash-o "></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a class="edit" href="updatecategory.jsp?catid=<%=rs.getInt(1) %>">
                                                            <i class="fa fa-pencil"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li> 
                            <% 
                    			}
                				cn.close();
							%>                    
                        </ul>                        
                    </div> 
                                      
                </article>
                <!-- Footer -->        
				<%@ include file="footer.jsp" %>  
				
				<!-- Alert Box for deleting Category -->
				<input type="hidden" id="count" name="count" value="<%=count%>">
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
                                <p>Are you sure want to delete this category?</p>
                            </div>
                            <div class="modal-footer">
                            	<form action="../CategoryController">                            		
                            		<span id="checkboxcatid"></span>
                                	<button type="submit" name="action" value="deletecategory" class="btn btn-primary">Yes</button>                                	
                                </form>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            </div>
                        </div>
                    </div>
                </div>
				<!--------------->		
				<!-- Set timer for add category modal -->
				<div class="modal fade" id="timer-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="margin-left: -1px;border-top-left-radius: 0;border-top-right-radius: 0;">
                                <h4 class="modal-title"><i class="fa fa-warning"></i> Category</h4>                                
                            </div>
                            <div class="modal-body">
                                <p>Category added successfully.</p>
                            </div>                            
                        </div>
                    </div>
                </div>
                <!----------------->					
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
        	
        	 var element = document.getElementById("category");
       	  	 element.classList.add("active");
       	  	 var element1 = document.getElementById("category");
    	  	 element1.classList.add("open");
       	  	 var element2 = document.getElementById("viewcategory");
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
    	  	 
    	  	 <!-- Check Box -->   
    	  	 const id=[];
    	  	 var MainCB;
    	  	 function SelectAll(cb){
    	  		var discardbtn = document.getElementById("discard");    	
    	  		var singlecb = document.getElementsByName('catid');
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
    	  	 }    	  	 
    	  	 var counter = document.getElementById("count").value;
    	  	 function removeitem(ids){
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
    	  			 selectall.checked = true;
    	  		 }else{
    	  			 selectall.checked = false;
    	  		 }      	  		 
    	  	 }
    	  	 function deleteitem(catid){        	  		     	  		 
  	  			 var temp = "<input type=\"hidden\" name=\"checkboxid\" value=\"" + catid + "\"</input>";    	  			    	  			
  	  			 $("#checkboxcatid").append(temp);    	  		
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