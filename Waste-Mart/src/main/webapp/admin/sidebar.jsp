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
                                    <a href="<%application.getContextPath(); %>/Waste-Mart/admin/dashboard.jsp">
                                        <i class="fa fa-home"></i> Dashboard </a>
                                </li>
                                <li id="category">
                                    <a href="#">
                                        <i class="fa fa-th-large"></i> Category Manager <i class="fa arrow"></i>
                                    </a>
                                    <ul class="sidebar-nav">
                                        <li id="addcategory">
                                            <a href="<%application.getContextPath(); %>/Waste-Mart/admin/category.jsp"> Add Category </a>
                                        </li>
                                        <li id="viewcategory">
                                            <a href="<%application.getContextPath(); %>/Waste-Mart/admin/viewcategory.jsp"> Category List </a>
                                        </li>                                                                                                               
                                    </ul>
                                </li>
                                <li id="item">
                                    <a href="#">
                                        <i class="fa fa-th-list"></i> Items Manager <i class="fa arrow"></i>
                                    </a>
                                    <ul class="sidebar-nav">                                                                                                               
                                        <li id="addsubcategory">
                                            <a href="#"> Add Item <i class="fa arrow"></i> </a>
                                            <ul class="sidebar-nav">
                                                <li id = "customeraddsubcategory">
                                                    <a href="<%application.getContextPath(); %>/Waste-Mart/admin/customeraddsubcategory.jsp"> Consumer </a>
                                                </li>
                                                <li id = "companyaddsubcategory">
                                                    <a href="<%application.getContextPath(); %>/Waste-Mart/admin/companyaddsubcategory.jsp"> Company </a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li id="viewsubcategory">
                                            <a href="#"> Items List <i class="fa arrow"></i> </a>
                                            <ul class="sidebar-nav">
                                                <li id = "customerviewsubcategory">
                                                    <a href="<%application.getContextPath(); %>/Waste-Mart/admin/customerviewsubcategory.jsp"> Consumer </a>
                                                </li>
                                                <li id = "companyviewsubcategory">
                                                    <a href="<%application.getContextPath(); %>/Waste-Mart/admin/companyviewsubcategory.jsp"> Company </a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li id="users">
                                    <a href="#">
                                        <i class="fa fa-users"></i> Users <i class="fa arrow"></i>
                                    </a>
                                    <ul class="sidebar-nav">
                                        <li id="customer">
                                            <a href="<%application.getContextPath(); %>/Waste-Mart/admin/customer.jsp"> Consumer </a>
                                        </li>
                                        <li id="company">
                                            <a href="<%application.getContextPath(); %>/Waste-Mart/admin/company.jsp"> Company </a>
                                        </li>
                                        <li id="zoner">
                                            <a href="<%application.getContextPath(); %>/Waste-Mart/admin/zonerviewregistration.jsp"> Zoner </a>
                                        </li>
                                    </ul>
                                </li>
                                <li id="request">
                                    <a href="#">
                                        <i class="fa fa-list-alt"></i> Request <i class="fa arrow"></i>
                                    </a>
                                    <ul class="sidebar-nav">
                                        <li id="customer_request">
                                            <a href="<%application.getContextPath(); %>/Waste-Mart/admin/request-customer.jsp"> Consumer </a>
                                        </li>
                                        <li id="company_request">
                                            <a href="<%application.getContextPath(); %>/Waste-Mart/admin/request-company.jsp"> Company </a>
                                        </li>
                                    </ul>
                                </li>
                                <li id="payment">
                                    <a href="<%application.getContextPath(); %>/Waste-Mart/admin/payment.jsp">
                                        <i class="fa fa-credit-card"></i> Transactions </a>
                                </li>
                                <li id="zone">
                                    <a href="<%application.getContextPath(); %>/Waste-Mart/admin/zone.jsp">
                                        <i class="fa fa-building-o"></i> Zone </a>
                                </li>
                                <li id="stocks">
                                    <a href="<%application.getContextPath(); %>/Waste-Mart/admin/stocks.jsp">
                                        <i class="fa fa-bar-chart-o"></i> Stocks </a>
                                </li>
                                <li id="services">
                                    <a href="<%application.getContextPath(); %>/Waste-Mart/admin/services.jsp">
                                        <i class="fa fa-cogs"></i> Services </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <footer class="sidebar-footer">
                        <ul class="sidebar-menu metismenu" id="customize-menu">
                            <li id="logout">                                                                                                                     
                            	<a href="<%application.getContextPath(); %>/Waste-Mart/admin/logout.jsp">
                                    <i class="fa fa-power-off"></i> Logout </a>
                            </li>
                        </ul>                       
                    </footer>
                </aside>
</body>
</html>