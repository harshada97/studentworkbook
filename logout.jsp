<%
	
	out.println("<script type=\"text/javascript\">");
   	out.println("alert('Logout Succesfull');");
   	out.println("location='index.jsp';");
   	out.println("</script>");
   	session.invalidate();
	response.sendRedirect("http://localhost:8080/Project/index.html");
%>
