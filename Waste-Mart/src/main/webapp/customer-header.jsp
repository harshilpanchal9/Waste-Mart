<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Home | Customer-login </title>
  <link rel="stylesheet" href="assets/css/style-freedom.css">
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<style>

.pimage {
  border-radius: 50%;
}
.request_bt{
background-color: #228B22; /* Green */
  border: none;
  color: white;
  padding: 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:12px;
}
.action{
	position:fixed;
	top:20px;
	right:30px;
}

.action .profile{
position:relative;
width:60px;
height:60px;
border-radius:50%;
overflow:hidden;
cursor:pointer;

}

.action .menu{
position:absolute;
top:80px;
right:-10px;
padding:10px 20px;
background:black;
width:200px;
box-sizing:0 5px 25px rgba(0,0,0,0.1);
border-radius:15px;
transition:0.5s;
}
.menu-nav-space{

margin-left:200px;
}

.fa_custom{
	color:#228B22; 
}

.cart_counticon{
  position: absolute;
  top: -7px;
  right: -4px;
  width: 20px;
  height: 20px;
  background: red;
  color: #ffffff;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
  font-size:12px;
}

li:after{
	display:block;
  	content: '';
  	border-bottom: solid 3px green;  
  	transform: scaleX(0);  
  	transition: transform 350ms ease-in-out
}
li:hover:after{
	 transform: scaleX(1);
}

</style>
<body>


<!-- header -->
<div class="w3l-headers-9">
    <header style="display: flex;flex-direction: row-reverse;justify-content: flex-end;">
        <div class="wrapper" style="margin-left: inherit;margin-right: inherit;">
        <!-- wrapper -->
            <div class="header" style="width: 1504px;padding-left: 70px;">
              
                <div>
                    <h1>
                    	<a class="logo" href="customer-homepage.jsp">
							<img src="category/Waste-Mart-Logo.png" alt="Your logo" title="Your logo" style="height:70px; width:100px; margin-left:10px;" />
						</a> 
                    </h1>
                </div>
                <div class="bottom-menu-content" style="margin:auto;margin-right: 0px;margin-left: 228px;width: 1095px;">
                    <input type="checkbox" id="nav" />
                    <label for="nav" class="menu-bar"></label>
                    <nav>
                        <ul class="menu">
                            <li><a href="customer-homepage.jsp" style="color:#228B22;" class="link-nav">Home</a></li>
                            <li><a href="customer-aboutus.jsp" style="color:#228B22;" class="link-nav">About</a></li>
                             <li><a href="customer-service.jsp" style="color:#228B22;" class="link-nav">Services</a></li>
                              <li><a href="customer-catelog.jsp" style="color:#228B22;" class="link-nav">Rate Chart</a></li>
                            <li><a href="customer-contactus.jsp" style="color:#228B22;" class="link-nav">Contact Us</a></li>

                             <%
                             	int cnt=0;
                             	Connection connection=new DBUtil().getConnection();
                                String countItem="select * from  customer_cart where customerid=?";
                                PreparedStatement statement=connection.prepareStatement(countItem);
                                statement.setInt(1,(Integer)session.getAttribute("customerid"));
                                ResultSet result=statement.executeQuery();
                                while(result.next())
                                {
                                	cnt++;
                                }
                             %>
                             <li style="height: 60px;padding-top: 5px;">
                             	<a href="category.jsp?action&customerid=<%=session.getAttribute("customerid") %>" style="padding:12px; border-radius:5px;" class="request_bt">Raise Pickup Request</a>
                             </li>
                             <li style="padding-top:10px;">
                             <a href="cart.jsp">
                             	<span class="fa fa-lg fa-shopping-cart fa_custom"></span>
                             	<span id="cart_counticon" class="cart_counticon"><%=cnt %></span></a>
                             </li>
                             
                         	
                           <li style="float: right;height: 60px;margin-right: 37px;">
                           <label for="drop-3" class="toggle toogle-2"><img src="customer-images/<%=session.getAttribute("photo")%>"> <span class="fa fa-caret-down"
                                        aria-hidden="true"></span></label>
                                <a  class="link-nav dropdown-toggle"><img  class="pimage" src="customer-images/<%=session.getAttribute("photo")%>"  width="60" height="60"> </a>
                                <input type="checkbox" id="drop-3" />
                                <ul>
                                    <li><a href="CustomerRegistrationController?action=update&customerid=<%=session.getAttribute("customerid")%>" style="color:#228B22;"><i class='fas fa-user-edit'></i>&nbsp;&nbsp;Edit Profile</a></li>
                                    <li><a href="customer-resetpassword.jsp" style="color:#228B22;"><i class='fas fa-user-lock' ></i>&nbsp;&nbsp;Reset Password</a></li>
                                    <li><a href="customer-requeststatus.jsp" style="color:#228B22;">Request History</a></li>
                                    <li><a href="home.jsp" style="color:#228B22;">Logout</a></li>
                                  
                                </ul>
                           </li>
                    
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- //header -->
</div>
<!-- covers -->
<script>
	var cart_counter = document.getElementById("cart_counticon");
	console.log(cart_counter.innerHTML);
	if(cart_counter.innerHTML == "0"){
		document.getElementById("cart_counticon").style.display = 'none';
	}else{
		document.getElementById("cart_counticon").style.display = 'flex';
	} 
</script>
</body>
</html>