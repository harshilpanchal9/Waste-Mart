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
        <title> Admin | Stocks </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <!-- Place favicon.ico in the root directory -->
        <link rel="icon" href="../favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" type="text/css" href="css/app.css">
        <style>
        	.form-control.boxed:focus {
			    border: 1px solid #ced4da;;
			}
        </style>
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
                                    <h3 class="title"> Stocks </h3>                                    
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
                                    <input id="searchbar" name="searchbar" style="border-right:0px;" list="category_list" value="<%=search%>" autocomplete="off" type="text" class="form-control boxed rounded-s" placeholder="Search Item name here..." onkeyup="showCancel(this.value)">
                                    <span class="input-group-append boxed" style="background-color:white;border-top: 1px solid #ced4da;border-bottom: 1px solid #ced4da;" onclick="clearSearch()">
                                   		<span class="input-group-text fa fa-times" id="searchicon" style="cursor:pointer;visibility:hidden;background-color:white;border:none;"></span>
                               		</span>
                                    <span class="input-group-btn">
                                        <button type="submit" name="btn" value="searchStockItem" class="btn btn-secondary rounded-s" style="padding-bottom: 7.5px;" type="button">
                                            <i class="fa fa-search" style="padding-top: 5px;"></i>
                                        </button>
                                    </span>                                    
                                </div>
                            </form>
                        </div>
                    </div>
            	<section class="section">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-block">
                                        <div class="card-title-block">
                                            <h3 class="title">Item Stock</h3>
                                        </div>
                                        <section class="example">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Item ID</th>
                                                            <th>Item name</th>
                                                            <th>Item stock</th>                                         
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                        int flag=0;
                                                        Connection cn = new DBUtil().getConnection();
	                                                    String qry=null;
	                    		                        String searchvalue = request.getParameter("search");
	                    		                        if(searchvalue != null){
	                    		                        	if(searchvalue.equalsIgnoreCase("null")){
	                    		                        		qry="select * from customer_subcategory where itemname like '%'";
	                    		                        	}else{
	                    		                        		qry = "select * from customer_subcategory where itemname like '"+searchvalue+"%'";	
	                    		                        		flag=1;
	                    		                        	}		                        	
	                    		                        }
	                    		                        else{
	                    		                        	qry="select * from customer_subcategory";
	                    		                        }
	                                                	PreparedStatement st = cn.prepareStatement(qry);
	                                                	ResultSet rs = st.executeQuery();
	                                                	if(!rs.first()){
	                                                		
				                                			if(flag==1){
				                                				%>
				                                					<tr>
                                                            			<td colspan="3" style="text-align:center;"><i class="fa fa-exclamation-circle" style='font-size:25px;margin-top:auto;margin-bottom:auto;'></i>&nbsp;&nbsp;Sorry, No any stock item found</td>                                                                                                                     
                                                        			</tr>
				                                				<%
				                                			}else{
				                                				%>                            					
				                                					<tr>
                                                            			<td colspan="3" style="text-align:center;"><i class="fa fa-warning" style='font-size:25px;margin-top:auto;margin-bottom:auto;'></i>&nbsp;&nbsp;Stock catalog is empty.</td>                                                                                                                     
                                                        			</tr>
				                                				<%
				                                			}
	                                                	}
	                                                	rs.relative(-1);
	                                                	while(rs.next()){
	                                                		%>
	                                                			<tr>
		                                                            <td><%=rs.getInt(1) %></td>
		                                                            <td><%=rs.getString(3) %></td>
		                                                            <td><%=rs.getString(6) %></td>			                                                                                                                    
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
            	<!-- Footer -->
            	<%@ include file="footer.jsp" %>
            </div>
        </div>
                
        	<script>
        	
        	var element = document.getElementById("stocks");
      	  	element.classList.add("active");
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
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>