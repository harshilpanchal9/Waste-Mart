<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Customer | Reset Password</title>
  <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
  <link rel="stylesheet" href="assets/css/style-freedom.css">
</head>
<script type="text/javascript">
		function matchpass()
		{
			var firstpassword=document.getElementById("p1").value;;
			var secondpassword=document.getElementById("p2").value;
 			var regEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			var checkp1=regEx.test(firstname);
			var checkp2=regEx.test(secondname);
			alert(checkp1+" "+checkp2)
			if(firstpassword==secondpassword)
			{
				if((checkp1==true)&&(checkp1==true))
				{
					return true;
				}
				else
				{
					document.getElementById("msg").innerHTML=" Password must contain atleast (eg. A,a,@,2) & 8 Character.";
					document.getElementById("msg").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
					return false;
					
				}
			}
			else
			{
				
				document.getElementById("msg").innerHTML="New password and confirm password should be same";
				document.getElementById("msg").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
				return false;
			}
		}
		function passwordValidation()
		{
		    var name=document.getElementById("p1").value;  	 			
			var regEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			var temp=regEx.test(name);
			if(name.length == 0)
			{
					document.getElementById("nameerror").innerHTML="";
  					document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");
  					
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
 	  				
 				}
			}
		}

</script>
<body>
<%@include file="customer-header.jsp" %>
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Customer Reset Password</h3>
                <li><a href="index-2.html">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Customer Reset Password</li>
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
							<h4>Customer Reset Password</h4>

						</div>
						<form action="CustomerRegistrationController" method="post" class="signin-form" onsubmit="">	
						
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
								<input type="password" name="newpassword" id="p1" placeholder="" required onkeyup="passwordValidation()" />
								
							</div>
							<div  class="form-input">
								<label>Confirm Password</label>
								<input type="password" name="confirmpassword" id="p2"  placeholder="" required onkeyup="matchpass()" />
							</div>
							<span id="nameerror"></span>
							<span id="msg" style="visibility:hidden"></span>
							<button class="btn" name="btn" style="background:#228B22; color:#ffffff;" value="reset" onclick="return submitValidation()">Reset</button>
							
						</form>
					</div>
					
				</div>
			</div>
	</div>
</section>
<script>
	function submitValidation()
	{
		//password validation
		 var password=document.getElementById("p1").value;  	 			
			var regEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			var temp=regEx.test(password);
			if(password.length == 0)
			{
					document.getElementById("nameerror").innerHTML="Please Enter Password";
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


	}

</script>
</body>
</html>