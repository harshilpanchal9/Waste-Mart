<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  
  <title>Home | Company Editprofile</title>
   <link rel="stylesheet" href="assets/css/style-freedom.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
</head>
<style>
.avatar-upload {
  position: relative;
  max-width: 205px;
  margin: 50px auto;
}
.avatar-upload .avatar-edit {
  position: absolute;
  right: 12px;
  z-index: 1;
  top: 10px;
}
.avatar-upload .avatar-edit input {
  display: none;
}
.avatar-upload .avatar-edit input + label {
  display: inline-block;
  width: 34px;
  height: 34px;
  margin-bottom: 0;
  border-radius: 100%;
  background: #FFFFFF;
  border: 1px solid transparent;
  box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
  cursor: pointer;
  font-weight: normal;
  transition: all 0.2s ease-in-out;
}
.avatar-upload .avatar-edit input + label:hover {
  background: #f1f1f1;
  border-color: #d6d6d6;
}

.avatar-upload .avatar-edit input + label:after {
  content: "\f040";
  font-family: 'FontAwesome';
  color: #757575;
  position: absolute;
  top: 10px;
  left: 0;
  right: 0;
  text-align: center;
  margin: auto;
}
.avatar-upload .avatar-preview {
  width: 192px;
  height: 192px;
  position: relative;
  border-radius: 100%;
  border: 6px solid #F8F8F8;
  box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
}

.avatar-upload .avatar-preview > div {
  width: 100%;
  height: 100%;
  border-radius: 100%;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}

</style>
<body>
<%@include file="company-header.jsp" %>
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Login</h3>
                <li><a href="index.jsp">Company <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Login</li>
                
            </ul>
        </div>
    </div>
</section>

<section class="w3l-form1">
	<div class="form">
			<div class="wrapper">
				<div class="form-content">
					<div class="form-left">
					
						<div class="middle">
							<h4>Company Editprofile</h4>

						</div>
							<form method="post" action="CompanyRegistrationController" class="signin-form" enctype="multipart/form-data">
								
							<input type="hidden" name="companyid" value="<%=session.getAttribute("companyid") %>" />
							
							<div class="container">
    
  							  <div class="avatar-upload">
        							<div class="avatar-edit">
        								<input type="hidden" name="oldimage" value="${model.profile}">
            							<input type="file"  name="photo" size="50" id="imageUpload" accept=".png, .jpg, .jpeg" />
            							<label for="imageUpload"></label>
        							</div>
        							<div class="avatar-preview">
            							<div id="imagePreview" style="background-image: url(company-images/${model.profile});"></div>
        							</div>
    						</div>
							</div>
						
							<div  class="form-input">
								<label>Company Name</label>
								<input type="text" name="name" placeholder="" required  value="${model.name }"/>
							</div>
							<div  class="form-input">
								<label>Phone No</label>
								<input type="text" name="phoneno" placeholder="" required value="${model.phoneno }" />
							</div>
							<div  class="form-input">
								<label>Email</label>
								<input type="email" name="email" placeholder=""  value="${model.email }" required />
							</div>
							
							<button type="submit" class="btn" name="btn" value="update" style="background:#228B22; color:#ffffff;">Update</button>
							
						</form>
						</div>
					
				</div>
			</div>
	</div>
</section>
</body>
<script>
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#imagePreview').css('background-image', 'url('+e.target.result +')');
            $('#imagePreview').hide();
            $('#imagePreview').fadeIn(650);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#imageUpload").change(function() {
    readURL(this);
});

</script>
</html>