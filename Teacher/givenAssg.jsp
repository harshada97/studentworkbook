<%@ page import="onLoad.*" %>

<%
	String cn=(String)session.getAttribute("cn");
	String bn=(String)session.getAttribute("bn");
	String aname=(String)session.getAttribute("an");
	String tname=(String)session.getAttribute("sn");
	
	 if(giveAssg.given(bn,cn,tname,aname))
	{
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('Assignment Given');");
   			out.println("location='giveAssg.jsp';");
   			out.println("</script>");
   			
   	}
   	else
   	{
   			out.println("<script type=\"text/javascript\">");
   			out.println("alert('Assignment could not be given. Please contact Admin.');");
   			out.println("location='giveAssg.jsp';");
   			out.println("</script>");
   	}
%>
