function searchPages()
{
	window.addEventListener('keyup', function(event) {	
	    if (event.keyCode === 13) {
	    	var searchbar = document.getElementById("searchfile").value;
			var search = searchbar.toLowerCase();	
			search=search.replace(/\s/g,"");	
			if(search=="zone"){
				window.location.href = "zone.jsp";				
			}
			else if(search.includes("dashboard")){
				window.location.href = "dashboard.jsp";				
			}
			else if(search.includes("addcategory")){
				window.location.href = "category.jsp";
			}
			else if(search.includes("category")){
				window.location.href = "viewcategory.jsp";
			}
			else if(search.includes("viewcategory")){
				window.location.href = "viewcategory.jsp";
			}
			else if(search.includes("categorylist")){
				window.location.href = "viewcategory.jsp";
			}
			else if(search.includes("additem"))
			{
				window.location.href="customeraddsubcategory.jsp";
			}
			else if(search.includes("itemlist"))
			{
				window.location.href="customerviewsubcategory.jsp";
			}
			else if(search.includes("registration"))
			{
				window.location.href="customer.jsp";
			}
			else if(search.includes("request"))
			{
				window.location.href="request-customer.jsp";
			}
			else if(search.includes("requestcustomer"))
			{
				window.location.href="request-customer.jsp";
			}
			else if(search.includes("requestcompany"))
			{
				window.location.href="request-company.jsp";
			}
			else if(search.includes("stock"))
			{
				window.location.href="stocks.jsp";
			}
			else if(search.includes("service") || search.includes("services"))
			{
				window.location.href="services.jsp";
			}
			else if(search.includes("zoner"))
			{
				window.location.href="zonerviewregistration.jsp";
			}
			else if(search.includes("zoner registration"))
			{
				window.location.href="zonerviewregistration.jsp";
			}
			else if(search.includes("transactions") || search.includes("transaction"))
			{
				window.location.href="payment.jsp";
			}
	  	}else{
			return false;
		}
	});
}