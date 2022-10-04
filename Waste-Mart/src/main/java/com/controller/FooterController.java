package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.FooterDao;
import com.model.FooterModel;




@WebServlet("/FooterController")
public class FooterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FooterController() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("inside controller");
		String btn=request.getParameter("btn");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		if(btn.equalsIgnoreCase("footer"))
		{
			FooterModel fmodel = new FooterModel();
			fmodel.setSubscribe_email(request.getParameter("subscribe_email"));
			int x =new FooterDao().Footer(fmodel);
			if(x>0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('You are subscribed.')");
				out.println("window.location.href='home.jsp';");
				out.println("</script>");

			}
			
		}
	
	}

}
