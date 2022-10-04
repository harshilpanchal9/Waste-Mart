package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BlogReplyDao;
import com.model.BlogReplyModel;
import com.model.CompanyRegistrationModel;


@WebServlet("/BlogReplyController")
public class BlogReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BlogReplyController() {
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
		
		if(btn.equalsIgnoreCase("add"))
		{
			System.out.println("inside if");
			
			BlogReplyModel bmodel = new BlogReplyModel();
			bmodel.setName(request.getParameter("name"));
			bmodel.setEmail(request.getParameter("email"));
			bmodel.setMessage(request.getParameter("message"));
			int x =new BlogReplyDao().CustomerAddBlogreply(bmodel);
			if(x>0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your Reply has been given.')");
				out.println("window.location.href='blog.jsp';");
				out.println("</script>");

			}
			
		}
		
		
	}

}
