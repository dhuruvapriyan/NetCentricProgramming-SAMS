
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.net.*"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URLEncoder"%>

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

String sql = "INSERT INTO od_form (s_no,class,c_no,date,from_class,to_class,reason,link) VALUES (?,?,?,?,?,?,?,?);";

String s_no=(String)session.getAttribute("user");
String classe = (String)session.getAttribute("class");
String c_no = request.getParameter("c_no");
String dated = request.getParameter("date");
String from_class = request.getParameter("from_class");
String to_class = request.getParameter("to_class");
String reason = request.getParameter("reason");
String link = request.getParameter("link");
if(true)
{
try{
Class.forName(driverName);
con = DriverManager.getConnection(url, dbusername,dbpassword);
ps = con.prepareStatement(sql);
ps.setString(1,s_no);
ps.setString(2,classe);
ps.setString(3,c_no);
ps.setString(4,dated);
ps.setString(5,from_class);
ps.setString(6,to_class);
ps.setString(7,reason);
ps.setString(8,link);
System.out.println(ps);
ps.execute();
ps.close(); 


%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Hi1</title>
<%
if(reason.equals("In_Class"))
{
%>

<script LANGUAGE='JavaScript'>
     window.alert('Your dispute has been recorded. Thank you');
     window.location.href='student_home.jsp';
    </script>
	</head>
	</html>
<%
}
else
{
%>
<script LANGUAGE='JavaScript'>
     window.alert('Your OD form has been recorded. Thank you');
     window.location.href='student_home.jsp';
    </script>
<%


}
}
catch(SQLException sqe)
{
out.println(sqe);
} 

}
else
{
%>
<! DOCTYPE html>
<html lang="es">
<head>
	<title>Hi</title>
<script LANGUAGE='JavaScript'>
     window.alert('Account creation failed!!! please try again.');
     window.location.href='index.jsp';
    </script>
	</head>
	</html>
<%
}
%>
