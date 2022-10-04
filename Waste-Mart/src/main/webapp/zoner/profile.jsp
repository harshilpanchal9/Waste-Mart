<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
    Zoner | Zoner Profile
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
<body class="g-sidenav-show bg-gray-200">
<%@include file="dashboard.jsp" %>

 <div class="main-content position-relative bg-gray-100 max-height-vh-100 h-100">
    <!-- Navbar -->
    <!-- End Navbar -->
    <div class="container-fluid px-2 px-md-4">
      <div class="page-header min-height-300 border-radius-xl mt-4" style="background-image: url('https://images.unsplash.com/photo-1531512073830-ba890ca4eba2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;ixlib=rb-1.2.1&amp;auto=format&amp;fit=crop&amp;w=1920&amp;q=80');">
        <span class="mask  bg-gradient-primary  opacity-6"></span>
      </div>
      <div class="card card-body mx-3 mx-md-4 mt-n6">
        <div class="row gx-4 mb-2">
          <div class="col-auto">
          <%
        	int zonerid = (Integer)session.getAttribute("zonerid");
        	Connection cn = new DBUtil().getConnection();
        	String qry = "select * from zoner_signup where zonerid=?";
        	PreparedStatement st=cn.prepareStatement(qry);
        	st.setInt(1,zonerid);
        	ResultSet rs=st.executeQuery();
        	if(rs.next())
        	{
        %>
            <div class="avatar position-relative" style="width:97px;height:74px;">
              <img src="../zoner-images/<%=rs.getString(11) %>" alt="profile_image" class="w-100 border-radius-lg shadow-sm">
            </div>
          </div>
          <div class="col-auto my-auto">
            <div class="h-100">
              <h5 class="mb-1">
                
              </h5>
              <p class="mb-0 font-weight-normal text-sm">
                
              </p>
            </div>
          </div>
        </div>
        
        <form method="post" action="../UserZonerController" enctype="multipart/form-data">
        <div class="row">
          <div class="row">
            <div class="col-12 col-xl-12">
              <div class="card card-plain h-100">
                <div class="card-body p-3">
                  <ul class="list-group">
                  </ul>
                  <h6 class="text-uppercase text-body text-xs font-weight-bolder mt-4"></h6>
                  <ul class="list-group">
                  <!-- zoner info -->
				            <input type="hidden" name="zonerid" value="<%=rs.getInt(1) %>" class="form-control"/>
                    <li class="list-group-item border-0 px-0">
                      <div class="ms-md-auto pe-md-3 d-flex align-items-center">
	                     <div class="input-group input-group-outline is-filled focused is-focused">
				            <label class="form-label">First name</label>
				            <input type="text" name="firstname" value="<%=rs.getString(2) %>" class="form-control">
				         </div>
                      </div>
                    </li>
                    <li class="list-group-item border-0 px-0">
                      <div class="ms-md-auto pe-md-3 d-flex align-items-center">
	                     <div class="input-group input-group-outline is-filled focused is-focused">
				            <label class="form-label">Last name</label>
				            <input type="text" name="lastname"  value="<%=rs.getString(3) %>" class="form-control">
				         </div>
                      </div>
                    </li>
                    <li class="list-group-item border-0 px-0">
                      <div class="ms-md-auto pe-md-3 d-flex align-items-center">
	                     <div class="input-group input-group-outline is-filled focused is-focused">
				            <label class="form-label">Email</label>
				            <input type="text" name="email" value="<%=rs.getString(6) %>" class="form-control">
				         </div>
                      </div>
                    </li>
                    <li class="list-group-item border-0 px-0">
                      <div class="ms-md-auto pe-md-3 d-flex align-items-center">
	                     <div class="input-group input-group-outline is-filled focused is-focused">
				            <label class="form-label">Phone number</label>
				            <input type="text" name="phoneno" value="<%=rs.getString(5) %>" class="form-control">
				         </div>
                      </div>
                    </li>
                    <li class="list-group-item border-0 px-0">
                      <div class="ms-md-auto pe-md-3 d-flex align-items-center">
	                     <div class="input-group input-group-outline is-filled focused is-focused">
				            <label class="form-label">Address</label>
				            <input type="text"  name="address" value="<%=rs.getString(4) %>" class="form-control">
				         </div>
                      </div>
                    </li>
                    <li class="list-group-item border-0 px-0" style="margin-right: auto;margin-left: auto;">
                      <div class="ms-md-auto pe-md-3 d-flex align-items-center">
	                     <div class="input-group input-group-outline is-filled focused is-focused">				            
				            <input type="submit" class="btn btn-outline-primary btn-sm mb-0" name="btn" value="Update" style="width: 300px;font-size: 15px;">
				         </div>
                      </div>
                    </li>                    
                    <!-- Complete zoner info -->
                  </ul>
                </div>
              </div>
            </div>
      
          </div>
        </div>
        </form>
        <%
        	}
        	cn.close();
        %>
      </div>
    </div>
    <footer class="footer py-4  ">
      <div class="container-fluid">
        <div class="row align-items-center justify-content-lg-between">
       
          <div class="col-lg-6">
            <ul class="nav nav-footer justify-content-center justify-content-lg-end">
            </ul>
          </div>
        </div>
      </div>
    </footer>
  </div>
  <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="material-icons py-2">settings</i>
    </a>
    <div class="card shadow-lg">
      <div class="card-header pb-0 pt-3">
        <div class="float-start">
          <h5 class="mt-3 mb-0">Material UI Configurator</h5>
          <p>See our dashboard options.</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="material-icons">clear</i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">Sidebar Colors</h6>
        </div>
        <a href="javascript:void(0)" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">Sidenav Type</h6>
          <p class="text-sm">Choose between 2 different sidenav types.</p>
        </div>
        <div class="d-flex">
          <button class="btn bg-gradient-dark px-3 mb-2 active" data-class="bg-gradient-dark" onclick="sidebarType(this)">Dark</button>
          <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-transparent" onclick="sidebarType(this)">Transparent</button>
          <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
        <!-- Navbar Fixed -->
        <hr class="horizontal dark my-3">
        <div class="mt-2 d-flex">
          <h6 class="mb-0">Light / Dark</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
          </div>
        </div>
        <hr class="horizontal dark my-sm-4">
        <a class="btn btn-outline-dark w-100" href="#">View documentation</a>
        <div class="w-100 text-center">
          <a class="github-button" href="https://github.com/creativetimofficial/material-dashboard" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star creativetimofficial/material-dashboard on GitHub">Star</a>
          <h6 class="mt-3">Thank you for sharing!</h6>
          <a href="https://twitter.com/intent/tweet?text=Check%20Material%20UI%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fsoft-ui-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
          </a>
          <a href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/material-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
          </a>
        </div>
      </div>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/perfect-scrollbar.min.js"></script>
  <script src="js/smooth-scrollbar.min.js"></script>
  <script>
  
  		var element = document.getElementById("zonehomepage");
		element.classList.add("bg-gradient-primary");
		var element1 = document.getElementById("zonehomepage");
		element1.classList.add("active");
  
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="js/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="js/material-dashboard.min2513.js?v=3.0.0"></script>
</body>
</html>