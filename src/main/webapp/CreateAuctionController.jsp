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
        String auc_id = request.getParameter("id");
    	String init_price = request.getParameter("init_price");
    	String min_price = request.getParameter("min_price");
    	String increment = request.getParameter("increment");
    	String close_date = request.getParameter("close_date");
    	String item_id = request.getParameter("item_id");
    	String username = (String) session.getAttribute("user");
    	
        
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
        
        stmt.executeUpdate("INSERT INTO auction VALUES ('" +auc_id+ "', '" +init_price+ "', '" +min_price+ "', '" +increment+ "', '" +close_date+ "', '" +item_id+ "', '" +username+ "');");
        response.sendRedirect("LiveAuctions.jsp");
        
        
    %>

</body>
</html>