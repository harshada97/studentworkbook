<%@ page import="Login.*"%>
<% String u=request.getParameter("user");
	String p=request.getParameter("pass");
	out.println("I am here");
	String s=login.loginValidation(u,p);
	out.println(s);
	if("ERROR".equals(s))
		response.sendRedirect("loginError.html");
	else
	{
		String memberID=getMemberID.getMemberId(u);
		session.setAttribute("memberID",memberID);
		String url=login.rolecmp(s);
		response.sendRedirect(url);
		
	}
%>
