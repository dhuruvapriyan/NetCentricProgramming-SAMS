<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<title>Course List</title>
</head>
<body>
<center>
<h1>Course List</h1>
<%
try {

String connectionURL = "jdbc:mysql://192.168.43.160:3306/sams";

Connection connection = null;

Statement statement = null;
PreparedStatement ps = null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(connectionURL, "root", "");
String course = request.getParameter("classes");
statement = connection.createStatement();
session.setAttribute("c_no",course);
String QueryString = "SELECT * from student_details where c_no = ?;";
ps = connection.prepareStatement(QueryString);
ps.setString(1,course);
rs = ps.executeQuery();
%>
<form action = "attendance_done.jsp" method = "GET">
<TABLE cellpadding="15" border="1" style="background-color: #ffeead;">
<tr><td> Date </td><td><input type = "date" name = "attendance_date"/></td></tr>
<tr><td> From </td><td><input type = "number" name = "from" pattern = "\d+" value = "1" step = "1" min = "1" max = "8"/></td>
<tr><td> To </td><td><input type = "number" name = "to" pattern = "\d+" value = "1" step = "1" min = "1" max = "8"/></td>
<TABLE cellpadding="15" border="1" style="background-color: #ffeead;">
<TR bgcolor = "#ffcc5c"><TH>Roll Number</TH><TH>Student Name</TH><TH>Attendance</TH><TR>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getString("s_no")%></TD>
<TD><%=rs.getString("name")%></TD>
<td><input type = "checkbox" name = "attendees" value = <%=rs.getString("s_no")%>/></td>
</TR>
<% } %>
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
<input type = "submit" value = "Submit Attendance">
</form>
</center>
</body>
</html>



