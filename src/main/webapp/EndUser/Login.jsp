<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

</head>
<body>
	<%@ include file="/header.jsp"%>

	<div style="display: flex; justify-content: center; margin-top: 250px;">
		<form action="CheckLogin.jsp" method="POST">
			<h1 style="text-align: center;">Login</h1>
			<div class="form-group">
				Username: <input type="text" name="Username" />
			</div>
			<div class="form-group">
				Password: <input type="password" name="Password" />
			</div>
			<button type="submit" class="btn btn-success">Submit</button>
			<button type="button" class="btn btn-primary" name="back" onclick="history.back()">Back</button>

		</form>
	</div>
	<%@ include file="/footer.jsp"%>

</body>
</html>