
<h1>Welcome Customer Rep!</h1>
<a class="btn btn-success" href="BidAuctionManagement.jsp">Bid And Auction Management</a>
<a class="btn btn-success" href="UserManagement.jsp">User Management</a>
<a class="btn btn-danger" href="Logout.jsp">Log out</a>
<h3>Current Questions</h3>
<ul>
	<%
	ResultSet customerRep = stmt.executeQuery("SELECT * FROM questions");
	while (customerRep.next()) {
		String user = customerRep.getString("username");
		String question = customerRep.getString("question");
		String id = customerRep.getString("question_id");
		String answer = customerRep.getString("answer");
		out.println("<div style='border: 2px solid #000000; padding: 20px; margin: 10px; width: 500px;'>");
		out.println("<h5>" + question + "</h5");
		out.println("<h6>from " + user + "</h6><br />");
		out.println("<strong>" + answer + "</strong><br />");
		out.println("<a href='CustomerRepReply.jsp?question_id=" + id + "'>Reply</a>");
		out.println("</div>");
	}
	%>
</ul>
