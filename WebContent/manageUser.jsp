<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<title>Hotel Booking Extravaganza</title>

	<meta charset="utf-8" />
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="homestyle.css" />
</head>
<body>
	<nav class="navbar navbar-inverse">
		<jsp:include page="navbar_admin.html"/>
	</nav>

	<div class="container">
		<div class="row">
			<h1 class="text-center">
				Manage User
			</h1>
		</div>
		<div class="row">
			<div class="row center-block" id="custom-search-input">
				<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 input-group">
					<input type="text" class="form-control" placeholder="Search Users">
					<span class="input-group-btn">
						<button class="btn btn-info btn-lg" type="button">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</span>
				</div>
			</div>
		</div>

		<div class="row">
			<h3 class="text-center">
				User Information
			</h3>

			<table class="table">
				<c:forEach items="${rooms}" var="room">
				<thead class="thead-inverse">
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Lennard Bandol</td>
						<td>lennard@gmail.com</td>
						<td><a href="#" class="btn btn-danger">Edit</a></td>
						<td><a href="#" class="btn btn-danger">Delete</a></td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>

</body>
</html>