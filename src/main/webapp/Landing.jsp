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
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="Login.jsp">End-User Login</a><br>
<a href="AdminLogin.jsp">Admin Login</a><br>
<a href="Register.jsp">Register</a>
<%} else {
%>
<h1>Welcome <%=session.getAttribute("user")%></h1> 
<a href="Logout.jsp">Log out</a> <br>
<a href="CreateAuction.jsp">Create Auction</a> <br>
<a href="LiveAuctions.jsp">View Live Auctions</a> <br>
<%
    }
%>
</body>
</html>