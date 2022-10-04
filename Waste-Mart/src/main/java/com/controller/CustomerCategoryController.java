package com.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CustomerCategoryDao;
import com.model.CustomerCategoryModel;


@WebServlet("/CustomerCategoryController")
public class CustomerCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CustomerCategoryController() {
        super();
   }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");
		int catid = Integer.parseInt(request.getParameter("catid"));
		if(action.equalsIgnoreCase("showdata"))
		{
			HashMap h1 = new CustomerCategoryDao().showItem(catid);
			request.setAttribute("h1", h1);
			request.getRequestDispatcher("scrap-price.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
}
