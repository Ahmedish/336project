<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Auction Controller</title>
</head>
<body>
    <%@ page import ="java.sql.*" %>
    <%
    	String price = request.getParameter("price");
    	String auction_id = request.getParameter("auction_id");
    	int username = (int) session.getAttribute("user");
    	long millis = System.currentTimeMillis();
    	java.sql.Date curr = new java.sql.Date(millis);
	
        
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
        
        stmt.executeUpdate("INSERT INTO bid (user_id, price, bid_date, auction_id) VALUES ('" +username+ "', '" +price+ "', '" +curr+ "', '" +auction_id + "');");
        stmt.executeUpdate("UPDATE auction SET buyer_username='"+username+"', curr_price='"+price+"' WHERE auction_id='"+auction_id+"'");
        response.sendRedirect("LiveAuctions.jsp");
        
        
    %>

</body>
</html>