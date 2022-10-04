package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.dao.ContactUsDao;

import com.model.ContactUsModel;
import com.model.FeedbackModel;

/**
 * Servlet implementation class ContectUsController
 */
@WebServlet("/ContactUsController")
public class ContactUsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ContactUsController() {
        super();
        // TODO Auto-generated constructor stub
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
		
		if(btn.equalsIgnoreCase("contact"))
		{
			ContactUsModel cmodel = new ContactUsModel();
			cmodel.setName(request.getParameter("name"));
			cmodel.setEmail(request.getParameter("email"));
			cmodel.setMessage(request.getParameter("message"));
			int x =new ContactUsDao().ContectUs(cmodel);
			if(x>0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your Contact are Saved.')");
				out.println("window.location.href='contactus.jsp';");
				out.println("</script>");

			}
			
		}
		else if(btn.equalsIgnoreCase("feedback"))
		{
			FeedbackModel fmodel = new FeedbackModel();
			fmodel.setName(request.getParameter("name"));
			fmodel.setEmail(request.getParameter("email"));
			fmodel.setSubject(request.getParameter("subject"));
			fmodel.setDescription(request.getParameter("description"));
			int x =new ContactUsDao().Feedback(fmodel);
			if(x>0)
			{
				System.out.println("hello");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Thanks for your Feedback...')");
				out.println("window.location.href='home.jsp';");
				out.println("</script>");

			}
	}

	}}
