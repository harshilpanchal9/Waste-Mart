<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%

	String zonename=request.getParameter("zoneid");
if(zonename!=null)
{	
	System.out.println(zonename);
	int id=0;
	String getid="select * from zone where zonename=?";
	
	String msg="No any zone area avalilable";
	String buffer="<label>Zone Area</label><select name='zonearea' id='zonearea'  style='width:450px; height:40px;' onchange='zoneareaDropdown()'> <option selected disabled hidden >Select Zonearea</option>";
	Connection cn=new DBUtil().getConnection();
	String str="select * from  zone_area where zoneid=?";
	try
	{
		
	PreparedStatement st=cn.prepareStatement(getid);
	st.setString(1,zonename);
	ResultSet rs=st.executeQuery();
	while(rs.next())
	{
		id=rs.getInt(1);
	}
	st=cn.prepareStatement(str);
	st.setInt(1,id);
	rs=st.executeQuery();
	if(!rs.first())
	{
		  buffer=buffer+"<option disabled>"+msg+"</option>"; 
	}
	rs.relative(-1);
	while(rs.next())
	{
		 buffer=buffer+"<option value='"+rs.getString(3)+"'>"+rs.getString(3)+"</option>"; 		
	}
	buffer=buffer+"</select>"; 
	buffer=buffer+"<span id='zoneareaerror' style='visibility:hidden;'></span>";
    response.getWriter().println(buffer);
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
}

	

%>