<%@ page import="onLoad.*" %>
<%@ page import="java.lang.String" %>
<%@ page import="profile.*" %>
<% 
	
	String memberID=(String)session.getAttribute("memberID");
	teacher stud=new teacher(memberID);
%>


<%@ page import="Admin.*" %>
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
            
          .notLogo
            {
                height: 300px;
                width: 300px;
            }
            td
            {
            	color:black;
            }
            tr
            {
            	color:black;
            }
            table
            {
            	color:black;
            }
        </style>
        
        
        <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Admin's Dashboard</title>
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
    function showAlert(id)
    {
    	//svar id = ;
     	
     }
     function getValueD(a)
     {
	window.location.href="http://localhost:8080/Project/Admin/index.jsp?param="+a.innerHTML;
     }
</script>
        
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
                    <a href="index.jsp" class="active">Home</a>
                    <a href="class.jsp">veiw classes</a>
                </div>
                </div>
                <br><br>
                <div class="col-lg-1">
                </div>
                <div class="col-lg-9" id="toHide">
                <h3 align="center">My profile details</h3>
    <br>
              <table color="black">
        	 <tr>
                <td>Role</td>
                <td><%= stud.getRole() %></td>
            </tr>
            <tr>
                <td>Member Id</td>
                <td><%= stud.getMemberID() %></td>
            </tr>
           <tr>
                <td>Username</td>
                <td><%= stud.getUserName() %></td>
            </tr>
             <tr>
                <td>Password</td>
                <td><%= stud.getPassword() %></td>
            </tr>
             <tr>
                <td>Name</td>
                <td><%= stud.getName() %></td>
            </tr>
            
              
            
    
    </table>

                </div>
             
       
            </body>
</html>
