<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Ask Question</title>

</head>
<body>
	<%@ include file="header.jsp"%>

	<h1>Create Auction</h1>

	<form action='CreateQuestionController.jsp' method='POST'>
		<div class="form-group">
			Question: <input type="text" name="question" />
		</div>
		<button type="submit" class="btn btn-success">Submit</button>
	</form>
	<%@ include file="footer.jsp"%>

</body>
</html>