package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.model.UserZonerModel;
import com.util.DBUtil;

public class UserZonerDao {
	Connection cn=null;
	UserZonerModel model=null;

	public int doRegister(UserZonerModel rmodel)
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
		String password=null;
		try {			
			String check="select * from zoner_signup where email=?";					
			PreparedStatement st= cn.prepareStatement(check);
			st.setString(1, rmodel.getEmail());			
			ResultSet rs=st.executeQuery();			
			if(rs.next())
			{
				email=rs.getString(6);				
			}			
			if(email==null)
			{
				String qry="insert into zoner_signup (firstname,lastname,address,phoneno,email,zonename,areaname,password,status,date,photo) values (?,?,?,?,?,?,?,?,?,?,?)";
				st=cn.prepareStatement(qry);				
				st.setString(1, rmodel.getFirstname());
				st.setString(2, rmodel.getLastname());
				st.setString(3, rmodel.getAddress());
				st.setString(4, rmodel.getPhoneno());
				st.setString(5, rmodel.getEmail());
				st.setString(6, rmodel.getZonename());
				st.setString(7, rmodel.getAreaname());
				st.setString(8, rmodel.getPassword());				
				st.setString(9,"Active");
				st.setString(10, datetime);
				st.setString(11, rmodel.getPhoto());
				x=st.executeUpdate();
			}else {
				x = -1;
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	public int updateProfile(UserZonerModel model)
	{

		int x=0;
		cn=new DBUtil().getConnection();
		String qry="update zoner_signup set firstname=?,lastname=?,address=?,phoneno=?,email=? where zonerid=?";
		try {
			System.out.println("inside try");
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, model.getFirstname());
			st.setString(2, model.getLastname());
			st.setString(3, model.getAddress());
			st.setString(4, model.getPhoneno());
			st.setString(5, model.getEmail());
			st.setInt(6, model.getZonerid());
			
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	public UserZonerModel doLogin(UserZonerModel lmodel)
	{
		cn=new DBUtil().getConnection();
		String qry="select * from zoner_signup where email=? and password=?";
		
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			
			st.setString(1, lmodel.getEmail());
			st.setString(2, lmodel.getPassword());
			System.out.println("inside dao");
			System.out.println(lmodel.getEmail());
			System.out.println(lmodel.getPassword());
			
			java.sql.ResultSet rs=st.executeQuery();
			
			if(rs.next())
			{
				model=new UserZonerModel();
				model.setZonerid(rs.getInt(1));
				model.setEmail(rs.getString(6));
				model.setPassword(rs.getString(10));
				model.setZonename(rs.getString(7));
				model.setAreaname(rs.getString(8));
				
			}
			
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	public int updateStatus(int id)
	{
		cn=new DBUtil().getConnection();
		int x=0;
		String qry="update customer_request set status=? where requestid=?";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, "Completed");
			st.setInt(2, id);
			x=st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	public String getGrandTotal(int requestid) {
		String gtotal = "";
		System.out.println("Reqid: "+requestid);
		cn=new DBUtil().getConnection();
		String qry="select * from customer_request where requestid=?";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, requestid);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				System.out.println("Inside while");
				gtotal = rs.getString(8);
			}
			System.out.println("Gtotal: "+gtotal);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gtotal;
	}
	
	//Get zonename using zoneid
	public String getZoneName(int zoneid) {
		String zonename="";
		cn = new DBUtil().getConnection();
		String qry = "select * from zone where zoneid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setInt(1, zoneid);			
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				zonename = rs.getString(2);
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return zonename;
	}
	
	//Get Areaname using areaid
	public String getAreaName(int id)
	{
		String areaname="";
		cn=new DBUtil().getConnection();
		String qry="select * from  zone_area where zonerareaid=?";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, id);
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				areaname=rs.getString(3);
			}
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return areaname;
	}
	//Active/Deactive User Status
	public int changeZonerStatus(int zoner_id,String status) {
		int x=0;		
		cn = new DBUtil().getConnection();
		String qry = "update zoner_signup set status=? where zonerid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setString(1, status);
			st.setInt(2, zoner_id);
			x = st.executeUpdate();
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return x;		
	}
	
	//get Total customer transactions done by zoner
	public float customerPayments() {
		float total=0.0f;
		cn = new DBUtil().getConnection();
		String qry = "select gtotal from customer_request where status='Completed'";
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
}
