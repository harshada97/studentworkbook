<%@ page import="Admin.*" %>
<%@ page import="java.time.LocalDate" %>    

<%
    String mid = request.getParameter("mid");
    String uname = request.getParameter("uname");
    String pwd = request.getParameter("password");
    String rno = request.getParameter("rollNo");
    String name = request.getParameter("name");
    
    String ph = request.getParameter("phoneNo");
    String bid = request.getParameter("batchID");
    String cid = request.getParameter("classID");

    out.print(cid);

	
/*if(!CreateMember.createMember(mid,uname,pwd,rno,name,ph,bid,cid,"Student"))
    {
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('ERROR!!');");
   			out.println("location='createAcc.html';");
   			out.println("</script>");
   	}
   	else
   	{
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('SUCCESS!!');");
   			out.println("location='createAcc.html';");
   			out.println("</script>");
   	}*/
%>
