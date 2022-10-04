<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Company | Reset Password</title>
  <link rel="stylesheet" href="assets/css/style-freedom.css">
  <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
</head>
<body>
 <%@include file="company-header.jsp" %> 
 <!-- inner banner -->
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Login</h3>
                <li><a href="#">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Reset Password</li>              
            </ul>
        </div>
    </div>
</section>
<!-- //covers -->
 
<section class="w3l-form1">
	<div class="form">
			<div class="wrapper">
				<div class="form-content">
					<div class="form-left">
					
						<div class="middle">
							<h4>Company Reset Password</h4>

						</div>
						<form action="CompanyRegistrationController" method="post" class="signin-form">	
						
							<div  class="form-input">
								<label>Email</label>
								<input type="email" name="email" placeholder=""  required />
							</div>
							<div  class="form-input">
								<label>old password</label>
								<input type="text" name="oldpassword" placeholder=""   required />
							</div>
							<div  class="form-input">
								<label> New Password</label>
								<input type="password" name="newpassword" placeholder="" required />
							</div>
							<div  class="form-input">
								<label>Confirm Password</label>
								<input type="password" name="confirmpassword" placeholder="" required />
							</div>
							
							<button class="btn" name="btn" style="background:#228B22; color:#ffffff;" value="reset">Reset</button>
							
						</form>
					</div>
					
				</div>
			</div>
	</div>
</section>
</body>
</html>