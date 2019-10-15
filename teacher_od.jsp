<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<title>OD List</title>
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
<h1>OD List</h1>
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
String course = request.getParameter("classes");
statement = connection.createStatement();
String teacherid=(String) session.getAttribute("tuser");
String QueryString = "SELECT * from class_teacher join od_form on class_teacher.c_no = od_form.c_no and class_teacher.class = od_form.class and class_teacher.t_no = ?;";
ps = connection.prepareStatement(QueryString);
ps.setString(1,teacherid);
rs = ps.executeQuery();
%>
<form action = "teacher_od_done.jsp" method = "GET">
<div class="container text-center">
            <div class="row">
                <div class="col-lg-13 mx-auto">
                    
                    <div class="table-responsive">
                        <table class="table">
<TR bgcolor = "#ffcc5c"><TH>Student ID</TH><TH>Student Name</TH><TH>Class</TH><TH>Course</TH><TH>Date</TH><TH>From Period</TH><TH>To Period</TH><TH>Reason</TH><TH>Document Proof</TH><TH>Approve</TH><TH>Disapprove</TH><TR>
<%
while (rs.next()) {
	String q2 = "SELECT s_name from student_details where s_no = ?";
	String q3 = "SELECT c_name from course where c_no =?;";
	PreparedStatement ps2 = connection.prepareStatement(q2);
	PreparedStatement ps3 = connection.prepareStatement(q3);
	ps2.setString(1,rs.getString("s_no"));
	ps3.setString(1,rs.getString("c_no"));
	ResultSet rs2 = ps2.executeQuery();
	ResultSet rs3 = ps3.executeQuery();
	if(rs2.next() && rs3.next())
	{
%>
<TR>
<TD><%=rs.getString("s_no")%></TD>
<TD><%=rs2.getString("s_name")%></TD>
<TD><%=rs.getString("class")%></TD>
<TD><%=rs.getString("c_no")%><br>(<%=rs3.getString("c_name")%>)</TD>
<TD><%=rs.getString("date")%></TD>
<TD><%=rs.getString("from_class")%></TD>
<TD><%=rs.getString("to_class")%></TD>
<TD><%=rs.getString("reason")%></TD>
<TD><a href="<%=rs.getString("link")%>"target="_blank"><%=rs.getString("link")%></a></TD>
<td><input type = "checkbox" name = "odees" value = <%=rs.getString("od_id")%>/></td>
<td><a href = "od_podi.jsp?id=<%=rs.getInt("od_id")%>">Remove</a></td>
</TR>
	<% }} %>
<%
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to Database.");
}
%>
</font>
</TABLE>
<br>
<input type = "submit" value = "Update OD List">
</form>
<br/>
<br/>
<p class="lead mb-5"><span>Click  &nbsp;</span><a href="/sams3/teacher_home.jsp">here</a> to go back.</p>
</center>
</body>
</html>



