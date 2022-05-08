<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>
<%@ page import="java.sql.*"%>
<%
ApplicationDB db = new ApplicationDB();
Connection connection = db.getConnection();
Statement stmt = connection.createStatement();
String currentUser = (String) session.getAttribute("username");
String userType = (String) session.getAttribute("userType");
String projectName = "/cs336Sample";
%>
<% if(currentUser == null){ %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="<%=projectName%>/Landing.jsp">Buy Me</a>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="Login.jsp" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           Login 
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="<%=projectName%>/Admin/AdminLogin.jsp">Admin Login</a>
          <a class="dropdown-item" href="<%=projectName%>/CustomerRep/CustomerRepLogin.jsp">Customer Rep Login</a>
          <a class="dropdown-item" href="<%=projectName%>/EndUser/Login.jsp">End-User Login</a>
        </div>
      </li>
 
      <li class="nav-item">
        <a class="nav-link" href="<%=projectName%>/EndUser/Register.jsp">Register</a>
      </li>
    </ul>
  </div>
</nav>
<% } else { %>
	<% if(userType.equals("admin")){ %>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="<%=projectName%>/Landing.jsp">Buy Me</a>
	  <div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
		  <li class="nav-item">
			<a class="nav-link" href="<%=projectName%>/Admin/SalesReport.jsp">Sales Report</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="<%=projectName%>/Admin/CreateCustomerRep.jsp">Create Customer Rep</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="<%=projectName%>/Logout.jsp">Log Out</a>
		  </li>
		</ul>
	  </div>
	</nav>	
	<% } else if(userType.equals("enduser")) { %>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="<%=projectName%>/Landing.jsp">Buy Me</a>
	  <div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
		  <li class="nav-item">
			<a class="nav-link" href="<%=projectName%>/EndUser/CreateAuction.jsp">Create Auction</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="<%=projectName%>/EndUser/LiveAuctions.jsp">View Live Auctions</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="<%=projectName%>/EndUser/UserAskQuestion.jsp">Ask Question</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="<%=projectName%>/EndUser/UserViewQuestion.jsp">View Questions</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="<%=projectName%>/Logout.jsp">Log Out</a>
		  </li>
		</ul>
	  </div>
	</nav>	
	<% } else if(userType.equals("customerrep")) { %>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="<%=projectName%>/Landing.jsp">Buy Me</a>
	  <div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
		  <li class="nav-item">
			<a class="nav-link" href="<%=projectName%>/CustomerRep/BidAuctionManagement.jsp">Bid Auction Management</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="<%=projectName%>/CustomerRep/UserManagement.jsp">User Management</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="<%=projectName%>/Logout.jsp">Log Out</a>
		  </li>
		</ul>
	  </div>
	</nav>	
	<% } %>
<% } %>
<div style="padding: 20px">