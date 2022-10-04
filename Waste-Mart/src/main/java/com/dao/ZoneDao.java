package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.util.DBUtil;

public class ZoneDao 
{
	//---------------------- Zone -------------------------------------
	// Add zone
	Connection cn=null;
	int x=0;
	public int addZone(String zonename) {
		cn = new DBUtil().getConnection();
		int flag = 0;
		String qry = "select * from zone where zonename=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setString(1, zonename);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				flag = 1;
			}
			if(flag == 0) {
				qry = "insert into zone (zonename) values (?)";			
				st = cn.prepareStatement(qry);
				st.setString(1, zonename);
				x = st.executeUpdate();
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	// Delete Zone
	public int deleteZone(int zoneid) {
		cn = new DBUtil().getConnection();
		String qry = "delete from zone where zoneid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setInt(1, zoneid);
			x = st.executeUpdate();	
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	// Update Zone
	public int updateZone(int zoneid,String zonename) {
		cn=new DBUtil().getConnection();		
		try {
			String qry="update zone set zonename=? where zoneid=?";
			PreparedStatement st=cn.prepareStatement(qry);
			st = cn.prepareStatement(qry);
			st.setString(1, zonename);
			st.setInt(2, zoneid);
			x=st.executeUpdate();			
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	//---------------------- Zone area -------------------------------------
	// Add zone area
	public int addarea(String areaname,int zoneid) {
		cn = new DBUtil().getConnection();
		int flag=0;
		String qry = "select * from zone_area where areaname=? and zoneid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setString(1, areaname);
			st.setInt(2, zoneid);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				flag = 1;
			}
			if(flag==0) {
				qry = "insert into zone_area (zoneid,areaname) values (?,?)";
				st = cn.prepareStatement(qry);
				st.setInt(1,zoneid);
				st.setString(2, areaname);
				x = st.executeUpdate();				
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	// Delete Zone
	public int deleteZoneArea(int zoneareaid) {
		cn = new DBUtil().getConnection();
		String qry = "delete from zone_area where zoneareaid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setInt(1, zoneareaid);
			x = st.executeUpdate();	
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	// Update zone area
	public int updateZoneArea(int zoneareaid, int zoneid, String areaname) {
		cn=new DBUtil().getConnection();		
		try {
			String qry="update zone_area set zoneid=?, areaname=? where zoneareaid=?";
			PreparedStatement st=cn.prepareStatement(qry);
			st = cn.prepareStatement(qry);
			st.setInt(1, zoneid);
			st.setString(2, areaname);
			st.setInt(3, zoneareaid);
			x=st.executeUpdate();			
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	// Take zone name using zoneareaid
	public String getZoneName(int zoneareaid) {
		String zonename="";
		int zoneid=0;
		cn = new DBUtil().getConnection();
		String qry = "select * from zone_area where zoneareaid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setInt(1, zoneareaid);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				zoneid = rs.getInt(2);
			}			
			qry = "select * from zone where zoneid=?";
			st = cn.prepareStatement(qry);
			st.setInt(1, zoneid);
			rs = st.executeQuery();
			while(rs.next()) {
				zonename = rs.getString(2);
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return zonename;
	}
}
