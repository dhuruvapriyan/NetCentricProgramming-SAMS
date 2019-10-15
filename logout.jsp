<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<% 
response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
session.setAttribute("s_no",null);
session.setAttribute("t_no",null);
session.invalidate();
response.sendRedirect("index.jsp"); %>
