<%@ page import="onLoad.*" %>
<%@ page import="java.lang.String" %>
<%

   String memberID=(String)session.getAttribute("memberID");
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
	<script>
		function getValue(a)
		{
			window.location.href="http://localhost:8080/Project/Student/Assignment_list/assgList__cg.jsp?param="+a.innerHTML;
		}
		
    		function logoutAlert()
    		{
    			alert("Logout Succesfull");
    		}
    

	</script>
    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Student's Dashboard</title>
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

    <style>
	li
	{
		color:white;
	}
    </style>


</head>

<body id="top">

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
                <li class="current"><a href="index.jsp" title="">Home</a></li>
                <li class="has-children">
                    <a href="#0" title="">Menu</a>
                    <ul class="sub-menu">
                        <li><a href="http://localhost:8080/Project/Student/profile.jsp">Profile</a></li>
                        <li><a href="../logout.jsp" onclick="logoutAlert();">Logout</a></li>
                    </ul>
                </li>
                 <li class="has-children"><a href="#assg">Subjects</a>
                 	
                    <ul class="header__nav">
                   
                    <% int i;
                    	for(i=0;i<cnt;i++) 
                   { %>
                   	
                   		 
                        <li><a href="#" onclick="getValue(this);"><%= s[i] %></a></li>
                       
                        <% } %>
                     
                    </ul>
                   
               </li>
                
            </ul> <!-- end header__nav -->

            <a href="#0" title="Close Menu" class="header__overlay-close close-mobile-menu">Close</a>

        </nav> <!-- end header__nav-wrap -->

    </header> <!-- s-header -->
    
    <!-- featured 
    ================================================== -->
    <section class="s-featured">
        <div class="row">
            <div class="col-full">
                <div class="featured-slider featured" data-aos="zoom-in">

                    <div class="featured__slide">
                        <div class="entry">

                            <div class="entry__background" style="background-image:url('images/thumbs/featured/featured-watch.jpg');"></div>
                            
                            <div class="entry__content">
                                
                                

                                <h1><a href="#0" title=""><%= s[0] %></a></h1>
                               
                            </div> <!-- end entry__content -->
                            
                        </div> <!-- end entry -->
                    </div> <!-- end featured__slide -->

                    <div class="featured__slide">

                        <div class="entry">

                            <div class="entry__background" style="background-image:url('images/thumbs/featured/tea.jpg');"></div>
                            
                            <div class="entry__content">
                                
                               

                                <h1><a href="#0" title=""><%= s[1] %></a></h1>

                            </div> <!-- end entry__content -->
                            
                        </div> <!-- end entry -->

                    </div> <!-- end featured__slide -->

                    <div class="featured__slide">

                        <div class="entry">

                            <div class="entry__background" style="background-image:url('images/thumbs/featured/glasses.jpg');"></div>

                            <div class="entry__content">
                               
                                

                                <h1><a href="#0" title=""><%= s[2] %></a></h1>
                            </div> <!-- end entry__content -->

                        </div> <!-- end entry -->

                    </div> <!-- end featured__slide -->
                    
                </div> <!-- end featured -->

            </div> <!-- end col-full -->
        </div>
    </section> <!-- end s-featured -->

    <!-- Java Script
    ================================================== -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>

</body>

</html>
