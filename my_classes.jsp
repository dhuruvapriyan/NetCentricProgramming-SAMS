<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 


<html lang="es">
<head>
<title>Class List</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
</head>
<body>

<h1>Class List</h1>
<%
try {

%>
<%@include file="connection.jsp"%>
<%

Connection connection = null;

Statement statement = null;
PreparedStatement ps = null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(url, dbusername,dbpassword);

statement = connection.createStatement();
String t_no = (String)session.getAttribute("t_no");
String QueryString = "SELECT * from class_teacher join course on class_teacher.c_no = course.c_no and t_no = ?;";
ps = connection.prepareStatement(QueryString);
ps.setString(1,t_no);
rs = ps.executeQuery();
%>
 <div class="container text-center">
            <div class="row">
                <div class="col-lg-13 mx-auto">
                    
                    <div class="table-responsive">
                        <table class="table">
<TR bgcolor = "#ffcc5c"><TH scope="col">Course Code</TH><TH scope="col">Course Name</TH><TH scope="col">Class</TH><TH scope="col">Attendance</TH><TR>
<%
while(rs.next()) {
%>
<TR>
<TD><%=rs.getString("course.c_no")%></TD>
<TD><%=rs.getString("course.c_name")%></TD>
<TD><%=rs.getString("class_teacher.class")%></TD>
<td><a class="btn btn-light btn-x3 js-scroll-trigger" role="button" href = "mark_attendance.jsp?courses=<%=rs.getString("course.c_no")%>&classes=<%=rs.getString("class_teacher.class")%>">Mark Attendance</a></td>
</TR>
<% } %>
<%
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
	out.println(ex);
%>
<color="red"></b>
<%
out.println("No books added.");
}
%>
</font>
</TABLE>



<p class="lead mb-5"><span>Click  &nbsp;</span><a href="/sams3/teacher_home.jsp">here</a> to go back.</p>

</body>
</html>



