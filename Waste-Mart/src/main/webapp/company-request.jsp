<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Company-request</title>
  <link rel="stylesheet" href="assets/css/style-freedom.css">
  <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
  	 <script lang="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function zoneArea()
      {
    	  var id=document.getElementById("zoneid").value;
    	  
    	  console.log();
	      if (typeof XMLHttpRequest != "undefined")
	      {
	      	xmlHttp= new XMLHttpRequest();
	      }
	      else if (window.ActiveXObject)
	      {
	      	xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
	      }
	      if (xmlHttp==null)
	      {
	      	alert("Browser does not support XMLHTTP Request")
	      	return;
	      } 
	      var url="zonearea.jsp";
	      url +="?zoneid=" +id;
	      xmlHttp.onreadystatechange = stateChange;
	      xmlHttp.open("GET", url, true);
	      xmlHttp.send(null);
      }

      function stateChange()
      {   
	      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	      {   
	      	document.getElementById("getarea").innerHTML=xmlHttp.responseText   
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
<%@include file="company-header.jsp" %>
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Company Subcategory</h3>
                <li><a href="index-2.html">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Ecommerce Single</li>
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
							<h4>Company Request</h4>
						</div>
						<form action="CompanyRegistrationController" method="post" class="signin-form" onsubmit="return submitValidation()">	
							
							<div  class="form-input">
								
								<input type="hidden" name="companyid" placeholder="" required value="<%=session.getAttribute("companyid") %>"/>
							</div>
							<div  class="form-input">
								<label>Address</label>
								<textarea style="height:100px;width:445px;" id="address" name="address" placeholder=""  ></textarea>
								<span id="addresserror" style="visibility:hidden;"></span>
							</div>
							<div  class="form-input">
								<label>Phone No</label>
								<input type="text" name="phoneno"  id="phoneno" placeholder=""  onkeyup="validatePhoneno()"/>
								<label id="vphoneno" style="visibility:hidden"></label>
							</div>
							<div  class="form-input">
								<label>Zone Name</label>
								<select name="zonename"   id="zoneid" style="width:450px; height:40px;" onchange="zoneArea()">
									<option selected disabled hidden >Select Zone</option>
								<%
									Connection cn=new DBUtil().getConnection();
									String qry="select * from zone";
									int id=0;
									PreparedStatement st=cn.prepareStatement(qry);
									ResultSet rs=st.executeQuery();
									while(rs.next())
									{
										
								%>
									<option value="<%=rs.getString(2)%>"><%=rs.getString(2) %></option>
								<%
									}
									cn.close();
								%>
								</select>
								<span id="zonenameerror" style="visibility:hidden;"></span>
							</div>
							
							<div class="form-input">
							<span id="getarea"></span>
							</div>
							
							
							<div  class="form-input">
								<label>Payment mode</label>
								<select id="payment" name="paymentmode" style="width:450px; height:40px;">
								<option selected disabled hidden >Select Mode</option>
								<option>Online</option>
								<option>Cash On Delivery</option>
								</select>
								<span id="paymenterror" style="visibility:hidden;"></span>
								<!-- <input type="text" name="paymentmode" placeholder="" required /> -->
							</div>
							
							<div  class="form-input">
								<label>Pickup date</label>
								<input type="date" name="pickupdate" placeholder="" required style="width:450px; height:40px;" />
							</div>
							<input type="hidden" name="companyid" value="<%=session.getAttribute("companyid")%>">
							<input type="hidden"name="gtotal" value="<%=request.getParameter("gtotal")%>">
							<button class="btn" name="btn"  style="background:#228B22; color:#ffffff;" value="request">Continue to payment</button>
						</form>
					</div>
					
				</div>
			</div>
	</div>
</section>
<script>
	function submitValidation()
	{
		var address=document.getElementById("address").value;
		var phoneno=document.getElementById("phoneno").value;
		var zoneid=document.getElementById("zoneid").value;
		if(address.length == 0 && phoneno.length == 0 && document.getElementById("zoneid").value=="Select Zone" && document.getElementById("payment").value=="Select Mode")
		{
			//address
			document.getElementById("addresserror").innerHTML="Please Enter Address."
			document.getElementById("addresserror").setAttribute("style","visibility:visible;font-size:16px;color:red");
			//phoneno
			document.getElementById("vphoneno").innerHTML="Please Enter Phoneno."
			document.getElementById("vphoneno").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			//zonename
			document.getElementById("zonenameerror").innerHTML="Please select Zonename."
			document.getElementById("zonenameerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			//payment
			document.getElementById("paymenterror").innerHTML="Please select payment mode."
			document.getElementById("paymenterror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			
			return false;
		}
		
	}
</script>
</body>
</html>