<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date,java.io.*,java.util.Enumeration"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
<title>Confirmation</title>
</head><body>
<center>
<%
String[] attendees = request.getParameterValues("attendees"); 
String entered_attendance = request.getParameter("atlist");
System.out.println(entered_attendance);
String at = request.getParameter("attendance_date");
String month = at.substring(0,2);
String datey = at.substring(3,5);
String year = at.substring(6,at.length());
at = year+"-"+month+"-"+datey;
System.out.println(at);
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date util_StartDate = format.parse(at);
java.sql.Date atdate = new java.sql.Date( util_StartDate.getTime() );
int from_hr = Integer.valueOf(request.getParameter("from"));
int to_hr = Integer.valueOf(request.getParameter("to"));
String c_no = (String)session.getAttribute("c_no");
String classe = (String)session.getAttribute("class");
try
	{
	    String myDriver = "com.mysql.jdbc.Driver";
        %>
<%@include file="connection.jsp"%>
<%
        Class.forName(myDriver);
        Connection conn = DriverManager.getConnection(url,dbusername,dbpassword);
		try
		{
			String Query = "SELECT student_details.s_no,student_details.s_name from student_details join course_registration on student_details.s_no = course_registration.s_no and student_details.class = ? and c_no = ?;";
			PreparedStatement ps = conn.prepareStatement(Query);
			ps.setString(1,classe);
			ps.setString(2,c_no);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				PreparedStatement ps2= conn.prepareStatement("insert into attendance values (?,?,?,?,?,?);");
				PreparedStatement ps3 = conn.prepareStatement("update course_registration SET total_classes = total_classes + ? where c_no = ? and s_no = ?;");
				ps3.setInt(1,to_hr-from_hr+1);
				ps3.setString(2,c_no);
				ps3.setString(3,rs.getString("student_details.s_no"));
				ps2.setDate(1,atdate);
				ps2.setInt(2,from_hr);
				ps2.setInt(3,to_hr);
				ps2.setString(4,rs.getString("student_details.s_no"));
				ps2.setString(5,c_no);
				ps2.setInt(6,0);
				System.out.println(ps2);
				ps2.execute();
				ps3.execute();
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		if(entered_attendance.length() > 0)
		{
			String[] snos = entered_attendance.split(",");
			for(int i = 0;i<snos.length;i++)
			{
				String s_no = snos[i];
				System.out.println(s_no);
				PreparedStatement ps= conn.prepareStatement("UPDATE attendance SET attendance = ? WHERE s_no = ? and date = ? and c_no = ? and from_class = ? and to_class = ?;");
				PreparedStatement ps1= conn.prepareStatement("UPDATE course_registration SET classes_attended = classes_attended + ? WHERE c_no = ? and s_no = ?;");
				
				
				ps1.setInt(1,to_hr-from_hr+1);
				ps1.setString(2,c_no);
				ps1.setString(3,s_no);
				ps.setInt(1,1);
				ps.setString(2,s_no);
				ps.setDate(3,atdate);
				ps.setString(4,c_no);
				ps.setInt(5,from_hr);
				ps.setInt(6,to_hr);
				System.out.println(ps);
				ps.execute();
				ps1.execute();
			
			}
			System.out.println("Attendance successfully inserted !!");
		}
		else
		{
			for(int i = 0;i<attendees.length;i++)
			{
				String s_no = attendees[i];
				PreparedStatement ps= conn.prepareStatement("UPDATE attendance SET attendance = ? WHERE s_no = ? and date = ? and c_no = ? and from_class = ? and to_class = ?;");
				PreparedStatement ps1= conn.prepareStatement("UPDATE course_registration SET classes_attended = classes_attended + ? WHERE c_no = ? and s_no = ?;");
				
				s_no = s_no.substring(0,s_no.length()-1);
				ps1.setInt(1,to_hr-from_hr+1);
				ps1.setString(2,c_no);
				ps1.setString(3,s_no);
				ps.setInt(1,1);
				ps.setString(2,s_no);
				ps.setDate(3,atdate);
				ps.setString(4,c_no);
				ps.setInt(5,from_hr);
				ps.setInt(6,to_hr);
				System.out.println(ps);
				ps.execute();
				ps1.execute();
				
			}
			System.out.println("Attendance successfully inserted !!");
		}
	}
	catch(Exception e1)
	{
		System.out.println(e1);
	}
%>


<script LANGUAGE='JavaScript'>
     window.alert('Attendance successfully updated.');
     window.location.href='/sams3/teacher_home.jsp';
    </script>

</center>
</body>
</html>