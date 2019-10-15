<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 


<html>
<head>
<title>Course Report</title>
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
<h1>Course Attendance Report</h1>
<%
try {

%>
<%@include file="connection.jsp"%>
<%
String s_no = (String)session.getAttribute("s_no");
String c_no = (String)request.getParameter("c_no");
Connection connection = null;

Statement statement = null;

ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(url, dbusername,dbpassword);

statement = connection.createStatement();
String QueryString = "SELECT * from attendance where s_no = ? and c_no = ? order by date asc;";
PreparedStatement ps = connection.prepareStatement(QueryString);
ps.setString(1,s_no);
ps.setString(2,c_no);
rs = ps.executeQuery();

String QueryString2 = "SELECT c_name from course where c_no = ?;";
PreparedStatement ps2 = connection.prepareStatement(QueryString2);
ps2.setString(1,c_no);
ResultSet rs2 = ps2.executeQuery();
while(rs2.next())
{
%>
<h3><%=rs2.getString("c_name")%></h3>
<%
}
%>
 <div class="container text-center">
            <div class="row">
                <div class="col-lg-13 mx-auto">
                    
                    <div class="table-responsive">
                        <table class="table">
<TR bgcolor = "#ffcc5c"><TH>Date</TH><TH>From</TH><TH>To</TH><TH>Attendance</TH><TH>Issues</TH><TR>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getDate("date")%></TD><td><%=rs.getInt("from_class")%></td><td><%=rs.getInt("to_class")%><td><%=rs.getInt("attendance")%></td>
<%
if(rs.getInt("attendance") < 1)
{
%>
<td><a href = "odform.jsp?user=<%=s_no%>&c_no=<%=c_no%>&date=<%=rs.getDate("date")%>&from_class=<%=rs.getInt("from_class")%>&to_class=<%=rs.getInt("to_class")%>&reason=In_Class&link=-">Raise dispute</a></td>

<% }%> </TR> <% } %>
<%
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
<p class="lead mb-5"><span>Click  &nbsp;</span><a href="/sams3/my_attendance.jsp">here</a> to go back.</p>
<br>
</center>
</body>
</html>



