<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<%
    if ((session.getAttribute("user") == null)) response.sendRedirect("Landing.jsp");
%>
<h1>Welcome Admin!</h1>
<a href="SalesReport.jsp">View Sales Report</a>
<a href="Logout.jsp">Log out</a>
</body>
</html>