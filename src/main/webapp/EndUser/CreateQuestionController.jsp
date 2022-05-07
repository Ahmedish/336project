<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Question Controller</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ include file="/header.jsp"%>

	<%
	String username = (String) session.getAttribute("username");
	int user_id = (int) session.getAttribute("user");
	String question = request.getParameter("question");

	stmt.executeUpdate("INSERT INTO questions (username, user_id, question, answer) VALUES ('" + username + "', '" + user_id
			+ "','" + question + "', '');");
	response.sendRedirect(projectName + "/Landing.jsp");
	%>

</body>
</html>