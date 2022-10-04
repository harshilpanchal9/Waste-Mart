package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.model.FooterModel;
import com.util.DBUtil;

public class FooterDao {
	Connection cn=null;
	FooterModel fmodel = new FooterModel();
	public int Footer(FooterModel model)
	{
		cn=new DBUtil().getConnection();
		int x=0;
		String qry="insert into subscribe (subscribe_email) values (?)";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, model.getSubscribe_email());			
			x=st.executeUpdate();
			System.out.println("hiiii");
			cn.close();
		}
		 catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return x;
	}
	
	
	
	

	

}
