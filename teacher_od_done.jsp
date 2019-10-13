<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date,java.io.*,java.util.Enumeration"%>
<html><body>
<center>
<%
String[] attendees = request.getParameterValues("odees"); 


Statement statement = null;
PreparedStatement ps2 = null;
ResultSet rs2 = null;
try
	{
	    
        String myUrl = "jdbc:mysql://localhost:3306/sams";
      Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection(myUrl, "root", "");
		for(int i = 0;i<attendees.length;i++)
		{
			String od_id = attendees[i];
			try {
			String QueryString2 = "SELECT * from od_form where od_id = ?;";
			ps2 = conn.prepareStatement(QueryString2);
			ps2.setString(1,od_id);
			rs2 = ps2.executeQuery();
			while(rs2.next()){
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date util_StartDate = format.parse( rs2.getString("date") );
				java.sql.Date atdate = new java.sql.Date( util_StartDate.getTime() );
				int from_hr = Integer.valueOf(rs2.getString("from_class"));
				int to_hr = Integer.valueOf(rs2.getString("to_class"));
				String c_no =rs2.getString("c_no");
				String s_no = rs2.getString("s_no");
			
			PreparedStatement ps= conn.prepareStatement("UPDATE attendance SET attendance = ? WHERE s_no = ? and date = ? and c_no = ? and from_class = ? and to_class = ?;");
			
			ps.setInt(1,1);
			ps.setString(2,s_no);
			ps.setDate(3,atdate);
			ps.setString(4,c_no);
			ps.setInt(5,from_hr);
			ps.setInt(6,to_hr);
			System.out.println(ps);
			ps.execute();
			String QueryString3 = "DELETE from od_form where od_id = ?;";
			PreparedStatement ps3 = conn.prepareStatement(QueryString3);
			ps3.setInt(1,Integer.valueOf(od_id.substring(0,od_id.length()-1)));
			System.out.println(ps3);
			ps3.execute(); 
					}
			}
			catch(Exception e1)
			{
				System.out.println(e1);
			}
		}
		System.out.println("OD successfully updated !!");
	}
	catch(Exception e1)
	{
		System.out.println(e1);
	}
%>
<p> OD successfully updated. </p>
<form action = "teacher_home.jsp">
<input type="hidden" name="items"/>
<input type='submit' value = "Go back to Home page."/>
</form>
</center>
</body>
</html>