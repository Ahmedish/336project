<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
        auctionCheck = stmt.executeQuery("SELECT * FROM auction JOIN users on users.user_id=auction.seller_username WHERE close_date > " + "'" + curr + "'");
        out.println("<h1>Live Auctions</h1>");
        while (auctionCheck.next()) {
        	int id = auctionCheck.getInt("auction_id");
        	int price = auctionCheck.getInt("curr_price");
        	Date date = auctionCheck.getDate("close_date");
        	int item_id = auctionCheck.getInt("item_id");
        	int user = auctionCheck.getInt("seller_username");
        	String username = auctionCheck.getString("username");
        	out.println("<div><h2>Auction " +id+ "</h2>");

        	out.println("<p>" +username+ " is auctioning item number " +item_id+ " until " +date+ " for a current price of $" +price+ "</p></div>");
        	String src = "";
        	if (item_id == 9987){
        		src = "https://cdn.lookastic.com/mint-skinny-jeans/asos-skinny-jeans-in-light-green-medium-171909.jpg";
        	} else if (item_id == 9988){
        		src = "https://images.riverisland.com/is/image/RiverIsland/blue-skinny-fit-jeans_306663_main";
        	} else if (item_id == 1234) {
        		src = "https://cdna.lystit.com/photos/2013/12/03/asos-red-super-skinny-jean-product-1-15797925-562278835.jpeg";
        	} else {
        		src = "https://cdna.lystit.com/photos/2013/09/27/asos-mustard-super-skinny-jean-product-1-13733690-930198097.jpeg";
        	}
        	out.println("<img src= \"" +src+ " \"width = \"300px\">");
        }
        %>
</body>
</html>