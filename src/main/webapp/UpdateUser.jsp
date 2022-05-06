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
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	String id = request.getParameter("id");
    	
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
		stmt.executeUpdate("UPDATE users SET username='"+username+"', password='"+password+"' where user_id='"+id+"'");
		response.sendRedirect("UserManagement.jsp");
        
        
    %>

</body>
</html>