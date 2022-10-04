package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ZoneDao;

@WebServlet("/ZoneController")
public class ZoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ZoneController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("deletezone")) {
			int zoneid = Integer.parseInt(request.getParameter("zoneid"));
			int x = new ZoneDao().deleteZone(zoneid);
			if(x>0) {
				response.sendRedirect("admin/zone.jsp");				
			}else {
				response.sendRedirect("admin/zone.jsp");
			}
		}
		else if(action.equalsIgnoreCase("deletezonearea")) {
			int zoneareaid = Integer.parseInt(request.getParameter("zoneareaid"));
			int x = new ZoneDao().deleteZoneArea(zoneareaid);
			if(x>0) {
				response.sendRedirect("admin/zone.jsp");				
			}else {
				response.sendRedirect("admin/zone.jsp");
			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		String btn = request.getParameter("btn");
		System.out.println("Btn: "+btn);
		if(btn.equalsIgnoreCase("addzone")) {			
			String zonename = request.getParameter("zonename");
			int x = new ZoneDao().addZone(zonename);				
			if(x>0) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Zone added.')");
				out.println("window.location.href='admin/zone.jsp';");
				out.println("</script>");				
			}else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Cannot add zone name, if already exists.')");
				out.println("window.location.href='admin/zone.jsp';");
				out.println("</script>");
			}
		}
		else if(btn.equalsIgnoreCase("updatezone")) {
			int zoneid = Integer.parseInt(request.getParameter("zoneid"));
			String zonename = request.getParameter("zonename");
			int x = new ZoneDao().updateZone(zoneid,zonename);
			if(x>0) {
				response.sendRedirect("admin/zone.jsp");				
			}else {
				response.sendRedirect("admin/zone.jsp");
			}
		}
		else if(btn.equalsIgnoreCase("addarea")) {
			String zonearea = request.getParameter("zonearea");
			int zoneid = Integer.parseInt(request.getParameter("zoneid"));
			System.out.println("zonearea: "+zonearea);
			System.out.println("zoneid: "+zoneid);
			if(zonearea=="") {
				response.sendRedirect("admin/zone.jsp?error=null");
			}else {
				int x = new ZoneDao().addarea(zonearea, zoneid);
				if(x>0) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Zone area added.')");
					out.println("window.location.href='admin/zone.jsp';");
					out.println("</script>");
				}else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Cannot add zone area, if already exists.')");
					out.println("window.location.href='admin/zone.jsp';");
					out.println("</script>");
				}
			}
		}
		else if(btn.equalsIgnoreCase("updatearea")) {
			int zoneid = Integer.parseInt(request.getParameter("zoneid"));
			int zoneareaid = Integer.parseInt(request.getParameter("zoneareaid"));
			String zonearea = request.getParameter("zonearea");
			int x = new ZoneDao().updateZoneArea(zoneareaid, zoneid, zonearea);
			if(x>0) {
				response.sendRedirect("admin/zone.jsp");				
			}else {
				response.sendRedirect("admin/zone.jsp");
			}
		}
	}
}