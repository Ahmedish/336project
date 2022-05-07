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
    	String answer = request.getParameter("answer");
    	String id = request.getParameter("question_id");
    	
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
		stmt.executeUpdate("UPDATE questions SET answer='"+answer+"' where question_id='"+id+"'");
		response.sendRedirect("CustomerRepDashboard.jsp");
        
        
    %>

</body>
</html>