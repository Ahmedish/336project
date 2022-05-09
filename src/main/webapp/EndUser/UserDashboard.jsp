
<h2>My Live Auctions</h2>
<%
String username = (String) session.getAttribute("username");
String question = request.getParameter("question");
long millis = System.currentTimeMillis();
java.sql.Date curr = new java.sql.Date(millis);
ResultSet auctionCheck = stmt
		.executeQuery("SELECT * FROM auction JOIN item on item.item_id=auction.item_id WHERE seller_username = "
		+ user_id + " and close_date > " + "'" + curr + "'");
%>

<div style="display: flex; flex-wrap: wrap;">
	<%
	boolean isLiveOpen = false;
	while (auctionCheck.next()) {
		isLiveOpen = true;
		int id = auctionCheck.getInt("auction_id");
		int price = auctionCheck.getInt("curr_price");
		Date date = auctionCheck.getDate("close_date");
		int item_id = auctionCheck.getInt("item_id");
		int user = auctionCheck.getInt("seller_username");
		int increment = auctionCheck.getInt("increment");
		String src = auctionCheck.getString("image_url");
	%>
	<div class="card col-sm" style="margin: 10px; text-align: center; flex: 0 0 325px;">
		<img class="card-img-top" src=<%=src%> data-toggle="modal"
			data-target="#exampleModal<%=id%>">
		<div class="card-body">
			<h4 class="card-title">
				Auction
				<%=id%></h4>
			<p class="card-text">
				<strong>You are</strong> auctioning item number
				<%=item_id%>
				until
				<%=date%>
				for a current price of $<%=price%></p>
		</div>
	</div>
	<%
	}
	if (!isLiveOpen) {
	%>
	<p>No Current Live Auctions</p>
	<%
	}
	%>
</div>

<h2>My Previous Auctions</h2>
<div style="display: flex; flex-wrap: wrap;">
	<%
	ResultSet auctionCheck2 = stmt
			.executeQuery("SELECT * FROM auction JOIN item on auction.item_id=item.item_id WHERE seller_username = "
			+ user_id + " and close_date < " + "'" + curr + "'");
	boolean isOpen = false;
	while (auctionCheck2.next()) {
		isOpen = true;
		int id = auctionCheck2.getInt("auction_id");
		int price = auctionCheck2.getInt("curr_price");
		Date date = auctionCheck2.getDate("close_date");
		int item_id = auctionCheck2.getInt("item_id");
		int user = auctionCheck2.getInt("seller_username");
		int buyer_id = auctionCheck2.getInt("buyer_username");
		int increment = auctionCheck2.getInt("increment");
		String src = auctionCheck2.getString("image_url");
	%>
	<div class="card col-sm" style="margin: 10px; text-align: center; flex: 0 0 325px;">
		<img class="card-img-top" src=<%=src%> data-toggle="modal"
			data-target="#exampleModal<%=id%>">
		<div class="card-body">
			<h4 class="card-title">
				Auction
				<%=id%></h4>
			<p class="card-text">
				<strong>You were</strong> auctioning item number
				<%=item_id%>
				until
				<%=date%>
				when it closed at a price of $<%=price%>
				for user <strong><%=buyer_id%></strong>
			</p>
		</div>
		<%
		}
		if (!isOpen) {
		%>
		<p>No Past Auctions</p>
		<%
		}
		%>
	</div>

</div>
<div>
	<a class="btn btn-danger" href="<%=projectName%>/Logout.jsp">Log out</a> <a
		class="btn btn-success" href="<%=projectName%>/EndUser/CreateAuction.jsp">Create
		Auction</a> <a class="btn btn-primary" href="<%=projectName%>/EndUser/LiveAuctions.jsp">View
		Live Auctions</a> <a class="btn btn-primary"
		href="<%=projectName%>/EndUser/UserAskQuestion.jsp">Ask Question</a> <a
		class="btn btn-primary" href="<%=projectName%>/EndUser/UserViewQuestion.jsp">View
		Question</a>
</div>
	</div>
	<h2>My Bids</h2>
	<% 
		ResultSet bidCheck = stmt.executeQuery("SELECT * FROM bid where user_id = " +user_id+ ";");
		boolean hasBids = false;
		while (bidCheck.next()){
			hasBids = true;
			int bid_price = bidCheck.getInt("price");
			Date bid_date = bidCheck.getDate("bid_date");
			int auction_id = bidCheck.getInt("auction_id");
			out.println("<p>You bid $" +bid_price+ " on " +bid_date+ " for auction #" +auction_id+ "</p>");
		}
		if (!hasBids) {
			out.println("No Past Bids");
		}
		
	%>
