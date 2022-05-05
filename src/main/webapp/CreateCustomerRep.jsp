<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Create Customer Representative</title>
	
</head>
<body>
<h1>Create Create Customer Representative</h1>
<form action="CreateCustomerRepController.jsp" method="POST">
       Username: <input type="text" name="Username"/> <br/>
       Password: <input type="password" name="Password"/> <br/>
       <input type="submit" value="Submit"/>
</form>
</body>
</html>