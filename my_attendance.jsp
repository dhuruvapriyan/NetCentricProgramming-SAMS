<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 


<html>
<head>
<title>Your Courses</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
</head>
<body>
<center>
<h1>Your Courses</h1>
<%
try {
%>
<%@include file="connection.jsp" %>
<%
String s_no = (String)session.getAttribute("s_no");
Connection connection = null;

ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(url, dbusername,dbpassword);

String QueryString = "SELECT course_registration.class,course_registration.c_no,course.c_name from course join course_registration on course.c_no = course_registration.c_no and course_registration.s_no = ?;";
PreparedStatement ps = connection.prepareStatement(QueryString);
ps.setString(1,s_no);
session.setAttribute(s_no,s_no);
rs = ps.executeQuery();
%>
<form action = "add_to_cart.jsp" method = "GET">
 <div class="container text-center">
            <div class="row">
                <div class="col-lg-13 mx-auto">
                    
                    <div class="table-responsive">
                        <table class="table">
<TR bgcolor = "#ffcc5c"><TH>Course Code</TH><TH>Course Name</TH><TH>Teacher</TH></TR>
<%
while (rs.next()) 
{
	String q = "SELECT t_name from teacher where t_no = (SELECT t_no from class_teacher where c_no = ? and class = ?);";
	PreparedStatement ps1 = connection.prepareStatement(q);
	ps1.setString(1,rs.getString("course_registration.c_no"));
	ps1.setString(2,rs.getString("course_registration.class"));
	System.out.println(ps1);
	ResultSet rs1 = ps1.executeQuery();
	while(rs1.next())
	{
%>
<TR>
<TD><%=rs.getString("course_registration.c_no")%></TD>
<TD><%=rs.getString("course.c_name")%></TD>
<TD><%=rs1.getString("t_name")%></TD>
<td><a class="btn btn-dark btn-x2 js-scroll-trigger" role="button" href = "attendance_report.jsp?c_no=<%=rs.getString("course_registration.c_no")%>">View report</a></td>
</TR>
	<% }} %>

<%
rs.close();
connection.close();
} catch (Exception ex) {
%>
<font size="+3" color="red"></b>
<%
out.println("No books added.");
}
%>
</font>
</TABLE>
</div>
<p class="lead mb-5"><span>Click  &nbsp;</span><a href="/sams3/student_home.jsp">here</a> to go back.</p>
                       </div>
</div></div></div>
<br>

</form>
</center>
</body>
</html>



