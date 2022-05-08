<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Rep Reply</title>

</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ include file="/header.jsp"%>

	<%
	String id = request.getParameter("question_id");
	ResultSet question = stmt.executeQuery("SELECT * FROM questions WHERE question_id='" + id + "'");
	%>
	<div style="display: flex; justify-content: center; margin-top: 250px;">
		<%
		out.println("<form action='ReplyController.jsp?question_id=" + id + "' method='POST'>");
		%>
		<h1 style="text-align: center;">Customer Rep Reply</h1>
		<%
		if (question.next()) {
			out.println("<p>Question: " + question.getString("question") + "</p>");
			out.println("<div class='form-group'>Answer: <input type='text' name='answer' value='"
			+ question.getString("answer") + "'></div>");
		}
		%>
		<button type="submit" class="btn btn-success">Submit</button>
		</form>
	</div>
	<%@ include file="/footer.jsp"%>

</body>
</html>