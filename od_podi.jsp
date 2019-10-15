<!DOCTYPE html>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<html lang="es">
<title>OD</title>
<body>

<table summary="Od" border="1" align = center style = "width:100%;border-style = solid;" >
<%
String id = request.getParameter("id"); 
try 
{
	String driverName = "com.mysql.jdbc.Driver";      %>
<%@include file="connection.jsp"%>
<%
Class.forName(driverName);
Connection conn = DriverManager.getConnection(url,dbusername,dbpassword);
String query = "DELETE FROM od_form where od_id = ?;";
PreparedStatement ps = conn.prepareStatement(query);
ps.setInt(1, Integer.valueOf(id));
ps.execute();

}
catch(Exception e){
%>
<color="red"></b>
<%
out.println("Unable to connect to database.");
}
%>
</font>
<script LANGUAGE='JavaScript'>
     window.location.href='teacher_od.jsp';
    </script>
</body>
</html>
