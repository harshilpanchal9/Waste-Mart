package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.Part;

import com.model.CategoryModel;
import com.model.SubCategoryModel;
import com.util.DBUtil;

public class CategoryDao 
{
	Connection cn=null;
	int x=0;
	
	// Add Main Category and check if existed or not
	public int addCategory(CategoryModel cmodel)
	{
		String existedCatName = null;
		cn=new DBUtil().getConnection();
		String qry1 = "select * from category where catname=?";
		try
		{
			PreparedStatement st = cn.prepareStatement(qry1);
			st.setString(1, cmodel.getCatname());			
			ResultSet rs1 = st.executeQuery();
			if(rs1.next())
			{  
				existedCatName = rs1.getString(2);	
				x=-1;
			}	
			if(existedCatName == null)
			{
				String qry="insert into category(catname,catimage) values(?,?)";
				st=cn.prepareStatement(qry);
				st.setString(1, cmodel.getCatname());
				st.setString(2, cmodel.getCatimage());
				x=st.executeUpdate();				
			}			
			cn.close();
		} catch (Exception e) {			
			e.printStackTrace();
		}
		return x;
	}
	
	// Delete selected Category
	public int DeleteCategory(String[] catid)
	{		
		cn = new DBUtil().getConnection();
		PreparedStatement st = null;
		try {
			for(int i=0;i<=catid.length-1;i++)
			{
				int id = Integer.parseInt(catid[i]);
				String qry = "delete from category where catid=?";
				st = cn.prepareStatement(qry);
				st.setInt(1, id);
				x = st.executeUpdate();				
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}

	// Update the Main Category if existed or not.
	public int updateCategory(int catid,String catname,String catimage)
	{
		int x=0;	
		cn=new DBUtil().getConnection();		
		try {
			String qry="update category set catname=?,catimage=? where catid=?";
			PreparedStatement st=cn.prepareStatement(qry);
			st = cn.prepareStatement(qry);
			st.setString(1, catname);
			st.setString(2, catimage);
			st.setInt(3, catid );
			x=st.executeUpdate();			
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}	
	
	// Get the Data of Main Category.
	public CategoryModel getRecordCategory(int catid)
	{
		CategoryModel cmodel=null;
		cn = new DBUtil().getConnection();
		String qry = "select * from category where catid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setInt(1, catid);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				cmodel = new CategoryModel();
				cmodel.setCatid(rs.getInt(1));
				cmodel.setCatname(rs.getString(2));
				cmodel.setCatimage(rs.getString(3));
			}
		} catch (Exception e) {		
			e.printStackTrace();
		}
		return cmodel;
	}	
	
//-------------------------------------- Complete Category Operation ----------------------------------------
	
	// Only get the name of Main Category
	public String getCategoryName(int catid)
	{
		String catname=null;		
		cn=new DBUtil().getConnection();		
		String qry="select catname from category where catid=?";
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, catid);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				catname=rs.getString(1);
			}
			cn.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return catname;
	}
	// For getting the filename of image
	public String extractfilename(Part file) 
	{
		String cd = file.getHeader("content-disposition");
		System.out.println(cd);
		String[] items = cd.split(";");
		for(String string : items)
		{
			if(string.trim().startsWith("filename"))
			{
				return string.substring(string.indexOf("=")+2,string.length()-1);
			}
		}
		return "";
	}
	// get all names of category for datalist
	public ArrayList<String> getAllCategoryName() {
		ArrayList<String> allcategory = new ArrayList<String>();
		cn=new DBUtil().getConnection();		
		String qry="select catname from category";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				allcategory.add(rs.getString(1));
				System.out.println(rs.getString(1));
			}
			System.out.println(allcategory);
			cn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return allcategory;
	}
	
	// Fetch the image name of category
	public String getCategoryImage(int subcatid)
	{
		String catimage=null;		
		cn=new DBUtil().getConnection();		
		String qry="select itemimage from customer_subcategory where subcatid=?";
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, subcatid);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				catimage=rs.getString(1);
			}
			cn.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return catimage;
	}

