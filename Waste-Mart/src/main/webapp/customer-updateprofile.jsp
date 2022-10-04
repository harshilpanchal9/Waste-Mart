<%@page import="org.apache.tomcat.util.modeler.modules.ModelerSource"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  
  <title>Home | Customer Editprofile</title>
  <link rel="stylesheet" href="assets/css/style-freedom.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
    <script lang="javascript" type="text/javascript">
  <!-- String validation -->
		function nameValidation()
		{
		    var name=document.getElementById("firstname").value;  	 			
			var regEx = /^[a-zA-Z\s]*$/;
			var temp=regEx.test(name);
			  
 			 if(temp)
 			 {
 					document.getElementById("fname").innerHTML="";
 	  				document.getElementById("fname").setAttribute("style","visibility: visible;font-size: 16px;"); 
 	  				return true;
 			 }
 			 else
 			{
 					document.getElementById("fname").innerHTML="Please enter valid name.";
 	  				document.getElementById("fname").style.visibility="visible";
 	  				document.getElementById("fname").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  
 	  				return false;
 			}
			
		}
		function lnameValidation()
		{
		    var name=document.getElementById("lastname").value;  	 			
			var regEx = /^[a-zA-Z\s]*$/;
			var temp=regEx.test(name);
			
				 
 			 if(temp)
 			 {
 					document.getElementById("lname").innerHTML="";
 	  				document.getElementById("lname").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 	
 			}
 			 else
 			{
 					document.getElementById("lname").innerHTML="Please enter valid name.";
 	  				document.getElementById("lname").style.visibility="visible";
 	  				document.getElementById("lname").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  				
 			}
			
		}
  		function validatePhoneno()
  		{
  			var phoneno=document.getElementById("phoneno").value;
  			var regx = /^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$/;
  			if(regx.test(phoneno))
  			{
  				document.getElementById("vphoneno").innerHTML="";
  				document.getElementById("vphoneno").style.visibility="visible";
  				document.getElementById("vphoneno").style.color="green";
  				
  			}
  			else
  			{
  				document.getElementById("vphoneno").innerHTML="Your phoneno is not valid";
  				document.getElementById("vphoneno").style.visibility="visible";
  				document.getElementById("vphoneno").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  
  				
  			}
  			
  		}


  </script>
</head>
<body>
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
<%@include file="customer-header.jsp" %>
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Login</h3>
                <li><a href="index.jsp">Customer <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li>Login</li>
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
							<h4>Customer Editprofile</h4>
						</div>
				<form method="post" action="CustomerRegistrationController" class="signin-form" enctype="multipart/form-data">
								
							<div class="container">
    
  							  <div class="avatar-upload">
        							<div class="avatar-edit">
        								<input type="hidden" name="oldimage" value="${model.profilepicture}">
            							<input type="file"  name="photo" size="50" id="imageUpload" accept=".png, .jpg, .jpeg" />
            							<label for="imageUpload"></label>
        							</div>
        							<div class="avatar-preview">
        								<div id="imagePreview" style="background-image: url(customer-images/${model.profilepicture});"></div>
        							</div>
    						</div>
							</div>
							<input type="hidden" name="customerid" value="<%=session.getAttribute("customerid") %>" />
							<div  class="form-input">
								<label>First Name</label>
								<input type="text" name="firstname" id="firstname" placeholder="" required  value="${model.firstname }" onkeyup="nameValidation()"/>
								<span id="fname" style="visibility:hidden"></span>
							</div>
							<div  class="form-input">
								<label>Last Name</label>
								<input type="text" name="lastname" id="lastname" placeholder="" required value="${model.lastname }" onkeyup="lnameValidation()"/>
								<span id="lname" style="visibility:hidden"></span>
							</div>
							<div  class="form-input">
								<label>Phone No</label>
								<input type="text" name="phoneno" id="phoneno" placeholder="" required value="${model.phoneno }" onkeyup="validatePhoneno()"/>
								<span id="vphoneno" style="visibility:hidden"></span>
							</div>
							
							<div  class="form-input">
								<label>Email</label>
								<input type="email" name="email" placeholder=""  value="${model.email }" required />
							</div>
							
							
							<button type="submit" class="btn" name="btn" style="background:#228B22; color:#ffffff;" value="update" onclick="return submitValidation()">Update</button>
							
						</form>
					</div>
					
				</div>
			</div>
	</div>
</section>

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
		//fname validation
		var fname = document.getElementById("firstname").value;  	 			
  		var regEx = /^[a-zA-Z\s]*$/;
		var temp=regEx.test(fname);
		console.log(temp);
		if(fname.length == 0)
	 	{
			document.getElementById("fname").innerHTML="name can not be a empty.";
			document.getElementById("fname").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
			return false;
		}
	 else
	 {
			if(temp!=false)
			{
				document.getElementById("fname").innerHTML="";
  				document.getElementById("fname").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  				
			}
			else
			{
				document.getElementById("fname").innerHTML="name must be in a characters.";
  				document.getElementById("fname").style.visibility="visible";
  				document.getElementById("fname").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  						 	  				
	  				return false;		
			}
	}
	//lastname validation
		var lname = document.getElementById("lastname").value;  	 			
  		var regEx = /^[a-zA-Z\s]*$/;
		var temp2=regEx.test(lname);
		console.log(temp2);
		if(lname.length == 0)
	 	{
			document.getElementById("lname").innerHTML="name can not be a empty.";
			document.getElementById("lname").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
			return false;
		}
		else
	 	{
				if(temp2!=false)
				{
				document.getElementById("lname").innerHTML="";
  				document.getElementById("lname").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  				
				}
				else
				{
				document.getElementById("lname").innerHTML="name must be in a characters.";
  				document.getElementById("lname").style.visibility="visible";
  				document.getElementById("lname").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  						 	  				
	  				return false;		
				}
		}
	//phoneno validation
			var phoneno=document.getElementById("phoneno").value;
			var regx = /^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$/;
		var temp3=regx.test(phoneno);
		if(temp3)
		{
			document.getElementById("vphoneno").innerHTML="";
				document.getElementById("vphoneno").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  				
		}
		else
		{
			document.getElementById("vphoneno").innerHTML="Enter valid Phoneno";
				document.getElementById("vphoneno").style.visibility="visible";
				document.getElementById("vphoneno").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  					 			 	  					 	  				
				return false;

		}
}


</script>
</body>
</html>