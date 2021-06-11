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
<%@include file="block/header.jsp" %>


        <%
            String msg = "";
            String res = request.getParameter("result");
            if (res != null && res.equals("true")) {
                msg = "Registration successfully";
            }
            if (res != null && res.equals("false")) {
                msg = "Login failed";
            }
        %> 

        
        <br><br>



        <div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
            <div class="wrapper wrapper--w780">
                <div class="card card-3">
                    <div class="card-heading"></div>
                    <div class="card-body">
                        <h2 class="title">Login</h2>
                        <form method="POST" action="dr">

                            <div class="input-group">
                                <input class="input--style-3" type="email" placeholder="Email" name="email">
                            </div>
                            <div class="input-group">
                                <input class="input--style-3" type="password" placeholder="password" name="passwd">
                            </div>

                            <div class="p-t-10">
                                <button class="btn btn--pill btn--green" type="submit">Submit</button>
                            </div>
                            <br>
                            <h2 class="text-danger"><%=msg%></h2>
                        </form>
                    </div>

                </div>
            <div>
                
                <h3 class="text-center">If you have no any account then click to register</h3>
                <center><a href="doctor_register.jsp"><button type="button" class="btn btn-primary btn-lg">Register</button></a></center>
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
