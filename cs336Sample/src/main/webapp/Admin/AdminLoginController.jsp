<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Login Controller</title>
</head>
<body>
	<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("Username");   
    String pass = request.getParameter("Password");
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet rs1;
    rs1 = stmt.executeQuery("select * from admin_users where username='" + userid + "'");
    if (rs1.next()){
    	 ResultSet rs2;
    	    rs2 = stmt.executeQuery("select * from admin_users where username='" + userid + "' and password='" + pass + "'");
    	    if (rs2.next()) {
    	    	session.setAttribute("user", userid); // the username will be stored in the session
    	    	session.setAttribute("isAdmin", true);
    	        response.sendRedirect("/cs336Sample/Landing.jsp");
    	    } else {
    	    	out.println("Username doesn't exist <a href= 'Register.jsp'>Create An Admin Account</a>");
    	    }
    }
    else{
    	out.println("Username doesn't exist");
    }
%>

</body>
</html>