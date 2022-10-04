<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin | Login </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <!-- Place favicon.ico in the root directory -->
        <link rel="icon" href="../favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" type="text/css" href="css/app.css">
</head>
<body>
 <div class="auth">
            <div class="auth-container">
                <div class="card">
                    <header class="auth-header">
                        <h1 class="auth-title">
                            <div class="logo">
                                <span class="l l1"></span>
                                <span class="l l2"></span>
                                <span class="l l3"></span>
                                <span class="l l4"></span>
                                <span class="l l5"></span>
                            </div> Waste-Mart 
                        </h1>
                    </header>
                       
                    <div class="auth-content">
                        <p class="text-center">LOGIN TO CONTINUE</p>
                        <form method="post" action="../AdminLoginController" onsubmit="return submitValidation()">
                        	<div class="form-group">
                        		<label for="username">Email</label>
                                <input type="email" class="form-control underlined" name="username" id="username" placeholder="Your email address" required>
                        	</div>
                        	<div class="form-group has-error has-success">
                                <label for="password">Password</label>
                                <input type="password" id="password" class="form-control underlined" name="password" id="password" placeholder="Your password" onkeyup="passwordValidation()">
                                <span id="nameerror" style="visibility:hidden"></span>
                            </div>                            
                            <div class="form-group">
                                <button type="submit" class="btn btn-block btn-primary" name="btn" value="login">Login</button>
                            </div>
                     	</form>  
                    </div>                     
                </div>  
            </div>
        </div>
        <!-- Reference block for JS -->
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>
        <script>
        
        function submitValidation(){
        	var name = document.getElementById("password").value;        	
        	if(name.length == 0){
        		document.getElementById("nameerror").innerHTML="Please enter your password.";
	  			document.getElementById("nameerror").style.visibility="visible";
	  			document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  				  	 	  				
	  			document.getElementById("nameerror").classList.remove('fa-times');
	  			document.getElementById("nameerror").className = "has-error";
	  			return false;
        	}
        	else
       		{
        		var regEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	 			var temp=regEx.test(name);
	 			if(name.length == 0){
	 					document.getElementById("nameerror").innerHTML="";
 	  					document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");
 	  					document.getElementById("nameerror").classList.remove('fa','fa-check','fa-times');
 	  					return false;
	 			}else{  
	  	 			 if(temp)
	  	 			 {  	 					
	  	 					document.getElementById("nameerror").innerHTML="  Password is Success.";
	  	 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 18px;");  	 	  					 	  	 	  				
	  	 	  				document.getElementById("nameerror").className = "has-success fa fa-check";
	  	 			 }
	  	 			 else
	  	 			 {  	 					
	  	 					document.getElementById("nameerror").innerHTML="  Password must contain atleast (eg. A,a,@,2) & 8 Character.";
	  	 	  				document.getElementById("nameerror").style.visibility="visible";
	  	 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 18px;");  	 	  				  	 	  				
	  	 	  				document.getElementById("nameerror").className = "has-error fa fa-times";
	  	 	  				return false;
	  	 			 }
	 			}
       		}
        }
        <!-- Validation -->
	 		function passwordValidation()
	 		{
	 		    var name=document.getElementById("password").value;  	 			
	 			var regEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	 			var temp=regEx.test(name);
	 			if(name.length == 0){
	 					document.getElementById("nameerror").innerHTML="";
 	  					document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");
 	  					document.getElementById("nameerror").classList.remove('fa','fa-check','fa-times');
	 			}else{  
	  	 			 if(temp)
	  	 			 {  	 					
	  	 					document.getElementById("nameerror").innerHTML="  Password is Success.";
	  	 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 18px;");  	 	  					 	  	 	  				
	  	 	  				document.getElementById("nameerror").className = "has-success fa fa-check";
	  	 			 }
	  	 			 else
	  	 			 {  	 					
	  	 					document.getElementById("nameerror").innerHTML="  Password must contain atleast (eg. A,a,@,2) & 8 Character.";
	  	 	  				document.getElementById("nameerror").style.visibility="visible";
	  	 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 18px;");  	 	  				  	 	  				
	  	 	  				document.getElementById("nameerror").className = "has-error fa fa-times";
	  	 			 }
	 			}
	 		}
	 		<!------------->
	 		
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
</body>
</html>