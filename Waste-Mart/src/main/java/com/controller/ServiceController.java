package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dao.ServicesDao;
import com.model.AboutUsModel;
import com.model.ServicesModel;

@WebServlet("/ServiceController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512,maxRequestSize = 1024 * 1024 * 512 )
public class ServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServiceController() {
        super();
        // TODO Auto-generated constructor stub
    }
    private String extractfilename(Part file) 
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("inside controller");
		String btn=request.getParameter("btn");
		System.out.println(btn);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		ServicesModel smodel=new ServicesModel();
		AboutUsModel amodel=null;
		if(btn.equalsIgnoreCase("addservices"))
		{
			String filename="";
			String oldimage=request.getParameter("photo");
			String savepath = "D:\\Waste-Mart\\src\\main\\webapp\\services";
			File fileSaveDir = new File(savepath);
			if(!fileSaveDir.exists())
			{
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("photo");
			System.out.println("f="+file1);
			if(file1.getContentType().equalsIgnoreCase("image/png")||file1.getContentType().equalsIgnoreCase("image/jpeg"))
			{
				System.err.println("if block");
				filename=extractfilename(file1);
				file1.write(savepath+File.separator+filename);
			}
			else
			{
				filename=oldimage;
			}
			file1.write(savepath + File.separator + filename);
			smodel.setTitle(request.getParameter("title"));
			smodel.setContent(request.getParameter("content"));
			smodel.setImage(filename);
			int x=new ServicesDao().addServices(smodel);
			if(x>0)
			{
				response.sendRedirect("admin/services.jsp");
			}
			else
			{
				response.sendRedirect("admin/services.jsp");
			}

		}
		else if(btn.equalsIgnoreCase("addaboutus"))
		{
			amodel.setTitle(request.getParameter("title"));
			amodel.setContent(request.getParameter("content"));
			int x=new ServicesDao().addAboutUs(amodel);
			if(x>0)
			{
				response.sendRedirect("about.jsp");
			}
			else
			{
				response.sendRedirect("admin/add-aboutus.jsp");
			}
		}
		else if(btn.equalsIgnoreCase("deleteservice"))
		{
			smodel.setId(Integer.parseInt(request.getParameter("id")));
			int x = new ServicesDao().deleteService(smodel);
			if(x>0) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Service deleted.')");
				out.println("window.location.href='admin/services.jsp';");
				out.println("</script>");
			}else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Service not delete, please try again.')");
				out.println("window.location.href='admin/services.jsp';");
				out.println("</script>");
			}
		}
	}

}
