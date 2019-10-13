<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 


<html>
<head>
<title>Class List</title>
</head>
<body>
<center>
<h1>Class List</h1>
<%
try {

String connectionURL = "jdbc:mysql://192.168.43.160:3306/sams";

Connection connection = null;

Statement statement = null;
PreparedStatement ps = null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(connectionURL, "root", "");

statement = connection.createStatement();
String t_no = (String)session.getAttribute("user");
String QueryString = "SELECT c_no from course_teacher where t_no = ?;";
ps = connection.prepareStatement(QueryString);
ps.setString(1,t_no);
rs = ps.executeQuery();
%>
<form action = "mark_attendance.jsp" method = "GET">
<TABLE cellpadding="15" border="1" style="background-color: #ffeead;">
<TR bgcolor = "#ffcc5c"><TH>Course</TH><TH>Name</TH><TH>Attendance</TH><TR>
<%
while(rs.next()) {
%>
<TR>
<TD><%=rs.getString("c_no")%></TD>
<td><input type = "radio" name = "classes" value = "<%=rs.getString("c_no")%>"/></td>
</TR>
<% } %>
<%
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
	out.println(ex);
%>
<font size="+3" color="red"></b>
<%
out.println("No books added.");
}
%>
</font>
</TABLE>
<br>
<input type = "submit" value = "Mark Attendance">
</form>
</center>
</body>
</html>



