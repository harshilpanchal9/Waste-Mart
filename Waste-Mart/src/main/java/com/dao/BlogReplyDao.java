package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.model.BlogReplyModel;
import com.util.DBUtil;

public class BlogReplyDao {
		
		Connection cn=null;
		BlogReplyModel bmodel = null;
		public int CustomerAddBlogreply(BlogReplyModel model)
		{
			cn=new DBUtil().getConnection();
			int x=0;
			String qry="insert into blog_reply (name,email,message) values (?,?,?)";
			try {
				PreparedStatement st=cn.prepareStatement(qry);
				st.setString(1, model.getName());
				st.setString(2, model.getEmail());
				st.setString(3, model.getMessage());
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
