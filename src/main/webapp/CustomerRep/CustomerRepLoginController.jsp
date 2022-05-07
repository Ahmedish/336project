<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Rep Login Controller</title>
</head>
<body>
	<%@ page import ="java.sql.*" %>
	<%@ include file="/header.jsp"%>
<%
    String userid = request.getParameter("Username");   
    String pass = request.getParameter("Password");
    
    ResultSet rs1;
    rs1 = stmt.executeQuery("select * from customer_rep_users where username='" + userid + "'");
    if (rs1.next()){
    	 ResultSet rs2;
    	    rs2 = stmt.executeQuery("select * from customer_rep_users where username='" + userid + "' and password='" + pass + "'");
    	    if (rs2.next()) {
    	    	session.setAttribute("username", userid); // the username will be stored in the session
    	    	session.setAttribute("userType", "customerrep"); // the username will be stored in the session
    	        response.sendRedirect(projectName+"/Landing.jsp");
    	    } else {
    	    	out.println("Username doesn't exist <a href= 'Landing.jsp'>Go To Landing</a>");
    	    }
    }
    else{
    	out.println("Username doesn't exist");
    }
%>

</body>
</html>