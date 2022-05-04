<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Live Auctions</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
    <%
        
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
        ResultSet auctionCheck;
        long millis = System.currentTimeMillis();
        java.sql.Date curr = new java.sql.Date(millis);
        auctionCheck = stmt.executeQuery("SELECT * FROM auction WHERE  close_date > " + "'" + curr + "'");
        out.println("<h1>Live Auctions</h1>");
        while (auctionCheck.next()) {
        	int id = auctionCheck.getInt("auction_id");
        	int price = auctionCheck.getInt("init_price");
        	Date date = auctionCheck.getDate("close_date");
        	int item_id = auctionCheck.getInt("item_id");
        	String user = auctionCheck.getString("seller_username");
        	out.println("<h2>Auction " +id+ "</h2>");
        	out.println("<p>" +user+ " is selling item number " +item_id+ " until " +date+ " for the price of $" +price+ "</p>");
        }
        %>
</body>
</html>