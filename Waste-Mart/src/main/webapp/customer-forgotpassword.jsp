<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Home | Customer Forgotpassword</title>
  <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
  <link rel="stylesheet" href="assets/css/style-freedom.css">
</head>
<body>
<%@include file="header2.jsp" %>
<!-- inner banner -->
<section class="w3l-inner-banner-main">
    <div class="about-inner">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Login</h3>
                <li><a href="index.jsp">Customer <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li>Forgot Password</li>
            </ul>
        </div>
    </div>
</section>
<!-- //covers -->

<!-- form -->
<section class="w3l-form1">
	<div class="form">
			<div class="wrapper">
				<div class="form-content">
					<div class="form-left">
					
						<div class="middle">
							<h4>Reset Password Form</h4>

						</div>
						<form action="CustomerRegistrationController" method="post" class="signin-form">	
							<div  class="form-input">
								<label>No worries!! Just enter your email and we will send you a OTP for reset password.</label>
								<input type="email" name="email" placeholder="" required />
							</div>
							
							
							<button class="btn" style="background:#228B22; color:#ffffff;" name="btn" value="forgot" >Reset</button>
							
						</form>
					</div>
					
				</div>
			</div>
	</div>
</section>

<%@include file="footer.jsp" %>
<!-- //form -->
</body>
</html>