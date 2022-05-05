<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Auction</title>
	
</head>
<body>
<h1>Create Auction</h1>
<form action="CreateAuctionController.jsp" method="POST">
	   ID: <input type="number" name="id"/> <br/>
       Initial Price: <input type="number" name="init_price"/> <br/>
       Minimum Price: <input type="number" name="min_price"/> <br/>
       Close Date: <input type="date" name="close_date"/> <br/>
       Increment: <input type="number" name="increment"/> <br/>
       Item ID: <input type="number" name="item_id"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
</body>
</html>