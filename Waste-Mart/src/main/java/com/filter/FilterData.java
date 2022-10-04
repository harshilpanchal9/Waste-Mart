package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebFilter("*.do")
public class FilterData implements Filter {

    public FilterData() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
	{
		HttpServletRequest req =(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		System.out.println("Now start Request filteration...");
		if(req.getSession(false)==null)
		{
			req.setAttribute("msg", "Session Expired Plz Try again...");
			req.getRequestDispatcher("admin/login.jsp").forward(req, res);
		}
		else
		{
			chain.doFilter(request, response);
			System.out.println("Now start Response for Filter...");
		}	
	}

	public void init(FilterConfig fConfig) throws ServletException
	{
		
	}
}
