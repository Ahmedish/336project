<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<%@ page import ="java.sql.*" %>

<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in
<br/>
<a class="btn btn-primary" href="Login.jsp">End-User Login</a>
<a class="btn btn-primary" href="CustomerRepLogin.jsp">Customer Rep Login</a>
<a class="btn btn-primary" href="AdminLogin.jsp">Admin Login</a>
<a class="btn btn-primary" href="Register.jsp">Register</a>
<%} else {
    ApplicationDB db = new ApplicationDB();    
    Connection connection = db.getConnection();    
    Statement stmt = connection.createStatement();
    ResultSet user;
	
    user = stmt.executeQuery("SELECT * FROM users WHERE user_id='"+session.getAttribute("user")+"'");
%>
<%
	if(user.next()){
		out.println("<h1>Welcome "+user.getString("username")+"</h1>");
 
	}
%>
<a class="btn btn-danger" href="Logout.jsp">Log out</a>
<a class="btn btn-success" href="CreateAuction.jsp">Create Auction</a>
<a class="btn btn-primary" href="LiveAuctions.jsp">View Live Auctions</a>
<a class="btn btn-primary" href="UserAskQuestion.jsp">Ask Question</a>

<%
    }
%>
</body>
</html>