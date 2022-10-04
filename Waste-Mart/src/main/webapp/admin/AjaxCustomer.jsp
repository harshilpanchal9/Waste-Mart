<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	if(action!=null){
		String status = request.getParameter("radio");
		String qry="",temp="";		
		String search = request.getParameter("search");
		
        if(status.equalsIgnoreCase("active")){
			qry = "select count(*) as totalconsumers from customer_signup where status='Active'";
		}	
		else if(status.equalsIgnoreCase("deactive")){
			qry = "select count(*) as totalconsumers from customer_signup where status='Deactive'";
		}
		else{
			temp = "All";
			qry = "select count(*) as totalconsumers from customer_signup where status in ('Active','Deactive')"; 
		}
        if(search.length()>0){
			qry = qry + " and firstname like '%"+search+"%'";
		}
        System.out.println("Qry: "+qry);
	 	Connection cn=new DBUtil().getConnection();
	 	PreparedStatement st=cn.prepareStatement(qry);
	    ResultSet rs=st.executeQuery(); 
	    if(rs.next()){
	    	int totalconsumers = rs.getInt("totalconsumers");
	    	out.println(totalconsumers);
	    }
	}
	else{
	
	String status = request.getParameter("radio");
	int pagenumber = Integer.parseInt(request.getParameter("pagenumber"));
	String qry="",temp="";
	String search = request.getParameter("search");
	
	if(status.equalsIgnoreCase("active")){
		qry = "select * from customer_signup where status='Active'";
	}	
	else if(status.equalsIgnoreCase("deactive")){
		qry = "select * from customer_signup where status='Deactive'";
	}
	else{
		temp = "All";
		qry = "select * from customer_signup where status in ('Active','Deactive')"; 
	}
	if(search.length()>0){
		qry = qry + " and firstname like '%"+search+"%'";
	}
	qry = qry + " limit "+(pagenumber-1)*10+","+(10);
	
	int count=0;
	Connection cn=new DBUtil().getConnection();
 	PreparedStatement st=cn.prepareStatement(qry);
    ResultSet rs=st.executeQuery(); 
    if(!rs.first())
    {
    	out.println("<li class='item item-list-header' style='color: rgb(153 153 153);font-size: 15px;font-weight: 700 !important;font-style: italic;justify-content: center;height:60px'>");	
    	out.println("<div class='item-row' style='justify-content: center;'>");
    	out.println("<script>");
    	out.println("document.getElementById('selectAll').checked = false;");
    	out.println("document.getElementById('selectAll').disabled = true;");
    	out.println("</script>");
    	out.println("No any customer user to view");
    	out.println("</div>");
    	out.println("</li>");    	 
    }
    rs.relative(-1);
   	while(rs.next())
   	{       
   		count++;
   		// Select all checkbox code
   		out.println("<script>");   		
    	out.println("document.getElementById('selectAll').disabled = false;");
    	out.println("</script>");
   		//---------------
   		out.println("<li class='item'>");
   		out.println("<div class='item-row'>");
   		out.println("<div name='divcheckbox' class='item-col fixed item-col-check'>");   		
   		out.println("<label class='item-check'>");
   		out.println("<input type='checkbox' class='checkbox' id='checkcategory' onchange='removeitem("+rs.getInt(1)+")'>");                                        
   		out.println("<span></span>");
   		out.println("</label>");
   		out.println("</div>");
   		out.println("<div name='divimage' class='item-col fixed item-col-img md'>");
   		out.println("<a href='#'>");
   		out.println("<div class='item-img rounded' style='background-image: url(../customer-images/"+rs.getString(8)+")'></div>");
   		out.println("</a>");
   		out.println("</div>");
   		out.println("<div name='divname' class='item-col item-col-author' style='text-align: center;flex-grow:2.5;padding-right: 5px;padding-left: 9px;'>");
   		out.println("<div class='item-heading'>Name</div>");
   		out.println("<div class='no-overflow' style='font-weight: 600;'> "+ rs.getString(2)+"&nbsp;"+rs.getString(3)+" </div>");
   		out.println("</div>");
   		out.println("<div name='divemail' class='item-col fixed pull-left item-col-title' style='text-align: center;flex-grow:4.3;padding-right: 5px;'>");
   		out.println("<div class='item-heading'>Email</div>");
   		out.println("<div>");
   		out.println("<a href='mailto:"+rs.getString(5)+"'>");
   		out.println("<h3 class='item-title'>"+rs.getString(5)+"</h3>");
   		out.println("</a>");
   		out.println("</div>");
   		out.println("</div>");
   		out.println("<div name='divphoneno' class='item-col item-col-stats' style='text-align: center;flex-grow: 2.2;padding-right: 5px;'>");
   		out.println("<div class='item-heading'>Phone No</div>");
   		out.println("<div class='no-overflow'>"+ rs.getString(4)+"</div>");
   		out.println("</div>");
   		out.println("<div name='divdate' class='item-col item-col-stats no-overflow' style='text-align: center;flex-grow: 1.9;padding-right: 5px;'>");                                        
                out.println("<div class='item-heading'>Registration Date</div>");
                out.println("<div class='no-overflow'>");
                String r_date="",l_date="",datetime=rs.getString(7);
               	String[] dt = datetime.split("T",2);
               	r_date = dt[0];
               	for(String str: dt){                 
               		out.println(str+"<br>");
                }
                out.println("</div>");
            out.println("</div>");
            out.println("<div name='divlogindate' class='item-col item-col-date no-overflow' style='text-align: center;flex-grow: 1.9;padding-right: 5px;'>");
                out.println("<div class='item-heading'>Login Date</div>");
                out.println("<div class='no-overflow'>");
                String lastlogin=rs.getString(9);
                	dt = lastlogin.split("T",2);
                	l_date = dt[0];
                	for(String str: dt){                 
						out.println(str+"<br>");
                    } 
                out.println("</div>");
            out.println("</div>");
            out.println("<div name='divpassword' class='item-col item-col-date' style='text-align: center;flex-grow: 2;'>");
                out.println("<div class='item-heading'>Password</div>");
                out.println("<div class='no-overflow'>"+rs.getString(6)+"</div>");
            out.println("</div>");
            out.println("<div class='item-col item-col-date' style='text-align: center;flex-grow: 1.5;padding-top: 16px;justify-content: center;'>");
                out.println("<div class='item-heading'>Status</div>");
                out.println("<div class='no-overflow'>");
                out.println("<form action='../UserCustomerController'>");                	                
               	out.println("<input type='hidden' name='cust_id' value='"+rs.getInt(1)+"'><input type='hidden' name='status' value='"+rs.getString(10)+"'><input type='hidden' name='all' value='"+temp+"'>");
               	// Check the user inactivity
               		String checkStatus = rs.getString(10);
               		if(checkStatus.equalsIgnoreCase("Active")){
	               		SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yy");
	               		Date date1 = new SimpleDateFormat("dd/MM/yy").parse(l_date);
	               		//System.out.println("Last logindate: " + sd.format(date1));
	               		LocalDate convert_date1 = date1.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();               		
	               		LocalDate currentDate = LocalDate.now();
	               		LocalDate C_DateMinus6Months = currentDate.minusMonths(6);
	               		String format = C_DateMinus6Months.format(DateTimeFormatter.ofPattern("dd/MM/yy"));
	               		//System.out.println("Before 6 months of current date" + format);
	               		Date d1 = sd.parse(l_date);
	               		Date d2 = sd.parse(format);
	               		if(d1.before(d2)){
	               			String qry1 = "update customer_signup set status=? where customerid=?";
	               			st = cn.prepareStatement(qry1);
	               			st.setString(1, "Deactive");
	            			st.setInt(2, rs.getInt(1));
	            			int x = st.executeUpdate();
	            			System.out.println("X: "+x);
	               		}   
               		}
               	//--------------------------
               	String statusname = rs.getString(10);               	
           		if(statusname.equalsIgnoreCase("active")){					
           			out.println("<button type='submit' name='btn' value='CustomerStatus' class='btn btn-oval btn-success' style='color:#ffffff;background-color: #4bcf99;border-color: #4bcf99;color:#ffffff;box-shadow:none;outline-offset:none;'>"+rs.getString(10)+"</button>");
           		}else{
           			out.println("<button type='submit' name='btn' value='CustomerStatus' class='btn btn-oval btn-success' style='color:#ffffff;background-color: #ff0000;border-color: #ff0c00;color:#ffffff;box-shadow:none;outline-offset:none;'>"+rs.getString(10)+"</button>");
           		}	                	                	
            	out.println("</form>");
            	out.println("</div>");
            out.println("</div>");
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
                        out.println("<li style='padding: 0 5px;'>");
                            out.println("<a class='edit' href='viewcustomer.jsp?custid="+rs.getInt(1)+"'>");
                            out.println("<i class='fa fa-lg fa-eye'></i>");
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
   	out.println("<input type='hidden' id='count' name='count' value="+count+">");
	}
	
	
%>	
<script src="js/vendor.js"></script>
<script src="js/app.js"></script>	
</body>
</html>