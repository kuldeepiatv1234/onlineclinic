<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<html lang="en">
    

<head>
    <!-- Required meta tags-->
    <title>DOCTOR - Responsive HTML &amp; Bootstrap Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    
    	
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,800,700,300' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=BenchNine:300,400,700' rel='stylesheet' type='text/css'>
	

    
    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
    <script src="js/modernizr.js"></script>
</head>

<body>
   
    <%
         String msg="";
         String res=request.getParameter("result");
         if(res!=null && res.equals("true"))
         {
             msg="successfully";
         }
         if(res!=null && res.equals("false"))
         {
             msg="failed";
         }
    %> 
    
    	
	<!-- ====================================================
	header section -->
	<header class="top-header">
		<div class="container">
			<div class="row">
				<div class="col-xs-4 header-logo">
					<br>
					<a href="index.jsp"><img src="img/logo.png" alt="" class="img-responsive logo"></a>
				</div>

				<div class="col-md-7">
					<nav class="navbar navbar-default">
					  <div class="container-fluid nav-bar">
					    <!-- Brand and toggle get grouped for better mobile display -->
					    <div class="navbar-header">
					      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					      </button>
					    </div>

					    <!-- Collect the nav links, forms, and other content for toggling -->
					    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					      
					      <ul class="nav navbar-nav navbar-right">
					        <li><a class="menu active" href="index.jsp" >Home</a></li>
					        <li><a class="menu" href="doctor_login.jsp">Doctor Login</a></li>
                                                <li><a class="menu" href=about.jsp">About Us</a></li>
                                                <li><a class="menu" href="contact.jsp">Contact Us</a></li>
					      </ul>
					    </div><!-- /navbar-collapse -->
					  </div><!-- / .container-fluid -->
					</nav>
				</div>
			</div>
		</div>
	</header> <!-- end of header area -->
<br><br>
    
    
    
    <div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
        <div class="wrapper wrapper--w780">
            <div class="card card-3">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">Apply for Appointment</h2>
                    <form method="POST" action="ptn_appoint">
                        <div class="input-group">
                            <input class="input--style-3" type="text" placeholder="Name" name="name">
                        </div>
                        <div class="input-group">
                            <input class="input--style-3" type="text" placeholder="Phone" name="contact">
                        </div>
                        <div class="input-group">
                            <input class="input--style-3" type="text" placeholder="Enter your Problem" name="problem">
                        </div>
                            <div class="input-group">
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="doctor">
                                <option disabled="Choose Your Doctor" selected="selected">Select Doctor</option>
                              <%
            //String res=request.getParameter("result");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment","root","root");
            String query1 = "select * from doctors";
            PreparedStatement ps1 = (PreparedStatement) cnn.prepareStatement(query1);
             ResultSet rs1 = ps1.executeQuery();
             String doctor="";
             while(rs1.next())
             {
                 doctor = rs1.getString("name");
                 System.out.println(doctor);
                 %><option><%=doctor%></option>
                 <%
             }
            %>
                            </select>
                              <div class="select-dropdown"></div>
                           </div>
                            <br>
                        <div class="input-group">
                            <input class="input--style-3" type="date" placeholder="Enter appointment Date" name="date">
                        </div>
                        <div class="input-group">
                            <input class="input--style-3" type="time" placeholder="Enter appointment Date" name="time">
                        </div>
                        <div class="input-group">
                            
                            <label class="input--style-3" for="img">Select image:</label>
                            <input class="input--style-3" type="file" id="img" accept="image/*" name="image">
                        </div>
                        <div class="p-t-10">
                            <button class="btn btn--pill btn--green" type="submit">Submit</button>
                        </div>
                             <br>
                        <h2 class="text-danger"><%=msg%></h2>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
    
    

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
