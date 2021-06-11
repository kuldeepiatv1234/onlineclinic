<%@page import="javax.jms.Session"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%><html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Skydash Admin</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="vendors/feather/feather.css">
        <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
        <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="css/vertical-layout-light/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="images/favicon.png" />

        <style>
            body {font-family: Arial, Helvetica, sans-serif;}
            * {box-sizing: border-box;}

            /* Button used to open the chat form - fixed at the bottom of the page */
            .open-button {
                background-color: #555;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                opacity: 0.8;
                position: fixed;
                bottom: 23px;
                right: 28px;
                width: 280px;
            }

            /* The popup chat - hidden by default */
            .chat-popup {
                display: none;
                position: fixed;
                bottom: 0;
                right: 15px;
                border: 3px solid #f1f1f1;
                z-index: 9;
            }

            /* Add styles to the form container */
            .form-container {
                max-width: 300px;
                padding: 10px;
                background-color: white;
            }

            /* Full-width textarea */
            .form-container textarea {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
                resize: none;
                min-height: 200px;
            }

            /* When the textarea gets focus, do something */
            .form-container textarea:focus {
                background-color: #ddd;
                outline: none;
            }

            /* Set a style for the submit/send button */ 
            .form-container .btn {
                background-color: #04AA6D;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                width: 100%;
                margin-bottom:10px;
                opacity: 0.8;
            }

            /* Add a red background color to the cancel button */
            .form-container .cancel {
                background-color: red;
            }

            /* Add some hover effects to buttons */
            .form-container .btn:hover, .open-button:hover {
                opacity: 1;
            }
            .upcoming
            {
                border-style: solid;
                border-color: blue;
                border-radius: 15px;
                width: 400px;
                height: 400px;
                padding: 20px;
                margin: 20px;
                background-color: #ddd;

            }
            .doctor_image
            {
                background-repeat: no-repeat;
                width: 70px;
                height: 65px;
                margin-bottom: 20px;
                border-radius: 50%;
            }
        </style>
        <%
            String path = request.getParameter("path");
            String result1 = request.getParameter("result1");
        %>
    </head>

    <body>

        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo mr-5" href="index.jsp"><img src="images/logo.svg" class="mr-2" alt="logo"/></a>
                    <a class="navbar-brand brand-logo-mini" href="index.jsp"><img src="images/logo-mini.svg" alt="logo"/></a>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                        <span class="icon-menu"></span>
                    </button>
                    <ul class="navbar-nav mr-lg-2">
                        <li class="nav-item nav-search d-none d-lg-block">
                            <div class="input-group">
                                <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                                    <span class="input-group-text" id="search">
                                        <i class="icon-search"></i>
                                    </span>
                                </div>
                                <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav navbar-nav-right">
                        <li class="nav-item dropdown">
                            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
                                <i class="icon-bell mx-0"></i>
                                <span class="count"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                                <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-success">
                                            <i class="ti-info-alt mx-0"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <h6 class="preview-subject font-weight-normal">Application Error</h6>
                                        <p class="font-weight-light small-text mb-0 text-muted">
                                            Just now
                                        </p>
                                    </div>
                                </a>
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-warning">
                                            <i class="ti-settings mx-0"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <h6 class="preview-subject font-weight-normal">Settings</h6>
                                        <p class="font-weight-light small-text mb-0 text-muted">
                                            Private message
                                        </p>
                                    </div>
                                </a>
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-info">
                                            <i class="ti-user mx-0"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <h6 class="preview-subject font-weight-normal">New user registration</h6>
                                        <p class="font-weight-light small-text mb-0 text-muted">
                                            2 days ago
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item nav-profile dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                                <img src="<%=path%>" alt="profile"/>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                                <a class="dropdown-item" href="patient_profile.jsp?result=<%=result1%>">
                                    <i class="icon-head text-primary"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="index.jsp">
                                    <i class="ti-power-off text-primary"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                        <li class="nav-item nav-settings d-none d-lg-flex">
                            <a class="nav-link" href="#">
                                <i class="icon-ellipsis"></i>
                            </a>
                        </li>
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                        <span class="icon-menu"></span>
                    </button>
                </div>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_settings-panel.html -->

                <!-- partial -->
                <!-- partial:partials/_sidebar.html -->
                <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">
                                <i class="icon-grid menu-icon"></i>
                                <span class="menu-title">Dashboard</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                                <i class="icon-head menu-icon"></i>
                                <span class="menu-title">User Pages</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="auth">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="patient_login.jsp"> Patient Login </a></li>
                                    <li class="nav-item"> <a class="nav-link" href="doctor_login.jsp"> Doctor Login </a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
                                <i class="icon-ban menu-icon"></i>
                                <span class="menu-title">Error pages</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="error">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
                                    <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="pages/documentation/documentation.html">
                                <i class="icon-paper menu-icon"></i>
                                <span class="menu-title">Documentation</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-lg-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h2>Chat Box</h2>
                                        <p>Click on the button at the bottom of this page to open the chat form.</p>
                                        <p>Note that the button and the form is fixed - they will always be positioned to the bottom of the browser window.</p>
                                        <h3 style="color: blue;">Message Received </h3>
                                        <div class="upcoming">

                                            <%
                                                int id;
                                                String doctor_email = "";
                                                String patient_email = "";
                                                String patient_email_check = "";
                                                String patient_email_check1 = "";
                                                String doctor_email_check = "";
                                                String res1 = "";
                                                String res2 = "";

                                                try {
                                                    res1 = request.getParameter("result");
                                                    res2 = request.getParameter("result1");
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    System.out.println("res11111111:" + res1);
                                                    Connection cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/online_clinic", "root", "root");

                                                    //for chating *****start*****
                                                    String query3 = "select * from Persons where patient_email='" + res2 + "' and doctor_email='" + res1 + "';";
                                                    PreparedStatement ps3 = (PreparedStatement) cnn.prepareStatement(query3);
                                                    ResultSet rs3 = ps3.executeQuery();

                                                    String query4 = "select * from Persons where patient_email='" + res2 + "';";
                                                    PreparedStatement ps4 = (PreparedStatement) cnn.prepareStatement(query4);
                                                    ResultSet rs4 = ps4.executeQuery();

                                                    String patient_email_check3 = "";
                                                    String doctor_email_check3 = "";
                                                    String patient_email_check4 = "";

                                                    while (rs3.next()) {
                                                        System.out.println("Ok let's check after then");
                                                        patient_email_check3 = rs3.getString("patient_email");
                                                        doctor_email_check3 = rs3.getString("doctor_email");
                                                        System.out.println("patient_email_checker_baad3333:" + patient_email_check3);
                                                    }

                                                    while (rs4.next()) {
                                                        patient_email_check4 = rs4.getString("patient_email");
                                                        System.out.println("patient_email_checker_baadokok:" + patient_email_check);
                                                    }

                                                    if ((!(res2.equals(patient_email_check3))) && (!(res2.equals(patient_email_check4)))) {
                                                        String query5 = "insert into Persons(doctor_email,patient_email) values(?,?);";
                                                        PreparedStatement ps5 = (PreparedStatement) cnn.prepareStatement(query5);
                                                        ps5.setString(1, res1);
                                                        ps5.setString(2, res2);
                                                        ps5.executeUpdate();
                                                    }

                                                    //            //****end****
                                                    String query1 = "select * from doctor_patient_appoint where patient_email='" + res2 + "' and doctor_email='" + res1 + "';";
                                                    PreparedStatement ps1 = (PreparedStatement) cnn.prepareStatement(query1);
                                                    ResultSet rs1 = ps1.executeQuery();
                                                    String query2 = "select * from doctor_patient_appoint where patient_email='" + res2 + "';";
                                                    PreparedStatement ps2 = (PreparedStatement) cnn.prepareStatement(query2);
                                                    ResultSet rs2 = ps2.executeQuery();

                                                    while (rs1.next()) {
                                                        patient_email_check = rs1.getString("patient_email");
                                                        doctor_email_check = rs1.getString("doctor_email");
                                                        System.out.println("patient_email_checker_baad:" + patient_email_check);
                                                    }
                                                    while (rs2.next()) {
                                                        patient_email_check1 = rs2.getString("patient_email");
                                                        System.out.println("patient_email_checker_baad11:" + patient_email_check1);
                                                    }
                                                    if ((!(res2.equals(patient_email_check))) && (!(res2.equals(patient_email_check1)))) {
                                                        String query = "insert into doctor_patient_appoint(doctor_email,patient_email) values(?,?)";
                                                        PreparedStatement ps = (PreparedStatement) cnn.prepareStatement(query);
                                                        ps.setString(1, res1);
                                                        ps.setString(2, res2);
                                                        ps.executeUpdate();
                                                    }

                                                    String received_msg = "";

                                                    String query5 = "select P_ID from Persons where patient_email='" + res2 + "' and doctor_email='" + res1 + "';";
                                                    PreparedStatement ps5 = (PreparedStatement) cnn.prepareStatement(query5);
                                                    ResultSet rs5 = ps5.executeQuery();
                                                    int p_id_receive = 0;
                                                    while (rs5.next()) {
                                                        p_id_receive = rs5.getInt("P_ID");
                                                    }

                                                    String query6 = "SELECT COUNT(*) FROM Orders where P_ID=" + p_id_receive + ";";
                                                    PreparedStatement ps6 = (PreparedStatement) cnn.prepareStatement(query6);
                                                    ResultSet rs6 = ps6.executeQuery();
                                                    int count = 0;
                                                    while (rs6.next()) {
                                                        count = rs6.getInt("COUNT(*)");
                                                    }
                                                    System.out.println("counttttt:" + count);

                                                    //******Start Doctor Image*********
                                                    String photo = "";
                                                    String fname_doctor = "";
                                                    String lname_doctor = "";
                                                    String query_img = "select * from doctor_register where email='" + res1 + "';";
                                                    PreparedStatement ps_img = (PreparedStatement) cnn.prepareStatement(query_img);
                                                    ResultSet rs_img = ps_img.executeQuery();
                                                    while (rs_img.next()) {
                                                        //id = rs_img.getString("id");
                                                        photo = rs_img.getString("img");
                                                        fname_doctor = rs_img.getString("fname");
                                                        lname_doctor = rs_img.getString("lname");
                                                    }
                                                    //******EndDoctor Image*********
                                            %>



                                            <nav class="navbar navbar-light alert-primary " style="height:  80px;margin-bottom: 20px;border-radius: 30%">
                                                <div class="container-fluid">
                                                    <h4>Dr. <%=fname_doctor%> <%=lname_doctor%></h4>
                                                    <img src="<%=photo%>" class="doctor_image">
                                                </div>
                                            </nav>

                                            <%
                                                String query7 = "select msg1 from Orders where P_ID='" + p_id_receive + "';";
                                                PreparedStatement ps7 = (PreparedStatement) cnn.prepareStatement(query7);
                                                ResultSet rs7 = ps7.executeQuery();
                                                for (int i = 0; i < count; i++) {
                                                    while (rs7.next()) {
                                                        received_msg = rs7.getString("msg1");
                                                        //System.out.println("RRRRMMMMMMSSSSGGG:"+received_msg);
                                                        if (received_msg == null) {
                                                            received_msg = "";
                                                        }

                                            %>


                                            <h5 class="font-weight-500 mb-xl-4 text-primary mb-2 mb-xl-0"><%=received_msg%></h5>

                                            <%
                                                        }
                                                    }

                                                } catch (ClassNotFoundException ex) {
                                                    System.out.println("class not found");
                                                } catch (SQLException ex) {
                                                    System.out.println("Sql exception");
                                                }
                                            %>
                                        </div>

                                        <button class="open-button" onclick="openForm()">Chat</button>

                                        <div class="chat-popup" id="myForm">
                                            <form class="form-container" method="post" action="ch">
                                                <h1 >Chat</h1>
                                                <input type="hidden" name="path" value="<%=path%>">
                                                <input type="hidden" name="doctor_email" value="<%=res1%>">
                                                <input type="hidden" name="patient_email" value="<%=res2%>">
                                                <label ><b>Message</b></label>
                                                <textarea placeholder="Type message.."  name="msg" required></textarea>
                                                <a href="chatBox.jsp?result=<%=res1%>&result1=<%=res2%>"><button type="submit" class="btn" onclick="openForm()" ">Send</button></a>
                                                <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.  kuldeep <a href="https://www.bootstrapdash.com/" target="_blank">Doctor patient appointment</a> from our team. All rights reserved.</span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>




        <script>
            function openForm() {
                document.getElementById("myForm").style.display = "block";
            }

            function closeForm() {
                document.getElementById("myForm").style.display = "none";
            }
        </script>

        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="js/off-canvas.js"></script>
        <script src="js/hoverable-collapse.js"></script>
        <script src="js/template.js"></script>
        <script src="js/settings.js"></script>
        <script src="js/todolist.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <!-- End custom js for this page-->
    </body>

</html>

