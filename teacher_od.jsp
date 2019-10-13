<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<title>OD List</title>
</head>
<body>
<center>
<h1>OD List</h1>
<%
try {

String connectionURL = "jdbc:mysql://localhost:3306/sams";

Connection connection = null;

Statement statement = null;
PreparedStatement ps = null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(connectionURL, "root", "");
String course = request.getParameter("classes");
statement = connection.createStatement();
String teacherid=(String) session.getAttribute("tuser");
String QueryString = "SELECT * from course_teacher,od_form where t_no = ?;";
ps = connection.prepareStatement(QueryString);
ps.setString(1,teacherid);
rs = ps.executeQuery();
%>
<form action = "teacher_od_done.jsp" method = "GET">
<TABLE cellpadding="15" border="1" style="background-color: #ffeead;">
<TR bgcolor = "#ffcc5c"><TH>Od Id</TH><TH>Student</TH><TH>Course</TH><TH>Date</TH><TH>From Period</TH><TH>To Period</TH><TH>Reason</TH><TH>Document Proof</TH><TH>Approve</TH><TR>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getString("od_id")%></TD>
<TD><%=rs.getString("s_no")%></TD>
<TD><%=rs.getString("c_no")%></TD>
<TD><%=rs.getString("date")%></TD>
<TD><%=rs.getString("from_class")%></TD>
<TD><%=rs.getString("to_class")%></TD>
<TD><%=rs.getString("reason")%></TD>
<TD><%=rs.getString("link")%></TD>
<td><input type = "checkbox" name = "odees" value = <%=rs.getString("od_id")%>/></td>
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
<input type = "submit" value = "Update OD List">
</form>
</center>
</body>
</html>



