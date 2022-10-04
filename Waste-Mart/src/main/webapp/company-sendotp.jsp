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
    <script type="text/javascript">
	function passwordValidation()
		{
		    var name=document.getElementById("p1").value;  	 			
			var regEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			var temp=regEx.test(name);
			if(name.length == 0){
					document.getElementById("nameerror").innerHTML="";
  					document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");
  					
			}else{  
 			 if(temp)
 			 {  	 					
 					document.getElementById("nameerror").innerHTML=" ";
 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;color:green;");  	 	  					 	  	 	  				
 	  				
 			 }
 			 else
 			{  	 					
 					document.getElementById("nameerror").innerHTML="  Password must contain atleast (eg. A,a,@,2) & 8 Character.";
 	  				document.getElementById("nameerror").style.visibility="visible";
 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  				  	 	  				
 	  				
 			}
			}
		}

</script>
  
</head>
<body>
<%@include file="company-header.jsp" %>
<!-- inner banner -->
<section class="w3l-inner-banner-main">
    <div class="about-inner">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Login</h3>
                <li><a href="index.jsp">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Login/Sign Up</li>
                
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
							<h4>Company Forgot Password</h4>

						</div>
						

						<form action="CompanyRegistrationController" method="post" class="signin-form">	
							<input type="hidden" name="checkotp" id="otp1" value="${otp }"/>
							<input type="hidden" name="email" value="${ email}"/>
							<div  class="form-input">
								<label>OTP</label>
								<input type="text" name="otp" id="otp2" placeholder="" required />
							</div>
							<div  class="form-input">
								<label>New Password</label>
								<input type="password" name="newpassword" id="p1" placeholder="" required onkeyup="passwordValidation()"/>
								<span id="nameerror" style="visibility:hidden"></span>
							</div>
							<div  class="form-input">
								<label>confirm  Password</label>
								<input type="password" name="confirmpassword" id="p2" placeholder="" required />
							</div>
							<span id="msg" style="visibility:hidden"></span>
							<span id="msg2" style="visibility:hidden"></span>
							
							<button class="btn" name="btn" value="verify" style="background:#228B22; color:#ffffff;" onclick="return submitValidation()">Update</button>
							
						</form>
					</div>
					
				</div>
			</div>
	</div>
</section>
<%@include file="footer.jsp" %>
<!-- //form -->
<script>

function submitValidation()
{
	//password validation
	 var password=document.getElementById("p1").value;  	 			
		var regEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
		var temp=regEx.test(password);
		if(password.length == 0)
		{
				document.getElementById("nameerror").innerHTML="Password can not be null";
				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
				return false;
		}
		else
		{  
		 	if(temp)
		 	{  	 					
				document.getElementById("nameerror").innerHTML="";
				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;color:green;");  	 	  					 	  	 	  				
				
		 	}
		 	else
			{  	 					
				document.getElementById("nameerror").innerHTML="  Password must contain atleast (eg. A,a,@,2) & 8 Character.";
				document.getElementById("nameerror").style.visibility="visible";
				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  				  	 	  				
				return false;
			}
		}
	//both password valiation
		var firstpassword=document.getElementById("p1").value;;
		var secondpassword=document.getElementById("p2").value;
		if(firstpassword==secondpassword)
		{
			document.getElementById("msg").innerHTML="";
			document.getElementById("msg").setAttribute("style","visibility: visible;font-size: 16px;color:green;");  	 	  					 	  	 	  				
		
		}
		else
		{
			document.getElementById("msg").innerHTML="Password and Confirm Password shoubld be match";
			document.getElementById("msg").style.visibility="visible";
			document.getElementById("msg").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  		
			return false;
		}
	//both otp should be same
	var otp1=document.getElementById("otp1").value;
	var otp2=document.getElementById("otp2").value;
	if(otp1==otp2)
	{
		document.getElementById("msg2").innerHTML="";
		document.getElementById("msg2").setAttribute("style","visibility: visible;font-size: 16px;color:green;");  	 	  					 	  	 	  				

	}
	else
	{
		document.getElementById("msg2").innerHTML="enter valid otp";
		document.getElementById("msg2").style.visibility="visible";
		document.getElementById("msg2").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  		
		return false;

	}

}

</script>

</body>
</html>