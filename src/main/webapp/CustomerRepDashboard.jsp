<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<%
    if ((session.getAttribute("user") == null)) response.sendRedirect("Landing.jsp");
%>
<h1>Welcome Customer Rep!</h1>
<%@ page import ="java.sql.*" %>
<a class="btn btn-success" href="SalesReport.jsp">Bid And Auction Management</a>
<a class="btn btn-success" href="CreateCustomerRep.jsp">User Management</a>
<a class="btn btn-danger" href="Logout.jsp">Log out</a>
<h3>Current Questions</h3>
<ul>
<%
        ApplicationDB db = new ApplicationDB();    
        Connection connection = db.getConnection();    
        Statement stmt = connection.createStatement();
        ResultSet customerRep = stmt.executeQuery("SELECT * FROM questions");
        while (customerRep.next()) {
        	String user = customerRep.getString("username");
        	String question = customerRep.getString("question");
        	String id = customerRep.getString("question_id");
        	String answer = customerRep.getString("answer");
        	out.println("<h5>"+ question + "</h5");
         	out.println("<h6>from " +user+ "</h6><br />");
         	out.println("<strong>" +answer+ "</strong><br />");
         	out.println("<a href='CustomerRepReply.jsp?question_id="+id+"'>Reply</a>");
        }

%>
</ul>
</body>
</html>