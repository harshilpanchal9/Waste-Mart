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
  <title>Waste-Mart | Cart</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="icon" href="waste-mart.ico" type="iamge/x-icon">
  <link rel="stylesheet" href="assets/css/style-freedom.css">
	<script lang="javascript" type="text/javascript">
		/* $(document).ready(function(){
			$(".itemqty").on('change',function(){
				var $el=$(this).closest('div');
				
				var customerid=$el.find(".customerid").val();
				var pprice=$el.find(".pprice").val();
				var qty=$el.find(".itemqty").val();
				var cartid=$el.find(".cartid").val();
				location.reload(true);
				
				console.log(cartid);
				
				$.ajax({
					url:'ajax.jsp',
					method:'post',
					cache:false,
					data:{qty:qty,customerid:customerid,pprice:pprice,cartid:cartid},
					success:function(response){
						
					}
				});
			});
		}); */
		 var xmlHttp = new XMLHttpRequest();
	     
	      function showCategory(qty,cartid,price,custid)
	      {
		     /*  if (typeof XMLHttpRequest != "undefined")
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
		      }  */
		      var url="ajax.jsp";
		      url +="?qty="+qty+"&cartid="+cartid+"&price="+price+"&custid="+custid;
		      xmlHttp.onreadystatechange = function(){
		    	  var index;
		    	  var total=0;
		    	  var cartids = document.getElementsByName('cartid');
		    	  
		    	  for(let i=0;i<cartids.length;i++)
		    		 {
		    			if(cartids[i].value == cartid)
		    			{
		    				index = i;
		    				if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
			    			  { 
			    				var allcartid = document.getElementsByName("cartids");
			    				var val = xmlHttp.responseText;
			    				
			    				const Array = val.split(",",2);
			    				var gt = Array[0];
			    				var gq = Array[1];
			    				
			    				allcartid[index].innerHTML = gt;
			    				document.getElementById("cart-quantity").innerHTML=gq;
			    				
			    				for(let i=0;i<allcartid.length;i++)
					    		 {
					    		  	total += parseFloat(allcartid[i].innerHTML);
					    		  	
					    		  	//qty += parseInt(qty[i].innerHTML);  	
					    		 }
			    				 document.getElementById("cart-total").innerHTML=total;
			    			  }
		    			}
		    		 }
		    	  //document.getElementById("cart-quantity").innerHTML=allqty;
		    		 
		      }
		      xmlHttp.open("POST", url, true);
		      xmlHttp.send();
	      }
	</script>
	<style>
		.product-price:before{
			content:none;
		}
	</style>
</head>
<body>
<%@include file="customer-header.jsp" %>
<!-- inner banner -->
<section class="w3l-inner-banner-main">
    <div class="about-inner" style="background-size:auto;">
        <div class="wrapper">
            
            <ul class="breadcrumbs-custom-path">
                <h3>Ecommerce Cart</h3>
                <li><a href="index-2.html">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                <li class="active">Ecommerce Cart</li>
            </ul>
        </div>
    </div>
</section>
<!-- //covers -->


