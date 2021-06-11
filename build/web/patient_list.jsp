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
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="css/vertical-layout-light/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="images/favicon.png" />
    </head>

    <body>
        <%
            String path = request.getParameter("path");
            String result_profile=request.getParameter("result");
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
                                <a class="dropdown-item" href="doctor_profile_hisOwn.jsp?result=<%=result_profile%>">
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
                                    <li class="nav-item"> <a class="nav-link" href="patient_login.jsp">Patient Login </a></li>
                                    <li class="nav-item"> <a class="nav-link" href="doctor_login.jsp">Doctor Login </a></li>
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
                                        <h4 class="card-title">Patient List</h4>
                                        <div class="table-responsive">

                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            User
                                                        </th>
                                                        <th>
                                                            Patient name
                                                        </th>
                                                        <th>
                                                            gender
                                                        </th>
                                                        <th>
                                                            Treatment 
                                                        </th>
                                                        <th>
                                                            Contact 
                                                        </th>
                                                        <th>
                                                            Age 
                                                        </th>
                                                        <th>
                                                            Current_Disease
                                                        </th>
                                                        <th>
                                                            Address
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        String doctor_email = "";
                                                        String fname = "";
                                                        String lname = "";
                                                        String age = "";
                                                        String contact = "";
                                                        String email = "";
                                                        String gender = "";
                                                        String address = "";
                                                        String photo = "";

                                                        String current_disease = "";

                                                        try {
                                                            //String res = request.getParameter("result");
                                                            doctor_email = request.getParameter("result");
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            System.out.println("res:" + doctor_email);
                                                            Connection cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/online_clinic", "root", "root");
                                                            String query = "select * from doctor_patient_appoint where doctor_email='" + doctor_email + "';";
                                                            PreparedStatement ps = (PreparedStatement) cnn.prepareStatement(query);
                                                            ResultSet rs = ps.executeQuery();

                                                            String query1 = "SELECT COUNT(*) FROM doctor_patient_appoint where doctor_email='" + doctor_email + "';";
                                                            PreparedStatement ps1 = (PreparedStatement) cnn.prepareStatement(query1);
                                                            ResultSet rs1 = ps1.executeQuery();

                                                            int count = 0;
                                                            while (rs1.next()) {
                                                                count = rs1.getInt("COUNT(*)");
                                                            }
                                                            System.out.println("Count....:" + count);

                                                            String id = "";
                                                            for (int i = 0; i < count; i++) {
                                                                while (rs.next()) {
                                                                    email = rs.getString("patient_email");
                                                                    System.out.println("patient.....:" + email);
                                                                    String query2 = "SELECT * FROM patient_register where email='" + email + "';";
                                                                    PreparedStatement ps2 = (PreparedStatement) cnn.prepareStatement(query2);
                                                                    ResultSet rs2 = ps2.executeQuery();
                                                                    while (rs2.next()) {
//                                                                    email = rs.getString("email");
//                                                                    System.out.println("email from patient_list:" + email);

                                                                        id = rs2.getString("id");
                                                                        fname = rs2.getString("fname");
                                                                        lname = rs2.getString("lname");
                                                                        email = rs2.getString("email");
                                                                        gender = rs2.getString("gender");
                                                                        age = rs2.getString("age");
                                                                        address = rs2.getString("address");
                                                                        contact = rs2.getString("contact");
                                                                        current_disease = rs2.getString("current_problem");
                                                                        photo = rs2.getString("img");
                                                                        System.out.println("email from patient_list:" + fname);
                                                                        //}
%>
                                                    <tr>
                                                        <td class="py-1">
                                                            <img src="<%=photo%>" alt="image"/>
                                                        </td>
                                                        <td>
                                                            <%=fname%> <%=lname%>
                                                        </td>
                                                        <td>
                                                            <div><%=gender%></div>
                                                        </td>
                                                        <td>
                                                            <%=address%>
                                                        </td>

                                                        <td>
                                                            <%=contact%>
                                                        </td>
                                                        <td>
                                                            <%=age%> year old
                                                        </td>
                                                        <td>
                                                            <%=current_disease%>
                                                        </td>

                                                        <td>
                                                            <a href="chatbox_doctor.jsp?result=<%=doctor_email%>&result1=<%=email%>&path=<%=path%>"><button type="button" class="btn btn-danger">Done</button></a>
                                                        </td>
                                                    </tr>
                                                    <%            }
                                                                }
                                                            }
                                                        } catch (ClassNotFoundException ex) {
                                                            System.out.println("class not found");
                                                        } catch (SQLException ex) {
                                                            System.out.println("Sql exception");
                                                        }
                                                    %>


                                                </tbody>

                                            </table>
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
