<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dao.UserZonerDao"%>
<%@page import="com.dao.UserCompanyDao"%>
<%@page import="com.dao.UserCustomerDao"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin | Dashboard </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <!-- Place favicon.ico in the root directory -->
        <link rel="icon" href="../favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" type="text/css" href="css/app.css">
        <style>
        .tab_hover:hover{
        	box-shadow: 0 10px 16px 1px rgb(0 0 0 / 20%), 0 2px 4px -3px rgb(0 0 0 / 6%);
        	transition: 0.5s;
        }
        </style>
</head>
<body>
			<div class="sidebar-overlay" id="sidebar-overlay"></div>
                <div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
                <div class="mobile-menu-handle"></div>
                <article class="content dashboard-page">
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col col-12 col-sm-12 col-md-6 col-xl-5 stats-col">
                                <div class="card sameheight-item stats" data-exclude="xs">
                                    <div class="card-block">
                                        <div class="title-block">
                                            <h4 class="title"> Stats </h4>
                                        </div>
                                        <div class="row row-sm stats-container">
                                            <div class="col-12 col-sm-6 stat-col">
                                                <div class="stat-icon">
                                                    <i class="fa fa-rocket"></i>
                                                </div>
                                                <%
                                                	int active_custItem = new CategoryDao().itemStockCustomerSubCategory();
                                                	int total_item = new CategoryDao().totalSubCategory();
                                                	int average_activeItem = ((active_custItem*100)/total_item);
                                                %>
                                                <div class="stat">
                                                    <div class="value"> <%=active_custItem%> </div>
                                                    <div class="name"> Active items </div>
                                                </div>
                                                <div class="progress stat-progress">
                                                    <div class="progress-bar" style="width: <%=average_activeItem%>%;"></div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6 stat-col">
                                                <div class="stat-icon">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </div>
                                                <%
                                                	int item_sold =(int)new CategoryDao().itemSoldCompanySubCategory();
                                                	float totalItemStock_cust = (float)new CategoryDao().totalItemStockCustomerSubCategory();
                                                	float average_itemSold = (float)((item_sold*100)/totalItemStock_cust);
                                                %>
                                                <div class="stat">
                                                    <div class="value"> <%=item_sold%> </div>
                                                    <div class="name"> Items sold </div>
                                                </div>
                                                <div class="progress stat-progress">
                                                    <div class="progress-bar" style="width: <%=average_itemSold%>%;"></div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6  stat-col">
                                                <div class="stat-icon">
                                                    <i class="fa fa-list-alt"></i>
                                                </div>
                                                <%
                                                	int customer_request = new UserCustomerDao().totalCustomerRequest();
                                                	int company_request = new UserCompanyDao().totalCompanyRequest();
                                                	int total_request = customer_request + company_request;
                                                %>
                                                <div class="stat">
                                                    <div class="value"> <%=total_request%> </div>
                                                    <div class="name"> Total requests </div>
                                                </div>
                                                <div class="progress stat-progress" style="visibility:hidden;">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6  stat-col">
                                                <div class="stat-icon">
                                                    <i class="fa fa-users"></i>
                                                </div>
                                                <%
                                                	int total_customer = new UserCustomerDao().totalCustomer();
                                                	int total_company = new UserCompanyDao().totalCompany();
                                                	int total_user = total_customer + total_company;
                                                %>
                                                <div class="stat">
                                                    <div class="value"> <%=total_user%> </div>
                                                    <div class="name"> Total users </div>
                                                </div>
                                                <div class="progress stat-progress" style="visibility:hidden;">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6  stat-col">
                                                <div class="stat-icon">
                                                    <i class="fa fa-money"></i>
                                                </div>
                                                <%
                                                	float total_zoner_income = new UserZonerDao().customerPayments();
                                                	String total_z_i = String.format("%.2f", total_zoner_income);
                                                %>
                                                <div class="stat">
                                                    <div class="value"> <i class="fa fa-inr" style="font-size:	20px;"></i><%=total_z_i %></div>
                                                    <div class="name"> Total zoner transactions </div>
                                                </div>
                                                <div class="progress stat-progress" style="visibility:hidden;">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6 stat-col">
                                                <div class="stat-icon">
                                                    <i class="fa fa-inr"></i>
                                                </div>
                                                <%
                                                	float total_company_income = new UserCompanyDao().companyPayments();
                                                	String total_c_i = String.format("%.2f", total_company_income);
                                                %>
                                                <div class="stat">
                                                    <div class="value"> <i class="fa fa-inr" style="font-size:	20px;"></i><%=total_c_i %></div>
                                                    <div class="name"> Total income </div>
                                                </div>
                                                <div class="progress stat-progress" style="visibility:hidden;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col col-12 col-sm-12 col-md-6 col-xl-7 history-col">
                                <div class="card sameheight-item" data-exclude="xs" id="dashboard-history">
                                    <div class="card-header card-header-sm bordered">
                                        <div class="header-block">
                                            <h3 class="title">User Requests</h3>
                                        </div>
                                        <ul class="nav nav-tabs pull-right" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="#visits" role="tab" data-toggle="tab">Consumer</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#downloads" role="tab" data-toggle="tab">Company</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="card-block">
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane active fade show" id="visits">
                                                <p class="title-description"> Number of requests from different users </p>
                                                <div class="card-block">                                        
			                                        <div class="row row-sm stats-container" style="height: 160px;align-items: center;">
			                                        	<div class="col-12 col-sm-6 stats tab_hover stat-col" onclick="callPendingCustomer()" style="cursor:pointer;text-align:center;height: 150px;display: flex;justify-content: center;align-items: center;">			                                                
			                                                <%
			                                                	int pending_cust_req = new UserCustomerDao().pendingCustomerRequest();
			                                                %>
			                                                <div class="stat" style="margin-right:0px;">
			                                                    <div class="value" style="font-size:30px;"> <%=pending_cust_req%> </div>
			                                                    <div class="name"style="padding-top:16px;font-size:17px;"> Pending requests </div>
			                                                </div>
			                                                <div class="progress stat-progress" style="visibility:hidden;">			                                                    
			                                                </div>
			                                            </div>
			                                            <div class="col-12 col-sm-6 stats tab_hover stat-col" onclick="callCompletedCustomer()" style="cursor:pointer;text-align:center;height: 150px;display: flex;justify-content: center;align-items: center;">			                                                
			                                                <%
			                                                	int completed_cust_req = new UserCustomerDao().completedCustomerRequest();
			                                                %>
			                                                <div class="stat" style="margin-right:0px;">
			                                                    <div class="value" style="font-size:30px;"> <%=completed_cust_req%> </div>
			                                                    <div class="name"style="padding-top:16px;font-size:17px;"> Completed requests </div>
			                                                </div>
			                                                <div class="progress stat-progress" style="visibility:hidden;">
			                                                </div>
			                                            </div>
			                                        </div>
			                                    </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="downloads">
                                                <p class="title-description"> Number of order requests from company </p>
                                               	<div class="card-block">                                        
			                                        <div class="row row-sm stats-container" style="height: 160px;align-items: center;">
			                                        	<div class="col-12 col-sm-6 stats tab_hover stat-col" onclick="callPendingCompany()" style="cursor:pointer;text-align:center;height: 150px;display: flex;justify-content: center;align-items: center;">			                                                
			                                                <%
			                                                	int pending_comp_req = new UserCompanyDao().pendingCompanyRequest();
			                                                %>
			                                                <div class="stat" style="margin-right:0px;">
			                                                    <div class="value" style="font-size:30px;"> <%=pending_comp_req%> </div>
			                                                    <div class="name"style="padding-top:16px;font-size:17px;"> Pending requests </div>
			                                                </div>
			                                                <div class="progress stat-progress" style="visibility:hidden;">			                                                    
			                                                </div>
			                                            </div>
			                                            <div class="col-12 col-sm-6 stats tab_hover stat-col" onclick="callCompletedCompany()" style="cursor:pointer;text-align:center;height: 150px;display: flex;justify-content: center;align-items: center;">			                                                
			                                                <%
			                                                	int completed_comp_req = new UserCompanyDao().completedCompanyRequest();
			                                                %>
			                                                <div class="stat" style="margin-right:0px;">
			                                                    <div class="value" style="font-size:30px;"> <%=completed_comp_req%> </div>
			                                                    <div class="name"style="padding-top:16px;font-size:17px;"> Completed requests </div>
			                                                </div>
			                                                <div class="progress stat-progress" style="visibility:hidden;">
			                                                </div>
			                                            </div>
			                                        </div>
		                                    	</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-xl-8">
                                <div class="card sameheight-item items" style="height:395.2px;" data-exclude="xs,sm,lg">
                                    <div class="card-header bordered">
                                        <div class="header-block">
                                            <h3 class="title"> Recently added items </h3>
                                            <a href="customeraddsubcategory.jsp" class="btn btn-primary btn-sm"> Add new </a>
                                        </div>
                                        <div class="header-block pull-right">
                                            <label class="search">
                                                <input class="search-input" style="width:81%;" placeholder="search by itemname...." onkeyup="searchCategory(this)">
                                                <i class="fa fa-search search-icon"></i>
                                            </label>                                           
                                        </div>
                                    </div>
                                    <ul class="item-list striped">
                                        <li class="item item-list-header">
                                            <div class="item-row">
                                                <div class="item-col item-col-header fixed item-col-img xs"></div>
                                                <div class="item-col item-col-header item-col-title">
                                                    <div>
                                                        <span>Item name</span>
                                                    </div>
                                                </div>
                                                <div class="item-col item-col-header item-col-sales">
                                                    <div>
                                                        <span>Category</span>
                                                    </div>
                                                </div>
                                                <div class="item-col item-col-header item-col-stats" style="text-align:center;">
                                                    <div class="no-overflow">
                                                        <span>Stock</span>
                                                    </div>
                                                </div>
                                                <div class="item-col item-col-header item-col-date" style="text-align:center;">
                                                    <div>
                                                        <span>Price</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <!----------------------------->
                                        <li class="item" id="userdata" ></li> <!-- Print the Search data of Customer Subcategory -->
                                        <!----------------------------->	
                                        <li class="item" id="searchdata" style="display:none;"></li> <!-- Print the Search data of Customer Subcategory -->
                                        <!----------------------------->
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xl-4">
                                <div class="card sameheight-item sales-breakdown" data-exclude="xs,sm,lg">
                                    <div class="card-header bordered">
                                        <div class="header-block">
                                            <h3 class="title"> Top Category items</h3>                                            
                                        </div>                                        
                                    </div>
                                    <!-- <div class="card-block" style="height:345px;"> -->
                                        <ul class="item-list striped">
	                                        <li class="item item-list-header">
	                                            <div class="item-row">	                                                
	                                                <div class="item-col item-col-header item-col-title" style="text-align:center;">
	                                                    <div>
	                                                        <span>Item name</span>
	                                                    </div>
	                                                </div>
	                                                <div class="item-col item-col-header item-col-sales" style="text-align:center;">
	                                                    <div>
	                                                        <span>Item stock</span>
	                                                    </div>
	                                                </div>	                                                
	                                            </div>
	                                        </li>
	                                        <!----------------------------->
	                                        <li class="item" id="stockitemdata"></li> <!-- Print the Company data of Transactions -->	                                        
	                                        <!----------------------------->
	                                    </ul>
                                    <!-- </div> -->
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="section map-tasks">
                        <div class="row sameheight-container">
                            <div class="col-md-8">
                                <div class="card sameheight-item" data-exclude="xs,sm">
                                    <div class="card-header bordered">
                                        <div class="header-block">
                                            <h3 class="title"> Top company transactions </h3>                                            
                                        </div>                                        
                                    </div>                                   
                                       <ul class="item-list striped">
                                        <li class="item item-list-header">
                                            <div class="item-row">
                                                <div class="item-col item-col-header fixed item-col-img xs"></div>
                                                <div class="item-col item-col-header item-col-title">
                                                    <div>
                                                        <span>Company name</span>
                                                    </div>
                                                </div>
                                                <div class="item-col item-col-header item-col-sales" style="text-align:center;">
                                                    <div>
                                                        <span>Quantity</span>
                                                    </div>
                                                </div>
                                                <div class="item-col item-col-header item-col-stats" style="text-align:center;">
                                                    <div class="no-overflow">
                                                        <span>Payment</span>
                                                    </div>
                                                </div>
                                                <div class="item-col item-col-header item-col-date" style="text-align:center;">
                                                    <div>
                                                        <span>Payment mode</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <!----------------------------->
                                        <li class="item" id="companydata"></li> <!-- Print the Company data of Transactions -->	                                        
                                        <!----------------------------->
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card sameheight-item" data-exclude="xs,sm" style="max-height: 495.278px;">
                                    <div class="card-header bordered">
                                        <div class="header-block">
                                            <h3 class="title"> Areas In Control </h3>
                                        </div>
                                        <div class="header-block pull-right">
                                            <a href="zone.jsp" class="btn btn-primary btn-sm rounded pull-right"> Add new </a>
                                        </div>
                                    </div>
                                    <div style="overflow-y: scroll;">
                                        <div class="tasks-block">
                                            <ul class="item-list striped">
                                                <li class="item item-list-header">
                                                    <div class="item-row">   
                                                    	<div class="item-col item-col-header fixed item-col-img xs"></div>                                                 	
                                                        <div class="item-col item-col-header item-col-title" style="text-align:left;padding-top:10px;padding-bottom:10px;">
                                                            <div>
	                                                        	<span>Area name</span>
	                                                    	</div>
                                                        </div>
                                                        <div class="item-col item-col-header item-col-title" style="text-align:center;padding-top:10px;padding-bottom:10px;">
                                                            <div>
	                                                        	<span>Zone</span>
	                                                    	</div>
                                                        </div>                                                        
                                                    </div>
                                                </li>
                                                <!----------------------------->
		                                        <li class="item" id="zonedata"></li> <!-- Print the Area name data Zone -->	                                        
		                                        <!----------------------------->
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </article>                
	<script>
		window.onload = function()
		{
			$.ajax({
				url : "AjaxDashboard.jsp",
				method : "POST",
				data : {						
					action : "CustomerItems"
				},
				success : function(data) {
					$('#userdata').html(data);
				}
			});  
			
			$.ajax({
				url : "AjaxDashboard.jsp",
				method : "POST",
				data : {						
					action : "CompanyTransactions"
				},
				success : function(data) {
					$('#companydata').html(data);
				}
			});
			
			$.ajax({
				url : "AjaxDashboard.jsp",
				method : "POST",
				data : {						
					action : "Stockitemdata"
				},
				success : function(data) {
					$('#stockitemdata').html(data);
				}
			});
			
			$.ajax({
				url : "AjaxDashboard.jsp",
				method : "POST",
				data : {						
					action : "ZoneArea"
				},
				success : function(data) {
					$('#zonedata').html(data);
				}
			});
		}
		
		function searchCategory(search){	
			var searchValue = search.value;
			$.ajax({
				url : "AjaxDashboard.jsp",
				method : "POST",
				data : {		
					searchCategory : searchValue, 
					action : "SearchCategory"
				},
				success : function(data) {	
					document.getElementById("userdata").style.display = 'none';
					document.getElementById("searchdata").style.display = 'block';															 
					$('#searchdata').html(data);
				}
			}); 
		}
		
		function callPendingCustomer(){
			window.location.href = "request-customer.jsp?status=pending";
		}
		function callCompletedCustomer(){
			window.location.href = "request-customer.jsp?status=completed";
		}
		function callPendingCompany(){
			window.location.href = "request-company.jsp?status=pending";
		}
		function callCompletedCompany(){
			window.location.href = "request-company.jsp?status=completed";
		}
	</script>
	<script src="js/vendor.js"></script>
	<script src="js/app.js"></script>
</body>
</html>