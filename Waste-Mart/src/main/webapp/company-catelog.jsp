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
  <title>company | Price Chart</title>
  <link rel="stylesheet" href="assets/css/style-freedom.css">
	<script>  
var request=new XMLHttpRequest();  
function searchInfo()
{  
	var name=document.getElementById("name").value;
	
	var url="search-companycategory.jsp?company="+name;  
  	try
  	{  
		request.onreadystatechange=function()
		{  
			if(request.readyState==4)
			{  
				var val=request.responseText;  
				document.getElementById('showall').innerHTML=val;  
			}  
		}  
		request.open("GET",url,true);  
		request.send();  
	}
  	catch(e)
  	{
  		alert("Unable to connect to server");
  	}  

}  
window.onload = function()
{
	var url="search-companycategory.jsp?company=all";  
  	try
  	{  
		request.onreadystatechange=function()
		{  
			if(request.readyState==4)
			{  
				var val=request.responseText;  
				document.getElementById('showall').innerHTML=val;  
			}  
		}  
		request.open("GET",url,true);  
		request.send();  
	}
  	catch(e)
  	{
  		alert("Unable to connect to server");
  	}  
}
</script>  

</head>
<body>
<!-- inner banner -->
<%@include file="company-header.jsp" %>
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Price Chart</h3>
                <li><a href="#">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Price Chart</li>
            </ul>
        </div>
    </div>
</section>
<!-- //covers -->
<!-- form-11 -->
<section class="w3l-forms-11">
		
	<div class="form-11">
			<div class="wrapper">
			<div class="form-11-content d-grid">
				<div class="column">
					<h5>Search for category</h5>
				</div>
				<div class="column email-input">
					<input type="email" name="name" id="name" placeholder="Search" onkeyup="searchInfo()" />
				</div>
				
			</div>
		</div>
	</div>
</section>

<!-- //features-11 -->
<%--  <section class="w3l-grid-3">
  <div class="top-bottom">
    <div class="wrapper">
        <div class="text-link">
            <h6 style="text-align:center;">Price Chart</h6>
          </div>
      <div class="middle-section">
      <%
      		Connection cn=new DBUtil().getConnection();
			String qry="select * from customer_subcategory";
			PreparedStatement st=cn.prepareStatement(qry);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
      %>
        <div class="divied-four-grids">
         <img src="subcategory/<%=rs.getString(5) %>"  style="height:100px;width:100px;margin-left:auto;margin-right:auto;display:block;margin-top:30px;"  class="img-responsive" alt="">
          <div class="w3layouts-grids-four">
           
              <h4 style="text-align:center;"><%=rs.getString(3) %></h4>
           
            <p style="text-align:center;">&#8377;<%=rs.getString(4) %></p>

          </div>
        </div>
        <%
			}
			cn.close();
        %>
 
      </div>
    
    </div>
  </div>
</section> 
<!-- //features-11 -->
 --%>
 
 
 <%--  <%
 
 		Connection cn=new DBUtil().getConnection();
 		String category="select * from category";
 		PreparedStatement st2=cn.prepareStatement(category);
 		ResultSet rs2=st2.executeQuery();
 		while(rs2.next())
 		{
 		
 		
 %> --%>
<section class="w3l-grid-3" id="showall">
 <%--  <div class="top-bottom">
    <div class="wrapper">
   
        <div class="text-link">
            <h1 style="text-align:center;"><%=rs2.getString(2) %></h1>
          <div class="middle-section">
     	
      <%
      		String qry="select * from company_subcategory where catid=?";
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1,rs2.getInt(1));
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
      %>
       
        <div class="divied-four-grids">
         <img src="subcategory/<%=rs.getString(5) %>"  style="height:100px;width:100px;margin-left:auto;margin-right:auto;display:block;margin-top:30px;"  class="img-responsive" alt="">
          <div class="w3layouts-grids-four">
           
              <h4 style="text-align:center;"><%=rs.getString(3) %></h4>
           
            <p style="text-align:center;">&#8377;<%=rs.getString(4) %></p>

          </div>
        </div>
         
       <%
			}
			
       %>
 </div>
     </div>
    
    </div>
  </div>
 --%></section>
<%-- <%
 		}
 		cn.close();
%> --%>
<%@include file="footer.jsp" %>
</body>
</html>