<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date,java.io.*,java.util.Enumeration"%>
<html><body>
<center>
<%
String[] attendees = request.getParameterValues("attendees"); 
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date util_StartDate = format.parse( request.getParameter("attendance_date") );
java.sql.Date atdate = new java.sql.Date( util_StartDate.getTime() );
int from_hr = Integer.valueOf(request.getParameter("from"));
int to_hr = Integer.valueOf(request.getParameter("to"));
String c_no = (String)session.getAttribute("c_no");
try
	{
	    String myDriver = "com.mysql.cj.jdbc.Driver";
        String myUrl = "jdbc:mysql://192.168.43.160/sams";
        Class.forName(myDriver);
        Connection conn = DriverManager.getConnection(myUrl, "root", "");
		try
		{
			String Query = "SELECT s_no from student_details where c_no = ?;";
			PreparedStatement ps = conn.prepareStatement(Query);
			ps.setString(1,c_no);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				PreparedStatement ps2= conn.prepareStatement("insert into attendance values (?,?,?,?,?,?);");
				
				ps2.setDate(1,atdate);
				ps2.setInt(2,from_hr);
				ps2.setInt(3,to_hr);
				ps2.setString(4,rs.getString("s_no"));
				ps2.setString(5,c_no);
				ps2.setInt(6,0);
				System.out.println(ps2);
				ps2.execute();
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		for(int i = 0;i<attendees.length;i++)
		{
			String s_no = attendees[i];
			PreparedStatement ps= conn.prepareStatement("UPDATE attendance SET attendance = ? WHERE s_no = ? and date = ? and c_no = ? and from_class = ? and to_class = ?;");
			s_no = s_no.substring(0,s_no.length()-1);
			ps.setInt(1,1);
			ps.setString(2,s_no);
			ps.setDate(3,atdate);
			ps.setString(4,c_no);
			ps.setInt(5,from_hr);
			ps.setInt(6,to_hr);
			System.out.println(ps);
			ps.execute();
			
		}
		System.out.println("Attendance successfully inserted !!");
	}
	catch(Exception e1)
	{
		System.out.println(e1);
	}
%>
<p> Attendance successfully updated. </p>
<form action = "teacher_home.jsp">
<input type="hidden" name="items"/>
<input type='submit' value = "Go back to Home page."/>
</form>
</center>
</body>
</html>