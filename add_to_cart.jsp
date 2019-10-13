<%@page language="java"%>
<%@page import="java.sql.*"%>
<html><body>
<center>
<h2>Book Cart</h2>
<table border="1" align = center>
<tr><th>Book Name</th><th>Price</th><th>Quantity</th><th>Total Price</tr>
<%
String[] items = request.getParameterValues("items");
String[] quantity = request.getParameterValues("quantity"); 
float totalPrice = 0;
float currbook = 0;
try 
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_details", "root", "mysqlroot");
String query = "select * from bookslist where book_id = ?;";
PreparedStatement ps = conn.prepareStatement(query);
for(int i = 0;i<quantity.length;i++)
{
if(quantity[i].equals("0"))
	continue;
ps.setInt(1, i+1);
ResultSet rs = ps.executeQuery();
if(rs.next())
{
	if(Integer.parseInt(quantity[i]) <= rs.getInt("copies"))
	{
%>
<%currbook = rs.getFloat("price")*Integer.parseInt(quantity[i]);%>
<%totalPrice = totalPrice + currbook;%>
<tr>
<td><%=rs.getString("book_name")%></td><td>Rs.<%=rs.getFloat("price")%><td><%=quantity[i]%></td><td><%=currbook%></td>
</tr>

<%
	}
	else
	{
%>
<tr>
<td><%=rs.getString("book_name")%></td><td>Rs.<%=rs.getFloat("price")%><td style = "color:#ff0000"><%=quantity[i]%> - Enough copies not available.</td><td>0</td>
</tr>
<%
	}
}
}
}
catch(Exception e){
%>
<font size="+3" color="red"></b>
<%
out.println("No books added.");
}
%>
</font>
</table>
<p>Total amount to be paid : Rs.<%=totalPrice%></p>
<form action = "book_home.jsp">
<input type="hidden" name="items"/>
<input type='submit' value = "Pay Now"/>
</form>
</center>
</body>
</html>