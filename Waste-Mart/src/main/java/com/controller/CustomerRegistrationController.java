 package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.Response;

import com.dao.CustomerRegistrationDao;
import com.model.CustomerCartMModel;
import com.model.CustomerRegistrationModel;
import com.model.CustomerRequestModel;
import com.util.DBUtil;
import com.util.Mailer;


@WebServlet("/CustomerRegistrationController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512,maxRequestSize = 1024 * 1024 * 512 )
public class CustomerRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CustomerRegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    private String extractfilename(Part file) 
	{
		String cd = file.getHeader("content-disposition");
		System.out.println(cd);
		String[] items = cd.split(";");
		for(String string : items)
		{
			if(string.trim().startsWith("filename"))
			{
				return string.substring(string.indexOf("=")+2,string.length()-1);
			}
		}
		return "";
	}
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("update"))
		{
			int customerid=Integer.parseInt(request.getParameter("customerid"));
			CustomerRegistrationModel model=new CustomerRegistrationDao().getRecord(customerid);
			request.setAttribute("model", model);
			request.getRequestDispatcher("customer-updateprofile.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		CustomerRegistrationModel rmodel=new CustomerRegistrationModel();
		String btn=request.getParameter("btn");
		HttpSession session=request.getSession(false);
		
		//Registration
		if(btn.equalsIgnoreCase("registration"))
		{
			System.out.println("Servlet called");
			String filename="";
			String oldimage=request.getParameter("oldimage");
			String savepath = "D:\\Waste-Mart\\src\\main\\webapp\\customer-images";
			File fileSaveDir = new File(savepath);
			if(!fileSaveDir.exists())
			{
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("photo");
			System.out.println("f="+file1);
			if(file1.getContentType().equalsIgnoreCase("image/png")||file1.getContentType().equalsIgnoreCase("image/jpeg"))
			{
				System.err.println("if block");
				filename=extractfilename(file1);
				file1.write(savepath+File.separator+filename);
			}
			else
			{
				filename=oldimage;
			}
			file1.write(savepath + File.separator + filename);
			rmodel.setPassword(request.getParameter("password"));
			rmodel.setFirstname(request.getParameter("firstname"));
			rmodel.setLastname(request.getParameter("lastname"));
			rmodel.setPhoneno(request.getParameter("phoneno").replaceAll(" ",""));
			rmodel.setEmail(request.getParameter("email"));
			rmodel.setProfilepicture(filename);
			System.out.println(filename);
			int x=new CustomerRegistrationDao().doRegister(rmodel);;
			if(x>0)
			{
				String email=request.getParameter("email");
				Mailer mail = new Mailer(); mail.send(email,"Registration", "Dear "+ rmodel.getFirstname()+" "+rmodel.getLastname()+",<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; You are successfully registered. <br> Welcome to our waste-mart family.");
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('You are successfully Registered.')");
				out.println("window.location.href='customer-login.jsp';");
				out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('You are not  Registered.')");
				out.println("window.location.href='customer-registration.jsp';");
				out.println("</script>");
			}
		}
		//Login	
		else if(btn.equalsIgnoreCase("login"))
		{			
			rmodel.setEmail(request.getParameter("email"));
			rmodel.setPassword(request.getParameter("password"));
			CustomerRegistrationModel model=new CustomerRegistrationDao().doLogin(rmodel);
			System.out.println(model);
			if(model!=null)
			{
				int x=new CustomerRegistrationDao().updateLoginDate(model.getCustomerid());
			}
			
			if(model!=null)
			{
				session=request.getSession(true);
				session.setAttribute("customerid", model.getCustomerid());
				session.setAttribute("photo", model.getProfilepicture());
				System.out.println(model.getProfilepicture());
				response.sendRedirect("customer-homepage.jsp");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('login unsuccessfully..')");
				out.println("window.location.href='customer-registration.jsp';");
				out.println("</script>");
			}
		}
		//Reset password
		else if(btn.equalsIgnoreCase("reset"))
		{
			int x=0;
			rmodel.setEmail(request.getParameter("email"));
			rmodel.setPassword(request.getParameter("oldpassword"));
			CustomerRegistrationModel model=new CustomerRegistrationDao().doLogin(rmodel);
			System.out.println("model"+model);
			if(model!=null)
			{
				
				String newpassword=request.getParameter("newpassword");
				String confirmpassword=request.getParameter("confirmpassword");
				if(newpassword.equals(confirmpassword))
				{
					rmodel.setPassword(request.getParameter("confirmpassword"));
					rmodel.setEmail(request.getParameter("email"));
					x=new CustomerRegistrationDao().updateRecord(rmodel);
					if(x>0)
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('password updated successfully..')");
						out.println("window.location.href='customer-login.jsp';");
						out.println("</script>");
						
					}
					else
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('password not updated successfully..')");
						out.println("window.location.href='customer-resetpassword.jsp';");
						out.println("</script>");
					}
				}
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('password and email does not match..')");
				out.println("window.location.href='customer-resetpassword.jsp';");
				out.println("</script>");

			}
		}
		//Update profile
		else if(btn.equalsIgnoreCase("update"))
		{
			String filename="";
			String oldimage=request.getParameter("oldimage");
			String savepath = "D:\\Waste-Mart\\src\\main\\webapp\\customer-images";
			File fileSaveDir = new File(savepath);
			if(!fileSaveDir.exists())
			{
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("photo");
			if(file1.getContentType().equalsIgnoreCase("image/png")||file1.getContentType().equalsIgnoreCase("image/jpeg"))
			{
				System.err.println("if block");
				filename=extractfilename(file1);
				file1.write(savepath+File.separator+filename);
			}
			else
			{
				filename=oldimage;
			}
			rmodel.setCustomerid(Integer.parseInt(request.getParameter("customerid")));
			rmodel.setFirstname(request.getParameter("firstname"));
			rmodel.setLastname(request.getParameter("lastname"));
			rmodel.setPhoneno(request.getParameter("phoneno").replaceAll(" ",""));
			rmodel.setEmail(request.getParameter("email"));
			rmodel.setProfilepicture(filename);
			int x=new CustomerRegistrationDao().updateProfile(rmodel);
			if(x>0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('profile updated successfully ')");
				out.println("window.location.href='customer-homepage.jsp';");
				out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('profile not updated .')");
				out.println("window.location.href='customer-login.jsp';");
				out.println("</script>");
			}			
		}
		//Forgot password
		else if(btn.equalsIgnoreCase("forgot"))
		{
			String email=request.getParameter("email");
			CustomerRegistrationModel model=new CustomerRegistrationDao().checkEmail(email);
			if(model==null)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Enter valid email id .')");
				out.println("window.location.href='customer-forgotpassword.jsp';");
				out.println("</script>");	
			}
			else
			{
				try {
					Random randomno=new Random();
					int otp=randomno.nextInt(900000)+100000;
					String msg=Integer.toString(otp);
					Mailer mail = new Mailer();
					System.out.println(msg);
					mail.send(email,"OTP",msg);
					
					
					request.setAttribute("email", model.getEmail());
					request.setAttribute("otp",msg);
					request.getRequestDispatcher("customer-sendotp.jsp").forward(request, response);
					out.println("<script type=\"text/javascript\">");
					out.println("alert('OTP send .')");
					//out.println("window.location.href='customer-sendotp.jsp';");
					out.println("</script>");
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		}
		//verify
		else if(btn.equalsIgnoreCase("verify"))
		{
			System.out.println("inside if");
			String G_OTP=request.getParameter("checkotp");
			String email=request.getParameter("email");
			String E_OTP=request.getParameter("otp");
			if(G_OTP.equalsIgnoreCase(E_OTP))
			{
			
				if(request.getParameter("newpassword").equalsIgnoreCase(request.getParameter("confirmpassword")))
				{
					System.out.println("inside second if");
					rmodel.setEmail(email);
					rmodel.setPassword(request.getParameter("newpassword"));
					int x=new CustomerRegistrationDao().updateRecord(rmodel);
					if(x>0)
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('password updated .')");
						out.println("window.location.href='customer-login.jsp';");
						out.println("</script>");
					}
					else
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('password not updated .')");
						out.println("window.location.href='customer-forgotpassword.jsp';");
						out.println("</script>");
					}
				}
				else
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Enter valid otp .')");
					out.println("window.location.href='customer-forgotpassword.jsp';");
					out.println("</script>");
				}
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('password not updated .')");
				out.println("window.location.href='customer-forgotpassword.jsp';");
				out.println("</script>");
				
			}
		}
		
		else if(btn.equalsIgnoreCase("request"))
		{
			CustomerRequestModel requestmodel=new CustomerRequestModel();
			String status="Pending";
			String email=request.getParameter("email");
			requestmodel.setCustomerid(Integer.parseInt(request.getParameter("customerid")));
			requestmodel.setAddress(request.getParameter("address"));
			requestmodel.setPhoneno(request.getParameter("phoneno").replaceAll(" ",""));
			requestmodel.setZonename(request.getParameter("zonename"));
			requestmodel.setZonearea(request.getParameter("zonearea"));
		//	requestmodel.setCategoryid(request.getParameter("category"));
			requestmodel.setPaymentmode(request.getParameter("paymentmode"));
			requestmodel.setPickupdate(request.getParameter("pickupdate"));
			requestmodel.setStatus(status);
			
			int x=new CustomerRegistrationDao().bookRequest(requestmodel);
			if(x>0)
			{
				Mailer mail = new Mailer(); mail.send(email,"Request Confirmation", "Request accepted Succesfully..");
				 
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Request Sending successfully .')");
				out.println("window.location.href='category.jsp';");
				out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Request not accepted .')");
				out.println("window.location.href='customer-request.jsp';");
				out.println("</script>");
			}
			
		}
		
		//addtocart
		else if(btn.equalsIgnoreCase("add to cart"))
		{
			CustomerCartMModel cmodel=new CustomerCartMModel();
			int customerid=Integer.parseInt(request.getParameter("customerid"));
			int catid=Integer.parseInt(request.getParameter("catid"));
			System.out.println(customerid);
			cmodel.setCustomerid(customerid);
			cmodel.setSubcatname(request.getParameter("subcatname"));
			cmodel.setCatimage(request.getParameter("catimage"));
			cmodel.setSubcatid(Integer.parseInt(request.getParameter("subcatid")));
			cmodel.setPrice(request.getParameter("price"));
			int x=new CustomerRegistrationDao().addToCart(cmodel);
			System.out.println(x);
			CustomerCartMModel cartmodel=new CustomerRegistrationDao().getCartid(cmodel);
			System.out.println(cartmodel.getCartid());
			if(x>0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Added Successfully..')");
				out.println("window.location.href='customer-subcategory.jsp?catid="+catid+"';");
				out.println("</script>");

			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Already added..')");
				out.println("window.location.href='customer-subcategory.jsp?catid="+catid+"';");
				out.println("</script>");

			}
			
		}
		//remove
		else if(btn.equalsIgnoreCase("remove"))
		{
			System.out.println("inside cart");
			int cartid=Integer.parseInt(request.getParameter("cartid"));
			int x=new CustomerRegistrationDao().deleteCartItem(cartid);
			System.out.println(x);
			if(x>0)
			{
				response.sendRedirect("cart.jsp");
			}
		}
		
		else if(btn.equalsIgnoreCase("checkout"))
		{
			CustomerRequestModel reqmodel=new CustomerRequestModel();
			reqmodel.setQty(request.getParameter("totalqty"));
			reqmodel.setGtotal(request.getParameter("grandtotal"));
			reqmodel.setCustomerid(Integer.parseInt(request.getParameter("cid")));
			int x=new CustomerRegistrationDao().checkoutDetail(reqmodel);
			if(x>0)
			{
				response.sendRedirect("customer-request.jsp");
			}
			else
			{
				response.sendRedirect("cart.jsp");
			}
			
		}
		else if(btn.equalsIgnoreCase("stockupdate"))
		{
			int requestid=Integer.parseInt(request.getParameter("requestid"));
			int custid=Integer.parseInt(request.getParameter("custid"));
			int zonerid=Integer.parseInt(request.getParameter("zonerid"));
			System.out.println("inside c"+custid);
			int x=new CustomerRegistrationDao().updateStock(custid);
			int y=new CustomerRegistrationDao().updateRequestStatus(requestid);
			System.out.println(x+" updte");
			System.out.println(y+" request");
			System.out.println("update"+x);
			if(x>0&&y>0)
			{
				response.sendRedirect("zoner-homepage.jsp?zonerid="+zonerid);
			}
		}
		else if(btn.equalsIgnoreCase("updatestatus"))
		{
			int requestid=Integer.parseInt(request.getParameter("requestid"));
			int custid=Integer.parseInt(request.getParameter("custid"));
			int zonerid=Integer.parseInt(request.getParameter("zonerid"));
			System.out.println("inside c"+custid);
			int x=new CustomerRegistrationDao().updateStock(custid);
			int y=new CustomerRegistrationDao().updateRequestStatus(requestid);
			System.out.println("update"+x);
			if(x>0&&y>0)
			{
				response.sendRedirect("zoner/zoner-homepage.jsp?zonerid="+zonerid);
			}
			else
			{
				response.sendRedirect("zoner/zoner-homepage.jsp?zonerid="+zonerid);
				
			}
			
		}
		else
		{
		
		}
		
	}
}