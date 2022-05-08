<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bid</title>
</head>
<body>
<form action="BidController.jsp" method="POST"> 
	Auction ID: <input type="number" name="auction_id"/> <br/>
       	Price: <input type="number" name="price"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
</body>
</html>
