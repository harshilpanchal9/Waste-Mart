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
	
	String status = request.getParameter("radio");
	String qry="",temp="";
	String search = request.getParameter("search");
	if(status.equalsIgnoreCase("active")){
		qry = "select * from zoner_signup where status='Active'";
	}	
	else if(status.equalsIgnoreCase("deactive")){
		qry = "select * from zoner_signup where status='Deactive'";
	}
	else{
		temp = "All";
		qry = "select * from zoner_signup where status in ('Active','Deactive')"; 
	}
	if(search.length()>0){
		qry = qry + " and firstname like '%"+search+"%'";
	}
	int count=0;
 	Connection cn=new DBUtil().getConnection();
 	PreparedStatement st=cn.prepareStatement(qry);
    ResultSet rs=st.executeQuery(); 
    if(!rs.first())
    {
    	out.println("<li class='item item-list-header' style='color: rgb(153 153 153);font-size: 15px;font-weight: 700 !important;font-style: italic;justify-content: center;height:60px'>");	
    	out.println("<div class='item-row' style='justify-content: center;'>");
    	out.println("<script>");
    	out.println("console.log(document.getElementById('selectAll').checked);");
    	out.println("document.getElementById('selectAll').checked = false;");
    	out.println("document.getElementById('selectAll').disabled = true;");
    	out.println("</script>");
    	out.println("No any zoner to view");
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
   		out.println("<div name='divimage' class='item-col fixed item-col-img md'>");
   		out.println("<a href='#'>");
   		out.println("<div class='item-img rounded' style='background-image: url(../zoner-images/"+rs.getString(11)+")'></div>");
   		out.println("</a>");
   		out.println("</div>");
   		out.println("<div name='divname' class='item-col item-col-author' style='text-align: center;flex-grow:2.5;padding-right: 5px;'>");
   		out.println("<div class='item-heading'>Name</div>");
   		out.println("<div class='no-overflow' style='font-weight: 600;'> "+ rs.getString(2)+"&nbsp;"+rs.getString(3)+" </div>");
   		out.println("</div>");
   		out.println("<div name='divzonename' class='item-col item-col-stats' style='text-align: center;flex-grow: 2.2;padding-right: 5px;'>");
   		out.println("<div class='item-heading'>Zone name</div>");
   		out.println("<div class='no-overflow'>"+ rs.getString(7)+"</div>");
   		out.println("</div>");
   		out.println("<div name='divzonearea' class='item-col item-col-stats' style='text-align: center;flex-grow: 2.2;padding-right: 5px;'>");
   		out.println("<div class='item-heading'>Zone area</div>");
   		out.println("<div class='no-overflow'>"+ rs.getString(8)+"</div>");
   		out.println("</div>");
   		out.println("<div name='divemail' class='item-col fixed pull-left item-col-title' style='text-align: center;flex-grow:4.3;padding-right: 5px;'>");
   		out.println("<div class='item-heading'>Email</div>");
   		out.println("<div>");
   		out.println("<a href='mailto:"+rs.getString(6)+"'>");
   		out.println("<h3 class='item-title'>"+rs.getString(6)+"</h3>");
   		out.println("</a>");
   		out.println("</div>");
   		out.println("</div>");   		
   		out.println("<div name='divphoneno' class='item-col item-col-stats' style='text-align: center;flex-grow: 2.2;padding-right: 5px;'>");
   		out.println("<div class='item-heading'>Phone No</div>");
   		out.println("<div class='no-overflow'>"+ rs.getString(5)+"</div>");
   		out.println("</div>");
   		out.println("<div name='divdate' class='item-col item-col-stats no-overflow' style='text-align: center;flex-grow: 1.9;padding-right: 5px;'>");                                        
                out.println("<div class='item-heading'>Registration Date</div>");
                out.println("<div class='no-overflow'>");
                String date="",time="",datetime=rs.getString(9);
                	String[] dt = datetime.split("T",2);
                	for(String str: dt){                 
                		out.println(str+"<br>");
                	}
                out.println("</div>");
            out.println("</div>");
           
            out.println("<div name='divpassword' class='item-col item-col-date' style='text-align: center;flex-grow: 2;'>");
                out.println("<div class='item-heading'>Password</div>");
                out.println("<div class='no-overflow'>"+rs.getString(10)+"</div>");
            out.println("</div>");
            out.println("<div class='item-col item-col-date' style='text-align: center;flex-grow: 1.5;padding-top: 16px;justify-content: center;'>");
                out.println("<div class='item-heading'>Status</div>");
                out.println("<div class='no-overflow'>");
                out.println("<form action='../UserZonerController'>");                	                
               	out.println("<input type='hidden' name='zoner_id' value='"+rs.getInt(1)+"'><input type='hidden' name='status' value='"+rs.getString(12)+"'><input type='hidden' name='all' value='"+temp+"'>");
               	String statusname = rs.getString(12);               	
               		if(statusname.equalsIgnoreCase("active")){						
               			out.println("<button type='submit' name='btn' value='ZonerStatus' class='btn btn-oval btn-success' style='color:#ffffff;background-color: #4bcf99;border-color: #4bcf99;color:#ffffff;box-shadow:none;outline-offset:none;'>"+rs.getString(12)+"</button>");
               		}else{               			
               			out.println("<button type='submit' name='btn' value='ZonerStatus' class='btn btn-oval btn-success' style='color:#ffffff;background-color: #ff0000;border-color: #ff0c00;color:#ffffff;box-shadow:none;outline-offset:none;'>"+rs.getString(12)+"</button>");
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
                                out.println("<a class='edit' href='editzoner.jsp?zonerid="+rs.getInt(1)+"'>");
                                	out.println("<i name='lock' class='fa fa-lg fa-pencil'></i>");
                               out.println("</a>");
                            out.println("</li>"); 
                            out.println("<li style='padding: 0 5px;'>");
                                out.println("<a class='edit' href='viewzoner.jsp?zonerid="+rs.getInt(1)+"'>");
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
	
%>		
</body>
<script src="js/vendor.js"></script>
<script src="js/app.js"></script>
</html>