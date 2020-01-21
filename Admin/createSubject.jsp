<%@ page import="Admin.*" %>
  <%
    String divisionId = request.getParameter("subjectID");
    String divisionName = request.getParameter("subjectName");
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
                 	alert("ID cannot contain more than 8 characters. Special symbols not allowed.");
                 	window.location.href="http://localhost:8080/Project/Admin/sta.html";
                 }
            }
        </script>    
    </head>
    
    <body onload="myfunc()"> 

    <% if(!Create.subject(divisionName,divisionId))
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
    </body>  
</html>
