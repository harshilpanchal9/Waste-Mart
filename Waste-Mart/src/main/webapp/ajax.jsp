<%@page import="java.io.PrintWriter"%>
<%@page import="java.awt.image.DataBuffer"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.*" %>
<%
	/* String customerid=request.getParameter("customerid");
	String pprice=request.getParameter("pprice");
	String qty=request.getParameter("qty");
	String cartid=request.getParameter("cartid");
	System.out.println("id="+customerid);
	System.out.println("price="+pprice);
	System.out.println("qty="+qty);
	System.out.println("cartid="+cartid);
	double total=(Double.parseDouble(qty))*(Double.parseDouble(pprice));
	System.out.println(total+" total");
	
	
	Connection cn=new DBUtil().getConnection();
	
	try
	{	
		int x=0;
		String updateCart="update customer_cart set quantity=?,total=? where id=?";
		PreparedStatement st=cn.prepareStatement(updateCart);
		st.setString(1, qty);
		st.setString(2, String.valueOf(total));
		st.setInt(3,Integer.parseInt(cartid));
		x=st.executeUpdate();
		System.out.println("X="+x);
		
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
	 */
	
	
			
	
		System.out.println("ajax called");
	 	String qty=request.getParameter("qty");
		String cartid=request.getParameter("cartid");
		String price=request.getParameter("price");
		String custid = request.getParameter("custid");
		double total=Double.parseDouble(price)*Double.parseDouble(qty);
		String buffer="";
		Connection cn=new DBUtil().getConnection();
		try
		{	
			int qtys=0;
			/* String qty_Query = "select * from customer_cart where customerid=?";
			PreparedStatement st=cn.prepareStatement(qty_Query);
			st.setInt(1,Integer.parseInt(custid));
			ResultSet rs1=st.executeQuery();
			while(rs1.next())
			{
				qtys =qtys+ Integer.parseInt(rs1.getString(6));
			}
			System.out.println(qtys);
 */			
		
			int x=0;
			String updateCart="update customer_cart set quantity=?,total=? where id=?";
			PreparedStatement st=cn.prepareStatement(updateCart);
			st.setString(1, qty);
			st.setString(2, String.valueOf(total));
			st.setInt(3,Integer.parseInt(cartid));
			x=st.executeUpdate();
			
			String update="select * from customer_cart where id=?";
			st=cn.prepareStatement(update);
			st.setInt(1,Integer.parseInt(cartid));
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				buffer=rs.getString(7);
				
			}
			String qty_Query = "select * from customer_cart where customerid=?";
			st=cn.prepareStatement(qty_Query);
			st.setInt(1,Integer.parseInt(custid));
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