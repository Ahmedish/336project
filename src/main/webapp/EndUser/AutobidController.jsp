<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auto Bid Controller</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
	String user_id = request.getParameter("user_id");
	String auction_id = request.getParameter("auction_id");
	String maxPrice = request.getParameter("maxPrice");
	ApplicationDB db = new ApplicationDB();
	Connection connection = db.getConnection();
	Statement stmt = connection.createStatement();

	stmt.executeUpdate("INSERT INTO autobid (user_id, auction_id, maxPrice) VALUES ('" + user_id + "', '" + auction_id + "', '" + maxPrice + "');");
	response.sendRedirect("LiveAuctions.jsp");
	%>

</body>
</html>