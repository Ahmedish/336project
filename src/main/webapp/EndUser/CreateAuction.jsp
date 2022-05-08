<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.cs336.pkg.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Auction</title>

</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ page import="java.sql.*"%>
	<script type="text/javascript">
 		function chooseId(id){
			document.querySelector("#item_id").value = id;	
		}	 
 	</script>

	<h1>Create Auction</h1>
	<form action="CreateAuctionController.jsp" method="POST">
		<div class="form-group">
			Initial Price: <input type="number" name="init_price" />
		</div>
		<div class="form-group">
			Minimum Price: <input type="number" name="min_price" />
		</div>
		<div class="form-group">
			Close Date: <input type="date" name="close_date" />
		</div>
		<div class="form-group">
			Increment: <input type="number" name="increment" />
		</div>
		<div class="form-group">
			Item ID: <input type="number" name="item_id" id="item_id" />
		</div>
		<button type="submit" class="btn btn-success">Submit</button>
	</form>
	<br>
	<h1>Item IDs</h1>
	<form action="CreateAuction.jsp" action="POST">
		<div class="input-group">
			<input name="search" type="search" class="form-control rounded" placeholder="Search"
				aria-label="Search" aria-describedby="search-addon" />
			<button type="submit" class="btn btn-outline-primary">search</button>
		</div>
	</form>
	<div style="display: flex; flex-wrap: wrap;">
		<%
		ResultSet items;
		String search = request.getParameter("search");
		if (search == null) {
			items = stmt.executeQuery(
			"SELECT * from item");
		} else {
			items = stmt.executeQuery(
			"SELECT * FROM item WHERE (item_type LIKE '%" + search + "%' OR fit LIKE '%" + search
					+ "%' OR color LIKE '%" + search + "%' OR size LIKE '%" + search + "%')");
		}

		while (items.next()) {
			String item_type = items.getString("item_type");
			String size = items.getString("size");
			String color = items.getString("color");
			String fit = items.getString("fit");
			String image_url = items.getString("image_url");
			String item_id = Integer.toString(items.getInt("item_id"));
		%>
		<div class="card col-sm item_card"
			style="margin: 10px; text-align: center; flex: 0 0 300px; height: 325px;"
			id="<%=item_id%>" onClick="chooseId(<%=item_id%>)">
			<img class="card-img-top" style="object-fit: contain; width: 100%; height: 200px;"
				src=<%=image_url%>>
			<div class="card-body">
				<h4 class="card-title"><%=size%>
					<%=color%>
					<%=fit%>
					<%=item_type%>
					-
					<%=item_id%></h4>
			</div>
		</div>
		<%
		}
		%>
	</div>
	<%@ include file="/footer.jsp"%>

</body>
</html>