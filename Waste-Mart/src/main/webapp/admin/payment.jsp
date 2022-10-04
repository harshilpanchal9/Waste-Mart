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
        <title> Admin | Transactions </title>
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
                                    <h3 class="title"> Transactions </h3>
                                </div>
                            </div>
                        </div>
                        <div class="items-search">
                            <form class="form-inline">
                            </form>
                        </div>
                    </div>

                    <section class="section">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                   <div class="card-block">                                        
                                        <ul class="nav nav-tabs nav-tabs-bordered">
                                            <li class="nav-item" onclick="clickZoner()">
                                                <a href="#home" id="zonertab" class="nav-link" data-target="#home" data-toggle="tab" aria-controls="home" role="tab">Zoner</a>
                                            </li>
                                            <li class="nav-item" onclick="clickCompany()">
                                                <a href="#profile" id="companytab" class="nav-link" data-target="#profile" aria-controls="profile" data-toggle="tab" role="tab">Company</a>
                                            </li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content tabs-bordered" style="padding:0px 0px 0px;">
                                        	<!-- Zoner Transactions -->
                                            <div class="tab-pane fade" id="home">
												<div class="card items">
							                        <ul class="item-list striped">
							                            <li class="item item-list-header">
							                                <div class="item-row">                                   
							                                    <div class="item-col item-col-header item-col-title" style="flex-grow:0.8;padding-right: 0px;text-align:center;">
							                                        <div>
							                                            <span>Request ID</span>
							                                        </div>
							                                    </div>
							                                    <div class="item-col item-col-header item-col-title" style="padding-right: 0px;flex-grow:1.3;padding-left:0px;">
							                                        <div class="no-overflow" style="text-align: center;">
							                                            <span>Customer Name</span>
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
							                                    <div class="item-col item-col-header fixed item-col-actions-dropdown">
							                                    </div>
							                                </div>
							                            </li>
							                             <%
							                             	int count=0;
							                             	Connection cn=new DBUtil().getConnection();
							                                String qry="select * from customer_request";
							                                PreparedStatement st=cn.prepareStatement(qry);
							                                ResultSet rs=st.executeQuery(); 
							                                if(!rs.first())
							                                {
							                                	%>
							                                		<li class="item item-list-header" style="color: rgb(153 153 153);font-size: 15px;font-weight: 700 !important;font-style: italic;justify-content: center;height:60px">
							                                		<div class="item-row" style="justify-content: center;">                                			
							                                			No any transaction yet :(
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
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:1.4;padding-right: 5px;">
							                                        <div class="item-heading">Request ID</div>
							                                        <div class="no-overflow" style="font-weight: 600;"> <%= rs.getInt(1) %></div>
							                                    </div>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.3;padding-right: 5px;">
							                                        <div class="item-heading">Customer Name</div>
							                                        <%
							                                        	String getname="select * from customer_signup where customerid=?";
							                                        	PreparedStatement ps=cn.prepareStatement(getname);
							                                        	ps.setInt(1,rs.getInt(2));
							                                        	ResultSet r=ps.executeQuery();
							                                        	String name="";
							                                        	if(r.next())
							                                        	{
							                                        		name=r.getString(2)+" "+r.getString(3);
							                                        	}
							                                        %>
							                                        <div class="no-overflow" style="font-weight: 600;"> <%= name %></div>
							                                    </div>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.5;padding-right: 5px;">
							                                        <div class="item-heading">Quantity</div>
							                                        <div class="no-overflow" style="font-weight: 600;"> <%= rs.getString(7) %></div>
							                                    </div>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.5;padding-right: 5px;">
							                                        <div class="item-heading">Payable amount</div>
							                                        <div class="no-overflow" style="font-weight: 600;"> <%= rs.getString(8) %></div>
							                                    </div>
							                                    <%
							                                    	String status = rs.getString(12);
							                                    	if(status.equalsIgnoreCase("Pending"))
							                                    	{
							                                    %>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.5;padding-right: 5px;">
							                                        <div class="item-heading">Status</div>
							                                        <div class="no-overflow btn btn-danger-outline" style="font-weight: 600;pointer-events: none;"> <%= rs.getString(12) %></div>
							                                    </div>
							                                    <%	}
							                                    	else{
							                                    %>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.5;padding-right: 5px;">
							                                        <div class="item-heading">Status</div>
							                                        <div class="no-overflow btn btn-success-outline" style="font-weight: 600;pointer-events: none;"> <%= rs.getString(12) %></div>
							                                    </div>
							                                    <%	} 
							                                    %>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.5;padding-right: 5px;">
							                                        <div class="item-heading">Payment mode</div>
							                                        <div class="no-overflow" style="font-weight: 600;"> <%= rs.getString(9) %></div>
							                                    </div>
							                                    <div class="item-col fixed item-col-actions-dropdown">
							                                        <div class="item-actions-dropdown">
							                                            <a class="item-actions-toggle-btn">
							                                                <span class="inactive">
							                                                    <i class="fa fa-lg fa-cog"></i>
							                                                </span>
							                                                <span class="active">
							                                                    <i class="fa fa-lg fa-chevron-circle-right"></i>
							                                                </span>
							                                            </a>
							                                            <div class="item-actions-block" style="height: 37px;top: -4px;line-height: 36px;border-radius: 15px;">
							                                                <ul class="item-actions-list">   							                                                	                                                 
							                                                    <li>
							                                                    	<a class="edit" href="viewcustomer-payment.jsp?requestid=<%=rs.getInt(1)%>">
							                                                            <i class="fa fa-lg fa-eye"></i>
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
														%>
							                        </ul>
							                    </div>
                                            </div>
                                            <!-- Company Transactions -->
                                            <div class="tab-pane fade" id="profile">
												<div class="card items">
							                        <ul class="item-list striped">
							                            <li class="item item-list-header">
							                                <div class="item-row">                                   
							                                    <div class="item-col item-col-header item-col-title" style="flex-grow:0.8;padding-right: 0px;text-align:center;">
							                                        <div>
							                                            <span>Request ID</span>
							                                        </div>
							                                    </div>
							                                    <div class="item-col item-col-header item-col-title" style="padding-right: 0px;flex-grow:1.3;padding-left:0px;">
							                                        <div class="no-overflow" style="text-align: center;">
							                                            <span>Company Name</span>
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
							                                    <div class="item-col item-col-header fixed item-col-actions-dropdown">
							                                    </div>
							                                </div>
							                            </li>
							                             <%
							                             	int count2=0;
							                                String company="select * from company_request";
							                                st=cn.prepareStatement(company);
							                                rs=st.executeQuery(); 
							                                if(!rs.first())
							                                {
							                                	%>
							                                		<li class="item item-list-header" style="color: rgb(153 153 153);font-size: 15px;font-weight: 700 !important;font-style: italic;justify-content: center;height:60px">
							                                		<div class="item-row" style="justify-content: center;">                                			
							                                			No any transaction yet :(
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
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:1.4;padding-right: 5px;">
							                                        <div class="item-heading">Request ID</div>
							                                        <div class="no-overflow" style="font-weight: 600;"> <%= rs.getInt(1) %></div>
							                                    </div>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.3;padding-right: 5px;">
							                                        <div class="item-heading">Company Name</div>
							                                        <%
							                                        	String getcomname="select * from company_signup where companyid=?";
							                                        	PreparedStatement ps2=cn.prepareCall(getcomname);
							                                        	ps2.setInt(1,rs.getInt(2));
							                                        	ResultSet r2=ps2.executeQuery();
							                                        	if(r2.next())
							                                        	{
							                                        	
							                                        %>
							                                        <div class="no-overflow" style="font-weight: 600;"> <%= r2.getString(2) %></div>
							                                        <%
							                                        	}
							                                        %>
							                                    </div>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.5;padding-right: 5px;">
							                                        <div class="item-heading">Quantity</div>
							                                        <div class="no-overflow" style="font-weight: 600;"> <%= rs.getString(7) %></div>
							                                    </div>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.5;padding-right: 5px;">
							                                        <div class="item-heading">Payable amount</div>
							                                        <div class="no-overflow" style="font-weight: 600;"> <%= rs.getString(8) %></div>
							                                    </div>
							                                    <%
							                                    	String status = rs.getString(12);
							                                    	if(status.equalsIgnoreCase("Pending"))
							                                    	{
							                                    %>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.5;padding-right: 5px;">
							                                        <div class="item-heading">Status</div>
							                                        <div class="no-overflow btn btn-danger-outline" style="font-weight: 600;pointer-events: none;"> <%= rs.getString(12) %></div>
							                                    </div>
							                                    <%	}
							                                    	else{
							                                    %>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.5;padding-right: 5px;">
							                                        <div class="item-heading">Status</div>
							                                        <div class="no-overflow btn btn-success-outline" style="font-weight: 600;pointer-events: none;"> <%= rs.getString(12) %></div>
							                                    </div>
							                                    <%	} 
							                                    %>
							                                    <div class="item-col item-col-author" style="text-align: center;flex-grow:2.5;padding-right: 5px;">
							                                        <div class="item-heading">Payment mode</div>
							                                        <div class="no-overflow" style="font-weight: 600;"> <%= rs.getString(9) %></div>
							                                    </div>
							                                    <div class="item-col fixed item-col-actions-dropdown">
							                                        <div class="item-actions-dropdown">
							                                            <a class="item-actions-toggle-btn">
							                                                <span class="inactive">
							                                                    <i class="fa fa-lg fa-cog"></i>
							                                                </span>
							                                                <span class="active">
							                                                    <i class="fa fa-lg fa-chevron-circle-right"></i>
							                                                </span>
							                                            </a>
							                                            <div class="item-actions-block" style="height: 37px;top: -4px;line-height: 36px;border-radius: 15px;">
							                                                <ul class="item-actions-list">   
							                                                	<li>
							                                                    	<a class="edit" href="viewcompany-payment.jsp?requestid=<%=rs.getInt(1)%>">
							                                                            <i class="fa fa-lg fa-eye"></i>
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
                                            </div>                                            
                                        </div>
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
        
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>
        	
        <script>
        	
        	var element = document.getElementById("payment");
      	  	element.classList.add("active");
        	
      	  	window.onload = function(){
	      	  	document.getElementById("zonertab").classList.add('active');
	  	  		document.getElementById("companytab").classList.remove('active');
	      	  	let el = document.getElementById('zonertab');
	      	    el.ariaSelected = "true";
	      	    let el1 = document.getElementById('companytab');
	      	    el1.ariaSelected = "false";	      	    
	  	  		document.getElementById("home").classList.add('active', 'show');
	  	  		document.getElementById("profile").classList.remove('active', 'show');
      	  	}
      	  	
      	  	function clickZoner(){
      	  		document.getElementById("zonertab").classList.add('active');
      	  		document.getElementById("companytab").classList.remove('active');
	      	  	let el = document.getElementById('zonertab');
	      	    el.ariaSelected = "true";
	      	    let el1 = document.getElementById('companytab');
	      	    el1.ariaSelected = "false";	      	    
      	  		document.getElementById("home").classList.add('active', 'show');
	  	  		document.getElementById("profile").classList.remove('active', 'show');
      	  	}
      	  	function clickCompany(){
    	  		document.getElementById("zonertab").classList.remove('active');
    	  		document.getElementById("companytab").classList.add('active');
    	  		let el = document.getElementById('zonertab');
	      	    el.ariaSelected = "false";
	      	    let el1 = document.getElementById('companytab');
	      	    el1.ariaSelected = "true";   	  		
    	  		document.getElementById("profile").classList.add('active', 'show');
	  	  		document.getElementById("home").classList.remove('active', 'show');
    	  	} 
      	  	
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>