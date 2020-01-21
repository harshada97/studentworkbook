<%@ page import="Admin.*" %>
<%
    String divisionId = request.getParameter("divisionID");
    String divisionName = request.getParameter("divisionName");
%>
  
<html>      
<head>
    <script>
        function myfunc()
        {
            var id=/^[0-9a-zA-Z]+$/;
            var str="<%=divisionId%>";
            if((str.match(id))&&str.length<8)
                return true;
            else
            {
                alert("ID cannot contain special symbols or be longer than 8 characters!!!");
                window.location.href="http://localhost:8080/newUI/Admin/CDB.html";
            }
        }
    </script>    
</head>
    
<body bgcolor="lightslategray" onload="myfunc()">
    
    if(!Create.divison(divisionId,divisionName))
    {
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('Yikes!!');");
   			out.println("location='index.jsp';");
   			out.println("</script>");
   	}
   	else
   	{
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('Yaya!!');");
   			out.println("location='index.jsp';");
   			out.println("</script>");
   	}
    </body>
    </html>