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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.UserZonerDao;
import com.model.UserZonerModel;


@WebServlet("/UserZonerController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512,maxRequestSize = 1024 * 1024 * 512 )
public class UserZonerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserZonerController() {
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


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//Change the Status of Customer in zonerviewregistration.jsp
		int x=0;
		String btn = request.getParameter("btn");		
		if(btn.equalsIgnoreCase("ZonerStatus")) {
			System.out.println("btn: "+btn);
			int zoner_id = Integer.parseInt(request.getParameter("zoner_id"));
			String status = request.getParameter("status");
			System.out.println("zoner_id: "+zoner_id);
			System.out.println("zoner_status: "+status);
			String all = request.getParameter("all");
			if(status.equalsIgnoreCase("active")) {
				x = new UserZonerDao().changeZonerStatus(zoner_id,"Deactive");
			}else if(status.equalsIgnoreCase("deactive")){
				x = new UserZonerDao().changeZonerStatus(zoner_id,"Active");
			}	
			if(all!=""){				
				if(x>0) {
					response.sendRedirect("admin/zonerviewregistration.jsp?status="+ status +"&all="+all);
				}else {
					response.sendRedirect("admin/zonerviewregistration.jsp");
				}
			}else {				
				if(x>0) {
					response.sendRedirect("admin/zonerviewregistration.jsp?status="+ status +"&all=null");
				}else {
					response.sendRedirect("admin/zonerviewregistration.jsp");
				}
			}			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		UserZonerModel rmodel=new UserZonerModel();
		String btn=request.getParameter("btn");
		if(btn.equalsIgnoreCase("registration"))
		{
			String filename="";
			String oldimage=request.getParameter("oldimage");
			String savepath = "D:\\Waste-Mart\\src\\main\\webapp\\zoner-images";
			File fileSaveDir = new File(savepath);
			if(!fileSaveDir.exists())
			{
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("photo");
			System.out.println("f="+file1);
			if(file1.getContentType().equalsIgnoreCase("image/png")||file1.getContentType().equalsIgnoreCase("image/jpeg"))
			{
				System.out.println("if block");
				filename=extractfilename(file1);
				System.out.println("Filename: "+filename);
				file1.write(savepath+File.separator+filename);
			}else{
				filename=oldimage;
			}
			file1.write(savepath + File.separator + filename);

			int zoneid =Integer.parseInt(request.getParameter("zoneid"));	
			rmodel.setPassword(request.getParameter("password"));
			rmodel.setFirstname(request.getParameter("firstname"));
			rmodel.setLastname(request.getParameter("lastname"));
			rmodel.setAddress(request.getParameter("address"));
			rmodel.setPhoneno(request.getParameter("phoneno").replaceAll(" ",""));
			rmodel.setZonename(new UserZonerDao().getZoneName(zoneid));
			rmodel.setAreaname(request.getParameter("zoneareaid"));
			rmodel.setEmail(request.getParameter("email"));	
			rmodel.setPhoto(filename);
			int x=new UserZonerDao().doRegister(rmodel);
			if(x>0)
			{		
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Zoner successfully registered.')");
				out.println("window.location.href='admin/zonerviewregistration.jsp';");
				out.println("</script>");
			}else if(x == -1) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('The given Zoner information is already registered.')");
				out.println("window.location.href='admin/zonerregistration.jsp';");
				out.println("</script>");
			}
			else{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Zoner info can not register.')");
				out.println("window.location.href='admin/zonerregistration.jsp';");
				out.println("</script>");
			}
		}
		else if(btn.equalsIgnoreCase("update"))
		{		
			rmodel.setZonerid(Integer.parseInt(request.getParameter("zonerid")));
			rmodel.setFirstname(request.getParameter("firstname"));
			rmodel.setLastname(request.getParameter("lastname"));
			rmodel.setAddress(request.getParameter("address"));
			rmodel.setPhoneno(request.getParameter("phoneno").replaceAll(" ", ""));
			rmodel.setEmail(request.getParameter("email"));

			int x=new UserZonerDao().updateProfile(rmodel);
			if(x>0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('profile updated successfully ')");
				out.println("window.location.href='zoner/zoner-homepage.jsp';");
				out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('profile not updated .')");
				out.println("window.location.href='zoner/zoner-homepage.jsp';");
				out.println("</script>");
			}
			
		}
		else if(btn.equalsIgnoreCase("login"))
		{
			rmodel.setEmail(request.getParameter("email"));
			rmodel.setPassword(request.getParameter("password"));
			UserZonerModel model=new UserZonerDao().doLogin(rmodel);
			
			if(model!=null)
			{
				HttpSession session=request.getSession(true);
				session.setAttribute("zonerid",model.getZonerid());
				System.out.println("Zonerid in c: "+model.getZonerid());
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Login Successfull .')");
				out.println("window.location.href='zoner/zoner-homepage.jsp';");
				out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Enter valid password and email .')");
				out.println("window.location.href='zoner-login.jsp';");
				out.println("</script>");
			}
		}
		else if(btn.equalsIgnoreCase("payment"))
		{
			int requestid=Integer.parseInt(request.getParameter("requestid"));
			System.out.println("requestid"+requestid);
			int zonerid=Integer.parseInt(request.getParameter("zonerid"));
			int custid=Integer.parseInt(request.getParameter("custid"));
			String grandtotal = new UserZonerDao().getGrandTotal(requestid);
			System.out.println(grandtotal);
			response.sendRedirect("zoner/pgRedirect.jsp?totalprice="+grandtotal+"&zonerid="+zonerid+"&custid="+custid+"&requestid="+requestid);
		}
		
	}

}
