<%-- <%@ page import="Admin.*" %> --%>
<%
    String batchId = request.getParameter("batchID");
    String batchNo = request.getParameter("batchNo");
    String classID = request.getParameter("classID");
    String divisionID = request.getParameter("divisionID");
    String sr=request.getParameter("sRoll");
    String er=request.getParameter("eRoll");
   
   %>
    <html>      
    <head>
        <script>
            function myfunc()
            {
                var id=/^[0-9a-zA-Z]+$/;
                var str="<%=batchId%>";
                if((str.match(id))&&str.length<8)
                    return true;
                else
                {
                    alert("ID cannot contain special symbols or be longer than 8 characters!!!");
                    window.location.href="http://localhost:8080/Project/Admin/CDB.html";
                }
            }
        </script>    
    </head>
    
    <body bgcolor="lightslategray" onload="myfunc()"> 
 
        CreateBatch.createBatch(batchId,batchNo,classID,divisionID,sr,er);
        out.println("<script type=\"text/javascript\">");
   			out.println("alert('Batch created!!');");
   			out.println("location='CDB.html';");
   			out.println("</script>");

</body>
</html>
