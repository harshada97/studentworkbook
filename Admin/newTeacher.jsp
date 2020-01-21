<%@ page import="Admin.*" %>
<%@ page import="java.time.LocalDate" %>    

<%
    String mid = request.getParameter("mid");
    String uname = request.getParameter("uname");
    String pwd = request.getParameter("password");
    String rno = "NULL";
    String name = request.getParameter("name");
    
    String ph = request.getParameter("phoneNo");
    String bid = "NULL";
    String cid = "NULL";

    out.print("In teacher.jsp");

if(!CreateMember.createMember(mid,uname,pwd,rno,name,ph,bid,cid,"Teacher"))
    {
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('Yikes!!');");
   			out.println("location='createAcc.html';");
   			out.println("</script>");
   	}
   	else
   	{
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('Yaya!!');");
   			out.println("location='createAcc.html';");
   			out.println("</script>");
   	}
%>
