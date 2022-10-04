<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin | Add Category </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">
        <!-- Place favicon.ico in the root directory -->
        <link rel="icon" href="../favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="css/vendor.css">
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
                        <h3 class="title"> Add Category <span class="sparkline bar" data-type="bar"></span>
                        </h3>
                    </div>
                    <form method="post" action="../CategoryController" onsubmit="return submitNameValidation()" enctype="multipart/form-data">
                        <div class="card card-block">
                        	
                            <div class="form-group row has-error">
                                <label class="col-sm-2 form-control-label text-xs-right"> Category Name: </label>
                                <div class="col-sm-10">
                                    <input type="text" id="catname" name="catname" class="form-control boxed" onkeyup="nameValidation()" >
                                    <span class="has-error" id="nameerror" style="visibility:hidden"></span>
                                </div>
                            </div>
                                                        
                            <div class="form-group row has-error">
                                <label class="col-sm-2 form-control-label text-xs-right"> Image: </label>
                                <div class="col-sm-10">                                    
                                   	<div class="images-container" >                                                                                
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
                                                	<input type="file" id="file1" name="image" accept=".jpg, .png" style="display:none;" alt="Please select any image."/>                                                	                                                     
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
                                    <button id="btnval" type="submit" name="btn" value="addcategory" class="btn btn-primary"> Add Category </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </article>
                <!-- Footer -->        
				<%@ include file="/admin/footer.jsp" %>
				<!-- Alert box -->
				<div class="modal fade" id="confirm-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="margin-left: -1px;border-top-left-radius: 0;border-top-right-radius: 0;">
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
                <!----------------->   
                <!-- Set timer for category not added modal -->
				<div class="modal fade" id="timer-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="margin-left: -1px;border-top-left-radius: 0;border-top-right-radius: 0;">
                                <h4 class="modal-title"><i class="fa fa-warning"></i> Category</h4>                                
                            </div>
                            <div class="modal-body">
                                <p>Cannot add Category, If already Exists.</p>
                            </div>                            
                        </div>
                    </div>
                </div>
                <!----------------->             
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
        	
        	var element = document.getElementById("category");
	  	 	element.classList.add("active");
	  		var element1 = document.getElementById("category");
  	 		element1.classList.add("open");
	  	 	var element2 = document.getElementById("addcategory");
  	 		element2.classList.add("active");
        
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
  	 		function submitNameValidation(){
  	 			var name = document.getElementById("catname").value; 
  	 			var catimage = document.getElementById("file1");
  	 			
	 			if(name.length == 0 && catimage.value == ''){
	 				document.getElementById("nameerror").innerHTML="Category name can not be a empty.";
 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				
 	  				document.getElementById("imageerror").innerHTML="Please choose any image.";
 	  				document.getElementById("imageerror").style.visibility="visible";
 	  				document.getElementById("imageerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  						 	  					 	  				
 	  				return false;
	 			}
	 			
	 			<!-- Item name -->
	 			var regEx = /^[a-zA-Z\s]*$/;
	 			var temp=regEx.test(name);
	 			if(name.length == 0){
	 				document.getElementById("nameerror").innerHTML="Category name can not be a empty.";
 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;"); 	  				
 	  				return false;
	 			}
	 			else{
		 			if(temp!=false)
		 			{
		 				document.getElementById("nameerror").innerHTML="";
	 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 			 	  					 	  					 	  				
		 			}
		 			else
		 			{
		 				document.getElementById("nameerror").innerHTML="Category name must be in a characters.";
	 	  				document.getElementById("nameerror").style.visibility="visible";
	 	  				document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  						 	  						 	  				
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
  	 		<!-- onkeyup validation -->
  	 		function nameValidation()
  	 		{
  	 		    var name=document.getElementById("catname").value;  	
  	 		    console.log(document.getElementById("catname").value);
  	 			var regEx = /^[a-zA-Z\s]*$/;
  	 			var temp=regEx.test(name);  	 			 
  	 			if(temp)
  	 			{
  	 				document.getElementById("nameerror").innerHTML="";
  	 	  			document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  					 	
  	 			}
  	 			else
  	 			{
  	 				document.getElementById("nameerror").innerHTML="Category name must be in a characters.";
  	 	  			document.getElementById("nameerror").style.visibility="visible";
  	 	  			document.getElementById("nameerror").setAttribute("style","visibility: visible;font-size: 16px;");  	 	  				
  	 			}
  	 		}
  	 		<!---------------->
            
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>                
</body>
</html>