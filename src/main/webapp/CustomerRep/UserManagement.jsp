<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>User Management</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ include file="/header.jsp"%>

	<%

	ResultSet users;
	users = stmt.executeQuery("SELECT * FROM users");
	out.println("<h1 style='margin-bottom: 10px'>Active Users</h1>");
	while (users.next()) {
		String user = users.getString("username");
		String pass = users.getString("password");
		int user_id = users.getInt("user_id");
		out.println("<div style='border: 2px solid #000000; padding: 20px; margin: 10px; width: 600px;'>");
		out.println("<form action='UpdateUser.jsp?id=" + user_id + "' method='POST'");
		out.println("<label>username</label>");
		out.println("<input type='text' name='username' value='" + user + "' />");
		out.println("<label>password</label>");
		out.println("<input type='text' name='password' value='" + pass + "' />");
		out.println("<button class='btn btn-primary' type='submit'>Update</button>");
		out.println("<a href='DeleteUser.jsp?username=" + user + "&id=" + user_id + "' class='btn btn-danger'>Delete</a>");
		out.println("</form>");
		out.println("</div>");

	}
	%>
	<%@ include file="/footer.jsp"%>

</body>
</html>