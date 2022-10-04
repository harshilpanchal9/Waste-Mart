<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    Zoner | worklist
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
		int zonerid=(Integer)session.getAttribute("zonerid");
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
		cn.close();
%>
 <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">

 <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">Completed Request</h6>
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
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Zone Name</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Zone Area</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Quantity</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">GrandTotal</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">PaymentMode</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">PickupDate</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                   	  </tr>
                  </thead>
                  <tbody>
                  <%
                  		cn=new DBUtil().getConnection();
                  		String qry="select * from customer_request where zonename=? and zonearea=? and status=?";
                  		st=cn.prepareStatement(qry);
                  		st.setString(1,zonename);
                  		st.setString(2,areaname);
                  		st.setString(3,"Completed");
                  		rs=st.executeQuery();
                  		if(!rs.first())
                  		{
                  			%>
                  			<tr rowspan=11 style="text-align:center; font-size: 17px;">
	              				<td colspan=11 style="padding-top:15px;">
	              					No any request complete &nbsp;:&nbsp;(
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
                        <span class="text-secondary text-xs font-weight-bold"><%=rs.getString(5) %></span>
                      </td>
                       <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%=rs.getString(6) %></span>
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
                   	  <a href="../UserZonerController?action=updatestatus&requestid=<%=rs.getInt(1) %>"><button class="badge badge-sm bg-gradient-success"><%=rs.getString(12) %></button></a>
                       <%--  <span class="badge badge-sm bg-gradient-success"><%=rs.getString(11) %></span> --%>
                      </td>
                     
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
   		var element = document.getElementById("worklist");
		element.classList.add("bg-gradient-primary");
		var element1 = document.getElementById("worklist");
   		element1.classList.add("active");
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