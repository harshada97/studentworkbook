<%@ page import="Admin.*" %>
<%
    String divisionId = request.getParameter("classID");
    String divisionName = request.getParameter("subjectID");

    if(!Create.linkClassSubject(divisionId,divisionName))
    {
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('ERROR!!');");
   			out.println("location='sta.html';");
   			out.println("</script>");
   	}
   	else
   	{
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('SUCCESS!!');");
   			out.println("location='sta.html';");
   			out.println("</script>");
   	}
   	
    
    	
%>
