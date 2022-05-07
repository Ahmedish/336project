<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Live Auctions</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ include file="/header.jsp"%>
	<h1>Live Auctions</h1>
	<form action="LiveAuctions.jsp" action="POST">
		<div class="input-group">
		  <input name="search" type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
		  <button type="submit" class="btn btn-outline-primary">search</button>
		</div>
	</form>

	<%
	ResultSet auctionCheck;
	long millis = System.currentTimeMillis();
	java.sql.Date curr = new java.sql.Date(millis);
	String search = request.getParameter("search");
	if(search == null){
		auctionCheck = stmt
				.executeQuery("SELECT * FROM auction JOIN users on users.user_id=auction.seller_username WHERE close_date > "
				+ "'" + curr + "'");
	} else {
		auctionCheck = stmt
				.executeQuery("SELECT * FROM auction JOIN users on users.user_id=auction.seller_username JOIN item on item.item_id=auction.item_id WHERE close_date > "
				+ "'" + curr + "' AND item_type LIKE '%" + search + "%'");
		
	}
	System.out.println(search);
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
			String username = auctionCheck.getString("username");
			String src = "";
			if (item_id == 9987){
				src= "https://cdn.lookastic.com/mint-skinny-jeans/asos-skinny-jeans-in-light-green-medium-171909.jpg";
			} else if (item_id == 9988) {
				src = "https://images.riverisland.com/is/image/RiverIsland/blue-skinny-fit-jeans_306663_main";
			} else if (item_id == 1234) {
				src = "https://cdna.lystit.com/photos/2013/12/03/asos-red-super-skinny-jean-product-1-15797925-562278835.jpeg";
			} else {
				src = "https://cdna.lystit.com/photos/2013/09/27/asos-mustard-super-skinny-jean-product-1-13733690-930198097.jpeg";
			}
		%>
		<div class="card col-sm" style="margin: 10px; text-align: center; width: 400px">
			<img class="card-img-top" src=<%=src%>>
			<div class="card-body">
				<h4 class="card-title">
					Auction
					<%=id%></h4>
				<p class="card-text">
					<strong><%=currentUser.equals(username) ? "You are" : username + " is"%></strong>
					auctioning item number
					<%=item_id%>
					until
					<%=date%>
					for a current price of $<%=price%></p>
				<%
				if (currentUser != null && !username.equals(currentUser)) {
				%>
				<form action="BidController.jsp" method="POST">
					<div class="input-group ">
						<input type="number" value=<%=price%> class="form-control" step=<%=increment%>
							placeholder="Recipient's username" aria-label="Price"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="submit">Bid</button>
						</div>
					</div>
				</form>
				<%
				}
				%>
			</div>
		</div>
		<%
		}
		%>
		</div>
		<%@ include file="/footer.jsp"%>
</body>
</html>