<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bid Controller</title>
</head>
<body>
 <%@ page import ="java.sql.*" %>
    <%
        String auc_id = request.getParameter("auction_id");
    	String price = request.getParameter("price");
    	String bid_date = request.getParameter("bid_date");
    	String username = (String) session.getAttribute("user");
    	String bid_num = request.getParameter("bid_num");
    	
        
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
        
        stmt.executeUpdate("INSERT INTO bid VALUES ('" +username+ "', '" +price+ "', '" +bid_date+ "', '" +auc_id+ "', '" +bid_num+ "');");
        stmt.executeUpdate("UPDATE auction SET curr_price ='" + price + "', buyer_username ='" + username + "' WHERE auction_id =" + auc_id + ";");
        response.sendRedirect("LiveAuctions.jsp");
        
        
    %>
</body>
</html>