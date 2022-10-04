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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>     
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<%
	String action = request.getParameter("action");
	if(action.equalsIgnoreCase("removerequest")){
		int x=0,cust_id=0;
		String gtotal="";
		int requestid = Integer.parseInt(request.getParameter("requestid"));
		String btn = request.getParameter("btn");
		Connection cn=new DBUtil().getConnection();
		PreparedStatement st = null;
		String qry1 = "select customerid,gtotal from customer_request where requestid="+requestid;
		st = cn.prepareStatement(qry1);
		ResultSet rs = st.executeQuery();
		while(rs.next()){
			cust_id = rs.getInt(1);
			gtotal = rs.getString(2);
		}
		String qry2 = "delete from customer_cart_print where customerid=? and total=?";
		st = cn.prepareStatement(qry2);
		x = st.executeUpdate();
		if(x>0){
			String qry = "delete from customer_request where requestid=?";
		 	st=cn.prepareStatement(qry);
		 	st.setInt(1, requestid);
			x = st.executeUpdate();
			if(x<=0){
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Cannot delete request.')");
				out.println("window.location.href='request-customer.jsp';");
				out.println("</script>");
			}
		}
		cn.close();
	}
	else if(action.equalsIgnoreCase("getStatus"))
	{
		String radiostatus = request.getParameter("radio");
		String zonename = request.getParameter("zonename");
		String qry="";
		if(zonename != null){
			if(zonename.equalsIgnoreCase("all")){
				qry = "select * from customer_request";
			}else{
				qry = "select * from customer_request where zonename='"+ zonename +"'";	
			}			
		}else{
			if(radiostatus.equalsIgnoreCase("pending")){
				qry = "select * from customer_request where status='Pending'";
			}	
			else if(radiostatus.equalsIgnoreCase("completed")){
				qry = "select * from customer_request where status='Completed'";
			}
			else{
				qry = "select * from customer_request"; 
			}
		}
		Connection cn=new DBUtil().getConnection();
		PreparedStatement st=cn.prepareStatement(qry);
		ResultSet rs=st.executeQuery(); 
		if(!rs.first())
		{
			out.println("<li class='item item-list-header' style='color: rgb(153 153 153);font-size: 15px;font-weight: 700 !important;font-style: italic;justify-content: center;height:60px'>");
				out.println("<div class='item-row' style='justify-content: center;'>");
					out.println("Request list is empty.");
				out.println("</div>");
			out.println("</li>");
		}  
		rs.relative(-1);
		while(rs.next())
		{
			out.println("<li class='item'>");
				out.println("<div class='item-row'>");
					out.println("<div class='item-col item-col-author' style='text-align: center;flex-grow:1.4;padding-right: 5px;'>");
						out.println("<div class='item-heading'>Request ID</div>");
						out.println("<div class='no-overflow' style='font-weight: 600;'>"+ rs.getInt(1) + "</div>");
					out.println("</div>");
					out.println("<div class='item-col item-col-author' style='text-align: center;flex-grow:2.3;padding-right: 5px;'>");
						out.println("<div class='item-heading'>Customer ID</div>");
						out.println("<div class='no-overflow' style='font-weight: 600;'>" + rs.getInt(2) + "</div>");
					out.println("</div>");
					out.println("<div class='item-col item-col-author' style='text-align: center;flex-grow:2;padding-right: 5px;'>");
						out.println("<div class='item-heading'>Zone name</div>");
						out.println("<div class='no-overflow' style='font-weight: 600;'> " + rs.getString(5) + "</div>");
					out.println("</div>");
					out.println("<div class='item-col item-col-author' style='text-align: center;flex-grow:2.5;padding-right: 5px;'>");
						out.println("<div class='item-heading'>Zone area</div>");
						out.println("<div class='no-overflow' style='font-weight: 600;'> &nbsp;&nbsp;" + rs.getString(6) + "</div>");
					out.println("</div>");
					out.println("<div class='item-col item-col-author' style='text-align: center;flex-grow:2.5;padding-right: 5px;'>");
						out.println("<div class='item-heading'>Quantity</div>");
						out.println("<div class='no-overflow' style='font-weight: 600;'>" + rs.getString(7) + "</div>");
					out.println("</div>");
					out.println("<div class='item-col item-col-author' style='text-align: center;flex-grow:2.5;padding-right: 5px;'>");
						out.println("<div class='item-heading'>Payable amount</div>");
						out.println("<div class='no-overflow' style='font-weight: 600;'>" + rs.getString(8) + "</div>");
					out.println("</div>");
					out.println("<div class='item-col item-col-author' style='text-align: center;flex-grow:2.7;padding-right: 5px;justify-content:center;'>");
						out.println("<div class='item-heading'>Status</div>");
							String status = rs.getString(9);
							String currentstatus = rs.getString(12);
						
							if(currentstatus.equalsIgnoreCase("pending")){
							out.println("<form action='../UserCustomerController' method='post'>");
								out.println("<div class='no-overflow'>");
									out.println("<input type ='hidden' name='radiostatus' value='" + radiostatus + "'>");
									out.println("<input type ='hidden' name='status' value='" + rs.getString(12) + "'>");
									out.println("<input type='hidden' name='requestid' value='" + rs.getInt(1) + "'>");
									out.println("<input type='hidden' name='paymentmode' value='" + rs.getString(9) + "'>");										
									out.println("<button type='submit' name='action' value='changeStatus' class='btn btn-danger-outline' style='font-weight: 600;width:138px;pointer-events: none;'>" + rs.getString(12) + "</button>");
								out.println("</div>");
							out.println("</form>");
							}
							else{
								out.println("<div class='no-overflow'>");
									out.println("<button class='btn btn-success-outline' style='font-weight: 600;width:138px;pointer-events: none;'>" + rs.getString(12) + "</button>");
								out.println("</div>");
							}
					out.println("</div>");
					out.println("<div class='item-col item-col-author' style='text-align: center;flex-grow:2.5;padding-right: 5px;'>");
						out.println("<div class='item-heading'>Payment mode</div>");
						out.println("<div class='no-overflow' style='font-weight: 600;'>" + rs.getString(9) + "</div>");
					out.println("</div>");
					out.println("<div class='item-col item-col-author no-overflow' style='text-align: center;flex-grow: 2.5;padding-right: 5px;'>");
						out.println("<div class='item-heading'>Pickup time</div>");
						out.println("<div class='no-overflow'>" + rs.getString(10) + "</div>");
					out.println("</div>");
						out.println("<div class='item-col item-col-author no-overflow' style='text-align: center;flex-grow: 2;padding-right: 5px;'>");
						out.println("<div class='item-heading'>Request date</div>");
						out.println("<div class='no-overflow'>");
						String datetime=rs.getString(11);
						String[] dt = datetime.split("T",2);
						for(String str: dt){					 
						out.println(str+"<br>");
						} 
						out.println("</div>");
					out.println("</div>                                                                                                                                              ");
					out.println("<div class='item-col fixed item-col-actions-dropdown'>");
						out.println("<div class='item-actions-dropdown'>");
							out.println("<a class='item-actions-toggle-btn'>");
								out.println("<span class='inactive'>");
									out.println("<i class='fa fa-lg fa-cog'></i>");
								out.println("</span>");
								out.println("<span class='active'>");
									out.println("<i class='fa fa-lg fa-chevron-circle-right'></i>");
								out.println("</span>");
							out.println("</a>");
							out.println("<div class='item-actions-block' style='height: 37px;top: -4px;line-height: 36px;border-radius: 15px;'>");
								out.println("<ul class='item-actions-list'>");
									out.println("<li>");
										out.println("<a class='edit' href='customer-cart.jsp?customerid=" + rs.getInt(2) + "'>");
											out.println("<i class='fa fa-lg fa-shopping-cart'></i>");
										out.println("</a>");
									out.println("</li>");
									out.println("<li>");
										out.println("<a class='edit' href='viewcustomerRequest.jsp?requestid=" + rs.getInt(1) + "'>");
											out.println("<i class='fa fa-lg fa-eye'></i>");
										out.println("</a>");
									out.println("</li>");
									out.println("<li style='padding: 0 5px;'>");
										out.println("<input type='hidden' name='requestid' value='" + rs.getInt(1) + "'>");
										out.println("<a class='remove' href='../UserCustomerController?method=get&btn=deleteCustomerRequest&requestid="+rs.getInt(1)+"''>");
											out.println("<i class='fa fa-lg fa-trash-o'></i>");
										out.println("</a>");
									out.println("</li>");
								out.println("</ul>");
							out.println("</div>");
						out.println("</div>");
					out.println("</div>");
				out.println("</div>");
			out.println("</li>");
		}
		cn.close();
	}
%>
</body>
<script src="js/vendor.js"></script>
<script src="js/app.js"></script>
</html>