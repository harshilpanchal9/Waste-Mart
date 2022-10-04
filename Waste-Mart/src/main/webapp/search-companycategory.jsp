<%@page import="java.io.PrintWriter"%>
<%@page import="java.awt.image.DataBuffer"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.*" %>

<%
	Connection cn=new DBUtil().getConnection();
	String name=request.getParameter("company");
	System.out.println(name+" =name");
	String allcategory="select * from category";
	String subcategory="select * from company_subcategory where catid=?";
	
	if(name.equalsIgnoreCase("all")){
		PreparedStatement st=cn.prepareStatement(allcategory);
		ResultSet rs=st.executeQuery();
		while(rs.next())
		{
			out.print("<section class='w3l-grid-3'>");
			  out.print("<div class='top-bottom'>");
			    out.print("<div class='wrapper'>");
			        out.print("<div class='text-link'>");
			            out.print("<h1 style='text-align:center;'>"+rs.getString(2)+"</h1>");
			          		out.print("<div class='middle-section'>");
			          			PreparedStatement st2=cn.prepareStatement(subcategory);
			          			st2.setInt(1, rs.getInt(1));
			          			ResultSet rs2=st2.executeQuery();
			          			while(rs2.next())
			          			{
			          				out.print("<div class='divied-four-grids'>");
					          		out.print("<img src='subcategory/"+rs2.getString(5)+"' style='height:100px;width:100px;margin-left:auto;margin-right:auto;display:block;margin-top:30px;' class='img-responsive' alt=''>");
					          		out.print("<div class='w3layouts-grids-four'>");
					          		out.print("<h4 style='text-align:center;'>"+rs2.getString(3)+"</h4>");
					          		out.print("<p style='text-align:center;'>&#8377;"+rs2.getString(4)+"</p>");
					          		out.print("</div></div>");

			          			}
			    out.print("</div></div></div></div></section>");
		}
	}
	else{
	if(name==null||name.trim().equals(""))
	{
		PreparedStatement st=cn.prepareStatement(allcategory);
		ResultSet rs=st.executeQuery();
		while(rs.next())
		{
			out.print("<section class='w3l-grid-3'>");
			  out.print("<div class='top-bottom'>");
			    out.print("<div class='wrapper'>");
			        out.print("<div class='text-link'>");
			            out.print("<h1 style='text-align:center;'>"+rs.getString(2)+"</h1>");
			          		out.print("<div class='middle-section'>");
			          			PreparedStatement st2=cn.prepareStatement(subcategory);
			          			st2.setInt(1, rs.getInt(1));
			          			ResultSet rs2=st2.executeQuery();
			          			while(rs2.next())
			          			{
			          				out.print("<div class='divied-four-grids'>");
					          		out.print("<img src='subcategory/"+rs2.getString(5)+"' style='height:100px;width:100px;margin-left:auto;margin-right:auto;display:block;margin-top:30px;' class='img-responsive' alt=''>");
					          		out.print("<div class='w3layouts-grids-four'>");
					          		out.print("<h4 style='text-align:center;'>"+rs2.getString(3)+"</h4>");
					          		out.print("<p style='text-align:center;'>&#8377;"+rs2.getString(4)+"</p>");
					          		out.print("</div></div>");

			          			}
			    out.print("</div></div></div></div></section>");
		}
	}
	else
	{
		PreparedStatement st=cn.prepareStatement("select * from company_subcategory where itemname like '"+name+"%'");
		ResultSet rs=st.executeQuery();
		if(!rs.isBeforeFirst())
		{
			out.print("<h1>No Record Found</h1>");
		}
		else
		{
			while(rs.next())
			{
			out.print("<div class='divied-four-grids'>");
      		out.print("<img src='subcategory/"+rs.getString(5)+"' style='height:100px;width:100px;margin-left:auto;margin-right:auto;display:block;margin-top:30px;' class='img-responsive' alt=''>");
      		out.print("<div class='w3layouts-grids-four'>");
      		out.print("<h4 style='text-align:center;'>"+rs.getString(3)+"</h4>");
      		out.print("<p style='text-align:center;'>&#8377;"+rs.getString(4)+"</p>");
      		out.print("</div></div>");
			}

		}
		
	}
	}
	cn.close();
%>