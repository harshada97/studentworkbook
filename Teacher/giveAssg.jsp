<%@ page import="onLoad.*" %>
<% 
	String cn=(String)session.getAttribute("cn");
	String bn=(String)session.getAttribute("bn");
	String tname=(String)session.getAttribute("sn");
	
	Batchassg assg[]=Batchassg.getAssgList(tname,bn,cn);
	int cnt;
	for(cnt=0;cnt<20;cnt++)
	{
		if(assg[cnt]==null)
			break;
	}
%>

<html>
    <head>
    <script>
    function go(a)
    	{
    		window.location.href="http://localhost:8080/Project/Teacher/batchDetails.jsp?param="+a.innerHTML;
    	}
    	function goassg(a)
    	{
    		window.location.href="http://localhost:8080/Project/Teacher/assgList.jsp?param="+a.innerHTML;
    	}
    	function myAssg(a)
    	{
    		window.location.href="http://localhost:8080/Project/Teacher/assg.jsp?param="+a.innerHTML;
    	}
    </script>
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
            
            .black
            {
            	color:black; !important 
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

    </head>
    
    <body>
        <header class="s-header">
        <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
        <nav class="header__nav-wrap">

            <h2 class="header__nav-heading h6">Navigate to</h2>

            <ul class="header__nav">
                <li><img src="logo.png"></li>
                <li class="current"><a href="index.jsp" title="">Home</a></li>
                <li class="has-children">
                    <a href="#0" title="">Menu</a>
                    <ul class="sub-menu">
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="../logout.jsp">Logout</a></li>
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
                    <a href="#" class="active"><%= tname %></a>
                    <% for(int i=0;i<cnt;i++)
                    	{
                    %>
                    <a href="#" onclick=" myAssg(this); "><%= assg[i].aName() %></a>
                    <% } %>
                       <a href="giveAssg.jsp">Give Assignment</a>
                    </div>
                </div>
                <br><br><br>
                <div class="col-lg-1">
                </div>
                
               <div class="col-lg-9">
               <form class="input-validate" action="givenAssg.jsp">
                 <input type="text" name="assgName" placeholder="Assignment Name">
                 <br><br>
                 <button class="btn" type="submit">Give!</button>
                </div>
                </div>
            </div>
        
    </body>
</html>
