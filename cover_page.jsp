<%@page language="java"%>
<%@page import="java.sql.*"%>
<html><body>
<center>
<table border="1" align = center style = "width:100%;border-style = solid;" >
<%
String id = request.getParameter("id"); 
try 
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_details", "root", "mysqlroot");
String query = "select * from bookslist where book_id = ?;";
PreparedStatement ps = conn.prepareStatement(query);
ps.setString(1, id);
ResultSet rs = ps.executeQuery();
while(rs.next())
{
%>
<tr><td width = "20%"><img src = ".\<%=rs.getString("book_name")%>.jpg" border=3 height = 500 width = 350></img></td>
<td width = "80%" style = "align = 'top';">
<table border = "1" style = "height:500;">
<tr><td width = "30%" bgcolor = "#f2ae72"><b> Book Name  </b></td ><td bgcolor = "#f2e394"width = "70%"><%=rs.getString("book_name")%></td></tr>
<tr><td width = "30%" bgcolor = "#f2ae72"><b> Book Author </b></td><td bgcolor = "#f2e394" width = "70%"><%=rs.getString("author")%></td></tr>
<tr><td width = "30%" bgcolor = "#f2ae72"><b> Description </b></td><td bgcolor = "#f2e394" width = "70%"><%=rs.getString("Description")%></td></tr>
<tr><td width = "30%" bgcolor = "#f2ae72"><b> Number of pages  </b></td><td bgcolor = "#f2e394" width = "70%"><%=rs.getInt("pages")%></td></tr>
<tr><td width = "30%" bgcolor = "#f2ae72"><b> Number of people bought this book  </b></td><td bgcolor = "#f2e394" width = "70%"><%=rs.getString("buys")%></td></tr>
<tr><td width = "30%" bgcolor = "#f2ae72"><b> Maximum Retail Price  </b></td><td bgcolor = "#f2e394" width = "70%">Rs.<%=rs.getString("price")%></td></tr>
</table>

</td></tr>


<%
}
}
catch(Exception e){
%>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database.");
}
%>
</font>
</table>
<p>Click <a href = "book_home.jsp">here</a> to go back to main page.</p></center>
</body>
</html>