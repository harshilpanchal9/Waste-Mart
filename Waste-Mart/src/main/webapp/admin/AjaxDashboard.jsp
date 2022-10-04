<%@page import="com.dao.ZoneDao"%>
<%@page import="com.dao.UserCompanyDao"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String action = request.getParameter("action");
	if(action.equalsIgnoreCase("SearchCategory")){
		String qry="";
		String search = request.getParameter("searchCategory");
		if(search==""){
			qry = "select * from customer_subcategory where subcatid > (select max(subcatid) - 7 from customer_subcategory) order by subcatid desc";
		}else{ 
			qry = "select * from customer_subcategory where itemname like '"+search+"%' LIMIT 7";
		}			
		Connection cn=new DBUtil().getConnection();
		PreparedStatement st=cn.prepareStatement(qry);
		ResultSet rs=st.executeQuery(); 
		if(!rs.first())
		{
			out.println("<li class='item item-list-header' style='color: rgb(153 153 153);font-size: 15px;font-weight: 700 !important;font-style: italic;justify-content: center;height:60px'>");
				out.println("<div class='item-row' style='justify-content: center;'>");
					out.println("<i class='fa fa-frown-o' style='font-size:25px;margin-top:auto;margin-bottom:auto;'></i>&nbsp;&nbsp;Sorry, No item found");
				out.println("</div>");
			out.println("</li>");
		}  
		rs.relative(-1);
		while(rs.next())
		{
			out.println("<li class='item'>");
            out.println("<div class='item-row'>");
                out.println("<div class='item-col fixed item-col-img xs'>");	                    
                    out.println("<div class='item-img xs rounded' style='background-image: url(../subcategory/"+rs.getString(5)+")'></div>");	                    
                out.println("</div>");
                out.println("<div class='item-col item-col-title no-overflow'>");
                    out.println("<div>");	                       
                        out.println("<h4 class='item-title no-wrap'> "+ rs.getString(3) +"</h4>");	                        
                    out.println("</div>");
                out.println("</div>");
                out.println("<div class='item-col item-col-sales'>");
                out.println("<div class='item-heading'>Sales</div>");
                out.println("<div> "+ new CategoryDao().getCategoryName(rs.getInt(2)) +" </div>");
                out.println("</div>");
                out.println("<div class='item-col item-col-sales' style='text-align:center;'>");
                out.println("<div class='item-heading'>Stock</div>");
                out.println("<div> "+ rs.getString(6) +" </div>");
                out.println("</div>");
                out.println("<div class='item-col item-col-date' style='text-align:center;'>");
                	out.println("<div class='item-heading'>Published</div>");
                		out.println("<div> "+ rs.getString(4) +" </div>");
                	out.println("</div>");
                out.println("</div>");
                out.println("</li>");
		}
		cn.close();
	}
	else if(action.equalsIgnoreCase("CustomerItems"))
	{
		String qry="select * from customer_subcategory where subcatid > (select max(subcatid) - 7 from customer_subcategory) order by subcatid desc";		
		Connection cn=new DBUtil().getConnection();
		PreparedStatement st=cn.prepareStatement(qry);
		ResultSet rs=st.executeQuery(); 
		if(!rs.first())
		{
			out.println("<li class='item item-list-header' style='color: rgb(153 153 153);font-size: 15px;font-weight: 700 !important;font-style: italic;justify-content: center;height:60px'>");
				out.println("<div class='item-row' style='justify-content: center;'>");
					out.println("Item list is empty.");
				out.println("</div>");
			out.println("</li>");
		}  
		rs.relative(-1);
		while(rs.next())
		{
			out.println("<li class='item'>");
	            out.println("<div class='item-row'>");
	                out.println("<div class='item-col fixed item-col-img xs'>");	                    
	                    out.println("<div class='item-img xs rounded' style='background-image: url(../subcategory/"+rs.getString(5)+")'></div>");	                    
	                out.println("</div>");
	                out.println("<div class='item-col item-col-title no-overflow'>");
	                    out.println("<div>");	                       
	                        out.println("<h4 class='item-title no-wrap'> "+ rs.getString(3) +"</h4>");	                        
	                    out.println("</div>");
	                out.println("</div>");
	                out.println("<div class='item-col item-col-sales'>");
	                out.println("<div class='item-heading'>Sales</div>");
	                out.println("<div> "+ new CategoryDao().getCategoryName(rs.getInt(2)) +" </div>");
	                out.println("</div>");
	                out.println("<div class='item-col item-col-sales' style='text-align:center;'>");
	                out.println("<div class='item-heading'>Stock</div>");
	                out.println("<div> "+ rs.getString(6) +" </div>");
	                out.println("</div>");
	                out.println("<div class='item-col item-col-date' style='text-align:center;'>");
	                	out.println("<div class='item-heading'>Published</div>");
	                		out.println("<div> "+ rs.getString(4) +" </div>");
	                	out.println("</div>");
	                out.println("</div>");
	                out.println("</li>");
		}
		cn.close();
	} 
	else if(action.equalsIgnoreCase("CompanyTransactions"))
	{
		String qry="SELECT * FROM company_request ORDER BY CAST(gtotal AS SIGNED) DESC LIMIT 8;";
		Connection cn=new DBUtil().getConnection();
		PreparedStatement st=cn.prepareStatement(qry);
		ResultSet rs=st.executeQuery(); 
		if(!rs.first())
		{
			out.println("<li class='item item-list-header' style='color: rgb(153 153 153);font-size: 15px;font-weight: 700 !important;font-style: italic;justify-content: center;height:60px'>");
				out.println("<div class='item-row' style='justify-content: center;'>");
					out.println("Transaction catalog is empty.");
				out.println("</div>");
			out.println("</li>");
		}  
		rs.relative(-1);
		while(rs.next())
		{
			out.println("<li class='item'>");
	            out.println("<div class='item-row'>");
	                out.println("<div class='item-col fixed item-col-img xs'>");	                    
	                    out.println("<div class='item-img xs rounded' style='background-image: url(../company-images/"+new UserCompanyDao().getCompanyImage(rs.getInt(2))+")'></div>");	                    
	                out.println("</div>");
	                out.println("<div class='item-col item-col-title no-overflow'>");
	                    out.println("<div>");	                       
	                        out.println("<h4 class='item-title no-wrap'> "+ new UserCompanyDao().getCompanyName(rs.getInt(2)) +"</h4>");	                        
	                    out.println("</div>");
	                out.println("</div>");
	                out.println("<div class='item-col item-col-sales' style='text-align:center;'>");
	                out.println("<div class='item-heading'>Sales</div>");
	                out.println("<div> "+ rs.getString(7) +" </div>");
	                out.println("</div>");
	                out.println("<div class='item-col item-col-sales' style='text-align:center;'>");
	                out.println("<div class='item-heading'>Stock</div>");
	                out.println("<div> "+ rs.getString(8) +" </div>");
	                out.println("</div>");
	                out.println("<div class='item-col item-col-date' style='text-align:center;'>");
	                	out.println("<div class='item-heading'>Published</div>");
	                		out.println("<div> "+ rs.getString(9) +" </div>");
	                	out.println("</div>");
	                out.println("</div>");
	                out.println("</li>");
		}
		cn.close();
	}
	else if(action.equalsIgnoreCase("Stockitemdata"))
	{
		String qry="SELECT * FROM customer_subcategory ORDER BY CAST(itemstock AS SIGNED) DESC LIMIT 7;";
		Connection cn=new DBUtil().getConnection();
		PreparedStatement st=cn.prepareStatement(qry);
		ResultSet rs=st.executeQuery(); 
		if(!rs.first())
		{
			out.println("<li class='item item-list-header' style='color: rgb(153 153 153);font-size: 15px;font-weight: 700 !important;font-style: italic;justify-content: center;height:60px'>");
				out.println("<div class='item-row' style='justify-content: center;'>");
					out.println("Item stock list is empty.");
				out.println("</div>");
			out.println("</li>");
		}  
		rs.relative(-1);
		while(rs.next())
		{
			out.println("<li class='item'>");
	            out.println("<div class='item-row'>");
	                out.println("<div class='item-col fixed item-col-img xs'>");	                    
	                    out.println("<div class='item-img xs rounded' style='background-image: url(../subcategory/"+new CategoryDao().getCategoryImage(rs.getInt(1))+")'></div>");	                    
	                out.println("</div>"); 
	                out.println("<div class='item-col item-col-title no-overflow'>");
	                    out.println("<div>");	                       
	                        out.println("<h4 class='item-title no-wrap'> "+  rs.getString(3) +"</h4>");	                        
	                    out.println("</div>");
	                out.println("</div>");
	                out.println("<div class='item-col item-col-sales' style='text-align:center;'>");
	                	out.println("<div class='item-heading'>Stock</div>");
	                	out.println("<div> "+ rs.getString(6) +" </div>");
                	out.println("</div>");
	                out.println("</div>");
	                out.println("</li>");
		}
		cn.close();
	}
	else if(action.equalsIgnoreCase("ZoneArea"))
	{
		String qry="SELECT * FROM zone_area;";
		Connection cn=new DBUtil().getConnection();
		PreparedStatement st=cn.prepareStatement(qry);
		ResultSet rs=st.executeQuery(); 
		if(!rs.first())
		{
			out.println("<li class='item item-list-header' style='color: rgb(153 153 153);font-size: 15px;font-weight: 700 !important;font-style: italic;justify-content: center;height:60px'>");
				out.println("<div class='item-row' style='justify-content: center;'>");
					out.println("No any zone area yet.");
				out.println("</div>");
			out.println("</li>");
		}  
		rs.relative(-1);
		while(rs.next())
		{
			out.println("<li class='item'>");
	            out.println("<div class='item-row'>");
	                out.println("<div class='item-col fixed item-col-img xs' style='visibility:hidden;'>");	                    
	                    out.println("<div class='item-img xs rounded'></div>");	                    
	                out.println("</div>");  
	                out.println("<div class='item-col item-col-title no-overflow' style='text-align:left;'>");
	                    out.println("<div>");	                       
	                        out.println("<h4 class='item-title no-wrap'> "+  rs.getString(3) +"</h4>");	                        
	                    out.println("</div>");
	                out.println("</div>");
	                out.println("<div class='item-col item-col-sales' style='text-align:center;'>");
	                	out.println("<div class='item-heading'>Stock</div>");
	                	out.println("<div> "+ new ZoneDao().getZoneName(rs.getInt(1)) +" </div>");
                	out.println("</div>");
	                out.println("</div>");
	                out.println("</li>");
		}
		cn.close();
	}
%>
<script src="js/vendor.js"></script>
<script src="js/app.js"></script>
</body>
</html>