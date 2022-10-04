<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    Zoner | Homepage
  </title>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="css/nucleo-icons.css" rel="stylesheet" />
  <link href="css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="js/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="css/material-dashboard2513.css?v=3.0.0" rel="stylesheet" />

</head>
<body>
<%@include file="dashboard.jsp" %>
<%
		String z_id = request.getParameter("zonerid");
		int zonerid=0;
		if(z_id != null){
			zonerid = Integer.parseInt(z_id);	
			session.setAttribute("zonerid",zonerid);
		}else{
			zonerid=(Integer)session.getAttribute("zonerid");
		}
		System.out.println("Zonerid: "+zonerid);
		String zonename="";
		String areaname="";
		Connection cn=new DBUtil().getConnection();
		String getarea="select * from zoner_signup where zonerid=?";
		PreparedStatement st=cn.prepareStatement(getarea);
		st.setInt(1, zonerid);
		ResultSet rs=st.executeQuery();
		while(rs.next())
		{
			zonename=rs.getString(7);
			areaname=rs.getString(8);
		}
		String getPending="select * from customer_request where zonename=? and zonearea=? and status=?";
		int pending=0,completed=0;
		st=cn.prepareStatement(getPending);
		st.setString(1,zonename);
		st.setString(2,areaname);
		st.setString(3,"Pending");
		rs=st.executeQuery();
		while(rs.next())
		{
			pending++;
		}
		String getcompleted="select * from customer_request where zonename=? and zonearea=? and status=?";
		st=cn.prepareStatement(getcompleted);
		st.setString(1,zonename);
		st.setString(2,areaname);
		st.setString(3,"Completed");
		rs=st.executeQuery();
		while(rs.next())
		{
			completed++;
		}

		cn.close();
