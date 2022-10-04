<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Home | Company-Forgotpassword</title>
  <link rel="stylesheet" href="assets/css/style-freedom.css">
  <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
</head>
<body>
<%@include file="header2.jsp" %>
<!-- inner banner -->

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
						<form action="CompanyRegistrationController" method="post" class="signin-form">	
							<div  class="form-input">
								<label>No worries!! Just enter your email and we will send you a OTP for reset password.</label>
								<input type="email" name="email" placeholder="" required />
							</div>
							
							
							<button class="btn" name="btn" value="forgot" style="background:#228B22; color:#ffffff;">Reset</button>
							
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