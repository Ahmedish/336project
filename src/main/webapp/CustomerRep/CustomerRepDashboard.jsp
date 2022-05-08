
<h1 style="margin: 10px 0px;">Welcome Customer Rep!</h1>
<h3 style="margin: 30px 0px;">Current Questions</h3>
<div>
	<%
	ResultSet customerRep = stmt.executeQuery("SELECT * FROM questions");
	while (customerRep.next()) {
		String user = customerRep.getString("username");
		String question = customerRep.getString("question");
		String id = customerRep.getString("question_id");
		String answer = customerRep.getString("answer");
	%>
	<div class="card" style="margin-top: 10px">
		<div class="card-body">
			<h5 class="card-title"><%=question%>
				~
				<%=user%></h5>
			<p class="card-text"><%=answer.equals(" ") ? "No Answer" : answer%></p>
			<a btn btn-primary href='<%=projectName%>/CustomerRep/CustomerRepReply.jsp?question_id=<%=id%>'>Reply</a>
		</div>
	</div>
	<%
	}
	%>
</div>
<div style="margin: 30px 0px;">
	<a class="btn btn-success" href="<%=projectName%>/CustomerRep/BidAuctionManagement.jsp">Bid And Auction Management</a>
	<a class="btn btn-success" href="<%=projectName%>/CustomerRep/UserManagement.jsp">User Management</a> <a
		class="btn btn-danger" href="Logout.jsp">Log out</a>
</div>