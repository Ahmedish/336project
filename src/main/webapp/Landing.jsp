<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
	<%@ page import="java.sql.*"%>

	<%@ include file="/header.jsp"%>

	<%
	if ((session.getAttribute("username") == null)) {
	%>
	<h1>You Are Not Logged In</h1>
	<br />
	<a class="btn btn-primary" href="<%=projectName%>/EndUser/Login.jsp">End-User Login</a>
	<a class="btn btn-primary" href="<%=projectName%>/CustomerRep/CustomerRepLogin.jsp">Customer Rep Login</a>
	<a class="btn btn-primary" href="<%=projectName%>/Admin/AdminLogin.jsp">Admin Login</a>
	<a class="btn btn-primary" href="<%=projectName%>/EndUser/Register.jsp">Register</a>
	<%
	} else {
	%>

	<%-- 	
		<%
			ResultSet  user = stmt.executeQuery("SELECT * FROM users WHERE user_id='" + session.getAttribute("user") + "'");
		%>
		<%
			if (user.next()) {
				out.println("<h1>Welcome " + user.getString("username") + "</h1>");
			}
		%>
 	--%>
	<%
	if (userType.equals("admin")) {
	%>
	<%@ include file="/Admin/AdminDashboard.jsp"%>
	<%
	} else if (userType.equals("enduser")) {
	%>
	<h1 style="margin: 20px 0px">Welcome <%=currentUser%>!</h1>
	<div>
	<a class="btn btn-danger" href="<%=projectName%>/Logout.jsp">Log out</a>
	<a class="btn btn-success" href="<%=projectName%>/EndUser/CreateAuction.jsp">Create Auction</a>
	<a class="btn btn-primary" href="<%=projectName%>/EndUser/LiveAuctions.jsp">View Live Auctions</a>
	<a class="btn btn-primary" href="<%=projectName%>/EndUser/UserAskQuestion.jsp">Ask Question</a>
	<a class="btn btn-primary" href="<%=projectName%>/EndUser/UserViewQuestion.jsp">View Question</a>
	<a class="btn btn-primary" href="<%=projectName%>/EndUser/ViewHistory.jsp">View History</a>
	</div>
	<br>
	<%@ include file="/EndUser/UserDashboard.jsp"%>
	<%
	} else if (userType.equals("customerrep")) {
	%>
	<%@ include file="/CustomerRep/CustomerRepDashboard.jsp"%>
	<%
	}
	%>
	<%
	}
	%>
	<%@ include file="/footer.jsp"%>
</body>
</html>