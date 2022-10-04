package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserCompanyDao;
import com.dao.UserCustomerDao;
@WebServlet("/UserCompanyController")
public class UserCompanyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UserCompanyController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//Change the Status of company in company.jsp
		PrintWriter out = response.getWriter();
		int x=0;
		String btn = request.getParameter("btn");		
		if(btn.equalsIgnoreCase("CompanyStatus")) {
			int company_id = Integer.parseInt(request.getParameter("company_id"));
			System.out.println(company_id);
			String status = request.getParameter("status");
			String all = request.getParameter("all");
			if(status.equalsIgnoreCase("active")) {
				x = new UserCompanyDao().changeCompanyStatus(company_id, "Deactive");
			}else if(status.equalsIgnoreCase("deactive")){
				x = new UserCompanyDao().changeCompanyStatus(company_id, "Active");
			}
			if(all!=""){				
				if(x>0) {
					response.sendRedirect("admin/company.jsp?status="+ status +"&all="+all);
				}else {
					response.sendRedirect("admin/company.jsp");
				}
			}else {				
				if(x>0) {
					response.sendRedirect("admin/company.jsp?status="+ status +"&all=null");
				}else {
					response.sendRedirect("admin/company.jsp");
				}
			}			
		}else if(btn.equalsIgnoreCase("deactivecompany")) {			
			String id[] = request.getParameterValues("checkboxid");
			if(id != null) {
				for(int i = 0;i <= id.length-1;i++) {
					System.out.println(id[i]);
				}
				x = new UserCompanyDao().deactiveCompany(id);
				if(x>0)
				{				
					response.sendRedirect("admin/company.jsp");
				}
				else
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Cannot update status of company.')");
					out.println("window.location.href='admin/company.jsp';");
					out.println("</script>");			
				}
			}else {
				response.sendRedirect("admin/company.jsp");
			}
		}
		else if(btn.equalsIgnoreCase("deleteCompanyRequest")) {
			int requestid = Integer.parseInt(request.getParameter("requestid"));
			x = new UserCompanyDao().deleteCompanyRequest(requestid);
			if(x>0) {
				response.sendRedirect("admin/request-company.jsp");
			}
			else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Soory, We cannot delete company request.')");
				out.println("window.location.href='admin/request-company.jsp';");
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
				x = new UserCompanyDao().changeRequestStatus(req_id,status,p_mode);
				if(x>0) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Payment status updated.')");
					out.println("window.location.href='admin/request-company.jsp?status="+ radiostatus +"';");
					out.println("</script>");
				}else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('cannot update payment status.')");
					out.println("window.location.href='admin/request-company.jsp';");
					out.println("</script>");
				}
			}
		}
	}
}
