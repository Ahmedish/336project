<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="Login.jsp">Login</a>
<a href="Register.jsp">Register</a>
<%} else {
%>
Welcome <%=session.getAttribute("user") %>  
<a href="Logout.jsp">Log out</a>
<a href="CreateAuction.jsp">Create Auction</a>
<a href="LiveAuctions.jsp">View Live Auctions</a>
<%
    }
%>
</body>
</html>