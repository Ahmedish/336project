<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Live Auctions</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ include file="header.jsp"%>

	<%
	ResultSet questionCheck;
	questionCheck = stmt.executeQuery("SELECT * FROM questions");
	out.println("<h1>Questions</h1>");
	while (questionCheck.next()) {
		String user = questionCheck.getString("username");
		String question = questionCheck.getString("question");
		String answer = questionCheck.getString("answer");
		if (answer.isBlank())
			answer = "answer not yet provided";

		out.println("<p>Q: <i>" + question + "</i> - " + user + "</p>");
		out.println("<p>A: <i>" + answer + "</p> <br>");
	}
	%>
	<%@ include file="footer.jsp"%>

</body>
</html>