package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CategoryDao;
import com.dao.UserCompanyDao;
import com.dao.UserCustomerDao;

@WebServlet("/UserCustomerController")
public class UserCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UserCustomerController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//Change the Status of Customer in customer.jsp
		int x=0;
		PrintWriter out = response.getWriter();
		String btn = request.getParameter("btn");		
		if(btn.equalsIgnoreCase("CustomerStatus")) {
			int cust_id = Integer.parseInt(request.getParameter("cust_id"));
			String status = request.getParameter("status");
			String all = request.getParameter("all");
			if(status.equalsIgnoreCase("active")) {
				x = new UserCustomerDao().changeCustomerStatus(cust_id,"Deactive");
			}else if(status.equalsIgnoreCase("deactive")){
				x = new UserCustomerDao().changeCustomerStatus(cust_id,"Active");
			}			
			if(all!=""){				
				if(x>0) {
					response.sendRedirect("admin/customer.jsp?status="+ status +"&all="+all);
				}else {
					response.sendRedirect("admin/customer.jsp");
				}
			}else {				
				if(x>0) {
					response.sendRedirect("admin/customer.jsp?status="+ status +"&all=null");
				}else {
					response.sendRedirect("admin/customer.jsp");
				}
			}			
		}else if(btn.equalsIgnoreCase("deactivecustomer")) {			
			String id[] = request.getParameterValues("checkboxid");
			if(id != null) {
				for(int i = 0;i <= id.length-1;i++) {
					System.out.println(id[i]);
				}
				x = new UserCustomerDao().deactiveCustomer(id);
				if(x>0)
				{				
					response.sendRedirect("admin/customer.jsp");
				}
				else
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Cannot update status of customer.')");
					out.println("window.location.href='admin/customer.jsp';");
					out.println("</script>");			
				}
			}else {
				response.sendRedirect("admin/customer.jsp");
			}
		}	
		else if(btn.equalsIgnoreCase("deleteCustomerRequest")) {
			int requestid = Integer.parseInt(request.getParameter("requestid"));
			x = new UserCustomerDao().deleteCustomerRequest(requestid);
			if(x>0) {
				response.sendRedirect("admin/request-customer.jsp");
			}
			else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Soory, We cannot delete customer request.')");
				out.println("window.location.href='admin/request-customer.jsp';");
				out.println("</script>");
			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{		
		PrintWriter out = response.getWriter();
		int x=0;
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("changeStatus")) {
			String status = request.getParameter("status");
			String radiostatus = request.getParameter("radiostatus");
			String p_mode = request.getParameter("paymentmode");
			int req_id = Integer.parseInt(request.getParameter("requestid"));
			if(status.equalsIgnoreCase("pending")) {
				x = new UserCustomerDao().changeRequestStatus(req_id,status,p_mode);
				if(x>0) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Payment status updated.')");
					out.println("window.location.href='admin/request-customer.jsp?status="+ radiostatus +"';");
					out.println("</script>");
				}else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('cannot update payment status.')");
					out.println("window.location.href='admin/request-customer.jsp';");
					out.println("</script>");
				}
			}
		}
	}
}
