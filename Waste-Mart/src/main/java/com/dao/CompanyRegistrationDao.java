package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.model.CompanyCartModel;
import com.model.CompanyRegistrationModel;
import com.model.CompanyRequestModel;
import com.model.CustomerCartMModel;
import com.model.CustomerRegistrationModel;
import com.model.CustomerRequestModel;
import com.util.DBUtil;

public class CompanyRegistrationDao {
	
	Connection cn=null;
	CompanyRegistrationModel model=null;
	CompanyCartModel cartmodel=null;
	//Registration
	public int doRegister(CompanyRegistrationModel rmodel)
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
		String check="select * from company_signup where email=?";
		try {
			PreparedStatement st=cn.prepareStatement(check);
			st.setString(1, rmodel.getEmail());
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				email=rs.getString(3);
			}
			if(email==null)
			{
				String qry="insert into company_signup (companyname,phoneno,email,password,photo,date,status,logindate) values (?,?,?,?,?,?,?,?)";
				st=cn.prepareStatement(qry);
				st.setString(1, rmodel.getName());
				st.setString(2, rmodel.getPhoneno());
				st.setString(3, rmodel.getEmail());
				st.setString(4, rmodel.getPassword());
				st.setString(5, rmodel.getProfile());
				st.setString(6, datetime);
				st.setString(7, "Active");
				st.setString(8, datetime);
				x=st.executeUpdate();
			}
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	//Login
	public CompanyRegistrationModel doLogin(CompanyRegistrationModel lmodel)
	{
		cn=new DBUtil().getConnection();
		String qry="select * from company_signup where email=? and password=?";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, lmodel.getEmail());
			st.setString(2, lmodel.getPassword());
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				model=new CompanyRegistrationModel();
				model.setCompanyid(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setPhoneno(rs.getString(3));
				model.setEmail(rs.getString(4));
				model.setPassword(rs.getString(5));
				model.setProfile(rs.getString(8));
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	//Get Record threw id
	public CompanyRegistrationModel getRecord(int comid)
	{
		cn=new DBUtil().getConnection();
		String qry="select * from company_signup where companyid=?";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, comid);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				model=new CompanyRegistrationModel();
				model.setCompanyid(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setPhoneno(rs.getString(3));
				model.setEmail(rs.getString(4));
				model.setProfile(rs.getString(8));
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	//Update Password
	public int updateRecord(CompanyRegistrationModel model)
	{
		int x=0;
		cn=new DBUtil().getConnection();
		String qry="update company_signup set password=? where email=?";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, model.getPassword());
			st.setString(2, model.getEmail());
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	//Update Profile
	public int updateProfile(CompanyRegistrationModel model)
	{
		int x=0;
		cn=new DBUtil().getConnection();
		String qry="update company_signup set companyname=?,phoneno=?,email=?,photo=? where companyid=?";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, model.getName());
			st.setString(2, model.getPhoneno());
			st.setString(3, model.getEmail());
			st.setString(4, model.getProfile());
			st.setInt(5, model.getCompanyid());
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	//check email
		public CompanyRegistrationModel checkEmail(String email)
		{
			cn=new DBUtil().getConnection();
			String qry="select * from company_signup where email=?";
			try {
				PreparedStatement st=cn.prepareStatement(qry);
				st.setString(1,email);
				ResultSet rs=st.executeQuery();
				if(rs.next())
				{
					model=new CompanyRegistrationModel();
					model.setEmail(rs.getString(4));
				}
				cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return model;
		}
		//Addtocart
		public int addToCart(CompanyCartModel cmodel)
		{
			int x=0;
			cn=new DBUtil().getConnection();
			int companyid=0;
			int subcatid=0;
			String qry1="select * from company_cart where companyid=? and subcatid=?";
			try 
			{
				PreparedStatement st=cn.prepareStatement(qry1);
				st.setInt(1,cmodel.getCompanyid());
				st.setInt(2, cmodel.getSubcatid());
				System.out.println("customerid="+cmodel.getCompanyid());
				System.out.println("subcatid="+cmodel.getSubcatid());
				ResultSet rs=st.executeQuery();
				if(rs.next())
				{
					companyid=rs.getInt(2);
					subcatid=rs.getInt(3);
					System.out.println(companyid+" "+subcatid);
				}
				if(companyid==0&&subcatid==0)
				{
					String qry="insert into company_cart (companyid,subcatid,subcatname,price,catimage,quantity,total,status) values (?,?,?,?,?,?,?,?)";
					st=cn.prepareStatement(qry);
					String total=String.valueOf(Integer.parseInt(cmodel.getPrice())*10);
					st.setInt(1,cmodel.getCompanyid());
					st.setInt(2, cmodel.getSubcatid());
					st.setString(3, cmodel.getSubcatname());
					st.setString(4, cmodel.getPrice());
					st.setString(5, cmodel.getCatimage());
					st.setString(6, "10");
					st.setString(7, total);
					st.setString(8, "Unpaid");					
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
		//Get Cart id
		public CompanyCartModel getCartid(CompanyCartModel cmodel)
		{
			cn=new DBUtil().getConnection();
			String qry="select * from company_cart where companyid=? and subcatid=?";
			try {
				PreparedStatement st=cn.prepareStatement(qry);
				st.setInt(1, cmodel.getCompanyid());
				st.setInt(2, cmodel.getSubcatid());
				ResultSet rs=st.executeQuery();
				if(rs.next()) 
				{
					cartmodel=new CompanyCartModel();
					cartmodel.setCartid(rs.getInt(1));
					cartmodel.setCompanyid(rs.getInt(2));
					cartmodel.setSubcatid(rs.getInt(3));
				}
				cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return cartmodel;
		}
		//total gt and gq
		public int checkoutDetail(CompanyRequestModel rmodel)
		{
			int x=0;
			double gq=0.0,gt=0.0;
			cn=new DBUtil().getConnection();
			String qry1="select * from company_cart where companyid=?";
			String qry2="insert into company_gtgq (companyid,gq,gt) values (?,?,?)";
			try {
				PreparedStatement st=cn.prepareStatement(qry1);
				st.setInt(1, rmodel.getCompanyid());
				ResultSet rs=st.executeQuery();
				while(rs.next())
				{
					gq=gq+Double.parseDouble(rs.getString(6));
					gt=gt+Double.parseDouble(rs.getString(7));
					
				}
				st=cn.prepareStatement(qry2);
				st.setInt(1,rmodel.getCompanyid());
				st.setString(2, String.valueOf(gq));
				st.setString(3, String.valueOf(gt));
				x=st.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return x;
		}
		//Book Request
		public int bookRequest(CompanyRequestModel rmodel)
		{
			int x=0,y=0,z=0;
			double gt=0.0,gq=0.0;
			//current time
		   	DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
	    	String dateString = dateFormat.format(new Date()).toString();
	    	//current date
	    	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	    	Date date = new Date();
	    	String dateString1=formatter.format(date).toString();
	    	String datetime=dateString1+"T"+dateString;

			cn=new DBUtil().getConnection();
			String qry1="select * from company_gtgq where companyid=?";
			String qry="insert into company_request (companyid,address,phoneno,paymentmode,pickupdate,status,quantity,gtotal,zonename,zonearea,date) values (?,?,?,?,?,?,?,?,?,?,?) ";
			try {
				PreparedStatement st=cn.prepareStatement(qry1);
				st.setInt(1, rmodel.getCompanyid());
				ResultSet rs=st.executeQuery();
				while(rs.next())
				{
					gq=gq+Double.parseDouble(rs.getString(3));
					gt=gt+Double.parseDouble(rs.getString(4));
				}
				st=cn.prepareStatement(qry);
				st.setInt(1, rmodel.getCompanyid());;
				st.setString(2, rmodel.getAddress());
				st.setString(3, rmodel.getPhoneno());
				st.setString(4, rmodel.getPaymentmode());
				st.setString(5, rmodel.getPickupdate());
				st.setString(6, rmodel.getStatus());
				st.setString(7, String.valueOf(gq));
				st.setString(8, String.valueOf(gt));
				st.setString(9, rmodel.getZonename());
				st.setString(10, rmodel.getZonearea());
				st.setString(11, datetime);			
				x=st.executeUpdate();
				CompanyCartModel cm=new CompanyRegistrationDao().getCartDetail(rmodel.getCompanyid());
				String delete="delete from company_gtgq where companyid=?";
				String deletecart="delete from company_cart where companyid=?";
				st=cn.prepareStatement(delete);
				st.setInt(1, rmodel.getCompanyid());
				
				y=st.executeUpdate();
				st=cn.prepareStatement(deletecart);
				st.setInt(1, rmodel.getCompanyid());

				z=st.executeUpdate();
				System.out.println("delete value ="+y);
				System.out.println("cart delete value="+z);
				cn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return x;
		}
		public int deleteCartItem(int cartid)
		{
			int x=0;
			cn=new DBUtil().getConnection();
			String qry="delete from company_cart where id=?";
			try {
				PreparedStatement st=cn.prepareStatement(qry);
				st.setInt(1, cartid);
				x=st.executeUpdate();
				cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return x;
		}
		// Get REquest id using grandtotal
		public int getRequestId(String gtotal) {
			int requestid = 0;
			cn=new DBUtil().getConnection();
			String qry="select * from company_request where gtotal=?";
			try {
				PreparedStatement st=cn.prepareStatement(qry);
				st.setString(1, gtotal);
				ResultSet rs = st.executeQuery();
				while(rs.next()) {
					requestid = rs.getInt(1);
				}
				cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return requestid;
		}
		
		//for insert data into another cart
		public CompanyCartModel getCartDetail(int companyid)
		{
			int x=0;
			String qry="select * from company_cart where companyid=?";
			cn=new DBUtil().getConnection();
			 CompanyCartModel cm=new CompanyCartModel();
			try {
				PreparedStatement st=cn.prepareStatement(qry);
				st.setInt(1, companyid);
				ResultSet rs=st.executeQuery();
				while(rs.next())
				{
					cm.setCartid(rs.getInt(1));
					cm.setCompanyid(rs.getInt(2));
					cm.setSubcatid(rs.getInt(3));
					cm.setSubcatname(rs.getString(4));
					cm.setPrice(rs.getString(5));
					cm.setQty(rs.getString(6));
					cm.setTotal(rs.getString(7));
					cm.setCatimage(rs.getString(8));
					x=new CompanyRegistrationDao().printCartDetail(cm);
				}
				cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return cm;
		}
		
		public int printCartDetail(CompanyCartModel cmodel)
		{
			int x=0;
			cn=new DBUtil().getConnection();
			String str="insert into company_cart_print (id,companyid,subcatid,subcatname,price,quantity,total,catimage,status) values (?,?,?,?,?,?,?,?,?)";
			try {
				PreparedStatement st=cn.prepareStatement(str);
				st.setInt(1, cmodel.getCartid());
				st.setInt(2, cmodel.getCompanyid());
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
				e.printStackTrace();
			}
			return x;
		}
		public int updateStock(int companyid)
		{
			cn=new DBUtil().getConnection();
			int x=0,y=0,qty=0,z=0,currentStock=0,updatedStock=0;
			String itemname="";
			String str="select * from company_cart_print where companyid=? and status=?";
			String updateStatus="update company_cart_print set status=? where companyid=?";
			String updateStock="update customer_subcategory set itemstock=? where itemname=?";
			String getCurrentStock="select * from  customer_subcategory where itemname=?";
			String updateRequestStatus="update company_request set status=? where companyid=?";
			try {
				PreparedStatement st=cn.prepareStatement(str);
				st.setInt(1, companyid);
				st.setString(2, "Unpaid");
				ResultSet rs=st.executeQuery();
				while(rs.next())
				{
					itemname=rs.getString(4);
					qty=Integer.parseInt(rs.getString(6));
					System.out.println("qty="+qty);
					st=cn.prepareStatement(updateStatus);
					st.setString(1, "Paid");
					st.setInt(2, companyid);
					x=st.executeUpdate();
					
					st=cn.prepareStatement(getCurrentStock);
					st.setString(1, itemname);
					ResultSet rs2=st.executeQuery();
					
					while(rs2.next())
					{
						currentStock=Integer.parseInt(rs2.getString(6));
					}
					
					updatedStock=currentStock-qty;
					
					st=cn.prepareStatement(updateStock);
					st.setString(1, String.valueOf(updatedStock));
					st.setString(2, itemname);
					y=st.executeUpdate();
					
					st=cn.prepareStatement(updateRequestStatus);
					
					st.setString(1, "Completed");
					st.setInt(2, companyid);
					z=st.executeUpdate();
					
					
				}
				cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return z;
		}
		//cash
		public int updateStockCash(int companyid)
		{
			cn=new DBUtil().getConnection();
			int x=0,y=0,qty=0,z=0,currentStock=0,updatedStock=0;
			String itemname="";
			String str="select * from company_cart_print where companyid=? and status=?";
			String updateStatus="update company_cart_print set status=? where companyid=?";
			String updateStock="update customer_subcategory set itemstock=? where itemname=?";
			String getCurrentStock="select * from  customer_subcategory where itemname=?";
			String updateRequestStatus="update company_request set status=? where companyid=?";
			try {
				PreparedStatement st=cn.prepareStatement(str);
				st.setInt(1, companyid);
				st.setString(2, "Unpaid");
				ResultSet rs=st.executeQuery();
				while(rs.next())
				{
					itemname=rs.getString(4);
					qty=Integer.parseInt(rs.getString(6));
					System.out.println("qty="+qty);
					st=cn.prepareStatement(updateStatus);
					st.setString(1, "Paid");
					st.setInt(2, companyid);
					x=st.executeUpdate();
					
					st=cn.prepareStatement(getCurrentStock);
					st.setString(1, itemname);
					ResultSet rs2=st.executeQuery();
					
					while(rs2.next())
					{
						currentStock=Integer.parseInt(rs2.getString(6));
					}
					
					updatedStock=currentStock-qty;
					
					st=cn.prepareStatement(updateStock);
					st.setString(1, String.valueOf(updatedStock));
					st.setString(2, itemname);
					y=st.executeUpdate();
					
					st=cn.prepareStatement(updateRequestStatus);
					
					st.setString(1, "Pending");
					st.setInt(2, companyid);
					z=st.executeUpdate();
					
					
				}
				cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return z;
		}

		public int updateLoginDate(int id)
		{
			int x=0;
			cn=new DBUtil().getConnection();
			//current time
		   	DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
	    	String dateString = dateFormat.format(new Date()).toString();
	    	//current date
	    	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	    	Date date = new Date();
	    	String dateString1=formatter.format(date).toString();
	    	String datetime=dateString1+"T"+dateString;

			String str="update company_signup set logindate=? where companyid=?";
			try {
				PreparedStatement st=cn.prepareStatement(str);
				st.setString(1, datetime);
				st.setInt(2, id);
				x=st.executeUpdate();
				cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return x;
				
		}

}
		
			
	


