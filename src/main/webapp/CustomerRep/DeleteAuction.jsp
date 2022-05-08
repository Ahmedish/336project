<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Auction</title>
</head>
<body>
    <%@ page import ="java.sql.*" %>
    <%
    	String username = request.getParameter("username");
    	String id = request.getParameter("auction_id");
    	
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
		stmt.executeUpdate("DELETE FROM auction WHERE auction_id='"+id+"'");
		response.sendRedirect("BidAuctionManagement.jsp");
        
        
    %>

</body>
</html>