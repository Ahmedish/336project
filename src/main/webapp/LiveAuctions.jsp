<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
    <%
        
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
        ResultSet auctionCheck;
        auctionCheck = stmt.executeQuery("SELECT * FROM auction");
        while (auctionCheck.next()) {
        	int id = auctionCheck.getInt("auction_id");
        	out.println(id);
        }
        %>
</body>
</html>