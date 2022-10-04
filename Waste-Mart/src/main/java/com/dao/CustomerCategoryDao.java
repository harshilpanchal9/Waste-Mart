package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.util.DBUtil;


public class CustomerCategoryDao 
{
	Connection cn = null;
	public HashMap showItem(int catid)
	{
		int i=0;
		HashMap h1 = new HashMap();
		Connection cn = new DBUtil().getConnection();
		String qry = "select * from customer_subcategory where catid=?";
		
		try {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, catid);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				h1.put(rs.getString(3), rs.getString(4));
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return h1;
	}
}
