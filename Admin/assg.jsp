<%@ page import="Admin.*" %>
<%
    String divisionId = request.getParameter("assgID");
    String divisionName = request.getParameter("assgName");
    String tid = request.getParameter("topicID");
    String ques = request.getParameter("question");
%>
  
    <html>      
    <head>
        <script>
            function myfunc()
            {
                var id=/^[0-9a-zA-Z]/;
                var str="<%=divisionId%>";
                if((str.match(id))&&str.length<8)
                    return true
                else
                {
                    alert("Assignment ID cannot contain special symbols or be longer than 8 characters!!!");
                    window.location.href="http://localhost:8080/newUI/Admin/sta.html";
                }
            }
        </script>    
    </head>
    <body onload="myfunc()" bgcolor="lightslategray">
    <%  if(!Create.assignment(divisionId,divisionName,tid,ques))
    {
     		out.println("<script type='text/javascript'>");
   			out.println("alert('Could not create new assignment!!');");
   			out.println("location='sta.html';");
   			out.println("</script>");
   	}
   	else
   	{
     		out.println("<script type='text/javascript'>");
   			out.println("alert('Yaya!!');");
   			out.println("location='sta.html';");
   			out.println("</script>");
   	} 	
    %>
        
    </body>
    </html>
