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
			Item ID: <input type="number" name="item_id" />
		</div>
		<button type="submit" class="btn btn-success">Submit</button>
	</form>
	<br>
	<h1>Item IDs</h1>
	<h2>Large Green Skinny Jeans (9987)</h2>
	<img
		src="https://cdn.lookastic.com/mint-skinny-jeans/asos-skinny-jeans-in-light-green-medium-171909.jpg"
		width="300px">
	<br>
	<h2>Large Blue Skinny Jeans (9988)</h2>
	<img
		src="https://images.riverisland.com/is/image/RiverIsland/blue-skinny-fit-jeans_306663_main"
		width="300px">
	<br>
	<h2>Medium Red Super-Skinny Jeans (1234)</h2>
	<img
		src="https://cdna.lystit.com/photos/2013/12/03/asos-red-super-skinny-jean-product-1-15797925-562278835.jpeg"
		width="300px">
	<br>
	<h2>Small Yellow Relaxed-Fit Jeans (6239)</h2>
	<img
		src="https://cdna.lystit.com/photos/2013/09/27/asos-mustard-super-skinny-jean-product-1-13733690-930198097.jpeg"
		width="300px">
	<%@ include file="/footer.jsp"%>

</body>
</html>