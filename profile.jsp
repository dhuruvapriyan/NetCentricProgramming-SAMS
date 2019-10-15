<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 


<html>
<head>
<title>Profile Information</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Profile Information</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
</head>
<body>
<center>
<h1>Profile Information</h1>
<%
try {

%>
<%@include file="connection.jsp"%>
<%
String s_no = (String)session.getAttribute("s_no");
Connection connection = null;

Statement statement = null;

ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(url, dbusername,dbpassword);

statement = connection.createStatement();
String QueryString = "SELECT * from student_details where s_no = ?;";
PreparedStatement ps = connection.prepareStatement(QueryString);
ps.setString(1,s_no);
rs = ps.executeQuery();
%>
 <div class="container text-center">
            <div class="row">
                <div class="col-lg-13 mx-auto">
                    
                    <div class="table-responsive">
                        <table class="table">
<%
while (rs.next()) {
%>
<TR><TD bgcolor = "#ffcc5c">Student Roll Number </TD><TD><%=rs.getString("s_no")%></TD></TR>
<TR><TD bgcolor = "#ffcc5c">Student Name </TD><TD><%=rs.getString("s_name")%></TD></TR>
<TR><TD bgcolor = "#ffcc5c">Gender </TD><TD><%=rs.getString("gender")%></TD></TR>
<TR><TD bgcolor = "#ffcc5c">HomeTown </TD><TD><%=rs.getString("city")%>, <%=rs.getString("state")%></TD></TR>
<TR><TD bgcolor = "#ffcc5c">CGPA </TD><TD><%=rs.getFloat("cgpa")%></TD></TR>
<TR><TD bgcolor = "#ffcc5c">Disciplinary Action Count </TD><TD><%=rs.getFloat("disciplinary_count")%></TD></TR>
<%
}
rs.close();
statement.close();
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
<p class="lead mb-5"><span>Click  &nbsp;</span><a href="/sams3/student_home.jsp">here</a> to go back.</p>
<br>
</center>
</body>
</html>



