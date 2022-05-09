<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Title</title>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%
	ResultSet userCheck;
	String user = request.getParameter("search");
	userCheck = stmt.executeQuery("SELECT * FROM users WHERE username = '" +user+ "';");
	if (userCheck.next()){
	String id = userCheck.getString("user_id");
	long millis = System.currentTimeMillis();
	java.sql.Date curr = new java.sql.Date(millis);
	%>
	<h1><%=user%>'s History</h1><br>
	<h2>Live Auctions</h2>
	<div style="display: flex; flex-wrap: wrap; ">
		<%
		ResultSet auctionCheck = stmt
				.executeQuery("SELECT * FROM auction JOIN item on auction.item_id=item.item_id WHERE seller_username = "
				+ id + " and close_date > " + "'" + curr + "'");
		boolean isLiveOpen = false;
		while (auctionCheck.next()) {
			isLiveOpen = true;
			int auc_id = auctionCheck.getInt("auction_id");
			int price = auctionCheck.getInt("curr_price");
			Date date = auctionCheck.getDate("close_date");
			int item_id = auctionCheck.getInt("item_id");
			int buyer_id = auctionCheck.getInt("buyer_username");
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
					<strong><%=user%> is</strong> auctioning item number
					<%=item_id%>
					until
					<%=date%>
					at a current price of $<%=price%>
				</p>
			</div>
			</div>
			<%
			}
			if (!isLiveOpen) {
			%>
			<p>No Live Auctions</p>
			<%
			}
			%>
		</div>
	
	
	
	
	<h2>Previous Auctions</h2>
	<div style="display: flex; flex-wrap: wrap; ">
		<%
		ResultSet auctionCheck2 = stmt
				.executeQuery("SELECT * FROM auction JOIN item on auction.item_id=item.item_id WHERE seller_username = "
				+ id + " and close_date < " + "'" + curr + "'");
		boolean isOpen = false;
		while (auctionCheck2.next()) {
			isOpen = true;
			int auc_id = auctionCheck2.getInt("auction_id");
			int price = auctionCheck2.getInt("curr_price");
			Date date = auctionCheck2.getDate("close_date");
			int item_id = auctionCheck2.getInt("item_id");
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
					<strong><%=user%> was</strong> auctioning item number
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
		<h2>Bid History</h2>
		<% 
			ResultSet bidCheck = stmt.executeQuery("SELECT * FROM bid where user_id = " +id+ ";");
			boolean hasBids = false;
			while (bidCheck.next()){
				hasBids = true;
				int bid_price = bidCheck.getInt("price");
				Date bid_date = bidCheck.getDate("bid_date");
				int auction_id = bidCheck.getInt("auction_id");
				out.println("<p>" +user+ " bid $" +bid_price+ " on " +bid_date+ " for auction #" +auction_id+ "</p>");
			}
			if (!hasBids) {
				out.println("No Past Bids");
			}
	} else {
		out.println("<h1>No users found</h1>");
	}	
		%>
	
	<%@ include file="/footer.jsp"%>
</body>
</html>