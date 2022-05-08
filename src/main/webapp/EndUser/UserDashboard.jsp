<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard</title>

</head>
<body>
	<%@ include file="/header.jsp"%>
	<h1>Live Auctions</h1>
	<%
	String username = (String) session.getAttribute("username");
	int user_id = (int) session.getAttribute("user");
	String question = request.getParameter("question");
	long millis = System.currentTimeMillis();
	java.sql.Date curr = new java.sql.Date(millis);
	ResultSet auctionCheck = stmt.executeQuery("SELECT * FROM auction WHERE seller_username = " +user_id+ " and close_date > " + "'" +curr+ "'");
	%>

	<div style="display: flex; flex-wrap: wrap;">
		<%
		while (auctionCheck.next()) {
			int id = auctionCheck.getInt("auction_id");
			int price = auctionCheck.getInt("curr_price");
			Date date = auctionCheck.getDate("close_date");
			int item_id = auctionCheck.getInt("item_id");
			int user = auctionCheck.getInt("seller_username");
			int increment = auctionCheck.getInt("increment");
			String src = "";
			if (item_id == 1) {
				src = "https://cdn.lookastic.com/mint-skinny-jeans/asos-skinny-jeans-in-light-green-medium-171909.jpg";
			} else if (item_id == 2) {
				src = "https://images.riverisland.com/is/image/RiverIsland/blue-skinny-fit-jeans_306663_main";
			} else if (item_id == 3) {
				src = "https://cdna.lystit.com/photos/2013/12/03/asos-red-super-skinny-jean-product-1-15797925-562278835.jpeg";
			} else {
				src = "https://cdna.lystit.com/photos/2013/09/27/asos-mustard-super-skinny-jean-product-1-13733690-930198097.jpeg";
			}
		%>
		<div class="card col-sm" style="margin: 10px; text-align: center; flex: 0 0 325px;" >
			<img class="card-img-top" src=<%=src%> data-toggle="modal" data-target="#exampleModal<%=id%>">
			<div class="card-body">
				<h4 class="card-title">
					Auction
					<%=id%></h4>
				<p class="card-text">
					<strong>You are</strong>
					auctioning item number
					<%=item_id%>
					until
					<%=date%>
					for a current price of $<%=price%></p>
			</div>
		</div>
		<%
				}
				%>
		</div>
	
	<h1>Previous Auctions</h1>
	<div style="display: flex; flex-wrap: wrap;">
		<%
		ResultSet auctionCheck2 = stmt.executeQuery("SELECT * FROM auction WHERE seller_username = " +user_id+ " and close_date < " + "'" +curr+ "'");
		while (auctionCheck2.next()) {
			int id = auctionCheck2.getInt("auction_id");
			int price = auctionCheck2.getInt("curr_price");
			Date date = auctionCheck2.getDate("close_date");
			int item_id = auctionCheck2.getInt("item_id");
			int user = auctionCheck2.getInt("seller_username");
			int buyer_id = auctionCheck2.getInt("buyer_username");
			int increment = auctionCheck2.getInt("increment");
			String src = "";
			if (item_id == 1) {
				src = "https://cdn.lookastic.com/mint-skinny-jeans/asos-skinny-jeans-in-light-green-medium-171909.jpg";
			} else if (item_id == 2) {
				src = "https://images.riverisland.com/is/image/RiverIsland/blue-skinny-fit-jeans_306663_main";
			} else if (item_id == 3) {
				src = "https://cdna.lystit.com/photos/2013/12/03/asos-red-super-skinny-jean-product-1-15797925-562278835.jpeg";
			} else {
				src = "https://cdna.lystit.com/photos/2013/09/27/asos-mustard-super-skinny-jean-product-1-13733690-930198097.jpeg";
			}
		%>
		<div class="card col-sm" style="margin: 10px; text-align: center; flex: 0 0 325px;" >
			<img class="card-img-top" src=<%=src%> data-toggle="modal" data-target="#exampleModal<%=id%>">
			<div class="card-body">
				<h4 class="card-title">
					Auction
					<%=id%></h4>
				<p class="card-text">
					<strong>You were</strong>
					auctioning item number
					<%=item_id%>
					until
					<%=date%>
					when it closed at a price of $<%=price%> for user <strong><%=buyer_id%></strong></p>
			</div>
			<%
				}
				%>
		</div>
		</div>
	
	
	
	<%@ include file="/footer.jsp"%>

</body>
</html>