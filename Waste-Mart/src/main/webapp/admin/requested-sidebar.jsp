<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
			<aside class="sidebar">
                    <div id=myDIV class="sidebar-container">
                        <div class="sidebar-header">
                            <div class="brand">
                                <div class="logo">
                                    <span class="l l1"></span>
                                    <span class="l l2"></span>
                                    <span class="l l3"></span>
                                    <span class="l l4"></span>
                                    <span class="l l5"></span>
                                </div> Waste Mart
                            </div>
                        </div>
                        <nav class="menu">
                            <ul class="sidebar-menu metismenu" id="sidebar-menu">
                                <li id="dashboard">
                                    <a href="<%= request.getContextPath() %>/admin/dashboard.jsp">
                                        <i class="fa fa-home"></i> Dashboard </a>
                                </li>
                                <li id="category">
                                    <a href="#">
                                        <i class="fa fa-th-large"></i> Category Manager <i class="fa arrow"></i>
                                    </a>
                                    <ul class="sidebar-nav">
                                        <li id="addcategory">
                                            <a href="<%= request.getContextPath() %>/admin/category.jsp"> Add Category </a>
                                        </li>
                                        <li id="viewcategory">
                                            <a href="<%= request.getContextPath() %>/admin/viewcategory.jsp"> Category List </a>
                                        </li>                                                                                                               
                                    </ul>
                                </li>
                                <li id="item">
                                    <a href="#">
                                        <i class="fa fa-th-large"></i> Items Manager <i class="fa arrow"></i>
                                    </a>
                                    <ul class="sidebar-nav">                                                                                                               
                                        <li id="addsubcategory">
                                            <a href="<%= request.getContextPath() %>/admin/subcategory.jsp"> Add Item </a>
                                        </li>
                                        <li id="viewsubcategory">
                                            <a href="<%= request.getContextPath() %>/admin/viewsubcategory.jsp"> Items List </a>
                                        </li>
                                    </ul>
                                </li>
                                <li id="users">
                                    <a href="#">
                                        <i class="fa fa-area-chart"></i> Users <i class="fa arrow"></i>
                                    </a>
                                    <ul class="sidebar-nav">
                                        <li id="customer">
                                            <a href="<%= request.getContextPath() %>/admin/customer.jsp"> Customer </a>
                                        </li>
                                        <li id="company">
                                            <a href="<%= request.getContextPath() %>/admin/company.jsp"> Company </a>
                                        </li>
                                        <li id="zoner">
                                            <a href="<%= request.getContextPath() %>/admin/zoner.jsp"> Zoner </a>
                                        </li>
                                    </ul>
                                </li>
                                <li id="request">
                                    <a href="#">
                                        <i class="fa fa-table"></i> Request <i class="fa arrow"></i>
                                    </a>
                                    <ul class="sidebar-nav">
                                        <li id="customer_request">
                                            <a href="<%= request.getContextPath() %>/admin/request-customer.jsp"> Customer</a>
                                        </li>
                                        <li id="company_request">
                                            <a href="<%= request.getContextPath() %>/admin/request-company.jsp"> Company </a>
                                        </li>
                                    </ul>
                                </li>
                                <li id="report">
                                    <a href="<%= request.getContextPath() %>/admin/report.jsp">
                                        <i class="fa fa-times"></i> Report </a>
                                </li>
                                <li id="payment">
                                    <a href="<%= request.getContextPath() %>/admin/payment.jsp">
                                        <i class="fa fa-pencil-square-o"></i> Payment </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <footer class="sidebar-footer">
                        <ul class="sidebar-menu metismenu" id="customize-menu">
                            <li id="logout">                                                                                                                     
                            	<a href="<%= request.getContextPath() %>/admin/logout.jsp">
                                    <i class="fa fa-cog"></i> Logout </a>
                            </li>
                        </ul>                       
                    </footer>
                </aside>
</body>
</html>