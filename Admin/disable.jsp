<%@ page import="Admin.*" %>
<% String id=request.getParameter("mid");%>
<html>      
    <head>
        <script>
            function myfunc()
            {
                var id1=/^[0-9a-zA-Z]+$/;
                var str="<%=id%>";
                if((str.match(id1))&&str.length<8)
                    return true;
                else
                {
                    alert("ID cannot contain special symbols or be longer than 8 characters!!!");
                    window.location.href="http://localhost:8080/Project/Admin/index.jsp";
                }
            }
        </script>    
    </head>
    
    <body bgcolor="lightslategray" onload="myfunc()"> 

<%	
	//out.println(Disable.disableMember(request.getParameter("mid")));
	if(Disable.disableMember(id))
	{
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('Account disabled!!');");
   			out.println("location='index.jsp';");
   			out.println("</script>");
   	}
   	else
   	{
   		out.println("<script type=\"text/javascript\">");
   			out.println("alert('Could not disable!!');");
   			out.println("location='index.jsp';");
   			out.println("</script>");
   	}		
%>
</body>
</html>