<section class="w3l-ecom-cart">
    <div class="covers-main">
        <div class="wrapper">
            <h1>Shopping Cart</h1>
            <div class="shopping-cart">
                <div id="cart-label" class="column-labels">
                    <label class="product-image">Items</label>
                    <label class="product-details">Product</label>
                    <label class="product-price">Price</label>
                    <label class="product-quantity">Quantity</label>
                    <label class="product-removal">Remove</label>
                    <label class="product-line-price">Total</label>
                </div>
                <%
                	int qty=0;
                	int gq=0;
                	double grandtotal=0;
                	Connection cn=new DBUtil().getConnection();
                	int customerid=(Integer)session.getAttribute("customerid");
                	String qry="select * from customer_cart where customerid=? and status=?";
                	PreparedStatement st=cn.prepareStatement(qry);
                	st.setInt(1, customerid);
                	st.setString(2, "Unpaid");
                	ResultSet rs=st.executeQuery();
                	if(!rs.first()){
                		%>
                			<div class="product" style="justify-content: center;flex-direction: column;">
                				<img name="catimage" src="subcategory/Empty_cart.png" alt="image is not available" class="img-responsive">                				
                				<b>Your Cart is empty</b><br>
                				Looks like you haven't added anything to your cart yet.
                			</div>                			
                		<%
                	}
                	rs.relative(-1);
                	while(rs.next())
                	{
                	
                %>
                <form id="vinform<%=session.getAttribute("cartid") %>" action="CustomerRegistrationController" method="post">
                <div class="product">
                    <div class="product-image">
                        <a href="ecommerce-single.html"><img name="catimage" src="subcategory/<%=rs.getString(8) %>" alt=""
                                class="img-responsive"></a>
                    </div>
                    <div class="product-details">
                        <div class="product-title"><a  href="ecommerce-single.html"><%=rs.getString(4)%></a></div>
                        <p class="product-description"><%=rs.getString(3) %></p>
                    </div>
                    <div class="product-price">&#x20B9;<%=rs.getString(5) %></div>
                   
                    <div class="product-quantity">
                    	<input type="hidden" class="customerid" name="customerid" value="<%=session.getAttribute("customerid") %>" />
                    	<input type="hidden" class="cartid" name="cartid" id="cartid" value="<%=rs.getString(1) %>" />
                    	<input type="hidden" class="pprice" name="pprice" id="pprice" value="<%=rs.getString(5) %>"/>
                        <input type="number" class="itemqty"  name="qty" id="qty"  value="<%=rs.getString(6) %>" min="1" onchange="showCategory(this.value,<%=rs.getString(1)%>,<%=rs.getString(5) %>,<%=session.getAttribute("customerid") %>)">
                    </div>
                    <div class="product-removal close">
                        <!-- <button class="remove-product" name="btn" value="removecartittem">
                            Remove
                        </button> -->
                        <input type="submit" class="remove-product" name="btn" value="Remove" />
                    </div>
                    
                    
                    <div class="product-line-price">&#x20B9; <span id="atotal" name="cartids"><%=rs.getString(7) %></span></div>
                </div>
                </form>
                <%
                		qty += Integer.parseInt(rs.getString(6));
                		grandtotal+= Double.parseDouble(rs.getString(7));
                	}
                	cn.close();
                	
                	
                %>
                <form id="totalForm" action="CustomerRegistrationController" method="post">
                <div class="totals">
                    <div class="totals-item">
                        <label>Total Quantity</label>
                        <div class="totals-value" id="cart-quantity"><%=qty %></div>
                        <input type="hidden" name="totalqty" value="<%=qty %>" />
                    </div>
                    <div class="totals-item totals-item-total">
                        <label>Grand Total</label>
                        <div class="totals-value"> &#x20B9;<span id="cart-total"><%=grandtotal%></span></div>
                        <input type="hidden" name="grandtotal" value="<%=grandtotal %>"/>
                      <input type="hidden"  name="cid" value="<%=session.getAttribute("customerid") %>" />
                    
                    </div>
                </div>
                  
              <!--   <a href="" class="checkout" >Checkout</a> -->
             	<input type="submit" name="btn" value="Checkout" style="background:#228B22; color:#ffffff;" class="checkout"/>
              
                </form>
            </div>
         </div>
      </div>
     
      
       <!-- close script -->
    <script>
        var closebtns = document.getElementsByClassName("close");
        var i;

        for (i = 0; i < closebtns.length; i++) {
            closebtns[i].addEventListener("click", function () {
                this.parentElement.style.display = 'none';
            });
        }
        
    	var cart_counter = document.getElementById("cart_counticon");
    	console.log(cart_counter.innerHTML);
    	if(cart_counter.innerHTML == "0"){
    		document.getElementById("cart-label").style.display = 'none';
    		document.getElementById("totalForm").style.display = 'none';
    		document.getElementById("cart_counticon").style.display = 'none';
    	}else{
    		document.getElementById("cart_counticon").style.display = 'flex';
    	}           
    </script>
    <!-- //close script -->
 </section>
</body>
</html>