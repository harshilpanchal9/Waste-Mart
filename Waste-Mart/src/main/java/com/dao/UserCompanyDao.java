package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBUtil;

public class UserCompanyDao 
{
	Connection cn=null;
	// Active/Deactive User Status
	public int changeCompanyStatus(int company_id,String status) {
		int x=0;		
		cn = new DBUtil().getConnection();
		String qry = "update company_signup set status=? where companyid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setString(1, status);
			st.setInt(2, company_id);
			x = st.executeUpdate();
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return x;		
	}
	
	// Deactive status of Customer	
	public int deactiveCompany(String[] subcatid)
	{
		int x=0;
		String status = "Deactive";
		cn = new DBUtil().getConnection();
		PreparedStatement st = null;
		try {
			for(int i=0;i<=subcatid.length-1;i++)
			{
				int id = Integer.parseInt(subcatid[i]);
				String qry = "update company_signup set status=? where companyid=?";
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
			String qry = "update company_request set status=? where requestid=? and paymentmode=?";
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
	
	//Count the total company User
	public int totalCompany() {
		int total=0;
		cn = new DBUtil().getConnection();
		try {
			String qry = "select companyid from company_signup";
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
	
	//Count the total customer requests
	public int totalCompanyRequest() {
		int total=0;
		cn = new DBUtil().getConnection();
		try {
			String qry = "select requestid from company_request";
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
	
	//get Total Company transactions
	public float companyPayments() {
		float total=0.0f;
		cn = new DBUtil().getConnection();
		String qry = "select gtotal from company_request where status='Completed'";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				total += Float.parseFloat(rs.getString(1));
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	//Count the pending request of customer
	public int pendingCompanyRequest() {
		int total=0;
		cn = new DBUtil().getConnection();
		try {
			String qry = "select requestid from company_request where status = 'Pending'";
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
	public int completedCompanyRequest() {
		int total=0;
		cn = new DBUtil().getConnection();
		try {
			String qry = "select requestid from company_request where status = 'Completed'";
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
	
	//Fetch the Company name
	public String getCompanyName(int company_id) {
		String companyname="";
		cn = new DBUtil().getConnection();
		try {
			String qry = "select companyname from company_signup where companyid = ?";
			PreparedStatement st = cn.prepareStatement(qry);
			st.setInt(1, company_id);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				companyname = rs.getString(1);
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return companyname;
	}
	
	//Fetch the Company name
	public String getCompanyImage(int company_id) {
		String image="";
		cn = new DBUtil().getConnection();
		try {
			String qry = "select photo from company_signup where companyid = ?";
			PreparedStatement st = cn.prepareStatement(qry);
			st.setInt(1, company_id);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				image = rs.getString(1);
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return image;
	}
	
	// Delete the company request along with cart items
		public int deleteCompanyRequest(int requestid) {
			int x=0,customerid=0,y=0;
			cn = new DBUtil().getConnection();
			try {
				String qry = "select companyid from company_request where requestid = ?";
				PreparedStatement st = cn.prepareStatement(qry);
				st.setInt(1, requestid);
				ResultSet rs = st.executeQuery();
				while(rs.next()) {
					customerid = rs.getInt(1);
				}
				String qry1 = "delete from company_cart_print where companyid = ?";
				st = cn.prepareStatement(qry1);
				st.setInt(1,customerid);
				x = st.executeUpdate();	
				if(x>0) {
					String qry2 = "delete from company_request where requestid = ?";
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
