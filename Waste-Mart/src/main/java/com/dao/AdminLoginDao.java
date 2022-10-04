package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.model.AdminLoginModel;
import com.util.DBUtil;

public class AdminLoginDao {

	Connection cn=null;
	AdminLoginModel model=null;
	// Admin login
	public AdminLoginModel doLogin(AdminLoginModel lmodel)
	{
		cn=new DBUtil().getConnection();
		String qry="select * from adminlogin where username=? and password=?";
		
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, lmodel.getUsername());
			st.setString(2, lmodel.getPassword());
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				model=new AdminLoginModel();
				model.setUsername(rs.getString(1));
				model.setUsername(rs.getString(2));
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}	
}
