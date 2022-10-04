<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Home | Company-registration</title>
  <link rel="stylesheet" href="assets/css/style-freedom.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
  <script lang="javascript" type="text/javascript">
  function nameValidation()
	{
	    var name=document.getElementById("companyname").value;  	 			
		var regEx = /^[a-zA-Z\s]*$/;
		var temp=regEx.test(name);
		if(name.length == 0){
			document.getElementById("companynameerror").innerHTML="";
			document.getElementById("companynameerror").setAttribute("style","visibility: visible;font-size: 16px;");
		}else{  
			 if(temp)
			 {
					document.getElementById("companynameerror").innerHTML="";
	 				document.getElementById("companynameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 	
			 }
			 else
			{
					document.getElementById("companynameerror").innerHTML="Please enter valid name.";
	 				document.getElementById("companynameerror").style.visibility="visible";
	 				document.getElementById("companynameerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  				
			}
		}
	}
  	function passwordValidation()
	{
	    var name=document.getElementById("password").value;  	 			
		var regEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
		var temp=regEx.test(name);
		if(name.length == 0){
			document.getElementById("passworderror").innerHTML="";
			document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 16px;");	  					
		}else{  
			 if(temp)
			 {  	 					
				document.getElementById("passworderror").innerHTML=" ";
 				document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 16px;color:green;");  	 	  					 	  	 	  					 	  				
			 }
			 else
			{  	 					
				document.getElementById("passworderror").innerHTML="  Password must contain atleast (eg. A,a,@,2) & 8 Character.";
 				document.getElementById("passworderror").style.visibility="visible";
 				document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  				  	 	  					 	  				
			}
		}
	}
	function validatePhoneno()
	{
		var phoneno=document.getElementById("phoneno").value;
		var regx = /^(?:(?:\+|0{0,2})91(\s*|[\-])?|[0]?)?([6789]\d{2}([ -]?)\d{3}([ -]?)\d{4})$/;
		var temp = regEx.test(phoneno); 
		if(phoneno.length == 0)
			{
				document.getElementById("phonenoerror").innerHTML="";
				document.getElementById("phonenoerror").style.visibility="visible";
				document.getElementById("phonenoerror").style.color="green";
			}
		else{
				if(temp)
				{
					document.getElementById("phonenoerror").innerHTML="";
					document.getElementById("phonenoerror").style.visibility="visible";
					document.getElementById("phonenoerror").style.color="green";				
				}
				else
				{
					document.getElementById("phonenoerror").innerHTML="Your phoneno is not valid";
					document.getElementById("phonenoerror").style.visibility="visible";
					document.getElementById("phonenoerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  
				} 
			}		 			
	}
</script>
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
<%@include file="header2.jsp" %>
<!-- inner banner -->
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Login</h3>
                <li><a href="index.jsp">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Sign Up</li>              
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
						<h4>Company Registration</h4>
					</div>
					<form action="CompanyRegistrationController" method="post" class="signin-form" onsubmit="return submitValidation()" enctype="multipart/form-data">	
					<div class="container">
					<div class="avatar-upload">
					    <div class="avatar-edit">
				      		<input type="hidden" name="oldimage" value="male_user.png" >
				            <input type="file" name="photo" size="50" id="imageUpload" accept=".png, .jpg, .jpeg" />
				            <label for="imageUpload"></label>
					    </div>
					    <div class="avatar-preview">
					        <div id="imagePreview" style="background-image: url(company-images/male_user.png);"></div>
					    </div>
					   </div>
					</div>
			
						<div  class="form-input">
							<label>Company Name</label>
							<input type="text" name="name" id="companyname" placeholder="" onkeyup="nameValidation()" />
							<span id="companynameerror" style="visibility:hidden"></span>
						</div>
						<div  class="form-input">
							<label>Phone No</label>
							<input type="text" id="phoneno" name="phoneno" placeholder="" onkeyup="validatePhoneno()"/>
							<span id="phonenoerror" style="visibility:hidden"></span>
						</div>
						<div  class="form-input">
							<label>Email</label>
							<input type="email" id="email" name="email" placeholder="" onkeyup = "emailValidation()"/>
							<span id="emailerror" style="visibility:hidden"></span>
						</div>
						<div  class="form-input">
							<label>Password</label>
							<input type="password" name="password" id="password" placeholder=""  onkeyup="passwordValidation()"/>
							<span id="passworderror" style="visibility:hidden"></span>
						</div>	
						<label class="container" style="color:#228B22;text-align:center;padding-left:0px;"><a style="color:#228B22;" href="company-login.jsp" >Already Have an Account?</a>
								
							</label>
						<button  class="btn" style="background:#228B22; color:#ffffff;" name="btn" value="registration">Registration</button>						
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="footer.jsp" %>
<!-- //form -->

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
function submitValidation()
{
	 var cname = document.getElementById("companyname").value; 
	 var phoneno=document.getElementById("phoneno").value;
	 var password=document.getElementById("password").value; 
	 var email=document.getElementById("email").value;
	 var image = document.getElementById("imageUpload");
	 if(cname.length == 0 || phoneno.length == 0 || password.length == 0  || email.length == 0)
	 {
			//company name
		 	if(cname.length == 0){
			document.getElementById("companynameerror").innerHTML="Please Enter Company Name.";
			document.getElementById("companynameerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
		 	}
			//phoneno
			if(phoneno.length == 0){
			document.getElementById("phonenoerror").innerHTML="Please Enter Phoneno.";
			document.getElementById("phonenoerror").style.visibility="visible";
			document.getElementById("phonenoerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  					 			 	  					 	  				
			}
			//password
			if(password.length == 0){
			document.getElementById("passworderror").innerHTML="Password can not be null.";
			document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
			}
			//email
			if(email.length == 0){
			document.getElementById("emailerror").innerHTML="Please Enter email.";
			document.getElementById("emailerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
			}
			return false;
	 }
		//fname validation
		 	 			
	var regEx = /^[a-zA-Z\s]*$/;
	var temp=regEx.test(cname);
	console.log(temp);
	if(cname.length == 0)
 	{
		document.getElementById("companynameerror").innerHTML="Please Enter Company Name";
		document.getElementById("companynameerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
		return false;
	}
	 else
	 {
			if(temp!=false)
			{
				document.getElementById("companynameerror").innerHTML="";
  				document.getElementById("companynameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  				
			}
			else
			{
				document.getElementById("companynameerror").innerHTML="Company name must be in a characters.";
  				document.getElementById("companynameerror").style.visibility="visible";
  				document.getElementById("companynameerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  						 	  				
	  			return false;		
			}
	}

	//phoneno validation
			
		var regx = /^(?:(?:\+|0{0,2})91(\s*|[\-])?|[0]?)?([6789]\d{2}([ -]?)\d{3}([ -]?)\d{4})$/;
		var temp3=regx.test(phoneno);
		console.log(temp3);
		if(phoneno.length==0)
		{
				document.getElementById("phonenoerror").innerHTML="Please Enter Phoneno.";
				document.getElementById("phonenoerror").style.visibility="visible";
				document.getElementById("phonenoerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  					 			 	  					 	  				
				return false;
		}
		else
		{
			if(temp3!=false)
			{
				document.getElementById("phonenoerror").innerHTML="";
				document.getElementById("phonenoerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  				
			}
			else
			{
				document.getElementById("phonenoerror").innerHTML="Enter valid Phoneno";
				document.getElementById("phonenoerror").style.visibility="visible";
				document.getElementById("phonenoerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  					 			 	  					 	  				
				return false;
			}
		}
		
	//password validation
		   	 			
			var regEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			var temp1=regEx.test(password);
			if(password.length == 0)
			{
					document.getElementById("passworderror").innerHTML="Password can not be null";
					document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
					return false;
		}
		else
		{  
			 	if(temp1!=false)
			 	{  	 					
					document.getElementById("passworderror").innerHTML="";
	  				document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 16px;color:green;");  	 	  					 	  	 	  				
	  				
			 	}
			 	else
				{  	 					
					document.getElementById("passworderror").innerHTML="  Password must contain atleast (eg. A,a,@,2) & 8 Character.";
	  				document.getElementById("passworderror").style.visibility="visible";
	  				document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  				  	 	  				
	  				return false;
				}
		} 
}
function emailValidation()
{
	document.getElementById("emailerror").innerHTML="";
}
</script>
</body>
</html>