%>
 <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
   <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
          </ol>
          <h6 class="font-weight-bolder mb-0"></h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group input-group-outline"></div>
          </div>
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </a>
            </li>
            <li class="nav-item dropdown pe-2 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body font-weight-bold p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-user me-sm-1 cursor-pointer"></i>
                <span class="d-sm-inline d-none">Sign In</span>

              </a>
              <ul class="dropdown-menu  dropdown-menu-end  px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="profile.jsp">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <i  class=" fas fa-user avatar avatar-sm   me-3 " style="color:#e91e63;font-size:20px;"></i>
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold"></span>Edit Profile
                        </h6>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="../zoner-login.jsp">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <i  class=" fa fa-sign-out avatar avatar-sm  me-3 " style="color:#e91e63;font-size:20px;"></i>
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold"></span>Logout
                        </h6>
                      </div>
                    </div>
                  </a>
                </li>

              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
 
 <div class="container-fluid py-4">
 	              <div class="col-xl-6">
              <div class="row">
                <div class="col-md-6 col-6">
                  <div class="card">
                    <div class="card-header mx-4 p-3 text-center">
                      <div class="icon icon-shape icon-lg bg-gradient-primary shadow text-center border-radius-lg">
                        <i class="material-icons opacity-10">account_balance</i>
                      </div>
                    </div>
                    <div class="card-body pt-0 p-3 text-center">
                      <h6 class="text-center mb-0">Pending Request</h6>
                      <hr class="horizontal dark my-3">
                      <h5 class="mb-0"><%=pending %></h5>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-6">
                  <div class="card" style="cursor:pointer;" onclick="callCompletepage()">
                    <div class="card-header mx-4 p-3 text-center">
                      <div class="icon icon-shape icon-lg bg-gradient-primary shadow text-center border-radius-lg">
                        <i class="material-icons opacity-10">account_balance_wallet</i>
                      </div>
                    </div>
                    <div class="card-body pt-0 p-3 text-center">
                      <h6 class="text-center mb-0">Completed Request</h6>
                      <hr class="horizontal dark my-3">
                      <h5 class="mb-0"><%=completed %></h5>
                    </div>
                  </div>
                </div>
              </div>
            </div>
 	  	<br><br>
      <div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">Customer Request</h6>
              </div>
            </div>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Request ID</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Customerid</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Address</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">PhoneNo</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Quantity</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">GrandTotal</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">PaymentMode</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">PickupDate</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                   	  <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Payment</th>
                   	  </tr>
                  </thead>
                  <tbody>
                  <%
                  	String date=java.time.LocalDate.now().toString();
                  System.out.println("date="+date);
                  	System.out.println("Zonename: "+zonename);
                  	System.out.println("Zonearea: "+areaname);
                  		cn=new DBUtil().getConnection();
                  		String qry="select * from customer_request where zonename=? and zonearea=? and status=? and pickupdate=?";
                  		st=cn.prepareStatement(qry);
                  		st.setString(1,zonename);
                  		st.setString(2,areaname);
                  		st.setString(3,"Pending");
                  		st.setString(4,date);
                  		rs=st.executeQuery();
                  		if(!rs.first())
                  		{
                  		%>
                  			<tr rowspan=10 style="text-align:center; font-size: 17px;">
                  				<td colspan=10 style="padding-top:15px;">
                  					Woo hoo!!! No any request remaining.
                  				</td>
                  			</tr>
                  		<%
                  		}
                  		rs.relative(-1);
                  		while(rs.next())
                  		{
                  %>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm"><%=rs.getInt(1) %></h6>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0"><%=rs.getInt(2) %></p>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%=rs.getString(3) %></span>
                      </td>
                       <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%=rs.getString(4) %></span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%=rs.getString(7) %></span>
                      </td>
                       <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%=rs.getString(8) %></span>
                      </td>
                       <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%=rs.getString(9) %></span>
                      </td>
                       <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%=rs.getString(10) %></span>
                      </td>

                      <td class="align-middle text-center text-sm">
                   	  <button class="badge badge-sm bg-gradient-success" style="pointer-events: none;"><%=rs.getString(12) %></button>
                      </td>
                      <%
                      		if(rs.getString(9).equalsIgnoreCase("online"))
                      		{
                      %>
                      <form action = "../UserZonerController" method="post">
                      		<input type="hidden" name="requestid" value="<%=rs.getInt(1)%>">
                      		<input type="hidden" name="zonerid" value="<%=zonerid%>">
                      		<input type="hidden" name="custid" value="<%=rs.getInt(2) %>">
                      		<td class="align-middle text-center text-sm">
                      			<button type="submit" name="btn" value="payment" class="badge badge-sm bg-gradient-success">Continue to payment</button>
                      		</td>
                      </form>
                      <%
                  		  }
                      	  else
                      	  {
                      %>
                       <form action = "../CustomerRegistrationController" method="post">
                      		<input type="hidden" name="requestid" value="<%=rs.getInt(1)%>">
                      		<input type="hidden" name="zonerid" value="<%=zonerid%>">
                      		<input type="hidden" name="custid" value="<%=rs.getInt(2) %>">
                      		<td class="align-middle text-center text-sm">
                      			<button type="submit" name="btn" value="updatestatus" class="badge badge-sm bg-gradient-success">Update Status </button>
                      		</td>
                      </form>
                      
                      <%  
                      	  }
                      			
                      	
                      %>
                    </tr>
                    <%
                  		}
                    	cn.close();
                    %>
                    <!-- 1 table row -->
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   </main>
   <script>
   		var element = document.getElementById("zonehomepage");
   		element.classList.add("bg-gradient-primary");
   		var element1 = document.getElementById("zonehomepage");
   		element1.classList.add("active");
   		
   		function callCompletepage()
   		{
   			window.location.href = "worklist.jsp";
   		}
   </script>
 <!--   Core JS Files   -->
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/perfect-scrollbar.min.js"></script>
  <script src="js/smooth-scrollbar.min.js"></script>
   <!-- Github buttons -->
  <script async defer src="js/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="js/material-dashboard.min2513.js?v=3.0.0"></script>

</body>
</html>