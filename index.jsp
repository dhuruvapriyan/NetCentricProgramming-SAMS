<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - SAMS</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
</head>

<body id="page-top"><a class="menu-toggle rounded" href="#"><em class="fa fa-bars"></em></a>
    <nav class="navbar navbar-light navbar-expand" id="sidebar-wrapper">
        <div class="container"><button data-toggle="collapse" class="navbar-toggler d-none" data-target="#"></button>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav sidebar-nav" id="sidebar-nav">
                    <li class="nav-item sidebar-brand" role="presentation"><a class="nav-link active js-scroll-trigger" href="#page-top">SAMS</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#page-top">Home</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#about">Login</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#services">Sign Up</a></li>
                   
                </ul>
            </div>
        </div>
    </nav>
    <header class="d-flex masthead" style="background-image:url('assets/img/bg-masthead.jpg');">
        <div class="container my-auto text-center">
            <h1 class="display-1 text-primary mb-1">Student Attendance Management System</h1>
            <h3 class="mb-5"></h3><a class="btn btn-primary btn-xl js-scroll-trigger" role="button" href="#about">Login</a>
            <div class="overlay"></div>
        </div>
    </header>
    <div></div>
    <section id="about" class="content-section bg-light">
        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <div>
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link" role="tab" data-toggle="tab" href="#tab-1" style="width: 550px;height: 47px;">Student</a></li>
                            <li class="nav-item" style="width: 123px;"><a class="nav-link active" role="tab" data-toggle="tab" href="#tab-2" style="width: 540px;">Teacher</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane" role="tabpanel" id="tab-1">
                                <form class="bootstrap-form-with-validation" action="student_login.jsp">
                                    <h2 class="text-center" style="width: 573px;height: 44px;padding: 8px;">Student Login</h2>
                                    <div class="form-group"><input class="form-control" type="text" id="roll_no" name="roll_no" style="width: 550px;" placeholder="Enter your Roll Number" Required></div>
                                    <div class="form-group"><input class="form-control" type="password" id="password" name="password" style="width: 550px;" placeholder="Enter your password" Required></div>
                                    
                                    <div class="form-group" style="width: 564px;"><a class="btn btn-primary" role="button" href="forgot_password.php" style="width: 169px;margin: 0px;">Forgot Password</a><button class="btn btn-primary" type="submit" style="width: 73px;margin: 18px;">Login</button></div>
                                </form>
                            </div>
                            <div class="tab-pane active" role="tabpanel" id="tab-2">
                                <form class="bootstrap-form-with-validation" action="teacher_login.jsp">
                                    <div class="form-row">
                                        <div class="col-md-6" style="width: 18px;height: 47px;margin: -6px;padding: -102px;"></div>
                                        <div class="col-md-6" style="padding: 13px;">
                                            <div class="form-group" style="height: 85px;">
                                                <h2 class="text-center" style="width: 563px;height: 39px;">Teacher Login</h2><input class="form-control" type="text" id="roll_no" name="roll_no" placeholder="Enter your Teacher ID" Required></div>
                                            <div class="form-group" style="width: 498px;padding: 0px;"><input class="form-control" type="password" id="password" name="password" style="width: 534px;" placeholder="Enter your password" Required>
                                                    <a class="btn btn-primary" role="button" href="forgot_password.php" style="width: 143px;margin: 9px;padding: 6px;height: 38px;">Forgot Password</a>
                                                <button
                                                    class="btn btn-primary" type="submit" style="width: 73px;margin: 9px;padding: 6px;height: 38px;">Login</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="tab-3">
                                <p>Content for tab 3.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="services" class="content-section bg-primary text-white text-center">
        <div class="container">
            <div class="content-section-heading">
                <h2 class="mb-5" style="width: 438px;">Student Sign Up</h2>
            </div>
            <div class="row">
                <div class="col">
                    <form class="bootstrap-form-with-validation" action="signup.jsp">
                        <div class="form-group"><input class="form-control" type="text" id="roll_no" name="roll_no" style="width: 440px;" placeholder="Enter your Registered Number" Required></div>
                        <div class="form-group"><input class="form-control" type="number" id="mobile_number" name="mobile_number" placeholder="Enter your mobile number" style="width: 439px;" Required></div>
                        <div class="form-group" style="width: 463px;"><button class="btn btn-primary" type="submit" style="width: 137px;">Create Account</button></div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <footer class="footer text-center">
        <div class="container">
            <ul class="list-inline mb-5">
                <li class="list-inline-item">&nbsp;<a class="text-white social-link rounded-circle" href="#"><em class="icon-social-facebook"></em></a></li>
                <li class="list-inline-item">&nbsp;<a class="text-white social-link rounded-circle" href="#"><em class="icon-social-twitter"></em></a></li>
                <li class="list-inline-item">&nbsp;<a class="text-white social-link rounded-circle" href="#"><em class="icon-social-github"></em></a></li>
            </ul>
            <p class="text-muted mb-0 small">Copyright &nbsp;© SAMS 2019</p>
        </div><a class="js-scroll-trigger scroll-to-top rounded" href="#page-top"><em class="fa fa-angle-up"></em></a></footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="assets/js/stylish-portfolio.js"></script>
    <script src="assets/js/bs-animation.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
</body>

</html>
