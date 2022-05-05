<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Controller</title>
</head>
<body>
    <%@ page import ="java.sql.*" %>
    <%
        String userid = request.getParameter("Username");   
        String pass = request.getParameter("Password");
        
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
        ResultSet userCheck;
        userCheck = stmt.executeQuery("SELECT * FROM customer_rep_users WHERE username='" + userid + "'");
        if (userCheck.next()){
            out.println("Customer Rep Already Exists <a href='CreateCustomerRep.jsp'>New One<a>");
        }
        else{
            stmt.executeUpdate("INSERT INTO customer_rep_users VALUES ('" +userid+ "', '" +pass+ "');");
            response.sendRedirect("Landing.jsp");
        }
    %>

</body>
</html>