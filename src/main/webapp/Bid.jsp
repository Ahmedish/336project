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
		Bid Number: <input type="number" name="bid_num"/> <br/>
       Price: <input type="number" name="price"/> <br/>
       Date: <input type="date" name="bid_date"/> <br/>
       Auction ID: <input type="number" name="auction_id"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
</body>
</html>