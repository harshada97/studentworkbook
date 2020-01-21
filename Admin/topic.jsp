<%@ page import="Admin.*" %>
<%
    String divisionId = request.getParameter("topicID");
    String divisionName = request.getParameter("topicName");
    String subjectID = request.getParameter("subjectID");
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
                    window.location.href="http://localhost:8080/Project/Admin/sta.html";
                }
            }
        </script>    
    </head>
    
    <body onload="myfunc()" bgcolor="lightslategray"> 

    <%
    if(!Create.topic(divisionId,divisionName,subjectID))
    {
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('Yikes!!');");
   			out.println("location='sta.html';");
   			out.println("</script>");
   	}
   	else
   	{
     		out.println("<script type=\"text/javascript\">");
   			out.println("alert('Yaya!!');");
   			out.println("location='sta.html';");
   			out.println("</script>");
   	}%>
    </body>
</html>


