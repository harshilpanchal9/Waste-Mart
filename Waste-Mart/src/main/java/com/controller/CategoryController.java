package com.controller;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.catalina.connector.Request;

import com.dao.CategoryDao;
import com.model.CategoryModel;
import com.model.SubCategoryModel;
import com.util.DBUtil;

@WebServlet("/CategoryController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512,maxRequestSize = 1024 * 1024 * 512 )
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CategoryController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{		
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");	
		
		if(action.equalsIgnoreCase("deletecategory")) {			
			String id[] = request.getParameterValues("checkboxid");
			if(id != null) {
				for(int i = 0;i <= id.length-1;i++) {
					System.out.println(id[i]);
				}
				int x = new CategoryDao().DeleteCategory(id);
				if(x>0)
				{				
					response.sendRedirect("admin/viewcategory.jsp");
				}
				else
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Cannot delete Category.')");
					out.println("window.location.href='admin/viewcategory.jsp';");
					out.println("</script>");			
				}
			}else {
				response.sendRedirect("admin/viewcategory.jsp");
			}
		}
		else if(action.equals("customerdeletesubitem"))
		{
			String id[] = request.getParameterValues("checkboxid");
			if(id != null) {
				for(int i = 0;i <= id.length-1;i++) {
					System.out.println(id[i]);
				}
				int x = new CategoryDao().customerDeleteSubiItem(id);
				if(x>0)
				{				
					response.sendRedirect("admin/customerviewsubcategory.jsp");
				}
				else
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Cannot delete customer item.')");
					out.println("window.location.href='admin/customerviewsubcategory.jsp';");
					out.println("</script>");			
				}
			}else {
				response.sendRedirect("admin/customerviewsubcategory.jsp");
			}
		}
		else if(action.equals("companydeletesubitem"))
		{
			String id[] = request.getParameterValues("checkboxid");
			if(id != null) {
				for(int i = 0;i <= id.length-1;i++) {
					System.out.println(id[i]);
				}
				int x = new CategoryDao().companyDeleteSubiItem(id);
				if(x>0)
				{				
					response.sendRedirect("admin/companyviewsubcategory.jsp");
				}
				else
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Cannot delete customer item.')");
					out.println("window.location.href='admin/companyviewsubcategory.jsp';");
					out.println("</script>");			
				}
			}else {
				response.sendRedirect("admin/companyviewsubcategory.jsp");
			}
		}		
							
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		PrintWriter out = response.getWriter();
		String btn=request.getParameter("btn");
		if(btn.equalsIgnoreCase("addcategory"))
		{
			String savepath="D:\\Waste-Mart\\src\\main\\webapp\\category";
			File fileSaveDir = new File(savepath);
			if(!fileSaveDir.exists())
			{
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("image");
			String filename = new CategoryDao().extractfilename(file1);
			file1.write(savepath + File.separator + filename);			
			CategoryModel cmodel=new CategoryModel();
			cmodel.setCatname(request.getParameter("catname"));
			cmodel.setCatimage(filename);			
			int x=new CategoryDao().addCategory(cmodel);
			if(x>0)
			{
				response.sendRedirect("admin/viewcategory.jsp");							
			}
			else if(x==-1) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Sorry, can not add category if already exists.')");
				out.println("window.location.href='admin/category.jsp';");
				out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Sorry, can not add category')");
				out.println("window.location.href='admin/category.jsp';");
				out.println("</script>");
			}
		}
		else if(btn.equalsIgnoreCase("customeradditem"))
		{
			String savepath="D:\\Waste-Mart\\src\\main\\webapp\\subcategory";
			File fileSaveDir = new File(savepath);
			if(!fileSaveDir.exists())
			{
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("itemimage");
			String filename = new CategoryDao().extractfilename(file1);
			file1.write(savepath + File.separator + filename);			
			
			SubCategoryModel scmodel=new SubCategoryModel();
			scmodel.setCatid(Integer.parseInt(request.getParameter("catid")));
			scmodel.setItemname(request.getParameter("itemname"));
			scmodel.setItemprice(request.getParameter("itemprice"));
			scmodel.setItemimage(filename);
			scmodel.setItemstock(request.getParameter("itemstock"));			
			int x=new CategoryDao().customerAddSubCategory(scmodel);
			if(x>0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Cusomter item added Successfully.')");
				out.println("window.location.href='admin/customerviewsubcategory.jsp';");
				out.println("</script>");				
			}
			else
			{	
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Cannot add customer item, If already Exists.')");
				out.println("window.location.href='admin/customeraddsubcategory.jsp';");
				out.println("</script>");
			}
		}
		else if(btn.equalsIgnoreCase("companyadditem"))
		{
			String savepath="D:\\Waste-Mart\\src\\main\\webapp\\subcategory";
			File fileSaveDir = new File(savepath);
			if(!fileSaveDir.exists())
			{
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("itemimage");
			String filename = new CategoryDao().extractfilename(file1);
			file1.write(savepath + File.separator + filename);						
			SubCategoryModel scmodel=new SubCategoryModel();
			scmodel.setCatid(Integer.parseInt(request.getParameter("catid")));
			scmodel.setItemname(request.getParameter("itemname"));
			scmodel.setItemprice(request.getParameter("itemprice"));
			scmodel.setItemimage(filename);
			int x=new CategoryDao().CompanyAddSubCategory(scmodel);			
			if(x>0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Company item added Successfully.')");
				out.println("window.location.href='admin/companyviewsubcategory.jsp';");
				out.println("</script>");				
			}
			else
			{	
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Cannot add company item, If already Exists.')");
				out.println("window.location.href='admin/companyaddsubcategory.jsp';");
				out.println("</script>");
			}
		}
		else if(btn.equalsIgnoreCase("customerUpdateItem"))
		{
			  int x=0;
			  String filename="";
			  String oldimage = request.getParameter("oldimage");
			  String savepath="D:\\Waste-Mart\\src\\main\\webapp\\subcategory";
			  File fileSaveDir = new File(savepath);
			  if(!fileSaveDir.exists())
			  {
				  fileSaveDir.mkdir();
			  }
			  Part file1 = request.getPart("itemimage");
			  if(file1.getContentType().equalsIgnoreCase("image/png") || file1.getContentType().equalsIgnoreCase("image/jpeg")) {	  
				  filename = new CategoryDao().extractfilename(file1);				  
				  file1.write(savepath + File.separator + filename);
			  }
			  else {				  
				  filename = oldimage;
			  }
			  SubCategoryModel scmodel=new SubCategoryModel();
			  scmodel.setCatid(Integer.parseInt(request.getParameter("catid")));
			  scmodel.setSubcatid(Integer.parseInt(request.getParameter("subcatid")));
			  scmodel.setItemname(request.getParameter("itemname"));
			  scmodel.setItemprice(request.getParameter("itemprice"));
			  scmodel.setItemimage(filename);
			  scmodel.setItemstock(request.getParameter("itemstock"));
			  x = new CategoryDao().CustomerUpdateSubCategory(scmodel);
			  if(x>0) 
			  {
				  response.sendRedirect("admin/customerviewsubcategory.jsp"); 
			  } 
			  else 
			  {
				  out.println("<script type=\"text/javascript\">");
				  out.println("alert('Customer item already exists')");
				  out.println("window.location.href='admin/customerviewsubcategory.jsp';");
				  out.println("</script>"); 
			  }
		}		
		else if(btn.equalsIgnoreCase("companyUpdateItem"))
		{
			  int x=0;
			  String filename="";
			  String oldimage = request.getParameter("oldimage");
			  String savepath="D:\\Waste-Mart\\src\\main\\webapp\\subcategory";
			  File fileSaveDir = new File(savepath);
			  if(!fileSaveDir.exists())
			  {
				  fileSaveDir.mkdir();
			  }
			  Part file1 = request.getPart("itemimage");
			  if(file1.getContentType().equalsIgnoreCase("image/png") || file1.getContentType().equalsIgnoreCase("image/jpeg")) {	  
				  filename = new CategoryDao().extractfilename(file1);				  
				  file1.write(savepath + File.separator + filename);
			  }
			  else {				  
				  filename = oldimage;
			  }						
			  SubCategoryModel scmodel=new SubCategoryModel();
			  scmodel.setCatid(Integer.parseInt(request.getParameter("catid")));
			  scmodel.setSubcatid(Integer.parseInt(request.getParameter("subcatid")));
			  scmodel.setItemname(request.getParameter("itemname"));
			  scmodel.setItemprice(request.getParameter("itemprice"));
			  scmodel.setItemimage(filename);
			  x = new CategoryDao().CompanyUpdateSubCategory(scmodel);
			  if(x>0) 
			  {
				  response.sendRedirect("admin/companyviewsubcategory.jsp"); 
			  } 
			  else 
			  {
				  out.println("<script type=\"text/javascript\">");
				  out.println("alert('Company item already exists')");
				  out.println("window.location.href='admin/companyviewsubcategory.jsp';");
				  out.println("</script>"); 
			  }
		}
		else if(btn.equalsIgnoreCase("updatecategory")) 
		{ 		
			  int x=0; 	
			  String filename="";
			  String oldimage = request.getParameter("oldimage");
			  String savepath="D:\\Waste-Mart\\src\\main\\webapp\\category";
			  File fileSaveDir = new File(savepath);
			  if(!fileSaveDir.exists())
			  {
				  fileSaveDir.mkdir();
			  }
			  Part file1 = request.getPart("itemimage");			  		 
			  if(file1.getContentType().equalsIgnoreCase("image/png") || file1.getContentType().equalsIgnoreCase("image/jpeg")) {	  
				  filename = new CategoryDao().extractfilename(file1);				  
				  file1.write(savepath + File.separator + filename);
			  }
			  else {				  
				  filename = oldimage;
			  }			  
			  int catid=Integer.parseInt(request.getParameter("catid")); 			  
			  String catname=request.getParameter("catname");			  
			  String catimage = filename; 
			  x = new CategoryDao().updateCategory(catid,catname,catimage);
			  if(x>0) 
			  {
				  response.sendRedirect("admin/viewcategory.jsp"); 
			  } 
			  else 
			  {
				  out.println("<script type=\"text/javascript\">");
				  out.println("alert('Category already exists')");
				  out.println("window.location.href='admin/viewcategory.jsp';");
				  out.println("</script>"); 
			  }				
		}			
	}
}