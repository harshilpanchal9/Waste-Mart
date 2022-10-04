package com.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.model.CustomerCartMModel;
import com.model.CustomerRegistrationModel;
import com.model.CustomerRequestModel;
import com.util.DBUtil;

public class CustomerRegistrationDao 
{
	Connection cn=null;
	CustomerRegistrationModel model=null;
	CustomerCartMModel cartmodel=null;
	
	//Registration
	public int doRegister(CustomerRegistrationModel rmodel)
	{
		int x=0;
		//current time
	   	DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
    	String dateString = dateFormat.format(new Date()).toString();
    	System.out.println("Current time in AM/PM: "+dateString);
    	//current date
    	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    	Date date = new Date();
    	String dateString1=formatter.format(date).toString();
    	System.out.println("current date:"+dateString1);
    	String datetime=dateString1+"T"+dateString;

    	
		cn=new DBUtil().getConnection();
		String email=null;
		String qry1="select * from customer_signup where email=?";
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry1);
			st.setString(1, rmodel.getEmail());
		
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				email=rs.getString(5);				
			}
			if(email==null)
			{
				String qry="insert into customer_signup (firstname,lastname,phoneno,email,password,photo,status,date,logindate) values (?,?,?,?,?,?,?,?,?)";
				st=cn.prepareStatement(qry);
				st.setString(1, rmodel.getFirstname());
				st.setString(2, rmodel.getLastname());
				st.setString(3, rmodel.getPhoneno());
				st.setString(4, rmodel.getEmail());
				st.setString(5, rmodel.getPassword());
				st.setString(6, rmodel.getProfilepicture());
				st.setString(7, "Active");		
				st.setString(8, datetime);
				st.setString(9, datetime);
				x=st.executeUpdate();
			}
			cn.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return x;
	}
	
	//Get record for particular customerid
	public CustomerRegistrationModel getRecord(int custid)
	{
		cn=new DBUtil().getConnection();
		String qry="select * from customer_signup where customerid=?";
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, custid);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				model=new CustomerRegistrationModel();
				model.setCustomerid(rs.getInt(1));
				model.setFirstname(rs.getString(2));
				model.setLastname(rs.getString(3));
				model.setPhoneno(rs.getString(4));
				model.setEmail(rs.getString(5));
				model.setPassword(rs.getString(6));
				model.setProfilepicture(rs.getString(8));
			}
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return model;
	}
	
	//for login to check whether email or password exists in databse or not
	public CustomerRegistrationModel doLogin(CustomerRegistrationModel lmodel)
	{
		cn=new DBUtil().getConnection();
		String qry="select * from customer_signup where email=? and password=?";
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, lmodel.getEmail());
			st.setString(2, lmodel.getPassword());
			System.out.println("inside dao");
			System.out.println(lmodel.getEmail());
			System.out.println(lmodel.getPassword());
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				model=new CustomerRegistrationModel();
				model.setCustomerid(rs.getInt(1));
				model.setFirstname(rs.getString(2));
				model.setLastname(rs.getString(3));
				model.setPhoneno(rs.getString(4));
				model.setEmail(rs.getString(5));
				model.setPassword(rs.getString(6));
				model.setProfilepicture(rs.getString(8));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return model;
	}
	
	//Reset  password
	public int updateRecord(CustomerRegistrationModel model)
	{
		int x=0;
		cn=new DBUtil().getConnection();
		String qry="update customer_signup set password=? where email=?";
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, model.getPassword());
			st.setString(2, model.getEmail());
			x=st.executeUpdate();
			cn.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return x;
	}
	//Update profile
	public int updateProfile(CustomerRegistrationModel model)
	{
		int x=0;
		cn=new DBUtil().getConnection();
		String qry="update customer_signup set firstname=?,lastname=?,phoneno=?,email=?,photo=? where customerid=?";
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, model.getFirstname());
			st.setString(2, model.getLastname());
			st.setString(3, model.getPhoneno());
			st.setString(4, model.getEmail());
			st.setString(5, model.getProfilepicture());
			st.setInt(6, model.getCustomerid());
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	//check email
	public CustomerRegistrationModel checkEmail(String email)
	{
		cn=new DBUtil().getConnection();
		String qry="select * from customer_signup where email=?";
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1,email);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				model=new CustomerRegistrationModel();
				model.setEmail(rs.getString(5));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return model;
	}
	
	public int bookRequest(CustomerRequestModel rmodel)
	{
		int x=0,y=0,z=0;
		double gt=0.0,gq=0.0;
		//current time
	   	DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
    	String dateString = dateFormat.format(new Date()).toString();
    	System.out.println("Current time in AM/PM: "+dateString);
    	//current date
    	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    	Date date = new Date();
    	String dateString1=formatter.format(date).toString();
    	System.out.println("current date:"+dateString1);
    	String datetime=dateString1+"T"+dateString;

		cn=new DBUtil().getConnection();
	
		String qry1="select * from customer_gtgq where customerid=?";
		String qry="insert into customer_request (customerid,address,phoneno,zonename,zonearea,paymentmode,pickupdate,status,quantity,gtotal,date) values (?,?,?,?,?,?,?,?,?,?,?) ";
		try {
			PreparedStatement st=cn.prepareStatement(qry1);
			st.setInt(1, rmodel.getCustomerid());
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				gq=gq+Double.parseDouble(rs.getString(3));
				gt=gt+Double.parseDouble(rs.getString(4));
				
			}
			st=cn.prepareStatement(qry);
			st.setInt(1, rmodel.getCustomerid());
			st.setString(2, rmodel.getAddress());
			st.setString(3, rmodel.getPhoneno());
			st.setString(4, rmodel.getZonename());
			st.setString(5, rmodel.getZonearea());
			//st.setString(3, rmodel.getCategoryid());
			st.setString(6, rmodel.getPaymentmode());
			st.setString(7, rmodel.getPickupdate());
			st.setString(8, rmodel.getStatus());
			st.setString(9, String.valueOf(gq));
			st.setString(10, String.valueOf(gt));
			st.setString(11, datetime);
		
			
			x=st.executeUpdate();
			CustomerCartMModel cm=new CustomerRegistrationDao().getCartDetail(rmodel.getCustomerid());
			String delete="delete from customer_gtgq where customerid=?";
			String deletecart="delete from customer_cart where customerid=?";
			st=cn.prepareStatement(delete);
			st.setInt(1, rmodel.getCustomerid());
			
			y=st.executeUpdate();
			st=cn.prepareStatement(deletecart);
			st.setInt(1, rmodel.getCustomerid());
			z=st.executeUpdate();
			System.out.println("delete value ="+y);
			System.out.println("cart delete value="+z);
			cn.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return x;
	}
	//Addtocart
	public int addToCart(CustomerCartMModel cmodel)
	{
		int x=0;
		cn=new DBUtil().getConnection();
		int customerid=0;
		int subcatid=0;
		String qry1="select * from customer_cart where customerid=? and subcatid=?";
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry1);
			st.setInt(1,cmodel.getCustomerid());
			st.setInt(2, cmodel.getSubcatid());
			System.out.println("customerid="+cmodel.getCustomerid());
			System.out.println("subcatid="+cmodel.getSubcatid());
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				customerid=rs.getInt(2);
				subcatid=rs.getInt(3);
				System.out.println(customerid+" "+subcatid);
			}
			if(customerid==0&&subcatid==0)
			{
				String qry="insert into customer_cart (customerid,subcatid,subcatname,price,catimage,quantity,total,status) values (?,?,?,?,?,?,?,?)";
				st=cn.prepareStatement(qry);
				st.setInt(1,cmodel.getCustomerid());
				st.setInt(2, cmodel.getSubcatid());
				st.setString(3, cmodel.getSubcatname());
				st.setString(4, cmodel.getPrice());
				st.setString(5, cmodel.getCatimage());
				st.setString(6, "1");
				st.setString(7, cmodel.getPrice());
				st.setString(8, "unpaid");				
				x=st.executeUpdate();
				
				
			}
			
			cn.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return x;
	}
	
	
	public CustomerCartMModel getCartid(CustomerCartMModel cmodel)
	{
		
		cn=new DBUtil().getConnection();
		String qry="select * from customer_cart where customerid=? and subcatid=?";
		
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, cmodel.getCustomerid());
			st.setInt(2, cmodel.getSubcatid());
			ResultSet rs=st.executeQuery();
			if(rs.next()) 
			{
				cartmodel=new CustomerCartMModel();
				cartmodel.setCartid(rs.getInt(1));
				cartmodel.setCustomerid(rs.getInt(2));
				cartmodel.setSubcatid(rs.getInt(3));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartmodel;
		
	}
	
	public int deleteCartItem(int cartid)
	{
		int x=0;
		cn=new DBUtil().getConnection();
		String qry="delete from customer_cart where id=?";
		
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, cartid);
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	
	/*
	 * public int checkoutDetail(CustomerRequestModel rmodel) { int x=0; cn=new
	 * DBUtil().getConnection(); String
	 * qry="insert into customer_request (customerid,quantity,gtotal) values (?,?,?)"
	 * ;
	 * 
	 * try { PreparedStatement st=cn.prepareStatement(qry); st.setInt(1,
	 * rmodel.getCustomerid()); st.setString(2, rmodel.getQty()); st.setString(3,
	 * rmodel.getGtotal()); x=st.executeUpdate(); } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return x; }
	 */
	/*public int checkoutDetail(CustomerRequestModel rmodel)
	{
		int x=0;
		double gq=0.0,gt=0.0;
		cn=new DBUtil().getConnection();
		String qry1="select * from customer_cart where customerid=?";
		String qry2="insert into customer_request (customerid,quantity,gtotal,status) values (?,?,?,?)";
		
		try {
			PreparedStatement st=cn.prepareStatement(qry1);
			st.setInt(1, rmodel.getCustomerid());
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				gq=gq+Double.parseDouble(rs.getString(6));
				gt=gt+Double.parseDouble(rs.getString(7));
				
			}
			st=cn.prepareStatement(qry2);
			st.setInt(1,rmodel.getCustomerid());
			st.setString(2, rmodel.getQty());
			st.setString(3, rmodel.getGtotal());
			st.setString(4, "Pending");
			x=st.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
		
	}*/
	
	public int checkoutDetail(CustomerRequestModel rmodel)
	{
		int x=0;
		double gq=0.0,gt=0.0;
		cn=new DBUtil().getConnection();
		String qry1="select * from customer_cart where customerid=?";
		String qry2="insert into customer_gtgq (customerid,gq,gt) values (?,?,?)";
		
		try {
			PreparedStatement st=cn.prepareStatement(qry1);
			st.setInt(1, rmodel.getCustomerid());
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				gq=gq+Double.parseDouble(rs.getString(6));
				gt=gt+Double.parseDouble(rs.getString(7));
				
			}
			st=cn.prepareStatement(qry2);
			st.setInt(1,rmodel.getCustomerid());
			st.setString(2, String.valueOf(gq));
			st.setString(3, String.valueOf(gt));
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
		
	}
	public CustomerCartMModel getCartDetail(int customerid)
	{
		int x=0;
		String qry="select * from customer_cart where customerid=?";
		cn=new DBUtil().getConnection();
		 CustomerCartMModel cm=new CustomerCartMModel();
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, customerid);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				
				cm.setCartid(rs.getInt(1));
				cm.setCustomerid(rs.getInt(2));
				cm.setSubcatid(rs.getInt(3));
				cm.setSubcatname(rs.getString(4));
				cm.setPrice(rs.getString(5));
				cm.setQty(rs.getString(6));
				cm.setTotal(rs.getString(7));
				cm.setCatimage(rs.getString(8));
				x=new CustomerRegistrationDao().printCartDetail(cm);
				
			}
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cm;
	}
	
	public int printCartDetail(CustomerCartMModel cmodel)
	{
		int x=0;
		cn=new DBUtil().getConnection();
		String str="insert into customer_cart_print (id,customerid,subcatid,subcatname,price,quantity,total,catimage,status) values (?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement st=cn.prepareStatement(str);
			st.setInt(1, cmodel.getCartid());
			st.setInt(2, cmodel.getCustomerid());
			st.setInt(3, cmodel.getSubcatid());
			st.setString(4, cmodel.getSubcatname());
			st.setString(5, cmodel.getPrice());
			st.setString(6, cmodel.getQty());
			st.setString(7, cmodel.getTotal());
			st.setString(8, cmodel.getCatimage());
			st.setString(9, "Unpaid");
			x=st.executeUpdate();
			cn.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	public int updateStock(int custid)
	{
		cn=new DBUtil().getConnection();
		int x=0,y=0;
		int subcatid=0,qty=0,currentQty=0,totalQty=0;
		String qry="update customer_subcategory set itemstock=? where subcatid=?";
		String getCurrentQty="select * from customer_subcategory where subcatid=?";
		String getQty="select * from customer_cart_print where status=? and customerid=?";
		String updateStatus="update customer_cart_print set status=? where customerid=?";
		try {
			PreparedStatement st=cn.prepareStatement(getQty);
			st.setString(1, "Unpaid");
			st.setInt(2, custid);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				subcatid=rs.getInt(3);
				qty=(Integer)rs.getInt(6);
				st=cn.prepareStatement(getCurrentQty);
				st.setInt(1, subcatid);
				ResultSet rs2=st.executeQuery();
				while(rs2.next())
				{
					currentQty=Integer.parseInt(rs2.getString(6));
				}
				totalQty=qty+currentQty;
				st=cn.prepareStatement(qry);
				st.setString(1,String.valueOf(totalQty));
				st.setInt(2,subcatid);
				x=st.executeUpdate();
				st=cn.prepareStatement(updateStatus);
				st.setString(1,"Paid");
				st.setInt(2, custid);
				y=st.executeUpdate();
			}
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return x;
	}
	
	public int updateRequestStatus(int rid)
	{
		cn=new DBUtil().getConnection();
		int x=0;
		String str="update customer_request set status=? where requestid=?";
		try {
			PreparedStatement st=cn.prepareStatement(str);
			st.setString(1, "Completed");
			st.setInt(2, rid);
			x=st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	
	public int updateLoginDate(int id)
	{
		int x=0;
		cn=new DBUtil().getConnection();
		//current time
	   	DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
    	String dateString = dateFormat.format(new Date()).toString();
    	System.out.println("Current time in AM/PM: "+dateString);
    	//current date
    	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    	Date date = new Date();
    	String dateString1=formatter.format(date).toString();
    	System.out.println("current date:"+dateString1);
    	String datetime=dateString1+"T"+dateString;

		String str="update customer_signup set logindate=? where customerid=?";
		try {
			PreparedStatement st=cn.prepareStatement(str);
			st.setString(1, datetime);
			st.setInt(2, id);
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
			
	}
	
}
