<%@ page import="Admin.*" %>

<% 
		String rid=request.getParameter(" ");
		String r=request.getParameter(" ");
		String m=request.getParameter(" ");
		out.println("<script type=\"text/javascript\">");
		out.println("alert(remark(rid,r,m));");
   		out.println("location='index.jsp';");
   		out.println("</script>");	
%>	
