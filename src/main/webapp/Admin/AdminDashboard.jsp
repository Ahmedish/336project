
<h1>Welcome Admin!</h1>
<h3>Current Customer Representatives</h3>
<ul>
	<%
	ResultSet customerRep = stmt.executeQuery("SELECT username FROM customer_rep_users");
	while (customerRep.next()) {
		String user = customerRep.getString("username");
		out.println("<li><h6>" + user + "</h6></li>");
	}
	%>
</ul>
<a class="btn btn-primary" href="SalesReport.jsp">View Sales Report</a>
<a class="btn btn-success" href="CreateCustomerRep.jsp">Create Customer Rep</a>
<a class="btn btn-danger" href="Logout.jsp">Log out</a>
