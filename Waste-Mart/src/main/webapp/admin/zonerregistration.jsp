<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin | Zoner Registration </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
        <!-- Place favicon.ico in the root directory -->
        <link rel="icon" href="../favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="<%application.getContextPath(); %>/Waste-Mart/admin/css/vendor.css">
        <link rel="stylesheet" type="text/css" href="<%application.getContextPath(); %>/Waste-Mart/admin/css/app.css">
       <style>
.avatar-upload {
  position: relative;
  max-width: 205px;
  margin: 50px auto;
}
.avatar-upload .avatar-edit {
  position: absolute;
  right: 40px;
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
  top: 7px;
  left: 0;
  right: 0;
  text-align: center;
  margin: auto;
}
.avatar-upload .avatar-preview {
  width: 170px;
  height: 170px;
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

.btn-warning{
	position:relative;
	padding:11px 16px;
	font-size:15px;
	line-height:1.5;
	border-radius:3px;
	color:#fff;
	background-color:#d2a213;
	border:0;
	overflow:hidden;
	transition:0.2s;
}

.btn-warning input[type="file"]{
	cursor:pointer;
	position:absolute;
	left: 0%;
	top: 0%;
	transform:scale(5);
	opacity:0;
}


.btn-warning:hover{
	background-color:#d9a400;
}

</style>
</head>
<body>
<div class="main-wrapper">
            <div class="app" id="app">
            	<!-- Header -->
            	<%@ include file="header.jsp" %>
            	
            	<!-- Sidebar -->
            	<%@ include file="sidebar.jsp" %>
            	
            	<!--  content  -->
        		<div class="sidebar-overlay" id="sidebar-overlay"></div>
                <div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
                <div class="mobile-menu-handle"></div>
                <article class="content items-list-page">
                    <div class="title-search-block">
                        <div class="title-block">
                            <h3 class="title"> Zoner Registration                                      
                                <a href="zonerviewregistration.jsp"><i class="fa fa-times" style="position: absolute;right: 3%;"></i></a>
                            </h3>
                        </div>
               		<section class="section">
                        <div class="row sameheight-container" style="width:68%;margin-left:auto;margin-right:auto;">
                            <div class="col-sm-12" style="display:flex;justify-content: center;">
                                <div class="card card-block" style="width:100%;">
                                    <form method="post" action="../UserZonerController" class="signin-form" onsubmit="return submitValidation()" enctype="multipart/form-data">
                                    	<div class="container">
			    							<div class="avatar-upload">
			        							<div class="avatar-edit">
			        								<input type="hidden" name="oldimage" value="male_user.png">
			           								<input type="file" name="photo" size="50" id="imageUpload" accept=".png, .jpg, .jpeg" />
			         		   						<label for="imageUpload"></label>
			       	 							</div>
			        							<div class="avatar-preview">
			            							<div id="imagePreview" style="background-image: url(../zoner-images/male_user.png);"></div>
			        							</div>
			    							</div>
										</div>
                                     	<div id="divfname" class="form-group">
                                            <label for="exampleInputEmail1">First name</label>
                                            <input type="text" id="fname" class="form-control underlined" name="firstname"  onkeyup="firstNameValidation()">
                                        	<span class="has-error" id="fnameerror" style="visibility:hidden"></span>
                                        </div>
                                        <div id="divlname" class="form-group">
                                            <label for="exampleInputEmail1">Last name</label>
                                            <input type="text" id="lname" class="form-control underlined" name="lastname"  onkeyup="lastNameValidation()" >
                                            <span class="has-error" id="lnameerror" style="visibility:hidden"></span>
                                        </div>
                                         <div id="divaddress" class="form-group">
                                            <label for="exampleInputEmail1">Address</label>
                                            <textarea id="address" rows="3" class="form-control underlined" name="address"  onkeyup="removevalidation()"></textarea>
                                            <span class="has-error" id="addresserror" style="visibility:hidden"></span>
                                        </div>
                                         <div id="divphone" class="form-group">
                                            <label for="exampleInputEmail1">Phone Number</label>
                                            <input type="text" id="phone" class="form-control underlined" name="phoneno"  onkeyup="phoneValidation()">
                                            <span class="has-error" id="phoneerror" style="visibility:hidden"></span>
                                        </div>
                                        <div id="divemail" class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input type="email" id="email" class="form-control underlined" name="email" onkeyup="emailValidation()">
                                            <span class="has-error" id="emailerror" style="visibility:hidden"></span>
                                        </div>
                                        <div class="form-group has-error">
                                            <label>Select Zone</label>
                                            <div class="form-group has-error">
                                            	<select id="zonename" name="zoneid" class="form-control" id="dropdownid" onchange="selectZone(this)">
	                                                <option selected disabled hidden>Select zone</option>
	                                                <%
	                                                	Connection cn = new DBUtil().getConnection();
	                                                	String qry = "select * from zone";
	                                                	PreparedStatement st = cn.prepareStatement(qry);
	                                                	ResultSet rs = st.executeQuery();
	                                                	if(!rs.first()){
	                                                		%>
	                                                			<option disabled>No any zone yet.</option>
	                                                		<%
	                                                	}
	                                                	rs.relative(-1);
	                                                	while(rs.next()){
	                                                		%>
	                                                			<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
	                                                		<%
	                                                	}	                                                	
	                                                %>
                                            	</select>
                                            	<span class="has-error" id="dropdownerror"style="visibility:hidden"></span>
                                        	</div>                                                                                        
                                        </div>
										<!-- Zone area data -->
										<span id="zoneareadata">
										</span>
										<!-------------------->
                                        <div id="divpassword" class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input type="password" id="password" class="form-control underlined" name="password" onkeyup="passwordValidation()">
                                            <span id="passworderror" style="visibility:hidden"></span>
                                        </div>
                                        <div class="form-group" style="text-align:center;">
                                            <button type="submit" class="btn btn-primary" name="btn" value="registration" style="width:40%;margin-top:15px;font-size:1.1rem;">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
						</div>
					</section>
				</div>
				</article>
            	<!-- Footer -->
            	<%@ include file="footer.jsp" %>
            </div>
        </div>
        
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        	</div>
        	<script>
        	
        	var element = document.getElementById("users");
      	  	element.classList.add("active");
      	  	var element1 = document.getElementById("users");
    	  	element1.classList.add("open");
      	  	var element2 = document.getElementById("zoner");
   	  	 	element2.classList.add("active");
        	
   	  	 	<!-- Dropdown validations -->
	   	  	function selectZone(a){
	  	  		var x = a.options[a.selectedIndex].text;
	  	  		if(x == "Select zone"){
	      	  		document.getElementById("dropdownerror").innerHTML="Please select any zone.";
					document.getElementById("dropdownerror").style.visibility="visible";
					document.getElementById("dropdownerror").setAttribute("style","visibility: visible;font-size: 16px;");
	  	  		}else{
	      	  		document.getElementById("dropdownerror").innerHTML="";
	  				document.getElementById("dropdownerror").setAttribute("style","visibility: visible;font-size: 16px;");
	  	  		}
		  	  	$.ajax({
					url : "AjaxZonerArea.jsp",
					method : "POST",
					data : {						
						zoneid: a.value,
						action: "registerZoner"
					},
					success : function(data) {
						$('#zoneareadata').html(data);
					}
				});
	  	  	}
   	  	 	
   	  	 	<!-- Image preview code -->   	  	
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
   	  	 	
		   	<!-- Validations -->
		   	function submitValidation(){
		   		var fname = document.getElementById("fname").value;
		   		var lname = document.getElementById("lname").value;
		   		var address = document.getElementById("address").value;
		   		var phoneno = document.getElementById("phone").value;
		   		var email = document.getElementById("email").value;
		   		var password = document.getElementById("password").value;
		   		
		   		if(document.getElementById("zonename").value == "Select zone"|| document.getElementById("zonearea").value == "Select area" || fname.length == 0 || lname.length == 0 || address.length == 0 || phoneno.length == 0 || email.length == 0 || password.length == 0)
	   			{
		   			if(document.getElementById("zonename").value == "Select zone"){
			   			document.getElementById("dropdownerror").innerHTML="Please select any zone.";
						document.getElementById("dropdownerror").style.visibility="visible";
						document.getElementById("dropdownerror").setAttribute("style","visibility: visible;font-size: 16px;");
		   			}
		   			if(document.getElementById("zonename").value != "Select zone"){		   			
		   				if(document.getElementById("zonearea").value == "Select area"){		   					
			   				document.getElementById("zoneareaerror").innerHTML="Please select any zone area.";
			   				document.getElementById("zoneareaerror").style.visibility="visible";
			   				document.getElementById("zoneareaerror").setAttribute("style","visibility: visible;font-size: 16px;");				   							   				
			   			}			   				
		   			}
		   			if(fname.length == 0){
		   				$("#divfname").addClass("has-error");
		 				document.getElementById("fnameerror").innerHTML="First name can not be a empty.";
	 	  				document.getElementById("fnameerror").setAttribute("style","visibility: visible;font-size: 16px;");
		   			}
		   			if(lname.length == 0){
		   				$("#divlname").addClass("has-error");
		 				document.getElementById("lnameerror").innerHTML="Last name can not be a empty.";
	 	  				document.getElementById("lnameerror").setAttribute("style","visibility: visible;font-size: 16px;");
		   			}
		   			if(address.length == 0){
		   				$("#divaddress").addClass("has-error");
		 				document.getElementById("addresserror").innerHTML="Please enter your address.";
	 	  				document.getElementById("addresserror").setAttribute("style","visibility: visible;font-size: 16px;");
		   			}
		   			if(phoneno.length == 0){
		   				$("#divphone").addClass("has-error");
		 				document.getElementById("phoneerror").innerHTML="Phone number can not be a empty.";
	 	  				document.getElementById("phoneerror").setAttribute("style","visibility: visible;font-size: 16px;");
		   			}
		   			if(email.length == 0){
		   				$("#divemail").addClass("has-error");
		 				document.getElementById("emailerror").innerHTML="Please enter your email address.";
	 	  				document.getElementById("emailerror").setAttribute("style","visibility: visible;font-size: 16px;");
		   			}
		   			if(password.length == 0){
		   				$("#divpassword").addClass("has-error");
		 				document.getElementById("passworderror").innerHTML="Please enter your password.";
	 	  				document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
		   			}
		   			return false;
	   			}
	   			
		   		<!-- First name -->  	 			  	 			
      	  		var regEx = /^[a-zA-Z\s]*$/;
	 			var ftest = regEx.test(fname);
	 			if(fname.length == 0){
	 				$("#divfname").addClass("has-error");
	 				document.getElementById("fnameerror").innerHTML="First name can not be a empty.";
 	  				document.getElementById("fnameerror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				
 	  				return false;
	 			}else{
		 			if(ftest!=false)
		 			{
		 				$("#divfname").removeClass("has-error");
		 				document.getElementById("fnameerror").innerHTML="";
	 	  				document.getElementById("fnameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  				
		 			}
		 			else
		 			{
		 				$("#divfname").addClass("has-error");
		 				document.getElementById("fnameerror").innerHTML="First name must be in a characters.";
	 	  				document.getElementById("fnameerror").style.visibility="visible";
	 	  				document.getElementById("fnameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  						 	  						 	  				
	 	  				return false;
		 			}
	 			}
	 			
	 			<!-- Last name -->	 			
	 			var ltest = regEx.test(lname);
	 			if(lname.length == 0){
	 				$("#divlname").addClass("has-error");
	 				document.getElementById("lnameerror").innerHTML="Last name can not be a empty.";
 	  				document.getElementById("lnameerror").setAttribute("style","visibility: visible;font-size: 16px;");
 	  				return false;
 	  			}else{
		 			if(ltest!=false)
		 			{
		 				$("#divlname").removeClass("has-error");
		 				document.getElementById("lnameerror").innerHTML="";
	 	  				document.getElementById("lnameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  				
		 			}
		 			else
		 			{
		 				$("#divlname").addClass("has-error");
		 				document.getElementById("lnameerror").innerHTML="Last name must be in a characters.";
	 	  				document.getElementById("lnameerror").style.visibility="visible";
	 	  				document.getElementById("lnameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  						 	  						 	  		
	 	  				return false;
		 			}
	 			}
	 			
	 			<!-- Address -->	 			
	 			if(address.length == 0){
	 				$("#divaddress").addClass("has-error");
	 				document.getElementById("addresserror").innerHTML="Please enter your address.";
 	  				document.getElementById("addresserror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  			
 	  				return false;
	 			}
	 			else{
	 				$("#divaddress").removeClass("has-error");
	 				document.getElementById("addresserror").innerHTML="";
 	  				document.getElementById("addresserror").setAttribute("style","visibility: visible;font-size: 16px;");
	 			}
	 			
	 			<!-- Phone number -->	 			  	 		
      	  		var pregEx = /^(?:(?:\+|0{0,2})91(\s*|[\-])?|[0]?)?([6789]\d{2}([ -]?)\d{3}([ -]?)\d{4})$/;  
	 			var phonetest = pregEx.test(phoneno);
	 			if(phoneno.length == 0){
	 				$("#divphone").addClass("has-error");
	 				document.getElementById("phoneerror").innerHTML="Phone number can not be a empty.";
 	  				document.getElementById("phoneerror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  			
 	  				return false;
	 			}else{
		 			if(phonetest!=false)
		 			{
		 				$("#divphone").removeClass("has-error");
		 				document.getElementById("phoneerror").innerHTML="";
	 	  				document.getElementById("phoneerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  				
		 			}
		 			else
		 			{
		 				$("#divphone").addClass("has-error");
		 				document.getElementById("phoneerror").innerHTML="Phone number must be 10 digits with code +91";
	 	  				document.getElementById("phoneerror").style.visibility="visible";
	 	  				document.getElementById("phoneerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  						 	  						 	  			
	 	  				return false;
		 			}
	 			}
	 			<!-- Email -->
	 			if(email.length == 0){
	 				console.log("Email l"+email.length);
	 				$("#divemail").addClass("has-error");
	 				document.getElementById("emailerror").innerHTML="Please enter your email address.";
 	  				document.getElementById("emailerror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  			
 	  				return false;
	 			}
	 			else{
 					$("#divemail").removeClass("has-error");
	 				document.getElementById("emailerror").innerHTML="";
 	  				document.getElementById("emailerror").setAttribute("style","visibility: visible;font-size: 16px;");
	 			}
	 			<!-- Password -->
	 			var pwd=document.getElementById("password").value;  	 			
	 			var pwdregEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	 			var temp=pwdregEx.test(pwd);
	 			if(pwd.length == 0){
	 					document.getElementById("passworderror").innerHTML="Please enter your password.";
		  				document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 16px;color:red;");
		  				document.getElementById("passworderror").classList.remove('fa','fa-check','fa-times');
		  				return false;
	 			}else{  
	  	 			 if(temp)
	  	 			 {  	 					
	  	 					document.getElementById("passworderror").innerHTML="  Password is Success.";
	  	 	  				document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 18px;color:#4bcf99;");  	 	  					 	  	 	  				
	  	 	  				document.getElementById("passworderror").classList.remove('has-error');
	  	 	  				document.getElementById("passworderror").className = "has-success fa fa-check";
	  	 			 }
	  	 			 else
	  	 			 {  	 					
	  	 					document.getElementById("passworderror").innerHTML="  Password must contain atleast (eg. A,a,@,2) & 8 Character.";
	  	 	  				document.getElementById("passworderror").style.visibility="visible";
	  	 	  				document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 18px;color:red;");  	 	  				  	 	  				
	  	 	  				document.getElementById("passworderror").className = "has-error fa fa-times";
	  	 	  				return false;
	  	 			 }
	 			}
	 			<!-- Zoner image -->
		   	}
		   	function selectZoneArea(){
   			  	document.getElementById("zoneareaerror").innerHTML="";
   				document.getElementById("zoneareaerror").setAttribute("style","visibility: visible;font-size: 16px;");
   			}
   	  		<!-- onkeyup validation -->
   	  		<!-- First name validation -->
	 		function firstNameValidation()
	 		{	 		      	 	
	 			var name=document.getElementById("fname").value;
	 			var regEx = /^[a-zA-Z\s]*$/;
	 			var temp=regEx.test(name);	 			
  	 			if(temp)
  	 			{
  	 				$("#divfname").removeClass("has-error");
  	 				document.getElementById("fnameerror").innerHTML="";
  	 	  			document.getElementById("fnameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 	
  	 			}
  	 			else
  	 			{
  	 				$("#divfname").addClass("has-error");
  	 				document.getElementById("fnameerror").innerHTML="First name must be in a characters.";
  	 	  			document.getElementById("fnameerror").style.visibility="visible";
  	 	  			document.getElementById("fnameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  				
  	 			}
	 		}
	 		<!-- Last name validation -->
   	  	 	function lastNameValidation()
   	  	 	{
	   	  	 	var name=document.getElementById("lname").value;
	 			var regEx = /^[a-zA-Z\s]*$/;
	 			var temp=regEx.test(name);	 			
	 			if(temp)
	 			{
	 				$("#divlname").removeClass("has-error");
	 				document.getElementById("lnameerror").innerHTML="";
	 	  			document.getElementById("lnameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 	
	 			}
	 			else
	 			{
	 				$("#divlname").addClass("has-error");
	 				document.getElementById("lnameerror").innerHTML="Last name must be in a characters.";
	 	  			document.getElementById("lnameerror").style.visibility="visible";
	 	  			document.getElementById("lnameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  				
	 			}
   	  	 	}
   	  	 	<!-- Address remove span -->
   	  	 	function removevalidation(){
   	  	 		$("#divaddress").removeClass("has-error");
   	  	 		document.getElementById("addresserror").innerHTML="";
				document.getElementById("addresserror").setAttribute("style","visibility: visible;font-size: 16px;");
   	  	 	}
	 		<!-- Phone number -->
	 		function phoneValidation()
  	 		{
  	 		    var phone=document.getElementById("phone").value;  	 		    
  	 			var regEx = /^(?:(?:\+|0{0,2})91(\s*|[\-])?|[0]?)?([6789]\d{2}([ -]?)\d{3}([ -]?)\d{4})$/;			
  	 			var temp=regEx.test(phone);    	 			
  	 			if(temp)
  	 			{
  	 				$("#divphone").removeClass("has-error");
	 				document.getElementById("phoneerror").innerHTML="";
 	  				document.getElementById("phoneerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 	
  	 			}
  	 			else
  	 			{
  	 				$("#divphone").addClass("has-error");
	 				document.getElementById("phoneerror").innerHTML="Phone number must be 10 digits with code +91";
 	  				document.getElementById("phoneerror").style.visibility="visible";
 	  				document.getElementById("phoneerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  						 	  					 	  			  	 	  			
  	 			}
  	 		}
	 		<!-- Email remove span -->
   	  	 	function emailValidation(){
   	  	 		$("#divemail").removeClass("has-error");
   	  	 		document.getElementById("emailerror").innerHTML="";
				document.getElementById("emailerror").setAttribute("style","visibility: visible;font-size: 16px;");
   	  	 	}
   	  	 	<!-- Password validation -->
	   	  	function passwordValidation()
	 		{
	 		    var pwd=document.getElementById("password").value;  	 			
	 			var pwdregEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	 			var temp=pwdregEx.test(pwd);
	 			if(pwd.length == 0){
	 					document.getElementById("passworderror").innerHTML="";
		  				document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 16px;");
		  				document.getElementById("passworderror").classList.remove('fa','fa-check','fa-times');
	 			}else{  
	  	 			 if(temp)
	  	 			 {  	 					
	  	 					document.getElementById("passworderror").innerHTML="  Password is Success.";
	  	 	  				document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 18px;color:#4bcf99;");  	 	  					 	  	 	  				
	  	 	  				document.getElementById("passworderror").className = "has-success fa fa-check";
	  	 			 }
	  	 			 else
	  	 			 {  	 					
	  	 					document.getElementById("passworderror").innerHTML="  Password must contain atleast (eg. A,a,@,2) & 8 Character.";
	  	 	  				document.getElementById("passworderror").style.visibility="visible";
	  	 	  				document.getElementById("passworderror").setAttribute("style","visibility: visible;font-size: 18px;color:red;");  	 	  				  	 	  				
	  	 	  				document.getElementById("passworderror").className = "has-error fa fa-times";
	  	 			 }
	 			}
	 		}
   	  	 	
        </script>        
        <script src="${pageContext.request.contextPath}/admin/js/vendor.js"></script>
    	<script src="${pageContext.request.contextPath}/admin/js/app.js"></script>
</body>
</html>