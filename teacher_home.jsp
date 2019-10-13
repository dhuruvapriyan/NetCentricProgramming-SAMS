<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="assets/css/ebs-bootstrap-datepicker-1.css">
    <link rel="stylesheet" href="assets/css/ebs-bootstrap-datepicker-2.css">
    <link rel="stylesheet" href="assets/css/ebs-bootstrap-datepicker-3.css">
    <link rel="stylesheet" href="assets/css/ebs-bootstrap-datepicker-4.css">
    <link rel="stylesheet" href="assets/css/ebs-bootstrap-datepicker.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
	

</head>
<%
String id=(String)session.getAttribute("user");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.43.160:3306/sams", "root", "");
String query = "select * from teacher where t_no=?;";
PreparedStatement ps = conn.prepareStatement(query);
ps.setString(1, id);
session.setAttribute("user",id);
ResultSet rs = ps.executeQuery();

while(rs.next())
{
%>

<body id="page-top"><a class="menu-toggle rounded" href="#"><i class="fa fa-bars"></i></a>
    <nav class="navbar navbar-light navbar-expand" id="sidebar-wrapper">
        <div class="container"><button data-toggle="collapse" class="navbar-toggler d-none" data-target="#"></button>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav sidebar-nav" id="sidebar-nav">
                    <li class="nav-item sidebar-brand" role="presentation"><a class="nav-link active js-scroll-trigger" href="#page-top">Brand</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#page-top">Home</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="my_classes.jsp">Attendance</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#services">OD/Leave</a></li>
					<li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="logout.php">Logout</a></li>
                   
                </ul>
            </div>
        </div>
    </nav>

    <header class="d-flex masthead" style="background-image:url('assets/img/bg-masthead.jpg');">
        <div class="container my-auto text-center">
		
            

			<h1 class="display-1 text-primary mb-1">Hi <%=rs.getString("name")%>
			</h1>
<%}%>
            <h3 class="mb-5"></h3><a class="btn btn-primary btn-xl js-scroll-trigger" role="button" href="#about">Find Out More</a>
            <div class="overlay"></div>
			
        </div>
    </header>

    <div></div>
    <section id="about" class="content-section bg-light">
	<div class="super_container">

	<!-- Header -->

	
		<!-- Loaders -->

		<div class="loaders">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="elements_title">Loaders</div>
					</div>
				</div>

				<div class="row elements_loaders_container">
					<div class="col-lg-3 loader_col">
						<!-- Loader -->
						<div class="loader" data-perc="0.75"></div>
						<div class="loader_text text-center">Photos Taken</div>
						<div class="loader_sub text-center">Etiam nec odio vestibulum est.</div>
					</div>
					<div class="col-lg-3 loader_col">
						<!-- Loader -->
						<div class="loader" data-perc="0.83"></div>
						<div class="loader_text text-center">Km Walked</div>
						<div class="loader_sub text-center">Odio vestibulum est mattis.</div>
						<span></span>
					</div>
					<div class="col-lg-3 loader_col">
						<!-- Loader -->
						<div class="loader" data-perc="0.25"></div>
						<div class="loader_text text-center">Cities Visited</div>
						<div class="loader_sub text-center">Vestibulum est mattis effic.</div>
					</div>
					<div class="col-lg-3 loader_col">
						<!-- Loader -->
						<div class="loader" data-perc="0.95"></div>
						<div class="loader_text text-center">Cities Visited</div>
						<div class="loader_sub text-center">Vestibulum est mattis effic.</div>
					</div>
				</div>

			</div>
		</div>
		
		

		

</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/greensock/TweenMax.min.js"></script>
<script src="plugins/greensock/TimelineMax.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="plugins/progressbar/progressbar.min.js"></script>
<script src="plugins/scrollTo/jquery.scrollTo.min.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="js/elements_custom.js"></script>
	
	</section>
    <section id="services" class="content-section bg-primary text-white text-center">
        <div class="container">
            <div class="content-section-heading">
                <h2 class="mb-5" style="width: 438px;">Apply for OD/Leave</h2>
            </div>
            <div class="row">
                <div class="col">
                    <form class="bootstrap-form-with-validation">
                        <div class="form-group"><input class="form-control" type="text" id="text-input" name="text-input" style="width: 440px;" placeholder="Enter course code"></div><input class="form-control" type="date" style="width: 439px;" name="date">
                        <div class="form-group"
                            style="width: 463px;margin: 19px;"><button class="btn btn-primary" type="submit" style="width: 137px;height: 42px;margin: 25px;">Apply OD</button><button class="btn btn-primary" type="submit" style="width: 137px;">Apply Leave</button></div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <footer class="footer text-center">
        <div class="container">
            <ul class="list-inline mb-5">
                <li class="list-inline-item">&nbsp;<a class="text-white social-link rounded-circle" href="#"><i class="icon-social-facebook"></i></a></li>
                <li class="list-inline-item">&nbsp;<a class="text-white social-link rounded-circle" href="#"><i class="icon-social-twitter"></i></a></li>
                <li class="list-inline-item">&nbsp;<a class="text-white social-link rounded-circle" href="#"><i class="icon-social-github"></i></a></li>
            </ul>
            <p class="text-muted mb-0 small">Copyright &nbsp;© SAMS 2019</p>
        </div><a class="js-scroll-trigger scroll-to-top rounded" href="#page-top"><i class="fa fa-angle-up"></i></a></footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="assets/js/stylish-portfolio.js"></script>
    <script src="assets/js/bs-animation.js"></script>
    <script src="assets/js/ebs-bootstrap-datepicker-1.js"></script>
    <script src="assets/js/ebs-bootstrap-datepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
</body>
</html>