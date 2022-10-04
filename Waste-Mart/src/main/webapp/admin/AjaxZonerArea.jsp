<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%				
	int zoneid = Integer.parseInt(request.getParameter("zoneid"));
	String action = request.getParameter("action");
	if(action.equalsIgnoreCase("editZoner")){
		Connection cn = new DBUtil().getConnection();
		String qry = "select * from zone_area where zoneid=?";
		PreparedStatement st = cn.prepareStatement(qry);
     	st.setInt(1, zoneid);
     	ResultSet rs = st.executeQuery();
     	if(!rs.first()){     
     		System.out.println("No area found.");
 			out.println("<option id='getzonearea' disabled>");
 			out.println("No any zone.");
 			out.println("</option>");                  		
	 	}
	 	rs.relative(-1);
	 	while(rs.next()){                
	 		System.out.println(rs.getString(3));	
	 		out.println("<option id='getzonearea' value='"+rs.getString(3)+"'>"+rs.getString(3)+"</option>");                  	
	 	}
	 	cn.close();
	}else if(action.equalsIgnoreCase("registerZoner")){		
		out.println("<div class='form-group has-error'>");
		out.println("<label>Select Zone area</label>");
	       out.println("<div class='form-group has-error'>");
	       	out.println("<select name='zoneareaid' id='zonearea' class='form-control' id='dropdownid' onchange='selectZoneArea()'>");
	            out.println("<option selected disabled hidden>Select area</option>");                  
	             	Connection cn = new DBUtil().getConnection();
	             	String qry = "select * from zone_area where zoneid=?";
	             	PreparedStatement st = cn.prepareStatement(qry);
	             	st.setInt(1, zoneid);
	             	ResultSet rs = st.executeQuery();
	             	if(!rs.first()){                  		
	             			out.println("<option disabled>No any zone.</option>");                  		
	             	}
	             	rs.relative(-1);
	             	while(rs.next()){                  		
	             			out.println("<option value='"+rs.getString(3)+"'>"+rs.getString(3)+"</option>");                  	
	             	}	   
	             	cn.close();
	        	out.println("</select>");
	        	out.println("<span class='has-error' id='zoneareaerror'style='visibility:hidden'></span>");
	    	out.println("</div>");                                                                
	   	out.println("</div>");  
	}
%>
<script>
	var result = document.getElementById('getzonearea').value;
	console.log(result);
</script>
</body>
</html>