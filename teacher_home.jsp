<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 

<%
System.out.println(session.getAttribute("t_no")); 
String ses = (String)session.getAttribute("t_no");
if(session.getAttribute("t_no") == null)
	{
		response.sendRedirect("index.jsp");
	}
		
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<%
	if(session.getAttribute("t_no") == null)
	{%>
	<meta http-equiv="REFRESH" content="2;url=index.jsp">
	<%}%>
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
String id=(String)session.getAttribute("t_no");
%>
<%@include file="connection.jsp"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection(url,dbusername,dbpassword);
String query = "select * from teacher where t_no=?;";
PreparedStatement ps = conn.prepareStatement(query);
ps.setString(1,id);
ResultSet rs = ps.executeQuery();
%>


<body id="page-top"><a class="menu-toggle rounded" href="#"><em class="fa fa-bars"></em></a>
    <nav class="navbar navbar-light navbar-expand" id="sidebar-wrapper">
        <div class="container"><button data-toggle="collapse" class="navbar-toggler d-none" data-target="#"></button>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav sidebar-nav" id="sidebar-nav">
                    <li class="nav-item sidebar-brand" role="presentation"><a class="nav-link active js-scroll-trigger" href="#page-top">Brand</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#page-top">Home</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="my_classes.jsp">Attendance</a></li>
                    <li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="teacher_od.jsp">OD/Leave</a></li>
					<li class="nav-item sidebar-nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="logout.jsp">Logout</a></li>
                   
                </ul>
            </div>
        </div>
    </nav>

    <header class="d-flex masthead" style="background-image:url('assets/img/bg-masthead.jpg');">
        <div class="container my-auto text-center">
		
            
<%
String s = null;
while(rs.next())
{
	s = rs.getString("t_name");
}
%>
			<h1 class="display-1 text-primary mb-1">Hi <%=s%>
			</h1>
       <h3 class="mb-5"></h3><a class="btn btn-primary btn-xl js-scroll-trigger" role="button" href="my_classes.jsp">Update Attendance</a>
	  <h3 class="mb-5"></h3><a class="btn btn-primary btn-xl js-scroll-trigger" role="button" href="teacher_od.jsp">Approve OD</a>
            <div class="overlay"></div>
			
        </div>
    </header>

    <div></div>
   
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
    <script src="assets/js/ebs-bootstrap-datepicker-1.js"></script>
    <script src="assets/js/ebs-bootstrap-datepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
</body>
</html>
