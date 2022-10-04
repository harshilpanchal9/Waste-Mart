package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBUtil;

public class UserCustomerDao 
{
	Connection cn=null;
	// Active/Deactive User Status
	public int changeCustomerStatus(int cust_id,String status) {
		int x=0;		
		cn = new DBUtil().getConnection();
		String qry = "update customer_signup set status=? where customerid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setString(1, status);
			st.setInt(2, cust_id);
			x = st.executeUpdate();
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return x;		
	}
	
	// Deactive status of Customer	
	public int deactiveCustomer(String[] subcatid)
	{
		int x=0;
		String status = "Deactive";
		cn = new DBUtil().getConnection();
		PreparedStatement st = null;
		try {
			for(int i=0;i<=subcatid.length-1;i++)
			{
				int id = Integer.parseInt(subcatid[i]);
				String qry = "update customer_signup set status=? where customerid=?";
				st = cn.prepareStatement(qry);					
				st.setString(1, status);
				st.setInt(2, id);
				x = st.executeUpdate();				
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	// Get the Customer name using requestid
	public String getCustomerName(int requestid) {
		String customername="";
		cn = new DBUtil().getConnection();
		String qry = "select * from customer_signup where customerid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setInt(1,requestid);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				customername = rs.getString(2);
				customername += " " + rs.getString(3);
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("C name: "+customername);
		return customername;
	}
	
	// Changes the status of company request
	public int changeRequestStatus(int req_id, String status, String p_mode) {
		int x=0;
		cn = new DBUtil().getConnection();
		String updatestatus="";
		if(status.equalsIgnoreCase("pending") && p_mode.equalsIgnoreCase("cash on delivery")) {
			updatestatus = "Completed";
		}else {
			updatestatus = status;
		}
		PreparedStatement st = null;
		try {
			String qry = "update customer_request set status=? where requestid=? and paymentmode=?";
			st = cn.prepareStatement(qry);
			st.setString(1, updatestatus);
			st.setInt(2, req_id);
			st.setString(3, p_mode);
			x = st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
		
	//Count the total customer
	public int totalCustomer() {
		int total=0;
		cn = new DBUtil().getConnection();
		try {
			String qry = "select customerid from customer_signup";
			PreparedStatement st = cn.prepareStatement(qry);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				total++;
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	//Count the total customer
	public int totalCustomerRequest() {
		int total=0;
		cn = new DBUtil().getConnection();
		try {
			String qry = "select requestid from customer_request";
			PreparedStatement st = cn.prepareStatement(qry);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				total++;
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	//Count the pending request of customer
	public int pendingCustomerRequest() {
		int total=0;
		cn = new DBUtil().getConnection();
		try {
			String qry = "select requestid from customer_request where status = 'Pending'";
			PreparedStatement st = cn.prepareStatement(qry);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				total++;
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	//Count the pending request of customer
	public int completedCustomerRequest() {
		int total=0;
		cn = new DBUtil().getConnection();
		try {
			String qry = "select requestid from customer_request where status = 'Completed'";
			PreparedStatement st = cn.prepareStatement(qry);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				total++;
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	// Delete the customer request along with cart items
	public int deleteCustomerRequest(int requestid) {
		int x=0,customerid=0,y=0;
		cn = new DBUtil().getConnection();
		try {
			String qry = "select customerid from customer_request where requestid = ?";
			PreparedStatement st = cn.prepareStatement(qry);
			st.setInt(1, requestid);;
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				customerid = rs.getInt(1);
			}
			String qry1 = "delete from customer_cart_print where customerid = ?";
			st = cn.prepareStatement(qry1);
			st.setInt(1,customerid);
			x = st.executeUpdate();	
			if(x>0) {
				String qry2 = "delete from customer_request where requestid = ?";
				st = cn.prepareStatement(qry2);
				st.setInt(1,requestid);
				y = st.executeUpdate();
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return y;
	}
}
