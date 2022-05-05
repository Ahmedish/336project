<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Sales Report</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
    <%
        
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
        
        long millis = System.currentTimeMillis();
        
        java.sql.Date curr = new java.sql.Date(millis);
        ResultSet totalEarningsResult = stmt.executeQuery("SELECT sum(init_price) as totalEarnings from auction WHERE close_date < " + "'" + curr + "'");
        out.println("<h1>Sales Report</h1>");
       	if(totalEarningsResult.next()){
			int totalEarnings = totalEarningsResult.getInt("totalEarnings");
			out.println("<h2>Total Earnings: " + totalEarnings + "</h2>");
       	}
		
		out.println("<br />");	
 		// Select the sum of the item_id's auction price 
        ResultSet earningsPerResult = stmt.executeQuery("SELECT seller_username as end_user, sum(curr_price) as sumPrices FROM auction GROUP BY seller_username");
        while (earningsPerResult.next()) {
//         	String item = earningsPerResult.getString("item");
        	int sumPrices = earningsPerResult.getInt("sumPrices");
 //       	String itemType = earningsPerResult.getString("item_type");
        	String user = earningsPerResult.getString("end_user");
//         	out.println("<h2>Item: " +item+ "</h2>");
 //       	out.println("<h3>Item Type: " +itemType+ "</h3>");
         	out.println("<p>From: " +user+ "</p>");
        	out.println("<p>Price: " +sumPrices+ "</p>");
        }
        // From the earnings per reuslt get the best seller
        ResultSet bestSeller = stmt.executeQuery("SELECT seller_username, sum(curr_price) FROM auction GROUP BY seller_username ORDER BY sum(curr_price) DESC LIMIT 1");
        
       	if(bestSeller.next()){
	        out.println("<h2>Best Seller: " +bestSeller.getString("seller_username")+ "</h2>");
       	} else {
       		out.println("<h2>No Best Seller</h2>");
       	}

        // From the earnings per result get the best user
        ResultSet bestBuyer = stmt.executeQuery("SELECT buyer_username, sum(curr_price) FROM auction GROUP BY buyer_username ORDER BY sum(curr_price) DESC LIMIT 1");
       	if(bestBuyer.next()){
        	out.println("<h2>Best Buyer: " +bestBuyer.getString("buyer_username")+ "</h2>");
       	} else {
       		out.println("<h2>No Best Buyer</h2>");
       	}
         %>
	</body>
</html>