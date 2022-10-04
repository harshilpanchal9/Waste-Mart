package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.AboutUsModel;
import com.model.ServicesModel;
import com.util.DBUtil;

public class ServicesDao {
	Connection cn=null;
	ServicesModel smodel=null;
	AboutUsModel amodel=null;
	public int addServices(ServicesModel model)
	{
		cn=new DBUtil().getConnection();
		int x=0;
		String qry="insert into services (title,content,photo) values (?,?,?)";
		
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, model.getTitle());
			st.setString(2, model.getContent());
			st.setString(3, model.getImage());
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	public int addAboutUs(AboutUsModel model)
	{
		cn=new DBUtil().getConnection();
		int x=0;
		String qry="insert into aboutus (title,content) values (?,?)";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, model.getTitle());
			st.setString(2, model.getContent());
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	public int deleteService(ServicesModel smodel)
	{
		int x=0;
		cn=new DBUtil().getConnection();
		String qry="delete from services where id=?";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, smodel.getId());
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	public int deleteAboutus(AboutUsModel model)
	{
		int x=0;
		cn=new DBUtil().getConnection();
		String qry="delete from aboutus where id=?";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1,model.getId());
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
		
	}

}
