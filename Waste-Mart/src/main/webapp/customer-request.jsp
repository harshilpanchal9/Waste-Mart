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
  <title>Customer-request</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <link rel="stylesheet" href="assets/css/style-freedom.css">
   <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
	 <script lang="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function zoneArea()
      {
    	  var id=document.getElementById("zoneid").value;
			document.getElementById("zonenameerror").innerHTML="";
			document.getElementById("zonenameerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");

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
 		function validateAddress()
 		{
 			var address=document.getElementById("address").value;
 			if(address.length==0)
 			{
 				document.getElementById("addresserror").innerHTML="Please Enter Address.";
 				document.getElementById("addresserror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
 			}
 			else
 			{
 				document.getElementById("addresserror").innerHTML="";
 				document.getElementById("addresserror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
 			}
 		}
 		function paymentDropdown()
 		{
			document.getElementById("paymenterror").innerHTML="";
			document.getElementById("paymenterror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
 		}
 		function zoneareaDropdown()
 		{
			document.getElementById("zoneareaerror").innerHTML="";
			document.getElementById("zoneareaerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
 		}
      </script>

</head>

<body>
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
							<h4>Customer Request</h4>

						</div>
						<form action="CustomerRegistrationController" method="post" class="signin-form" onsubmit="return submitValidation()">	
							
							<div  class="form-input">
								<label></label>
								<input type="hidden" name="customerid" value="<%=session.getAttribute("customerid") %>" readonly/>
							</div>
							<%
								Connection cn=new DBUtil().getConnection();
								int id=(Integer)session.getAttribute("customerid");
								String emailid="";
								String mail="select * from customer_signup where customerid=?";
								PreparedStatement st=cn.prepareStatement(mail);
								st.setInt(1,id);
								ResultSet rs=st.executeQuery();
								if(rs.next())
								{
									emailid=rs.getString(5);	
								}
							%>
							<input type="hidden" name="email" value="<%=emailid %>"/>
							<div  class="form-input">
								<label>Address</label>
								<textarea style="height:100px;width:445px;" id="address" name="address"  onkeyup="validateAddress()" ></textarea>
								<span id="addresserror" style="visibility:hidden;"> </span>
							</div>
							<div  class="form-input">
								<label>Phone No</label>
								<input type="text" name="phoneno" id="phoneno" placeholder="Enter Phoneno"  onkeyup="validatePhoneno()"/>
								<label id="vphoneno" style="visibility:hidden"></label>
							</div>
							<div  class="form-input">
								<label>Zone Name</label>
								<select name="zonename"   id="zoneid" style="width:450px; height:40px; " onchange="zoneArea()">
									<option selected disabled hidden >Select Zone</option>
								<%
									cn=new DBUtil().getConnection();
									String qry="select * from zone";
									id=0;
									st=cn.prepareStatement(qry);
									rs=st.executeQuery();
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
								<select name="paymentmode" id="payment" style="width:450px; height:40px;" onchange="paymentDropdown()">
								<option selected disabled hidden >Select Mode</option>
								<option>Online</option>
								<option>Cash On Delivery</option>
								</select>
								<span id="paymenterror" style="visibility:hidden;"></span>
							</div>
							<div  class="form-input">
								<label>Pickup date</label>
								<input type="date" id="date" name="pickupdate"  style="width:450px; height:40px;" onchange="changeDate()" />
								<span id="date_error" style="visibility:hidden;"></span>
							</div>
							
							<button class="btn" name="btn" style="background:#228B22; color:#ffffff;" value="request">Confirm</button>
							
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
		var date=document.getElementById("date").value;
		console.log(date);
		console.log(document.getElementById("zoneid").value=="Select Zone");
		if(address.length == 0 && phoneno.length == 0 && document.getElementById("zoneid").value=="Select Zone" && document.getElementById("payment").value=="Select Mode" && date.length==0)
		{
			//address
			document.getElementById("addresserror").innerHTML="Please Enter Address.";
			document.getElementById("addresserror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			//phoneno
			document.getElementById("vphoneno").innerHTML="Please Enter Phoneno.";
			document.getElementById("vphoneno").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			//zonename
			document.getElementById("zonenameerror").innerHTML="Please Select Zone Name.";
			document.getElementById("zonenameerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			//payment
			document.getElementById("paymenterror").innerHTML="Please Select payment mode.";
			document.getElementById("paymenterror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			//date
			document.getElementById("date_error").innerHTML="Please Select Date .";
			document.getElementById("date_error").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			
			return false;
		}
		else if(document.getElementById("payment").value=="Select Mode")
		{
			document.getElementById("paymenterror").innerHTML="Please Select payment mode.";
			document.getElementById("paymenterror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			return false;			
		}
		else if(document.getElementById("zoneid").value=="Select Zone")
		{
			document.getElementById("zonenameerror").innerHTML="Please Select Zone name.";
			document.getElementById("zonenameerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			return false;			
			
		}
		//all in or condition
		if(address.length == 0 || phoneno.length == 0 || document.getElementById("zoneid").value=="Select Zone" || document.getElementById("payment").value=="Select Mode" || date.length==0 || document.getElementById("zonearea").value=="Select Zonearea")
		{
			if(address.length==0)
			{
				//address
				document.getElementById("addresserror").innerHTML="Please Enter Address.";
				document.getElementById("addresserror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			}
			if(phoneno.length==0)
			{
				//phoneno
				document.getElementById("vphoneno").innerHTML="Please Enter Phoneno.";
				document.getElementById("vphoneno").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			}
			if(document.getElementById("zoneid").value=="Select Zone")
			{
				//zonename
				document.getElementById("zonenameerror").innerHTML="Please Select Zone Name.";
				document.getElementById("zonenameerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			}
			if(document.getElementById("payment").value=="Select Mode")
			{
				//payment
				document.getElementById("paymenterror").innerHTML="Please Select payment mode.";
				document.getElementById("paymenterror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			}
			if(date.length==0)
			{
				//date
				document.getElementById("date_error").innerHTML="Please Select Date .";
				document.getElementById("date_error").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			}
			if(document.getElementById("zonearea").value=="Select Zonearea")
			{
				document.getElementById("zoneareaerror").innerHTML="Please Select Zone Area.";
				document.getElementById("zoneareaerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			}

			return false;
		}

		//zone name
		if(document.getElementById("zoneid").value=="Select Zone")
		{
			document.getElementById("zonenameerror").innerHTML="Please Select Zone Name.";
			document.getElementById("zonenameerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			return false;
		}
		else
		{
			if(document.getElementById("zoneid").value!="Select Zone")
			{
				document.getElementById("zonenameerror").innerHTML="";
				document.getElementById("zonenameerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
								
			}
			else
			{
				document.getElementById("zonenameerror").innerHTML="";
				document.getElementById("zonenameerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
				return false;
			}
		}
		//zone area
		if(document.getElementById("zonearea").value=="Select Zonearea")
		{
			document.getElementById("zoneareaerror").innerHTML="Please Select Zone Area.";
			document.getElementById("zoneareaerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			return false;
		}
		else
		{
			document.getElementById("zoneareaerror").innerHTML="";
			document.getElementById("zoneareaerror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
		}
		
		//address
		if(address.length==0)
		{
			document.getElementById("addresserror").innerHTML="Please Enter Address.";
			document.getElementById("addresserror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			return false;
		}
		else
		{
			document.getElementById("addresserror").innerHTML="";
			document.getElementById("addresserror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
		}
		//phoneno validation
			
		var regx = /^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$/;
		var temp3=regx.test(phoneno);
		if(phone.length==0)
		{
			document.getElementById("vphoneno").innerHTML="Please Enter Phoneno.";
			document.getElementById("vphoneno").style.visibility="visible";
			document.getElementById("vphoneno").setAttribute("style","visibility: visible;font-size: 16px;color:red;");  	 	  					 			 	  					 	  				
			return false;
		}
		else
		{
			if(temp3!=false)
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
		//payment mode
		if(document.getElementById("payment").value=="Select Mode")
		{
			document.getElementById("paymenterror").innerHTML="Please Select payment mode.";
			document.getElementById("paymenterror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			return false;
		}
		else
		{
			document.getElementById("paymenterror").innerHTML="";
			document.getElementById("paymenterror").setAttribute("style","visibility:visible;font-size:16px;color:red;");
		}
		if(date.length==0)
		{
			document.getElementById("date_error").innerHTML="Please Select payment mode.";
			document.getElementById("date_error").setAttribute("style","visibility:visible;font-size:16px;color:red;");
			return false;
		}
		
	}
	function changeDate()
	{
		document.getElementById("date_error").innerHTML="";
	}
	$document.ready(function(){
		$(function(){
		var dtToday=new Date();
		var month=dtToday.getMonth()+1;
		var day=dtToday.getDate();
		var year=dtToday.getFullYear();
		if(month<10)
		{
			month='0'+month.toString();
			
		}
		if(day<10)
		{
			day='0'+day.toString();
		}
		var maxDate=year+'-'+month+'-'+day;
		$('#date').attr('min'.maxDate);
		})
	});
</script>
</body>
</html>
