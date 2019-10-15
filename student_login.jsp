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
%>
<%@include file="connection.jsp"%>
<%
String user = "root";
String dbpsw = "";

String sql = "select * from student_login where s_no = ? and password = ?;";

String userid = request.getParameter("roll_no");
String password = request.getParameter("password");

if((!(userid.equals(null) || userid.equals("")) && !(password.equals(null) || password.equals(""))))
{
try{
Class.forName(driverName);
con = DriverManager.getConnection(url, dbusername,dbpassword);
ps = con.prepareStatement(sql);
ps.setString(1, userid);
ps.setString(2, password);
rs = ps.executeQuery();
if(rs.next())
{ 
userdbName = rs.getString("s_no");
userdbPsw = rs.getString("password");
if(userid.equals(userdbName) && password.equals(userdbPsw))
{
session.setAttribute("s_no",userdbName); 
response.sendRedirect("student_home.jsp"); 
} 
}
else
{
%>	
<script LANGUAGE='JavaScript'>
     window.alert('Incorrect credentials');
     window.location.href='index.jsp#about';
    </script>"	
<%	

}
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
getServletContext().getRequestDispatcher("/index.jsp").include(request, response);
}
%>
</body>
</html>