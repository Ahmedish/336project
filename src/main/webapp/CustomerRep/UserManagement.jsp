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
		String id = users.getString("user_id");
		String pass = users.getString("password");
	%>
	<div style='border: 2px solid #000000; padding: 20px; margin: 10px; width: 600px;'>
		<form action='UpdateUser.jsp?id=<%=id%>' method='POST'>
			<label>user</label> <input type='text' name='username' value=<%=user%> />
			<label>password</label> <input type='text' name='password' value=<%=pass%> />
			<button class='btn btn-primary' type='submit'>Update</button>
			<a href='<%=projectName%>/CustomerRep/DeleteUser.jsp?id=<%=id%>'
				class='btn btn-danger'>Delete</a>
		</form>
	</div>

	<%
	}
	%>
	<%@ include file="/footer.jsp"%>

</body>
</html>