<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ include file="/header.jsp"%>

	<%
	String userid = request.getParameter("Username");
	String pass = request.getParameter("Password");

	ResultSet rs1;
	rs1 = stmt.executeQuery("select * from users where username='" + userid + "'");
	if (rs1.next()) {
		ResultSet rs2;
		rs2 = stmt.executeQuery("select * from users where username='" + userid + "' and password='" + pass + "'");
		if (rs2.next()) {
			int id = rs2.getInt("user_id");
			session.setAttribute("user", id); // the username will be stored in the session
			session.setAttribute("username", userid); // the username will be stored in the session
			session.setAttribute("userType", "enduser"); // the username will be stored in the session
			response.sendRedirect(projectName + "/Landing.jsp");
		} else {
			response.sendRedirect("Login.jsp");
		}
	} else {
		out.println("Username doesn't exist <br /><a href='Register.jsp'>Create An Account</a>");
	}
	%>

</body>
</html>