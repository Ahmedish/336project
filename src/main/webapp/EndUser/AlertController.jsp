<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alert Controller</title>
</head>
<body>
    <%@ page import ="java.sql.*" %>
    <%
    	String user_id = request.getParameter("user_id");
    	String auction_id = request.getParameter("auction_id");
    	String alert_id = request.getParameter("alert_id");
        
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
        System.out.println(alert_id);
       	if(alert_id.equals("null") == true) {
        	stmt.executeUpdate("INSERT INTO alert (user_id, auction_id) VALUES ('" +user_id+ "', '" +auction_id+ "');");
       	} else {
        	stmt.executeUpdate("DELETE FROM alert WHERE alert_id="+alert_id);
       		
       	}
       		
        response.sendRedirect("LiveAuctions.jsp");
        
        
    %>

</body>
</html>