//-------------------------------------- Customer Item Operation ----------------------------------------
	
	// Add Customer Item and check if existed or not
	public int customerAddSubCategory(SubCategoryModel scmodel)
	{
		String existedSubCatname = null;
		cn=new DBUtil().getConnection();	
		String qry1 = "select * from customer_subcategory where itemname=? and catid=?";
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry1);
			st.setString(1, scmodel.getItemname());		
			st.setInt(2, scmodel.getCatid());
			ResultSet rs1 = st.executeQuery();
			if(rs1.next())
			{
				existedSubCatname = rs1.getString(3);				
			}	
			if(existedSubCatname == null)
			{
				String qry="insert into customer_subcategory(catid,itemname,itemprice,itemimage,itemstock) values(?,?,?,?,?)";
				st=cn.prepareStatement(qry);
				st.setInt(1, scmodel.getCatid());
				st.setString(2, scmodel.getItemname());
				st.setString(3, scmodel.getItemprice());
				st.setString(4, scmodel.getItemimage());
				st.setString(5, scmodel.getItemstock());				
				x=st.executeUpdate();
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	// Delete Customer Item	
	public int customerDeleteSubiItem(String[] subcatid)
	{
		cn = new DBUtil().getConnection();
		PreparedStatement st = null;
		try {
			for(int i=0;i<=subcatid.length-1;i++)
			{
				int id = Integer.parseInt(subcatid[i]);
				String qry = "delete from customer_subcategory where subcatid=?";
				st = cn.prepareStatement(qry);
				st.setInt(1, id);
				x = st.executeUpdate();				
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	//Update the Item of Customer
	public int CustomerUpdateSubCategory(SubCategoryModel scmodel)
	{
		String existedSubCatname = null;
		int x=0;
		cn=new DBUtil().getConnection();
		try {
			String qry="update customer_subcategory set catid=?,itemname=?,itemprice=?,itemimage=?,itemstock=? where subcatid=?";
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, scmodel.getCatid());
			st.setString(2, scmodel.getItemname());
			st.setString(3, scmodel.getItemprice());
			st.setString(4, scmodel.getItemimage());
			st.setString(5, scmodel.getItemstock());
			st.setInt(6, scmodel.getSubcatid());
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	// Fetch the data of Item Of Customer
	public SubCategoryModel getRecordItem(int subcatid)
	{
		SubCategoryModel cmodel=null;
		cn = new DBUtil().getConnection();
		String qry = "select * from customer_subcategory where subcatid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setInt(1, subcatid);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				cmodel = new SubCategoryModel();
				cmodel.setSubcatid(rs.getInt(1));
				cmodel.setCatid(rs.getInt(2));
				cmodel.setItemname(rs.getString(3));
				cmodel.setItemprice(rs.getString(4));
				cmodel.setItemimage(rs.getString(5));
				cmodel.setItemstock(rs.getString(6));
			}
		} catch (Exception e) {		
			e.printStackTrace();
		}
		return cmodel;
	}
	
	// Count the item which is active in Customer (whose itemstock not 00)
	public int itemStockCustomerSubCategory() {
		int activeItem=0;
		Connection cn = null;
		try {
			cn = new DBUtil().getConnection();
			String qry = "select * from customer_subcategory where NOT itemstock='00'";
			PreparedStatement st=cn.prepareStatement(qry);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				activeItem++;
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return activeItem;
	}
	// Count the total stock of Customer
	public int totalItemStockCustomerSubCategory() {
		int totalItemStock=0;
		Connection cn = null;
		try {
			cn = new DBUtil().getConnection();
			String qry = "select * from customer_subcategory";
			PreparedStatement st=cn.prepareStatement(qry);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				totalItemStock+=Integer.parseInt(rs.getString(6));
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return totalItemStock;
	}
	
	// Count the all items in Customer and company (Active / Non active)
	public int totalSubCategory() {
		int customer_Item = 0;
		Connection cn = null;
		try {
			cn = new DBUtil().getConnection();
			String qry = "select * from customer_subcategory";
			//String qry1 = "select * from company_subcategory";
			PreparedStatement st=cn.prepareStatement(qry);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				customer_Item++;
			}
			cn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return customer_Item;
	}
	
//-------------------------------------- Company Item Operation ----------------------------------------
	
	// Add Company Item and check if existed or not
	public int CompanyAddSubCategory(SubCategoryModel scmodel)
	{
		String existedSubCatname = null;
		cn=new DBUtil().getConnection();	
		String qry1 = "select * from company_subcategory where itemname=? and catid=?";
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry1);
			st.setString(1, scmodel.getItemname());
			st.setInt(2, scmodel.getCatid());
			ResultSet rs1 = st.executeQuery();
			if(rs1.next())
			{
				existedSubCatname = rs1.getString(3);				
			}	
			if(existedSubCatname == null)
			{
				String qry="insert into company_subcategory(catid,itemname,itemprice,itemimage) values(?,?,?,?)";
				st=cn.prepareStatement(qry);
				st.setInt(1, scmodel.getCatid());
				st.setString(2, scmodel.getItemname());
				st.setString(3, scmodel.getItemprice());
				st.setString(4, scmodel.getItemimage());
				x=st.executeUpdate();
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	// Delete Company Item
	public int companyDeleteSubiItem(String[] subcatid)
	{
		cn = new DBUtil().getConnection();		
		try {
			for(int i=0;i<=subcatid.length-1;i++)
			{
				int id = Integer.parseInt(subcatid[i]);
				String qry = "delete from company_subcategory where subcatid=?";
				PreparedStatement st = cn.prepareStatement(qry);
				st.setInt(1, id);
				x = st.executeUpdate();				
			}
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	//Update the Item of Company
	public int CompanyUpdateSubCategory(SubCategoryModel scmodel)
	{
		int x=0;
		cn=new DBUtil().getConnection();
		try {			
			String qry="update company_subcategory set catid=?,itemname=?,itemprice=?,itemimage=? where subcatid=?";
			PreparedStatement st=cn.prepareStatement(qry);
			st.setInt(1, scmodel.getCatid());
			st.setString(2, scmodel.getItemname());
			st.setString(3, scmodel.getItemprice());
			st.setString(4, scmodel.getItemimage());
			st.setInt(5, scmodel.getSubcatid());
			x=st.executeUpdate();
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	// Fetch the data of Item Of Company
	public SubCategoryModel companyGetRecordItem(int subcatid)
	{
		SubCategoryModel cmodel=null;
		cn = new DBUtil().getConnection();
		String qry = "select * from company_subcategory where subcatid=?";
		try {
			PreparedStatement st = cn.prepareStatement(qry);
			st.setInt(1, subcatid);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				cmodel = new SubCategoryModel();
				cmodel.setSubcatid(rs.getInt(1));
				cmodel.setCatid(rs.getInt(2));
				cmodel.setItemname(rs.getString(3));
				cmodel.setItemprice(rs.getString(4));
				cmodel.setItemimage(rs.getString(5));
			}
			cn.close();
		} catch (Exception e) {		
			e.printStackTrace();
		}
		return cmodel;
	}
	
	// To count Total item sold where payment status is completed
	public float itemSoldCompanySubCategory() {
		float soldItem=0;
		Connection cn = null;
		try {
			cn = new DBUtil().getConnection();
			String qry = "select quantity from company_request where status='Completed'";
			PreparedStatement st=cn.prepareStatement(qry);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				soldItem+=Float.parseFloat(rs.getString(1));
			}
			cn.close();
			System.out.println("solditem: "+soldItem);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return soldItem;
	}
	public int customerTotalSubcategory()
	{
		Connection cn=new DBUtil().getConnection();
		int x=0;
		String total="select * from customer_subcategory";
		try {
			PreparedStatement st=cn.prepareStatement(total);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				x++;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
		
	}
}
