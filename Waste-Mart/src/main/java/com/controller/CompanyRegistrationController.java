package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.util.Mailer;
import com.dao.CompanyRegistrationDao;
import com.dao.CustomerRegistrationDao;
import com.model.CompanyCartModel;
import com.model.CompanyRegistrationModel;
import com.model.CompanyRequestModel;
import com.model.CustomerCartMModel;
import com.model.CustomerRegistrationModel;
import com.model.CustomerRequestModel;

@WebServlet("/CompanyRegistrationController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512,maxRequestSize = 1024 * 1024 * 512 )

public class CompanyRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CompanyRegistrationController() {
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
			int companyid=Integer.parseInt(request.getParameter("companyid"));
			CompanyRegistrationModel model=new CompanyRegistrationDao().getRecord(companyid);
			request.setAttribute("model", model);
			request.getRequestDispatcher("company-updateprofile.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		CompanyRegistrationModel rmodel=new CompanyRegistrationModel();
		String btn=request.getParameter("btn");
		HttpSession session=request.getSession(false);
		
		if(btn.equalsIgnoreCase("registration"))
		{
			
			String filename="";
			String oldimage=request.getParameter("oldimage");
			String savepath = "D:\\Waste-Mart\\src\\main\\webapp\\company-images";
			File fileSaveDir = new File(savepath);
			if(!fileSaveDir.exists())
			{
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("photo");
			if(file1.getContentType().equalsIgnoreCase("image/png")||file1.getContentType().equalsIgnoreCase("image/jpeg"))
			{

				filename=extractfilename(file1);
				file1.write(savepath+File.separator+filename);
			}
			else
			{
				filename=oldimage;
			}
			file1.write(savepath + File.separator + filename);
			
			rmodel.setPassword(request.getParameter("password"));
			rmodel.setName(request.getParameter("name"));
			rmodel.setPhoneno(request.getParameter("phoneno").replaceAll(" ",""));	
			System.out.println(request.getParameter("phoneno").replaceAll(" ",""));
			rmodel.setEmail(request.getParameter("email"));
			rmodel.setProfile(filename);
			
			int x=new CompanyRegistrationDao().doRegister(rmodel);
			if(x>0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('You are successfully Registered.')");
				out.println("window.location.href='company-login.jsp';");
				out.println("</script>");

			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('not registered.')");
				out.println("window.location.href='company-registration.jsp';");
				out.println("</script>");
				
			}
		
		}
		else if(btn.equalsIgnoreCase("login"))
		{
			CompanyRegistrationModel lmodel=new CompanyRegistrationModel();
			
			
			lmodel.setEmail(request.getParameter("email"));
			lmodel.setPassword(request.getParameter("password"));
			
			CompanyRegistrationModel  model=new CompanyRegistrationDao().doLogin(lmodel);
			if(model!=null)
			{
				int x=new CompanyRegistrationDao().updateLoginDate(model.getCompanyid());
			}
			
			if(model!=null)
			{
				session=request.getSession(true);
				session.setAttribute("companyid",model.getCompanyid());
				session.setAttribute("photo", model.getProfile());
				out.println("<script type=\"text/javascript\">");
				out.println("alert('You are successfully login.')");
				out.println("window.location.href='company-homepage.jsp';");
				out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('login unsuccessfully.')");
				out.println("window.location.href='company-login.jsp';");
				out.println("</script>");

			}
		}
		
		else if(btn.equalsIgnoreCase("reset"))
		{
			int x=0;
			rmodel.setEmail(request.getParameter("email"));
			rmodel.setPassword(request.getParameter("oldpassword"));
			CompanyRegistrationModel model=new CompanyRegistrationDao().doLogin(rmodel);
			
			System.out.println(model);
			if(model!=null)
			{
				
				String newpassword=request.getParameter("newpassword");
				String confirmpassword=request.getParameter("confirmpassword");
				
				if(newpassword.equals(confirmpassword))
				{
					rmodel.setPassword(request.getParameter("confirmpassword"));
					rmodel.setEmail(request.getParameter("email"));
					x=new CompanyRegistrationDao().updateRecord(rmodel);
					if(x>0)
					{
						System.out.println("inside if");
						out.println("<script type=\"text/javascript\">");
						out.println("alert('password updated successfully.')");
						out.println("window.location.href='company-login.jsp';");
						out.println("</script>");
						
					}
					else
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('password not updated.')");
						out.println("window.location.href='company-resetpassword.jsp';");
						out.println("</script>");
						
					}
				}
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('password not updated.')");
				out.println("window.location.href='company-resetpassword.jsp';");
				out.println("</script>");
				
			}
		}
		else if(btn.equalsIgnoreCase("update"))
		{
			String filename="";
			String oldimage=request.getParameter("oldimage");
			String savepath = "D:\\Waste-Mart\\src\\main\\webapp\\company-images";
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
			rmodel.setCompanyid(Integer.parseInt(request.getParameter("companyid")));
			rmodel.setName(request.getParameter("name"));
			rmodel.setPhoneno(request.getParameter("phoneno").replaceAll(" ",""));
			rmodel.setEmail(request.getParameter("email"));
			rmodel.setProfile(filename);
			
			
			int x=new CompanyRegistrationDao().updateProfile(rmodel);
			if(x>0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('profile updated successfully ')");
				out.println("window.location.href='company-login.jsp';");
				out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('profile not updated .')");
				out.println("window.location.href='company-login.jsp';");
				out.println("</script>");
			}
			
		}
		else if(btn.equalsIgnoreCase("forgot"))
		{
			String email=request.getParameter("email");
			CompanyRegistrationModel model=new CompanyRegistrationDao().checkEmail(email);
			if(model==null)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Enter valid email id .')");
				out.println("window.location.href='company-forgotpassword.jsp';");
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
					request.getRequestDispatcher("company-sendotp.jsp").forward(request, response);
					out.println("<script type=\"text/javascript\">");
					out.println("alert('OTP send .')");
					
					out.println("</script>");
					
					
					
				}
				catch(Exception e)
				{
					
				}
			}
		}
		else if(btn.equalsIgnoreCase("verify"))
		{
			System.out.println("inside if");
			String G_OTP=request.getParameter("checkotp");
			String email=request.getParameter("email");
			System.out.println(email);
			System.out.println(G_OTP);
			String E_OTP=request.getParameter("otp");
			System.out.println(E_OTP);
			if(G_OTP.equalsIgnoreCase(E_OTP))
			{
			
				if(request.getParameter("newpassword").equalsIgnoreCase(request.getParameter("confirmpassword")))
				{
					System.out.println("inside second if");
					rmodel.setEmail(email);
					rmodel.setPassword(request.getParameter("newpassword"));
					int x=new CompanyRegistrationDao().updateRecord(rmodel);
					if(x>0)
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('password updated .')");
						out.println("window.location.href='company-login.jsp';");
						out.println("</script>");
					}
					else
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('password not updated .')");
						out.println("window.location.href='company-forgotpassword.jsp';");
						out.println("</script>");
					}
						
						
				}
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('password not updated .')");
				out.println("window.location.href='company-forgotpassword.jsp';");
				out.println("</script>");
			}

			
	}
		else if(btn.equalsIgnoreCase("addtocart"))
		{
			CompanyCartModel cmodel=new CompanyCartModel();
			int companyid=Integer.parseInt(request.getParameter("companyid"));
			int catid=Integer.parseInt(request.getParameter("catid"));
			System.out.println(companyid);
			cmodel.setCompanyid(companyid);
			cmodel.setSubcatname(request.getParameter("subcatname"));
			cmodel.setCatimage(request.getParameter("catimage"));
			cmodel.setSubcatid(Integer.parseInt(request.getParameter("subcatid")));
			cmodel.setPrice(request.getParameter("price"));
			int x=new CompanyRegistrationDao().addToCart(cmodel);
			System.out.println(x);
			CompanyCartModel cartmodel=new CompanyRegistrationDao().getCartid(cmodel);
			System.out.println(cartmodel.getCartid());
			if(x>0)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your item added Successfully..')");
				out.println("window.location.href='company-subcategory.jsp?catid="+catid+"';");
				out.println("</script>");

			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your item is already added.')");
				out.println("window.location.href='company-category.jsp';");
				out.println("</script>");

			}
			
		}
		else if(btn.equalsIgnoreCase("checkout"))
		{
			CompanyRequestModel reqmodel=new CompanyRequestModel();
			reqmodel.setQuantity(request.getParameter("totalqty"));
			reqmodel.setGtotal(request.getParameter("grandtotal"));
			reqmodel.setCompanyid(Integer.parseInt(request.getParameter("cid")));
			int x=new CompanyRegistrationDao().checkoutDetail(reqmodel);
			if(x>0)
			{
				response.sendRedirect("company-request.jsp?gtotal="+request.getParameter("grandtotal"));
			}
			else
			{
				response.sendRedirect("company-cart.jsp");
			}
			
		}
		else if(btn.equalsIgnoreCase("request"))
		{
			CompanyRequestModel requestmodel=new CompanyRequestModel();
			String status="Pending";
			String mode=request.getParameter("paymentmode");
			boolean ans1=mode.equalsIgnoreCase("Online");
			boolean ans2=mode.equalsIgnoreCase("Cash On Delivery");
			System.out.println("mode="+mode);
			requestmodel.setCompanyid(Integer.parseInt(request.getParameter("companyid")));
			requestmodel.setAddress(request.getParameter("address"));
			requestmodel.setPhoneno(request.getParameter("phoneno").replaceAll(" ",""));
			requestmodel.setZonename(request.getParameter("zonename"));
			requestmodel.setZonearea(request.getParameter("zonearea"));
		//	requestmodel.setCategoryid(request.getParameter("category"));
			requestmodel.setPaymentmode(request.getParameter("paymentmode"));
			requestmodel.setPickupdate(request.getParameter("pickupdate"));
			requestmodel.setStatus(status);
			int companyid = Integer.parseInt(request.getParameter("companyid"));
			String gtotal = request.getParameter("gtotal");
			int x=new CompanyRegistrationDao().bookRequest(requestmodel);
			if(x>0&&ans1)
			{
				
				/*
				 * out.println("<script type=\"text/javascript\">");
				 * out.println("alert('Request Sending successfully .')");
				 * out.println("window.location.href='company-category.jsp';");
				 * out.println("</script>");
				 */
				//int requestid = new CompanyRegistrationDao().getRequestId(gtotal);
					response.sendRedirect("pgRedirect.jsp?totalprice="+gtotal+"&companyid="+companyid);
			}
			if(ans2&&x>0)
				{

					int updatestock=new CompanyRegistrationDao().updateStockCash(companyid);
					if(updatestock>0)
					{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Request Sending successfully .')");
					  out.println("window.location.href='company-category.jsp';");
					  out.println("</script>");
					}
					else
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Request not accepted .')");
						out.println("window.location.href='company-request.jsp';");
						out.println("</script>");
					}
				}
			
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Request not accepted .')");
				out.println("window.location.href='company-request.jsp';");
				out.println("</script>");
			}

		}
		else if(btn.equalsIgnoreCase("remove"))
		{
			System.out.println("inside cart");
			int cartid=Integer.parseInt(request.getParameter("cartid"));
			int x=new CompanyRegistrationDao().deleteCartItem(cartid);
			System.out.println(x);
			if(x>0)
			{
				response.sendRedirect("company-cart.jsp");
			}
		}
		else if(btn.equalsIgnoreCase("stockupdate"))
		{
			int companyid=Integer.parseInt(request.getParameter("companyid"));
			System.out.println(companyid+"companyid");
			int x=new CompanyRegistrationDao().updateStock(companyid);
			if(x>0)
			{
				session.setAttribute("companyid", companyid);
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Payment successful .')");
				out.println("window.location.href='company-category.jsp';");
				out.println("</script>");

			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Payment not successful .')");
				out.println("window.location.href='company-request.jsp';");
				out.println("</script>");

			}
			
		}
		
		
	}
}
		
	

		
		
		
			
				

