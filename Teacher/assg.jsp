<%@ page import="onLoad.*" %>
<% 
	String cn=(String)session.getAttribute("cn");
	String bn=(String)session.getAttribute("bn");
	String sn=(String)session.getAttribute("sn");
	session.setAttribute("an",request.getParameter("param"));
	
	
	Batchassg assg[]=Batchassg.getAssgList(sn,bn,cn);
	int cnt;
	for(cnt=0;cnt<20;cnt++)
	{
		if(assg[cnt]==null)
			break;
	}
	showAssg1 ag=new showAssg1(request.getParameter("param"));
	out.println(ag.getan());
%>


<html>
    <head>
        <style>
            .vertical-menu 
            {
                width: 120%;
                height: 100%;
                background-color: #C3C6C7;
                /* Set a width if you like */
            }


            .vertical-menu a 
            {
              /*background-color: #eee; Grey background color */
              color: black; /* Black text color */
              display: block; /* Make the Topics appear below each other */
              padding: 12px; /* Add some padding */
              text-decoration: none; /* Remove underline from Topics */
            }
            .vertical-menu a:hover 
            {
              background-color: #ccc; /* Dark grey background on mouse-over */
            }

            .vertical-menu a.active 
            {
              background-color: black; /*Add black color to active Topic*/
              color: white;
            }
            
             .fullWidth
            {
                width:100% !important;
                background-color: lightslategray;
            }
            
            .noPadding
            {
                padding-left: 0 !important;
                padding-right: 0 !important;
                padding-top: 0;
            }
           
            .noMargin
            {
                margin-left: 0 !important;
                margin-right: 0 !important;
                margin-top: 0 !important;
                margin-bottom: 0 !important;
            }
            
             .btn
            {
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
            }
            
            .black
            {
            	color:black; !important 
            }
            
            
            #toShow
            {
                display: none;
            }
            
            li
            {
            	color:white;
            }
        </style>
        
		<!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>View Batch</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="../Student/css/base.css">
    <link rel="stylesheet" href="../Student/css/vendor.css">
    <link rel="stylesheet" href="../Student/css/main.css">

    <!-- script
    ================================================== -->
    <script src="js/modernizr.js"></script>

    <!-- favicons
    ================================================== -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
        
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>

function show() {
  var x = document.getElementById("toHide");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
    
    var y = document.getElementById("toShow");
    if (y.style.display === "block")
        y.style.display = "none";
    else
        y.style.display = "block";
}

	function myAssg(a)
    	{
    		window.location.href="http://localhost:8080/Project/Teacher/assg.jsp?param="+a.innerHTML;
    	}
	function subject(a)
    	{
    		window.location.href="http://localhost:8080/Project/Teacher/assgList.jsp?param="+a.innerHTML;
    	}
        </script>
    </head>
    
    <body>
        <header class="s-header">
        <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
        <nav class="header__nav-wrap">

            <h2 class="header__nav-heading h6">Navigate to</h2>

            <ul class="header__nav">
                <li class="current"><a href="http://localhost:8080/Project/Teacher/index.jsp" title="">Home</a></li>
                <li class="has-children">
                    <a href="#0" title="">Menu</a>
                    <ul class="sub-menu">
                        <li><a href="http://localhost:8080/Project/Teacher/profile.jsp">Profile</a></li>
                        <li><a href="../index.html">Logout</a></li>
                    </ul>
                </li>
                
                
            </ul> <!-- end header__nav -->

            <a href="#0" title="Close Menu" class="header__overlay-close close-mobile-menu">Close</a>

        </nav> <!-- end header__nav-wrap -->

    </header> <!-- s-header -->
        <br><br><br><br>
        <div class="container fullWidth noPadding">
            <div class="row fullWidth">
                <div class="col-lg-2">
                   <div class="vertical-menu"> 
                   <a href="#" class="active" onclick=" subject(this); " ><%= sn %></a>
                    <% 
                    	
                    	for(int i=0;i<cnt;i++)
                    	{
                    		
                    %>
                    	<a href="#" onclick="myAssg(this);"><%= assg[i].aName() %></a>
                    <% } %>
                       <a href="#">Give Assignment</a>
                    </div>
                 </div>
                
                <br><br>
                <div class="col-lg-1">
                </div>
              
                <div class="col-lg-9" id="toHide">
                	<h2><%= request.getParameter("param") %><h2>
                	<br><br>
                	Assigned Date: <%= ag.adate() %><br>
                	Due Date: 	   <%= ag.ddate() %><br><br><br>
                	Info    :<%= ag.info() %><br><br>
                	Question:<%= ag.ques() %>
                 </div>
                
                <!-- Aligning table and button -->
                <div class="col-lg-1">
                </div>
                
                <div class="col-lg-9">
                    <div id="toShow">
                    <h1>I'm showing this text and hiding the table.
                        Data needs to be entered dynamically </h1>
                        
                    <br><br>
                    <button class="btn" onclick="show()">Back to list</button>
                    </div>
                <form action="remarks1.jsp">
                <br><br><br><br>
               <button class="btn" onlick=" window.location.href='remarks.jsp';" >Give remark</button>
                	
                </form>
                </div>
                
            </div>
        </div>
    </body>
</html>



