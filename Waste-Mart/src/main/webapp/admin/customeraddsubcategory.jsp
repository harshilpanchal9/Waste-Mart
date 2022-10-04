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
        <title> Admin | Add Consumer Items </title>
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
                        <h3 class="title"> Add Consumer Item <span class="sparkline bar" data-type="bar"></span>
                        </h3>
                    </div>
                    <form method="post" action="../CategoryController" name="item" onsubmit="return submitValidation()" enctype="multipart/form-data">
                        <div class="card card-block">
                        	                            
                            <div class="form-group row has-error">
                                <label class="col-sm-2 form-control-label text-xs-right"> Select Category: </label>
                                <div class="col-sm-10">
                                    <select id="dropdown" value="Select Category" name="catid" class="c-select form-control boxed" onchange="changedropdown()">
                                       <option selected disabled hidden>Select Category</option>                                     
                                    <%
                                    Connection cn=new DBUtil().getConnection();
                                    String qry="select * from Category";
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
                                     <span class="has-error" id="dropdownerror"style="visibility:hidden"></span>
                                </div>
                            </div>
                            <div class="form-group row has-error">
                                <label class="col-sm-2 form-control-label text-xs-right"> Item Name: </label>
                                <div class="col-sm-10">
                                    <input type="text" id="itemname" name="itemname" class="form-control boxed" placeholder="" onkeyup="nameValidation()">
                                    <span class="has-error" id="nameerror" style="visibility:hidden"></span>
                                </div>
                            </div>
                            <div class="form-group row has-error">
                                <label class="col-sm-2 form-control-label text-xs-right"> Item Price: </label>
                                <div class="col-sm-10" >                                	                                                               
                                   <div class="input-group" style="margin-bottom:0px;">                            
                                		<span class="input-group-prepend">
                                    		<span class="input-group-text">&#x20B9;</span>
                                		</span>
                                		<input type="text" id="itemprice" name="itemprice" class="form-control" placeholder=" per KG" onkeyup="numberValidation()">
                                		<span class="input-group-append">
                                    		<span class="input-group-text">.00</span>
                                		</span>                                		
                            	   </div>      
                            	   <span class="has-error" id="numbererror" style="visibility:hidden"></span>                                                   
                                </div>
                            </div>                                                       
                            <div class="form-group row has-error">
                                <label class="col-sm-2 form-control-label text-xs-right"> Item Stock (per <i>KG</i>): </label>
                                <div class="col-sm-10" >                                	                            
                                   <input type="text" id="itemstock" name="itemstock" value="00" class="form-control boxed" placeholder="Kilogram" onkeyup="stockNumberValidation()">                                                         
                                   <span class="has-error" id="stocknumbererror" style="visibility:hidden"></span>
                                </div>
                            </div>
                            <div class="form-group row has-error">
                                <label class="col-sm-2 form-control-label text-xs-right"> Item Image: </label>
                                <div class="col-sm-10">                                    
                                    <div class="images-container">                                                                                
                                        <div id="img-box" class="image-container" style="display:none;margin-bottom:0px;">
                                            <div class="controls">                                                
                                   					<a href="#" class="control-btn remove" data-toggle="modal" data-target="#confirm-modal">
                                                    <i class="fa fa-trash-o"></i>
                                                </a>
                                            </div>
                                            
                                            <div class="image" id="imgname"></div> <!-- Show the preview of image -->
                                            
                                        </div>                                        
                                        <a href="#" class="add-image">                                        
                                            <div class="image-container new" style="margin-bottom:0px;">                                            	
                                                <div class="image" onclick="myFile()">
                                                	<input type="file" id="file1" name="itemimage" accept=".jpg, .png" style="display:none;" alt="Please select any image." />                                                	                                                     
                                                    <i class="fa fa-plus"></i>
                                                </div>                                            	
                                            </div>
                                        </a>                                        
                                    </div>
                                    <span class="has-error" id="imageerror" style="visibility:hidden"></span>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <div class="col-sm-10 col-sm-offset-2">
                                    <button type="submit" name="btn" value="CustomerAddItem" class="btn btn-primary"> Add Item </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </article>
                <!-- Footer -->        
				<%@ include file="footer.jsp" %>
				<!-- Alert box -->
				<div class="modal fade" id="confirm-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header"style="margin-left: -1px;border-top-left-radius: 0;border-top-right-radius: 0;">
                                <h4 class="modal-title"><i class="fa fa-warning"></i> Delete</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure want to delete this Image?</p>
                            </div>
                            <div class="modal-footer">
                            	<form action="../CategoryController">
                            		<input type="hidden" name="catid" value="catid">
                                	<button type="button" onclick="removeimg()" class="btn btn-primary" data-dismiss="modal">Yes</button>                                	
                                </form>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            </div>
                        </div>
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
        
        	var element = document.getElementById("item");
  	  	 	element.classList.add("active");
  	  		var element1 = document.getElementById("item");
	  	 	element1.classList.add("open");  	  	 	
	  	 	var element3 = document.getElementById("addsubcategory");
	  	 	element3.classList.add("open");
	  	 	var element4 = document.getElementById("customeraddsubcategory");
	  	 	element4.classList.add("open");
	  	    
	  	 	function myFile()
  	 	 	{	
  	 		 	document.getElementById("file1").click();	  	 		
  	 	 	}
  	 		
  	 		const file1 = document.getElementById("file1");
  	 		const imgname = document.getElementById("imgname");
  	 		file1.addEventListener("change",function(){
  	 			const file = this.files[0];
  	 			
  	 			if(file){
  	 				const reader = new FileReader();
  	 				document.getElementById('img-box').style.display = 'block';
  	 				
  	 				reader.addEventListener("load",function(){
  	 					imgname.setAttribute("style", "background-image: url(" + this.result + ");");
  	 				});
  	 				reader.readAsDataURL(file);
  	 				document.getElementById("imageerror").innerHTML="";
  	 			}
  	 			else{
  	 				document.getElementById('img-box').style.display = 'none';
  	 				imgname.setAttribute("style", "background-image: url(" + "" + ");");
  	 			}
  	 		}); 
			
  	 		function removeimg(){
  	 			document.getElementById("file1").value = '';
  	 			document.getElementById("imageerror").innerHTML="";
  	 			document.getElementById('img-box').style.display = 'none';
	 			imgname.setAttribute("style", "background-image: url(" + "" + ");");  	 			
  	 		}
	  	 	
  	 		<!-- Validation -->
  	 	    <!-- Dropdown validation -->
  	 		function submitValidation() { 
  	 			var itemname = document.getElementById("itemname").value;
  	 			var price=document.getElementById("itemprice").value;
  	 			var stock=document.getElementById("itemstock").value;
  	 			var catimage = document.getElementById("file1");
  	 			
  	 			if (document.getElementById("dropdown").value == "Select Category" || itemname.length == 0 || price.length == 0 || catimage.value == '' || stock.length == 0) {    
		        		if(document.getElementById("dropdown").value == "Select Category"){
  	 					document.getElementById("dropdownerror").innerHTML="Please select any category.";
	 	  				document.getElementById("dropdownerror").style.visibility="visible";
	 	  				document.getElementById("dropdownerror").setAttribute("style","visibility: visible;font-size: 16px;");	
		        		}
	 	  				//Itemname
	 	  				if(itemname.length == 0){
	 	  				document.getElementById("nameerror").innerHTML="Item name can not be a empty.";
 	  					document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;"); 
	 	  				}
 	  					//Itemprice
 	  					if(price.length == 0){
 	  					document.getElementById("numbererror").innerHTML="Item price can not be a empty.";
 	  					document.getElementById("numbererror").setAttribute("style","visibility: visible;font-size: 16px;");
 	  					}
 	  					//CatImage
 	  					if(catimage.value == ''){
 	  					document.getElementById("imageerror").innerHTML="Please choose any image.";
 	  					document.getElementById("imageerror").style.visibility="visible";
 	  					document.getElementById("imageerror").setAttribute("style","visibility: visible;font-size: 16px;");
 	  					}
 	  					//ItemStock
 	  					if(stock.length == 0){
 	  						document.getElementById("stocknumbererror").innerHTML="Item stock can not be a empty.";
 	  	 	  				document.getElementById("stocknumbererror").setAttribute("style","visibility: visible;font-size: 16px;");
 	  					}
	 	  				return false;
		        }
		        <!-- Itemname validation -->
		        var regEx = /^[a-zA-Z\s]*$/;
	 			var temp=regEx.test(itemname);
	 			console.log(temp);
	 			if(itemname.length == 0){
	 				document.getElementById("nameerror").innerHTML="Item name can not be a empty.";
 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;"); 
 	  				return false;
	 			}else{
		 			if(temp!=false)
		 			{
	 					document.getElementById("nameerror").innerHTML="";
	 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  				
		 			}
		 			else
		 			{
	 					document.getElementById("nameerror").innerHTML="Item name must be in a characters.";
	 	  				document.getElementById("nameerror").style.visibility="visible";
	 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");  
	 	  				return false;
		 			}
	 			}
	 			<!-- Item price validation -->	 			
	 			var letter_regEx = /^(([0-9]*)|(([0-9]*)\.([0-9]*)))$/;
	 			var ptest = letter_regEx.test(price);
	 			if(price.length == 0){
	 				document.getElementById("numbererror").innerHTML="Item price can not be a empty.";
 	  				document.getElementById("numbererror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				
 	  				return false;
	 			}else{
	 				if(ptest != false){
	 					document.getElementById("numbererror").innerHTML="";
	 	  				document.getElementById("numbererror").setAttribute("style","visibility: visible;font-size: 16px;");
	 				}
	 				else{
	 					document.getElementById("numbererror").innerHTML="Item price must be a digit without whitespaces.";
  	 	  				document.getElementById("numbererror").style.visibility="visible";
  	 	  				document.getElementById("numbererror").setAttribute("style","visibility: visible;font-size: 16px;");  	
  	 	  				return false;
	 				}
	 			}
	 			<!-- Item Stock validation -->	 			
	 			var stest = letter_regEx.test(stock);
	 			if(stock.length == 0){
	 				document.getElementById("stocknumbererror").innerHTML="Item stock can not be a empty.";
 	  				document.getElementById("stocknumbererror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				
 	  				return false;
	 			}else{
	 				if(stest != false){
	 					document.getElementById("stocknumbererror").innerHTML="";
	 	  				document.getElementById("stocknumbererror").setAttribute("style","visibility: visible;font-size: 16px;");
	 				}
	 				else{	 					
	 					document.getElementById("stocknumbererror").innerHTML="Item stock must be a digit without whitespaces.";
  	 	  				document.getElementById("stocknumbererror").style.visibility="visible";
  	 	  				document.getElementById("stocknumbererror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  				
  	 	  				return false;
	 				}
	 			}
	 			<!-- Image validation -->	 				 		
	 			if(catimage.value != '')
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
  	 		function changedropdown(){
  	 			document.getElementById("dropdownerror").innerHTML="";
	  			document.getElementById("dropdownerror").setAttribute("style","visibility: visible;font-size: 16px;");
  	 		}
  	 		<!-- onkeyup validation -->
  	 		<!-- String validation -->
  	 		function nameValidation()
  	 		{
  	 		    var name=document.getElementById("itemname").value;  	 			
  	 			var regEx = /^[a-zA-Z\s]*$/;
  	 			var temp=regEx.test(name);
  	 			if(temp)
  	 			{
  	 				document.getElementById("nameerror").innerHTML="";
  	 	  			document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 		  	 	  				  	 	  		
  	 			}
  	 			else
  	 			{
  	 				document.getElementById("nameerror").innerHTML="Item name must be in a characters.";
  	 	  			document.getElementById("nameerror").style.visibility="visible";
  	 	  			document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					  	 	  				  	 	  		
  	 			}  	 			
  	 		}
  	 		<!-- Number validation -->
  	 		//For price
  	 		function numberValidation()
  	 		{
  	 		    var price=document.getElementById("itemprice").value;  	 		    
  	 			var regEx = /^(([0-9]*)|(([0-9]*)\.([0-9]*)))$/;  	 			
  	 			var temp=regEx.test(price);  	 	  	 			  	 			
  	 			if(temp)
  	 			{
  	 				document.getElementById("numbererror").innerHTML="";
  	 	  			document.getElementById("numbererror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 	
  	 			}
  	 			else
  	 			{
  	 				document.getElementById("numbererror").innerHTML="Item price must be a digit without whitespaces.";
  	 	  			document.getElementById("numbererror").style.visibility="visible";
  	 	  			document.getElementById("numbererror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  				
  	 			}
  	 		}
  	 		//For stock
  	 		function stockNumberValidation()
  	 		{  	 		    
  	 		    var stock=document.getElementById("itemstock").value;
  	 			var regEx = /^(([0-9]*)|(([0-9]*)\.([0-9]*)))$/;  	 			
  	 			var temp=regEx.test(stock);  	 	  	 			  	 			
  	 			if(temp)
  	 			{
  	 				document.getElementById("stocknumbererror").innerHTML="";
  	 	  			document.getElementById("stocknumbererror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 	
  	 			}
  	 			else
  	 			{
  	 				document.getElementById("stocknumbererror").innerHTML="Stock value must be a digit without whitespaces.";
  	 	  			document.getElementById("stocknumbererror").style.visibility="visible";
  	 	  			document.getElementById("stocknumbererror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  				
  	 			}
  	 		}
  	 		<!---------------->
  	 		
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>        
</body>
</html>