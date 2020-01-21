<%@ page import="onLoad.*" %>
<%@ page import="java.lang.String" %>
<%

   String memberID=(String)session.getAttribute("memberID");
   String s[] = getSubjects.getSubjectList(memberID);
   int cnt=0,tcnt=0,acnt=0,j=0,i=0,c=0;
   for(i=0;i<s.length;i++)
   {
   	if(s[i]!=null)
   		cnt++;
   }
	
 	String topic=request.getParameter("param");
 	session.setAttribute("topic",topic);
 	String assg[]=getTopic.getAssgList(topic);
   for(i=0;i<assg.length;i++)
   {
   	if(assg[i]!=null)
   		acnt++;
   }
   out.println(assg[0]);
%> 

<html>
    <head>
        <style>
            .vertical-menu 
            {
                width: 120%;
                height: 100%;
                background-color: #eee;
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
            
            img
            {
                height: 800px;
                width: 400px;
                vertical-align: middle;
                margin-left: auto;
                margin-right: auto;
                margin-top: auto;
                display: block;
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
            
            .assglist
            {
                text-align: center; 
            }
            
            .btn
            {
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
            }
            
            th,td
            {
                padding: 50px;
                text-align: center;
            }
            
            #toShow
            {
                display: none;
            }
            
            .cell 
            {
                    max-width: 50px; /* tweak me please */
                    white-space : nowrap;
                    overflow : hidden;
            }

            .expand-small-on-hover:hover
            {
                max-width : 200px; 
                text-overflow: ellipsis;
            }

            .expand-maximum-on-hover:hover 
            {
                max-width : initial; 
            }
            li
            {
            	color:white;
            }
        </style>
        
        <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Computer Graphics</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/vendor.css">
    <link rel="stylesheet" href="../css/main.css">

    <!-- script
    ================================================== -->
    <script src="js/modernizr.js"></script>

    <!-- favicons
    ================================================== -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
        
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Hiding table and contents -->
<script>

function getValue(a)
		{
			window.location.href="http://localhost:8080/Project/Student/Assignment_list/assgList__cg.jsp?param="+a.innerHTML;
		}
		function getValueA(a)
		{
			
			window.location.href="http://localhost:8080/Project/Student/Assignment_list/assignment.jsp?param="+a.innerHTML;
			
		}

function getValue1(a)
{
	window.location.href="http://localhost:8080/Project/Student/Assignment_list/topic1.jsp?param="+a.innerHTML;
}

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
        </script>
    </head>
    
    <body>
        <header class="s-header">
        <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
        <nav class="header__nav-wrap">

            <h2 class="header__nav-heading h6">Navigate to</h2>

            <ul class="header__nav">
                <li class="current"><a href="http://localhost:8080/Project/Student/index.jsp" title="">Home</a></li>
                <li class="has-children">
                    <a href="#0" title="">Menu</a>
                    <ul class="sub-menu">
                        <li><a href="http://localhost:8080/Project/Student/profile.jsp">Profile</a></li>
                        <li><a href="../index.html">Logout</a></li>
                    </ul>
                </li>
                <li class="has-children"><a href="#assg">Subjects</a>
                    <ul class="heafer__nav">
                    <% 
                    	
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
        <br><br><br><br>
        <div class="container fullWidth noPadding">
            <div class="row fullWidth">
                <div class="col-lg-2">
                   <div class="vertical-menu"> 
                   <a href="#" class="active" onclick="getValueA(this);"><%= topic %></a>
                    <% 
                    	
                    	for(i=0;i<acnt;i++)
                    	{
                    		
                    %>
                    	<a href="#" onclick="getValue1(this);"><%= assg[i] %></a>
                    <% } %>
                    </div>
                 </div>
                </div>
                
                <br><br>
                <div class="col-lg-1">
                </div>
                </div>
                <div class="col-lg-9" id="toHide">
                	
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
                </div>
            </div>
        </div>
    </body>
</html>

