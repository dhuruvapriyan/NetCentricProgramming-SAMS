<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 


<html>
<head>
<title>Book List</title>
</head>
<body>
<center>
<h1>Book List</h1>
<%
try {

String connectionURL = "jdbc:mysql://localhost:3306/book_details";

Connection connection = null;

Statement statement = null;

ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(connectionURL, "root", "mysqlroot");

statement = connection.createStatement();

String QueryString = "SELECT * from bookslist";
rs = statement.executeQuery(QueryString);
%>
<form action = "add_to_cart.jsp" method = "GET">
<TABLE cellpadding="15" border="1" style="background-color: #ffeead;">
<TR bgcolor = "#ffcc5c"><TH>Book ID</TH><TH>Book Name</TH><TH>Author</TH><TH>Available copies</TH><TH>Price</TH><TH>Cover Page</TH><TH>Buy</TH><TH>Quantity</TH><TR>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getInt("book_id")%></TD>
<TD><%=rs.getString("book_name")%></TD>
<TD><%=rs.getString("author")%></TD>
<TD><%=rs.getInt("copies")%></TD>
<TD>Rs.<%=rs.getFloat("price")%></TD>
<td><a href = "cover_page.jsp?id=<%=rs.getInt("book_id")%>">View Cover page</a></td>
<td><input type = "checkbox" name = "items" value = "<%=rs.getInt("book_id")%>"/></td>
<td><input type = "number" name = "quantity" pattern = "\d+" value = "0" step = "1" min = "0"/></td>
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
out.println("No books added.");
}
%>
</font>
</TABLE>
<br>
<input type = "submit" value = "Add To Cart">
</form>
</center>
</body>
</html>



