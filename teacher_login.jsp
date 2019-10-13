<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%! String userdbName;
String userdbPsw;
%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/sams";
String user = "root";
String dbpsw = "";

String sql = "select * from teacher where t_no = ? and password = ?;";

String userid = request.getParameter("roll_no");
String password = request.getParameter("password");

if((!(userid.equals(null) || userid.equals("")) && !(password.equals(null) || password.equals(""))))
{
try{
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);
ps.setString(1, userid);
ps.setString(2, password);
rs = ps.executeQuery();
if(rs.next())
{ 
userdbName = rs.getString("t_no");
userdbPsw = rs.getString("password");
if(userid.equals(userdbName) && password.equals(userdbPsw))
{
session.setAttribute("tuser",userdbName); 
response.sendRedirect("teacher_home.jsp"); 
} 
}
else
response.sendRedirect("index.jsp");
rs.close();
ps.close(); 
}
catch(SQLException sqe)
{
out.println(sqe);
} 
}
else
{
%>
<center><p style="color:red">Missing fields, Please try again.</p></center>
<% 
getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
}
%>
</body>
</html>