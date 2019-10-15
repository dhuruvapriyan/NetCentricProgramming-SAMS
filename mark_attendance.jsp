<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<title>Course List</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<SCRIPT language="javascript" >
$(function(){

	// add multiple select / deselect functionality
	$("#selectall").click(function() {
		  $('.attendees').attr('checked', this.checked);
	});

	// if all checkbox are selected, check the selectall checkbox
	// and viceversa
	$(".attendees").click(function(){

		if($(".attendees").length == $(".attendees:checked").length) {
			$("#selectall").attr("checked", "checked");
		} else {
			$("#selectall").removeAttr("checked");
		}

});
});
</script>!-->
<SCRIPT type="text/javascript" >
$(function(){
	
		
		var date = new Date();
		var currentMonth = date.getMonth();
		var currentDate = date.getDate();
		var currentYear = date.getFullYear();
		var $j = jQuery.noConflict();
		$j('#datepicker').datepicker({
		maxDate: new Date(currentYear, currentMonth, currentDate)
		});
		});
	
</script>

<script type="text/javascript">
			function selectAll(){
				var items=document.getElementsByName('attendees');
				for(var i=0; i<items.length; i++){
					if(items[i].type=='checkbox')
						items[i].checked=true;
				}
			}
			
			function UnSelectAll(){
				var items=document.getElementsByName('attendees');
				for(var i=0; i<items.length; i++){
					if(items[i].type=='checkbox')
						items[i].checked=false;
				}
			}			
		</script>

</head>
<body>
<center>
<h1>Course List</h1>
<%
try {

%>
<%@include file="connection.jsp"%>
<%

Connection connection = null;

Statement statement = null;
PreparedStatement ps = null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(url,dbusername,dbpassword);
String course = request.getParameter("courses");
String classe = request.getParameter("classes");
statement = connection.createStatement();
session.setAttribute("c_no",course);
session.setAttribute("class",classe);
String QueryString = "SELECT student_details.s_no,student_details.s_name from student_details join course_registration on student_details.s_no = course_registration.s_no and student_details.class = ? and c_no = ?;";
ps = connection.prepareStatement(QueryString);
ps.setString(1,classe);
ps.setString(2,course);
rs = ps.executeQuery();
%>
<form action = "attendance_done.jsp" method = "GET">
<div class="container text-center">
            <div class="row">
                <div class="col-lg-13 mx-auto">
                    
                    <div class="table-responsive">
                        <table class="table">

<tr><td> Date </td><td><input type = "text" id="datepicker" name = "attendance_date" Required/></td></tr>
<tr><td> From </td><td><input type = "number" name = "from" pattern = "\d+" value = "1" step = "1" min = "1" max = "8"/></td>
<tr><td> To </td><td><input type = "number" name = "to" pattern = "\d+" value = "1" step = "1" min = "1" max = "8"/></td>
<tr><td> Enter Roll numbers here</td><td><textarea rows = "5" columns = "300" name = "atlist"></textarea><tr>

<TR bgcolor = "#ffcc5c"><TH>Roll Number</TH><TH>Student Name</TH><TH>Attendance <br/>
<input class="btn btn-light btn-x4 js-scroll-trigger" type="button" onclick='selectAll()' value="P"/>
		<input class="btn btn-light btn-x4 js-scroll-trigger" type="button" onclick='UnSelectAll()' value="A"/> </TH></TR>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getString("student_details.s_no")%></TD>
<TD><%=rs.getString("student_details.s_name")%></TD>
<td><input type = "checkbox" class = "attendees" name = "attendees" value = <%=rs.getString("student_details.s_no")%>/></td>
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
out.println("Unable to connect to Database.");
}
%>
</font>
</TABLE>
<br>
<input type = "submit" value = "Submit Attendance">
</form>
<br/>
<br/>

<p class="lead mb-5"><span>Click  &nbsp;</span><a href="/sams3/my_classes.jsp">here</a> to go back.</p>
</center>
</body>
</html>



