<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<% if(session.getAttribute("s_no")==null)
	{response.sendRedirect("index.jsp");}
%>
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

<body id="page-top"><a class="menu-toggle rounded" href="#"><i class="fa fa-bars"></i></a>
    <nav class="navbar navbar-light navbar-expand" id="sidebar-wrapper">
        <div class="container"><button data-toggle="collapse" class="navbar-toggler d-none" data-target="#"></button>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav sidebar-nav" id="sidebar-nav">
                    <li class="nav-item sidebar-brand" role="presentation"><a class="nav-link active js-scroll-trigger" href="#page-top">SAMS</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#page-top">Home</a></li>
					<li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="profile.jsp">View Profile</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#about">Attendance</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#services">OD/Leave</a></li>
					<li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="logout.jsp">Logout</a></li>
                   
                </ul>
            </div>
        </div>
    </nav>

    <header class="d-flex masthead" style="background-image:url('assets/img/bg-masthead.jpg');">
        <div class="container my-auto text-center">
		
            
				<%
String id=(String)session.getAttribute("s_no");
%>
<%@include file="connection.jsp"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection(url, dbusername,dbpassword);
String query = "select * from student_details where s_no=?;";
PreparedStatement ps = conn.prepareStatement(query);
ps.setString(1, id);
ResultSet rs = ps.executeQuery();

while(rs.next())
{
	session.setAttribute("class",rs.getString("class"));
%>
			<h1 class="display-1 text-primary mb-1">Hi, <%=rs.getString("s_name")%>
			</h1>
<%}%>
            <h3 class="mb-5"></h3><a class="btn btn-primary btn-xl js-scroll-trigger" role="button" href="#about">Attendance</a>
            <h3 class="mb-5"></h3><a class="btn btn-primary btn-xl js-scroll-trigger" role="button" href="#services">Apply OD</a>
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
						
					</div>
				</div>
<h2>Attendance Status</h2><br>
				<div class="row elements_loaders_container">
				<% 
				String query2 = "select course_registration.c_no,course.c_name,course_registration.classes_attended,course_registration.total_classes from course_registration join course on course_registration.c_no = course.c_no and course_registration.s_no=?;";
				PreparedStatement ps2 = conn.prepareStatement(query2);
				ps2.setString(1, id);
				ResultSet rs2 = ps2.executeQuery();
				while(rs2.next())
				{
					String c_no = rs2.getString("course_registration.c_no");
					int classes_attended = rs2.getInt("course_registration.classes_attended");
					int total_classes = rs2.getInt("course_registration.total_classes");
					System.out.println(classes_attended);
					System.out.println(total_classes);
					
					if(total_classes > 0)
					{
					double percentage = (double)classes_attended/total_classes;
					System.out.println(percentage);
				%>
				
					<div class="col-lg-3 loader_col">
						<!-- Loader -->
						<div class="loader" data-perc="<%=percentage%>"></div>
						<div class="loader_sub text-center"> <b><%=c_no%></b><br><%=rs2.getString("course.c_name")%> </div>
					</div>
					
					<% 
					}
					else
					{
					%>
					<div class="col-lg-3 loader_col">
						<!-- Loader -->
						<div class="loader" data-perc="1.0"></div>
						<div class="loader_sub text-center"> <b><%=c_no%></b><br><%=rs2.getString("course.c_name")%> </div>
					</div>
					<%
					}
					
					} %>

				</div>
				<center>
				<h3 class="mb-5"></h3><a class="btn btn-primary btn-xl js-scroll-trigger" role="button" href="my_attendance.jsp">View Detailed Report</a>
            </center>
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
                    <form class="bootstrap-form-with-validation" action="odform.jsp">
							<input class="form-control" type="date" style="width: 439px;margin: 25px;" name="date" Required>
							<input class="form-control" type="number" id="from_class" name="from_class" style="width: 440px;margin: 25px;" placeholder="Enter starting period" Required>
							<input class="form-control" type="number" id="to_class" name="to_class" style="width: 440px;margin: 25px;" placeholder="Enter period till" Required>
							<% 
							rs = ps.executeQuery();
							while(rs.next())
							{
							String query3 = "select course_registration.c_no,course.c_name from course_registration join course on course_registration.c_no = course.c_no where s_no=?;";
							PreparedStatement ps3 = conn.prepareStatement(query3);
							ps3.setString(1, id);
							ResultSet rs3 = ps3.executeQuery();
							%>
							<select class="form-control" name = "c_no" style="width: 440px;margin: 25px;" placeholder="Course Code" Required>
										<option value="" disabled selected>Course Code</option>
							<%
							while(rs3.next())
							{
							%>
							  <option value="<%=rs3.getString("course_registration.c_no")%>"><%=rs3.getString("course_registration.c_no")%> (<%=rs3.getString("course.c_name")%>)</option>
							  <%}
							%>
							</select>
							<%}%>
							
								
							<input class="form-control" type="text" id="reason" name="reason" style="width: 440px;margin: 25px;" placeholder="Reason" Required>
							<input class="form-control" type="text" id="link" name="link" style="width: 440px;margin: 25px;" placeholder="link" Required>
							<button class="btn btn-primary" type="submit" style="width: 440px;">Apply OD</button>
								
                    </form>
                </div>
            </div>
        </div>
    </section>
    <footer class="footer text-center">
        <div class="container">
            <ul class="list-inline mb-3">
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