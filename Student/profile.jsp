<%@ page import="onLoad.*" %>
<%@ page import="java.lang.String" %>
<%@ page import="profile.*" %>
<% 
	
	String memberID=(String)session.getAttribute("memberID");
	Student stud=new Student(memberID);
	
	
	
	String s[] = getSubjects.getSubjectList(memberID);
        int cnt=0;
	for(int i=0;i<s.length;i++)
	{
	   if(s[i]!=null)
	  	cnt++;
	}
%>


<!DOCTYPE html>
<html class="no-js" lang="en">
<head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>My Profile</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/vendor.css">
    <link rel="stylesheet" href="css/main.css">

    <!-- script
    ================================================== -->
    <script src="../Forum/js/modernizr.js"></script>

    <!-- favicons
    ================================================== -->
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon">
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
    
    <!-- Java Script
    ================================================== -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>
    
    <style>
    	body
    	{
    		background:white;
    	}
    	li
    	{
    		color:white;
    	}
    </style>

</head>

<body id="top" bgcolor="lightslategray">

    <!-- preloader
    ================================================== -->
    <div id="preloader">
        <div id="loader" class="dots-fade">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>


    <!-- header
    ================================================== -->
    <header class="s-header header">
        <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
        <nav class="header__nav-wrap">

            <h2 class="header__nav-heading h6">Navigate to</h2>

            <ul class="header__nav">
                <li class="current"><a href="http://localhost:8080/Project/Student/index.jsp" title="">Home</a></li>
                <li class="has-children">
                    <a href="#0" title="">Menu</a>
                    <ul class="sub-menu">
                        <li><a href="#">Profile</a></li>
                        <li><a href="../index.html">Logout</a></li>
                    </ul>
                </li>
                 <li class="has-children"><a href="#assg">Subjects</a>
                    <ul class="header__nav">
                    <% int i;
                    	for(i=0;i<cnt;i++) 
                   { %>
                   	
                        <li><a href="Assignment_list/assgList__cg.jsp"><%= s[i] %></a></li>
                        <% } %>
                    </ul>
               </li>
                
            </ul> <!-- end header__nav -->

            <a href="#0" title="Close Menu" class="header__overlay-close close-mobile-menu">Close</a>

        </nav> <!-- end header__nav-wrap -->

    </header> <!-- s-header -->
    
    <br><br><br>
    <h3 align="center">My profile details</h3>
    <br>
    <br>
    
    
              <%-- To get list of data members dynamically --%>
       
        <table>
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
             <tr>
                <td>Role</td>
                <td><%= stud.getRole() %></td>
            </tr>
            
    
    </table>
    </body>
</html>
