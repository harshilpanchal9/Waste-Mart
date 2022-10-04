package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.model.ContactUsModel;
import com.util.DBUtil;

public class ContactUsDao {
	
	Connection cn=null;
	ContactUsModel cmodel = new ContactUsModel();
	public int ContectUs(ContactUsModel model)
	{
		cn=new DBUtil().getConnection();
		int x=0;
		String qry="insert into contactus (name,message,email) values (?,?,?)";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, model.getName());
			st.setString(2, model.getMessage());
			st.setString(3, model.getEmail());
			x=st.executeUpdate();
			cn.close();
		}
		 catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return x;
	}
	
	public int Feedback(com.model.FeedbackModel model)
	{
		cn=new DBUtil().getConnection();
		int x=0;
		String qry="insert into feedback (name,subject,description,email) values (?,?,?,?)";
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, model.getName());
			st.setString(2, model.getSubject());
			st.setString(3, (model).getDescription());
			st.setString(4, model.getEmail());
			// st.setDate(5, null, null); ;
			x=st.executeUpdate();
			cn.close();
		}
		 catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return x;
		
	}
	
	

}
