<%@page import="javax.jms.Session"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>

<!DOCTYPE html>
<html lang="en">

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
        <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
        <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
        <link rel="stylesheet" type="text/css" href="js/select.dataTables.min.css">
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="css/vertical-layout-light/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="images/favicon.png" />
    </head>
    <body>


        <%
            String id = "";
            String id1 = "";
            String fname1 = "";
            String fname = "";
            String year = "";
            String lname = "";
            String email = "";
            String gender = "";
            String degree = "";
            String dob = "";
            String address = "";
            String experience = "";
            String fee = "";
            String description = "";
            String detail = "";
            String category = "";
            String city = "";
            String total = "";
            String online = "";
            String final_category = "";
            String user_email = "";
            String path = "";
            String res="";
            try {
                res = request.getParameter("result");
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("res:" + res);
                Connection cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/online_clinic", "root", "root");
                String query = "select * from patient_register where email='" + res + "';";
                PreparedStatement ps = (PreparedStatement) cnn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                String query1 = "select * from doctor_register;";
                PreparedStatement ps1 = (PreparedStatement) cnn.prepareStatement(query1);
                ResultSet rs1 = ps1.executeQuery();

                //String img="";
                String query2 = "SELECT COUNT(*) FROM doctor_register;";
                PreparedStatement ps2 = (PreparedStatement) cnn.prepareStatement(query2);
                ResultSet rs2 = ps2.executeQuery();
                while (rs.next()) {
                    id = rs.getString("id");

                    fname = rs.getString("fname");
                    user_email = rs.getString("email");
                    path = rs.getString("img");
                    System.out.println("img:" + path);
                    System.out.println("fname:" + fname);
                }

//                    response.setContentType("text/html");  
//                    HttpSession session_dash=request.getSession();  
//                    session_dash.setAttribute("uname","ok");  
                int count = 0;
                while (rs2.next()) {
                    count = rs2.getInt("COUNT(*)");
                }
        %> 
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo mr-5" href="index.html"><img src="images/logo.svg" class="mr-2" alt="logo"/></a>
                    <a class="navbar-brand brand-logo-mini" href="index.html"><img src="images/logo-mini.svg" alt="logo"/></a>
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
                                <a class="dropdown-item" href="patient_profile.jsp?result=<%=res%>">
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
                <div class="theme-setting-wrapper">
                    <div id="settings-trigger"><i class="ti-settings"></i></div>
                    <div id="theme-settings" class="settings-panel">
                        <i class="settings-close ti-close"></i>
                        <p class="settings-heading">SIDEBAR SKINS</p>
                        <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
                        <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
                        <p class="settings-heading mt-2">HEADER SKINS</p>
                        <div class="color-tiles mx-0 px-4">
                            <div class="tiles success"></div>
                            <div class="tiles warning"></div>
                            <div class="tiles danger"></div>
                            <div class="tiles info"></div>
                            <div class="tiles dark"></div>
                            <div class="tiles default"></div>
                        </div>
                    </div>
                </div>
                <div id="right-sidebar" class="settings-panel">
                    <i class="settings-close ti-close"></i>
                    <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="setting-content">
                        <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
                            <div class="add-items d-flex px-3 mb-0">
                                <form class="form w-100">
                                    <div class="form-group d-flex">
                                        <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                                        <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                                    </div>
                                </form>
                            </div>
                            <div class="list-wrapper px-3">
                                <ul class="d-flex flex-column-reverse todo-list">
                                    <li>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox" type="checkbox">
                                                Team review meeting at 3.00 PM
                                            </label>
                                        </div>
                                        <i class="remove ti-close"></i>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox" type="checkbox">
                                                Prepare for presentation
                                            </label>
                                        </div>
                                        <i class="remove ti-close"></i>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox" type="checkbox">
                                                Resolve all the low priority tickets due today
                                            </label>
                                        </div>
                                        <i class="remove ti-close"></i>
                                    </li>
                                    <li class="completed">
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox" type="checkbox" checked>
                                                Schedule meeting for next week
                                            </label>
                                        </div>
                                        <i class="remove ti-close"></i>
                                    </li>
                                    <li class="completed">
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="checkbox" type="checkbox" checked>
                                                Project review
                                            </label>
                                        </div>
                                        <i class="remove ti-close"></i>
                                    </li>
                                </ul>
                            </div>
                            <h4 class="px-3 text-muted mt-5 font-weight-light mb-0">Events</h4>
                            <div class="events pt-4 px-3">
                                <div class="wrapper d-flex mb-2">
                                    <i class="ti-control-record text-primary mr-2"></i>
                                    <span>Feb 11 2018</span>
                                </div>
                                <p class="mb-0 font-weight-thin text-gray">Creating component page build a js</p>
                                <p class="text-gray mb-0">The total number of sessions</p>
                            </div>
                            <div class="events pt-4 px-3">
                                <div class="wrapper d-flex mb-2">
                                    <i class="ti-control-record text-primary mr-2"></i>
                                    <span>Feb 7 2018</span>
                                </div>
                                <p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
                                <p class="text-gray mb-0 ">Call Sarah Graves</p>
                            </div>
                        </div>
                        <!-- To do section tab ends -->
                        <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
                            <div class="d-flex align-items-center justify-content-between border-bottom">
                                <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
                                <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See All</small>
                            </div>
                            <ul class="chat-list">
                                <li class="list active">
                                    <div class="profile"><img src="images/faces/face1.jpg" alt="image"><span class="online"></span></div>
                                    <div class="info">
                                        <p>Thomas Douglas</p>
                                        <p>Available</p>
                                    </div>
                                    <small class="text-muted my-auto">19 min</small>
                                </li>
                                <li class="list">
                                    <div class="profile"><img src="images/faces/face2.jpg" alt="image"><span class="offline"></span></div>
                                    <div class="info">
                                        <div class="wrapper d-flex">
                                            <p>Catherine</p>
                                        </div>
                                        <p>Away</p>
                                    </div>
                                    <div class="badge badge-success badge-pill my-auto mx-2">4</div>
                                    <small class="text-muted my-auto">23 min</small>
                                </li>
                                <li class="list">
                                    <div class="profile"><img src="images/faces/face3.jpg" alt="image"><span class="online"></span></div>
                                    <div class="info">
                                        <p>Daniel Russell</p>
                                        <p>Available</p>
                                    </div>
                                    <small class="text-muted my-auto">14 min</small>
                                </li>
                                <li class="list">
                                    <div class="profile"><img src="images/faces/face4.jpg" alt="image"><span class="offline"></span></div>
                                    <div class="info">
                                        <p>James Richardson</p>
                                        <p>Away</p>
                                    </div>
                                    <small class="text-muted my-auto">2 min</small>
                                </li>
                                <li class="list">
                                    <div class="profile"><img src="images/faces/face5.jpg" alt="image"><span class="online"></span></div>
                                    <div class="info">
                                        <p>Madeline Kennedy</p>
                                        <p>Available</p>
                                    </div>
                                    <small class="text-muted my-auto">5 min</small>
                                </li>
                                <li class="list">
                                    <div class="profile"><img src="images/faces/face6.jpg" alt="image"><span class="online"></span></div>
                                    <div class="info">
                                        <p>Sarah Graves</p>
                                        <p>Available</p>
                                    </div>
                                    <small class="text-muted my-auto">47 min</small>
                                </li>
                            </ul>
                        </div>
                        <!-- chat tab ends -->
                    </div>
                </div>
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
                                    <li class="nav-item"> <a class="nav-link" href="doctor_login.jsp"> Doctor Login </a></li>
                                    <li class="nav-item"> <a class="nav-link" href="patient_login.jsp"> Patient Login </a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
                                <i class="icon-bar-graph menu-icon"></i>
                                <span class="menu-title">About us</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="charts">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="about.jsp">About Us</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
                                <i class="icon-grid-2 menu-icon"></i>
                                <span class="menu-title">Contact Us</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="tables">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"> <a class="nav-link" href="contact.jsp">Contact us</a></li>
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
                            <div class="col-md-12 grid-margin">
                                <div class="row">
                                    <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                        <h3 class="font-weight-bold">Welcome <%=fname%></h3>
                                        <h6 class="font-weight-normal mb-0">All systems are running smoothly! You have <span class="text-primary">3 unread alerts!</span></h6>
                                    </div>
                                    <div class="col-12 col-xl-4">
                                        <div class="justify-content-end d-flex">
                                            <div class="dropdown flex-md-grow-1 flex-xl-grow-0">
                                                <button class="btn btn-sm btn-light bg-white dropdown-toggle" type="button" id="dropdownMenuDate2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                    <i class="mdi mdi-calendar"></i> Today (10 Jan 2021)
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuDate2">
                                                    <a class="dropdown-item" href="#">January - March</a>
                                                    <a class="dropdown-item" href="#">March - June</a>
                                                    <a class="dropdown-item" href="#">June - August</a>
                                                    <a class="dropdown-item" href="#">August - November</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 grid-margin stretch-card">
                                <div class="card tale-bg">
                                    <div class="card-people mt-auto">
                                        <a href="Doctor_Table_category.jsp?result=1&result1=<%=user_email%>&path=<%=path%>"><img src="images/dashboard/doctor1.webp" alt="people"></a>
                                        <div class="weather-info">
                                            <div class="d-flex">
                                                <div>
                                                    <!--                        <h2 class="mb-0 font-weight-normal"><i class="icon-sun mr-2"></i>31<sup>C</sup></h2>-->
                                                </div>
                                                <div class="ml-2">
                                                    <h3 class="location font-weight-normal">General Practitioner</h3><br>
                                                    <h4 class="font-weight-normal">Cough,fever and sneezing,headache</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12 grid-margin transparent">
                                    <div class="row">
                                        <div class="col-md-6 grid-margin transparent">
                                            <div class="card tale-bg mt-auto">
                                                <div class="card-people">
                                                    <a href="Doctor_Table_category.jsp?result=2&result1=<%=user_email%>&path=<%=path%>"><img src="images/dashboard/doctor2.webp" alt="doctor"></a>
                                                    <div class="weather-info">
                                                        <div class="d-flex">
                                                            <div>
                                                                <!--                        <h2 class="mb-0 font-weight-normal"><i class="icon-sun mr-2"></i>31<sup>C</sup></h2>-->
                                                            </div>
                                                            <div class="ml-2">
                                                                <h3 class="location font-weight-normal">Cardiologists</h3><br>
                                                                <!--                        <h4 class="font-weight-normal">Cough,fever and sneezing,headache</h4>-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>  
                                        </div>


                                        <div class="col-md-6 grid-margin transparent">
                                            <div class="card tale-bg mt-auto">
                                                <div class="card-people">
                                                    <a href="Doctor_Table_category.jsp?result=3&result1=<%=user_email%>&path=<%=path%>"><img src="images/dashboard/doctor11.jpg" alt="doctor"></a>
                                                    <div class="weather-info">
                                                        <div class="d-flex">
                                                            <div>
                                                                <!--                        <h2 class="mb-0 font-weight-normal"><i class="icon-sun mr-2"></i>31<sup>C</sup></h2>-->
                                                            </div>
                                                            <div class="ml-2">
                                                                <h3 class="location font-weight-normal">Emergency Specialists</h3><br>
                                                                <!--                        <h4 class="font-weight-normal">Cough,fever and sneezing,headache</h4>-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>  
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 grid-margin transparent">
                                            <div class="card tale-bg mt-auto">
                                                <div class="card-people">
                                                    <a href="Doctor_Table_category.jsp?result=4&result1=<%=user_email%>&path=<%=path%>"><img src="images/dashboard/doctor5.webp" alt="doctor"></a>
                                                    <div class="weather-info">
                                                        <div class="d-flex">
                                                            <div>
                                                                <!--                        <h2 class="mb-0 font-weight-normal"><i class="icon-sun mr-2"></i>31<sup>C</sup></h2>-->
                                                            </div>
                                                            <div class="ml-2">
                                                                <h3 class="location font-weight-normal">Family Physicians</h3><br>
                                                                <!--                        <h4 class="font-weight-normal">Cough,fever and sneezing,headache</h4>-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>  
                                        </div>


                                        <div class="col-md-6 grid-margin transparent">
                                            <div class="card tale-bg mt-auto">
                                                <div class="card-people">
                                                    <form action="dash" method="post" name="1">
                                                        <a href="Doctor_Table_category.jsp?result=5&result1=<%=user_email%>&path=<%=path%>"><img src="images/dashboard/doctor13.webp" alt="doctor"></a>
                                                    </form>
                                                    <div class="weather-info">
                                                        <div class="d-flex">
                                                            <div class="ml-2">
                                                                <h3 class="location font-weight-normal">psychologist</h3><br>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 grid-margin stretch-card">
                                <div class="card position-relative">
                                    <div class="card-body">
                                        <div id="detailedReports" class="carousel slide detailed-report-carousel position-static pt-2" data-ride="carousel">
                                            <div class="carousel-inner">

                                                <%
                                                    for (int i = 0; i < count; i++) {
                                                        while (rs1.next()) {
                                                            String img = "";
                                                            description = rs1.getString("description");
                                                            category = rs1.getString("category");
                                                            if ("1".equals(category)) {
                                                                final_category = "General Practitioner(Cough,fever and sneezing,headache)";
                                                                img = "images/dashboard/doctor1.webp";
                                                            }
                                                            if ("2".equals(category)) {
                                                                System.out.println("ye aaya kya ");
                                                                final_category = "Cardiologists";
                                                                img = "images/dashboard/doctor2.webp";
                                                            }
                                                            if ("3".equals(category)) {
                                                                final_category = "Emergency Specialists";
                                                                img = "images/dashboard/doctor11.";
                                                            }
                                                            if ("4".equals(category)) {
                                                                final_category = "Family Physicians";
                                                                img = "images/dashboard/doctor5.webp";
                                                            }
                                                            if ("5".equals(category)) {
                                                                final_category = "images/dashboard/doctor13.webp";
                                                            }
                                                            detail = rs1.getString("detail");
                                                            gender = rs1.getString("gender");

                                                %>
                                                <div class="carousel-item active">

                                                    <div class="row">

                                                        <div class="col-md-12 col-xl-3 d-flex flex-column justify-content-start">
                                                            <div class="ml-xl-4 mt-3">

                                                                <p class="card-title"><%=final_category%></p>
                                                                <h4 class="font-weight-500 mb-xl-4 text-primary mb-2 mb-xl-0"><p class="mb-2 mb-xl-0"><%=description%></h4></p>
                                                                <h4 class="font-weight-500 mb-xl-4 text-success mb-2 mb-xl-0"><p class="mb-2 mb-xl-0"> A doctor treats and interacts with patients on a daily basis. A career as a doctor provides one an opportunity to cure patients, thus bringing happiness into the lives of the people.</h4></p>

                                                                <div>    
                                                                    <a href="doctor_profile.jsp?result=<%=email%>&result1=<%=user_email%>"><button type="button" class="btn btn-danger">Book Now</button></a>
                                                                    <!--                                                                    <button type="button" class="btn btn-success">Fee</button>-->
                                                                </div>
                                                            </div>  
                                                        </div>
                                                        <div class="col-md-12 col-xl-9">
                                                            <div class="row">
                                                                <div class="col-md-6 border-right">
                                                                    <div class="table-responsive mb-3 mb-md-0 mt-3">
                                                                        <table class="table table-borderless report-table">
                                                                            <%
                                                                                degree = rs1.getString("degree");
                                                                                online = rs1.getString("online_checkup");
                                                                                total = rs1.getString("total_patient_checkup");

                                                                                city = rs1.getString("city");

                                                                                fee = rs1.getString("fee");
                                                                                dob = rs1.getString("date");

                                                                            %>

                                                                            <tr>
                                                                                <td class="text-muted">Total Patient</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div class="progress progress-md mx-4">
                                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0"><%=total%></h5></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-muted">Offline Treatment</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div class="progress progress-md mx-4">
                                                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0">20%</h5></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-muted">Level Of Education</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div class="progress progress-md mx-4">
                                                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0"><%=degree%></h5></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-muted">Online Treatment</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div class="progress progress-md mx-4">
                                                                                        <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0"><%=online%></h5></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-muted">Experience Year</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div class="progress progress-md mx-4">
                                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0"><%=year%> </h5></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-muted">Gender</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div  mx-4">
                                                                                          <div class="progress-bar bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0"><%=gender%> </h5></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-muted">DOB</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div  mx-4">
                                                                                          <div class="progress-bar bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0"><%=dob%> </h5></td>
                                                                            </tr>


                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mt-3">

                                                                    <%                                                                        System.out.println("or yaha tak:");
                                                                        id1 = rs1.getString("id");
                                                                        fname1 = rs1.getString("fname");
                                                                        lname = rs1.getString("lname");
                                                                        year = rs1.getString("year");
                                                                        email = rs1.getString("email");
                                                                        address = rs1.getString("address");

                                                                        System.out.println("fname1:" + fname1);
                                                                    %>
                                                                    <!--                                                                    <canvas id="north-america-chart"></canvas>
                                                                                                                                        <div id="north-america-legend"></div>-->
                                                                    <img src="images/dashboard/doctor2.webp" style="border-radius: 50%;">
                                                                    <h4 class="font-weight-500 mb-xl-4 text-primary mb-2 mb-xl-0">Dr. <%=fname1%> <%=lname%></h4>
                                                                    <h5 class="font-weight-500 mb-xl-4 text-primary mb-2 mb-xl-0"><%=degree%></h5>
                                                                    <h5 class="font-weight-500 mb-xl-4 text-primary mb-2 mb-xl-0"><%=year%> year Experience</h5>
                                                                    <h5 class="font-weight-500 mb-xl-4 text-primary mb-2 mb-xl-0">Address : <%=address%></h5>
                                                                    <h5 class="font-weight-500 mb-xl-4 text-primary mb-2 mb-xl-0">Email : <%=email%></h5>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>


                                                    <hr>

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

                                                <div class="carousel-item">
                                                    <div class="row">
                                                        <div class="col-md-12 col-xl-3 d-flex flex-column justify-content-start">
                                                            <div class="ml-xl-4 mt-3">
                                                                <p class="card-title">Detailed Reports</p>
                                                                <h1 class="text-primary">$34040</h1>
                                                                <h3 class="font-weight-500 mb-xl-4 text-primary">North America</h3>
                                                                <p class="mb-2 mb-xl-0">The total number of sessions within the date range. It is the period time a user is actively engaged with your website, page or app, etc</p>
                                                            </div>  
                                                        </div>
                                                        <div class="col-md-12 col-xl-9">
                                                            <div class="row">
                                                                <div class="col-md-6 border-right">
                                                                    <div class="table-responsive mb-3 mb-md-0 mt-3">
                                                                        <table class="table table-borderless report-table">
                                                                            <tr>
                                                                                <td class="text-muted">Illinois</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div class="progress progress-md mx-4">
                                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0">713</h5></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-muted">Washington</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div class="progress progress-md mx-4">
                                                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0">583</h5></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-muted">Mississippi</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div class="progress progress-md mx-4">
                                                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0">924</h5></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-muted">California</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div class="progress progress-md mx-4">
                                                                                        <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0">664</h5></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-muted">Maryland</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div class="progress progress-md mx-4">
                                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0">560</h5></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-muted">Alaska</td>
                                                                                <td class="w-100 px-0">
                                                                                    <div class="progress progress-md mx-4">
                                                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td><h5 class="font-weight-bold mb-0">793</h5></td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mt-3">
                                                                    <canvas id="south-america-chart"></canvas>
                                                                    <div id="south-america-legend"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a class="carousel-control-prev" href="#detailedReports" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#detailedReports" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- content-wrapper ends -->
                        <!-- partial:partials/_footer.html -->
                        <footer class="footer">
                            <div class="d-sm-flex justify-content-center justify-content-sm-between">
                                <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.  Kuldeep choudhary<a href="https://www.bootstrapdash.com/" target="_blank">Doctor-patient appointment</a> from our team support All rights reserved.</span>
                                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Doctor-patient & made with <i class="ti-heart text-danger ml-1"></i></span>
                            </div>
                        </footer>
                        <!-- partial -->
                    </div>
                    <!-- main-panel ends -->
                </div>
                <!-- page-body-wrapper ends -->
            </div>
            <!-- container-scroller -->

            <!-- plugins:js -->
            <script src="vendors/js/vendor.bundle.base.js"></script>
            <!-- endinject -->
            <!-- Plugin js for this page -->
            <script src="vendors/chart.js/Chart.min.js"></script>
            <script src="vendors/datatables.net/jquery.dataTables.js"></script>
            <script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
            <script src="js/dataTables.select.min.js"></script>

            <!-- End plugin js for this page -->
            <!-- inject:js -->
            <script src="js/off-canvas.js"></script>
            <script src="js/hoverable-collapse.js"></script>
            <script src="js/template.js"></script>
            <script src="js/settings.js"></script>
            <script src="js/todolist.js"></script>
            <!-- endinject -->
            <!-- Custom js for this page-->
            <script src="js/dashboard.js"></script>
            <script src="js/Chart.roundedBarCharts.js"></script>
            <!-- End custom js for this page-->
    </body>

</html>

