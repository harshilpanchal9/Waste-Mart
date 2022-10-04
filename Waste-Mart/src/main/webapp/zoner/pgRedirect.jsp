<%@page import="com.util.PaytmConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>    
<%
Random r  = new Random();
int r1 = r.nextInt(10000000);
String merchantMid = "oBxHSK64425635495641";
//Key in your staging and production MID available in your dashboard
String merchantKey = "XpDaEMg2vHBpc#qv";
//Key in your staging and production merchant key available in your dashboard
String orderId = "order"+r1;
String channelId = "WEB";
String custId = "cust123";
String mobileNo = "9016545414";
String email = "rahulsanghavia1234@gmail.com";
//-------------------------------------------------
// Get Grand total from UserZonerController servlet
String grtotal = request.getParameter("totalprice");
int zonerid = Integer.parseInt(request.getParameter("zonerid"));
int custid = Integer.parseInt(request.getParameter("custid"));
int requestid=Integer.parseInt(request.getParameter("requestid"));
//-------------------------------------------------
String website = "WEBSTAGING";
//This is the staging value. Production value is available in your dashboard
String industryTypeId = "Retail";
//This is the staging value. Production value is available in your dashboard
String callbackUrl = "http://localhost:8083/Waste-Mart/zoner/pgResponse.jsp?zonerid="+zonerid+"&custid="+custid+"&requestid="+requestid;
TreeMap<String, String> paytmParams = new TreeMap<String, String>();
paytmParams.put("MID",merchantMid);
paytmParams.put("ORDER_ID",orderId);
paytmParams.put("CHANNEL_ID",channelId);
paytmParams.put("CUST_ID",custId);
paytmParams.put("MOBILE_NO",mobileNo);
paytmParams.put("EMAIL",email);
paytmParams.put("TXN_AMOUNT",grtotal);
paytmParams.put("WEBSITE",website);
paytmParams.put("INDUSTRY_TYPE_ID",industryTypeId);
paytmParams.put("CALLBACK_URL", callbackUrl);
String paytmChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(merchantKey, paytmParams);
StringBuilder outputHtml = new StringBuilder();
outputHtml.append("<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>");
outputHtml.append("<html>");
outputHtml.append("<head>");
outputHtml.append("<title>Merchant Checkout Page</title>");
outputHtml.append("</head>");
outputHtml.append("<body>");
outputHtml.append("<center><h1>Please do not refresh this page...</h1></center>");

outputHtml.append("<form method='post' action='https://securegw-stage.paytm.in/theia/processTransaction' name='f1'>");
for(Map.Entry<String,String> entry : paytmParams.entrySet()) {
outputHtml.append("<input type='hidden' name='"+entry.getKey()+"' value='"+entry.getValue()+"'>");
}
outputHtml.append("<input type='hidden' name='CHECKSUMHASH' value='"+paytmChecksum+"'>");
outputHtml.append("</form>");
outputHtml.append("<script type='text/javascript'>");
outputHtml.append("document.f1.submit();");
outputHtml.append("</script>");
outputHtml.append("</body>");
outputHtml.append("</html>");
out.println(outputHtml);
%>
