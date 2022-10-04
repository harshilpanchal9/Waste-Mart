package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminLoginDao;
import com.model.AdminLoginModel;


@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AdminLoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");		
		String btn=request.getParameter("btn");
		AdminLoginModel lmodel=new AdminLoginModel();
		
		if(btn.equalsIgnoreCase("login"))
		{
			PrintWriter out = response.getWriter();
			
			lmodel.setUsername(request.getParameter("username"));
			lmodel.setPassword(request.getParameter("password"));
			
			AdminLoginModel rsmodel=new AdminLoginDao().doLogin(lmodel);
			if(rsmodel != null)
			{
				HttpSession session=request.getSession(true);
				session.setAttribute("userid", lmodel.getUsername());
				session.setAttribute("password", lmodel.getPassword());
				session.setMaxInactiveInterval(120); 
				System.out.println("Session: "+session.getMaxInactiveInterval());
				response.sendRedirect("admin/dashboard.jsp");
			} else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Invalid email or password.')");
				out.println("window.location.href='admin/login.jsp';");
				out.println("</script>");
			}
		}
	}
}