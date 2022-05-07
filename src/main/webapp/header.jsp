<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>
<%@ page import="java.sql.*"%>
<%
ApplicationDB db = new ApplicationDB();
Connection connection = db.getConnection();
Statement stmt = connection.createStatement();
String currentUser = (String) session.getAttribute("username");
String userType = (String) session.getAttribute("userType");
%>
<% if(currentUser == null){ %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="Landing.jsp">Buy Me</a>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="Login.jsp" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           Login 
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="AdminLogin.jsp">Admin Login</a>
          <a class="dropdown-item" href="CustomerRepLogin.jsp">Customer Rep Login</a>
          <a class="dropdown-item" href="Login.jsp">End-User Login</a>
        </div>
      </li>
 
      <li class="nav-item">
        <a class="nav-link" href="Register.jsp">Register</a>
      </li>
    </ul>
  </div>
</nav>
<% } else { %>
	<% if(userType.equals("admin")){ %>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="Landing.jsp">Buy Me</a>
	  <div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
		  <li class="nav-item">
			<a class="nav-link" href="SalesReport.jsp">Sales Report</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="CreateCustomerRep.jsp">Create Customer Rep</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="Logout.jsp">Log Out</a>
		  </li>
		</ul>
	  </div>
	</nav>	
	<% } else if(userType.equals("enduser")) { %>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="Landing.jsp">Buy Me</a>
	  <div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
		  <li class="nav-item">
			<a class="nav-link" href="CreateAuction.jsp">Create Auction</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="LiveAuctions.jsp">View Live Auctions</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="UserAskQuestion.jsp">Ask Question</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="UserViewQuestion.jsp">View Questions</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="Logout.jsp">Log Out</a>
		  </li>
		</ul>
	  </div>
	</nav>	
	<% } else if(userType.equals("customerrep")) { %>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="Landing.jsp">Buy Me</a>
	  <div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
		  <li class="nav-item">
			<a class="nav-link" href="BidAuctionManagement.jsp">Bid Auction Management</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="UserManagement.jsp">User Management</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="Logout.jsp">Log Out</a>
		  </li>
		</ul>
	  </div>
	</nav>	
	<% } %>
<% } %>
<div style="padding: 20px">