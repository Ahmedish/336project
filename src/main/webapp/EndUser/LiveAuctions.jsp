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
	<%@ page import="java.util.HashMap"%>
	<%@ page import="java.util.ArrayList"%>
	<%@ page import="java.util.List"%>
	<%@ include file="/header.jsp"%>
	<script type="text/javascript">
		
	</script>
	<h1>Live Auctions</h1>
	<form action="LiveAuctions.jsp" action="POST">
		<div class="input-group">
			<input name="search" type="search" class="form-control rounded" placeholder="Search"
				aria-label="Search" aria-describedby="search-addon" />
			<button type="submit" class="btn btn-outline-primary">search</button>
		</div>

	</form>
	<div class="btn-group" style="margin: 20px 0px">
		<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false">Sort By</button>
		<div class="dropdown-menu">
			<form action="LiveAuctions.jsp?sortby=item_type" action="POST">
				<button type="submit" class="dropdown-item"
					onClick='localStorage.setItem("sort", "Name")'>Name</button>
			</form>
			<form action="LiveAuctions.jsp?sortby=auction_id" action="POST">
				<button type="submit" class="dropdown-item"
					onClick='localStorage.setItem("sort", "ID")'>ID</button>
			</form>
			<form action="LiveAuctions.jsp?sortby=curr_price" action="POST">
				<button type="submit" class="dropdown-item"
					onClick='localStorage.setItem("sort", "Price")'>Price</button>

			</form>
			<form action="LiveAuctions.jsp?sortby=close_date" action="POST">
				<button type="submit" class="dropdown-item"
					onClick='localStorage.setItem("sort", "Date")'>Date</button>
			</form>
		</div>
	</div>

	<%
	final class BidClass {
		String username;
		String price;
		Date date;

		public BidClass(String username, String price, Date date) {
			this.username = username;
			this.price = price;
			this.date = date;
		}
	}
	
	HashMap<Integer, List<BidClass>> auctionToBids = new HashMap<Integer, List<BidClass>>();
	HashMap<Integer, Integer> auctionsToAlerts = new HashMap<Integer, Integer>();
	ResultSet bids = stmt.executeQuery("SELECT * FROM bid JOIN users on users.user_id=bid.user_id ORDER BY auction_id");
	while (bids.next()) {
		int aid = bids.getInt("auction_id");
		String username = bids.getString("username");
		String price = Integer.toString(bids.getInt("price"));
		Date date = bids.getDate("bid_date");
		BidClass b = new BidClass(username, price, date);
		if (auctionToBids.containsKey(aid)) {
			auctionToBids.get(aid).add(b);
		} else {
			List<BidClass> newBidList = new ArrayList<BidClass>();
			newBidList.add(b);
			auctionToBids.put(aid, newBidList);
		}
	}
	ResultSet alertsQuery = stmt.executeQuery("SELECT * FROM alert WHERE user_id='"+user_id+"'");
	while(alertsQuery.next()){
		int aid = alertsQuery.getInt("auction_id");
		auctionsToAlerts.put(aid, alertsQuery.getInt("alert_id"));
	}
	ResultSet auctionCheck;
	long millis = System.currentTimeMillis();
	java.sql.Date curr = new java.sql.Date(millis);
	String search = request.getParameter("search");
	String sortby = request.getParameter("sortby");
	if (search == null) {
		auctionCheck = stmt.executeQuery(
		"SELECT * FROM auction JOIN users on users.user_id=auction.seller_username JOIN item on item.item_id=auction.item_id WHERE close_date > "
				+ "'" + curr + "' ORDER BY " + sortby);
	} else {
		auctionCheck = stmt.executeQuery(
		"SELECT * FROM auction JOIN users on users.user_id=auction.seller_username JOIN item on item.item_id=auction.item_id WHERE close_date > "
				+ "'" + curr + "' AND (item_type LIKE '%" + search + "%' OR fit LIKE '%" + search
				+ "%' OR color LIKE '%" + search + "%' OR size LIKE '%" + search + "%')");

	}
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
			String src = auctionCheck.getString("image_url");
		%>
		<div class="card col-sm" style="margin: 10px; text-align: center; flex: 0 0 325px;">
			<img class="card-img-top" src=<%=src%> data-toggle="modal"
				data-target="#exampleModal<%=id%>"
				style="object-fit: contain; width: 100%; height: 200px;">
			<div class="card-body">
				<h4 class="card-title">
					Auction
					<%=id%></h4>
				<p class="card-text">
					<strong><%=username.equals(currentUser) ? "You are" : username + " is"%></strong>
					auctioning item number
					<%=item_id%>
					until
					<%=date%>
					for a current price of $<%=price%></p>
				<%
				if (currentUser != null && !username.equals(currentUser)) {
				%>
				<form action="BidController.jsp?auction_id=<%=id%>" method="POST" style="margin-bottom: 10px">
					<div class="input-group ">
						<input type="number" value=<%=price%> class="form-control" step=<%=increment%>
							placeholder="Recipient's username" aria-label="Price" name="price"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="submit">Bid</button>
						</div>
					</div>
				</form>
				<% %>
				<form action="AlertController.jsp?auction_id=<%=id%>&user_id=<%=user_id%>&alert_id=<%=auctionsToAlerts.get(id)%>" method="POST">
					<div class="input-group ">
						<div class="input-group-append">
							<button class="btn btn-danger" type="submit"><%=auctionsToAlerts.get(id) == null?"Alert":"Unalert" %></button>
						</div>
					</div>
				</form>
				<%
				}
				%>
			</div>
		</div>
		<div class="modal fade" id="exampleModal<%=id%>" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">
							Auction
							<%=id%>
							Information
						</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<%
						if (currentUser != null && !username.equals(currentUser)) {
						%>
						<h4>Max Autobid</h4>
						<form action="AutobidController.jsp?auction_id=<%=id%>&user_id=<%=user_id%>"
							method="POST" style="margin: 20px 0px;">
								<input type="number" value=<%=price%> class="form-control" step=<%=increment%>
									placeholder="Autobid Max" aria-label="Price" name="maxPrice">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="submit">Autobid</button>
								</div>
						</form>
						<%
						}
						%>
						<h4>Bid History</h4>
						<%
						if (auctionToBids.get(id) != null) {
						%>
						<%
						for (BidClass b : auctionToBids.get(id)) {
						%>
						<p><%=b.username%>
							bid $<%=b.price%>
							on
							<%=b.date%></p>
						<%
						}
						%>
						<%
						} else {
						%>
						<p>No Bid History</p>
						<%
						}
						%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>