package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		String btn=request.getParameter("btn");
		if(btn.equalsIgnoreCase("searchCategory")) {
			String searchbar = request.getParameter("searchbar");
			System.out.println("Search value: "+searchbar);
			if(searchbar != "") {
				response.sendRedirect("admin/viewcategory.jsp?search="+searchbar);
			}else {
				response.sendRedirect("admin/viewcategory.jsp?search="+null);
			}
		}
		else if(btn.equalsIgnoreCase("searchCustomerSubCategory")) {
			String searchbar = request.getParameter("searchbar");
			if(searchbar != "") {
				response.sendRedirect("admin/customerviewsubcategory.jsp?search="+searchbar);
			}else {
				response.sendRedirect("admin/customerviewsubcategory.jsp?search="+null);
			}
		}
		else if(btn.equalsIgnoreCase("searchCompanySubCategory")) {
			String searchbar = request.getParameter("searchbar");
			if(searchbar != "") {
				response.sendRedirect("admin/companyviewsubcategory.jsp?search="+searchbar);
			}else {
				response.sendRedirect("admin/companyviewsubcategory.jsp?search="+null);
			}
		}
		else if(btn.equalsIgnoreCase("searchStockItem")) {
			String searchbar = request.getParameter("searchbar");
			if(searchbar != "") {
				response.sendRedirect("admin/stocks.jsp?search="+searchbar);
			}else {
				response.sendRedirect("admin/stocks.jsp?search="+null);
			}
		}
	}
}
