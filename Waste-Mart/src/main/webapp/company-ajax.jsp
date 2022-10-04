<%@page import="java.io.PrintWriter"%>
<%@page import="java.awt.image.DataBuffer"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.*" %>
<%
		System.out.println("ajax called");
	 	String qty=request.getParameter("qty");
		String cartid=request.getParameter("cartid");
		String price=request.getParameter("price");
		String companyid = request.getParameter("companyid");
		System.out.println("companyid="+companyid);
		System.out.println("qty="+qty);
		System.out.println("cartid="+cartid);
		double total=Double.parseDouble(price)*Double.parseDouble(qty);
		System.out.println(total);
		String buffer="";
		Connection cn=new DBUtil().getConnection();
		try
		{	
			int qtys=0;
			int x=0;
			String updateCart="update company_cart set quantity=?,total=? where id=?";
			PreparedStatement st=cn.prepareStatement(updateCart);
			st.setString(1, qty);
			st.setString(2, String.valueOf(total));
			st.setInt(3,Integer.parseInt(cartid));
			x=st.executeUpdate();
			System.out.println("X="+x);
			
			
			String update="select * from company_cart where id=?";
			st=cn.prepareStatement(update);
			st.setInt(1,Integer.parseInt(cartid));
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				System.out.println(rs.getString(6));
				buffer=rs.getString(7);
				System.out.println("buffer="+buffer);
				
			}
			String qty_Query = "select * from company_cart where companyid=?";
			st=cn.prepareStatement(qty_Query);
			st.setInt(1,Integer.parseInt(companyid));
			ResultSet rs1=st.executeQuery();
			while(rs1.next())
			{
				qtys =qtys+ Integer.parseInt(rs1.getString(6));
			}
			buffer=buffer+","+qtys;
			out.println(buffer);
		
			cn.close();
		}	
		catch(Exception e)
		{
			System.out.println(e);
		}
		
%>