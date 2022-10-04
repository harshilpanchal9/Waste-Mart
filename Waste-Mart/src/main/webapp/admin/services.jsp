<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin | Services </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <!-- Place favicon.ico in the root directory -->
        <link rel="icon" href="../favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" type="text/css" href="css/app.css">   
</head>
<body>
<div class="main-wrapper">
            <div class="app" id="app">
            <!-- Header -->
			<%@include file="header.jsp" %>
			<!-- Sidebar -->
			<%@include file="sidebar.jsp" %>
			<!-- Content -->
			<div class="sidebar-overlay" id="sidebar-overlay"></div>
			<div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
			<div class="mobile-menu-handle"></div>
						<article class="content item-editor-page">
                    <div class="title-block">
                        <h3 class="title"> Add Services <span class="sparkline bar" data-type="bar"></span>
                        </h3>
                    </div>
                    <form method="post" action="../ServiceController" onsubmit="return submitNameValidation()" enctype="multipart/form-data">
                        <div class="card card-block">
                 			 <div class="form-group row has-error">
                                <label class="col-sm-2 form-control-label text-xs-right"> Add Title: </label>
                                <div class="col-sm-10">
                                    <input id="title" type="text" name="title" class="form-control boxed" placeholder="Enter your title" onkeyup="checkTitle()">
                                    <span class="has-error" id="titleerror" style="visibility:hidden"></span>
                                </div>
                            </div>
                            <div class="form-group row has-error">
                                <label class="col-sm-2 form-control-label text-xs-right">Enter Content:</label>
                                <div class="col-sm-10" >                                	                            
                                   <textarea id="content" class="form-control" name="content" rows="10" cols="100" style="resize:none;" placeholder="Write your content here..." onkeyup="checkContent()"></textarea>                                                        
                                   <span class="has-error" id="contenterror" style="visibility:hidden"></span>
                                </div>
                            </div>
                            
                            <div class="form-group row has-error">
                                <label class="col-sm-2 form-control-label text-xs-right"> Service Images: </label>
                                <div class="col-sm-10">
                                    <input id="file1" type="file" name="photo" class="form-control boxed" value="null" onchange="checkImage()">
                                    <span class="has-error" id="imageerror" style="visibility:hidden"></span>
                                </div>                                
                            </div>
                     		 <div class="form-group row">
                                <div class="col-sm-10 col-sm-offset-2">
                                    <button type="submit" name="btn" value="addservices" class="btn btn-primary"> Add Service </button>
                                </div>
                            </div>
                        </div>
                        </form>
                    <div class="title-block">
                        <h3 class="title"> Delete Customer-Services <span class="sparkline bar" data-type="bar"></span>
                        </h3>
                     </div>
                        <form method="post" action="../ServiceController" onsubmit="return submitDelete()" name="item">
                        <div class="card card-block">                        	                            
                            <div class="form-group row has-error">
                                <label class="col-sm-2 form-control-label text-xs-right"> Select Category: </label>
                                <div class="col-sm-10">
                                    <select id="dropdown" name="id" class="c-select form-control boxed" onchange="changedropdown()">
                                       <option disable hidden selected>Select Title</option>                                     
                                    <%
                                    Connection cn=new DBUtil().getConnection();
                                    String qry="select * from services";
                                    PreparedStatement st=cn.prepareStatement(qry);
                                    ResultSet rs=st.executeQuery();
                                    while(rs.next())
                                    {
                                    %>
                                        <option value="<%= rs.getInt(1)%>"> <%=rs.getString(2) %></option>                                        
                                    <%
                                    }
                                    cn.close();
                                    %>                                        
                                     </select>
                                     <span class="has-error" id="dropdownerror" style="visibility:hidden"></span>
                                </div>                                
                            </div>                            
                            <div class="form-group row">
                                <div class="col-sm-10 col-sm-offset-2">
                                	<button type="submit" name="btn" value="deleteservice" class="btn btn-primary"> Delete Service </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </article>
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
	        var element = document.getElementById("services");
	  	  	element.classList.add("active");	  	  	
	  	 	
	  	 	function submitNameValidation(){
  	 			var title = document.getElementById("title").value;
  	 			var content = document.getElementById("content").value;
  	 			var image = document.getElementById("file1");
  	 			
	 			if(title.length == 0 && image.value == '' && content.length == 0){
	 				document.getElementById("titleerror").innerHTML="Title can not be a empty.";
 	  				document.getElementById("titleerror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				
 	  				document.getElementById("contenterror").innerHTML="Please write some description about service.";
 	  				document.getElementById("contenterror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				 	  				
 	  				document.getElementById("imageerror").innerHTML="Please choose any image.";
 	  				document.getElementById("imageerror").style.visibility="visible";
 	  				document.getElementById("imageerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  						 	  					 	  				
 	  				return false;
	 			}
	 			
	 			if(title.length == 0){
	 				document.getElementById("titleerror").innerHTML="Title can not be a empty.";
 	  				document.getElementById("titleerror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				 	  				
 	  				return false;
	 			}else{
	 				document.getElementById("titleerror").innerHTML="";
 	  				document.getElementById("titleerror").setAttribute("style","visibility: visible;font-size: 16px;");
	 			}
	 			
	 			if(content.length == 0){
	 				document.getElementById("contenterror").innerHTML="Please write some description about service.";
 	  				document.getElementById("contenterror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				 	  				
 	  				return false;
	 			}else{
	 				document.getElementById("contenterror").innerHTML="";
 	  				document.getElementById("contenterror").setAttribute("style","visibility: visible;font-size: 16px;");
	 			}
	 			<!-- Image validation -->	
	 			if(image.value != '')
	 			{
	 				document.getElementById("imageerror").innerHTML="";
 	  				document.getElementById("imageerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  				 	  			 					 	  				
	 			}
	 			else
	 			{
	 				document.getElementById("imageerror").innerHTML="Please choose any image.";
 	  				document.getElementById("imageerror").style.visibility="visible";
 	  				document.getElementById("imageerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  						 	  					 	  				
 	  				return false;
	 			}	 			
  	 		}
	  	 	
	  	 	<!-- onkeyup and onchange validation -->
	  	 	function checkImage(){
	  	 		var image = document.getElementById("file1");
		  	 	if(image.value != ''){
		  	 		document.getElementById("imageerror").innerHTML="";
		  			document.getElementById("imageerror").setAttribute("style","visibility: visible;font-size: 16px;");
		  	 	}
	  	 	}
	  	 	
	  	 	function checkTitle(){
	  	 		var title = document.getElementById("title").value;
	  	 		if(title.length != 0){
	  	 			document.getElementById("titleerror").innerHTML="";
 	  				document.getElementById("titleerror").setAttribute("style","visibility: visible;font-size: 16px;");
	  	 		}
	  	 	}
	  	 	
	  	 	function checkContent(){
	  	 		var content = document.getElementById("content").value;
	  	 		if(content.length != 0){
	  	 			document.getElementById("contenterror").innerHTML="";
 	  				document.getElementById("contenterror").setAttribute("style","visibility: visible;font-size: 16px;");
	  	 		}
	  	 	}
	  	 	
	  	 	<!-- Delete Service -->
	  	 	function submitDelete(){
	  	 		if(document.getElementById("dropdown").value == "Select Title"){
	  	 			document.getElementById("dropdownerror").innerHTML="Please select any title.";
		  			document.getElementById("dropdownerror").setAttribute("style","visibility: visible;font-size: 16px;");
		  			return false;
	  	 		}
	  	 	}
	  	 	function changedropdown(){
  	 			document.getElementById("dropdownerror").innerHTML="";
	  			document.getElementById("dropdownerror").setAttribute("style","visibility: visible;font-size: 16px;");
  	 		}
  	 	</script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>           
</body>
</html>