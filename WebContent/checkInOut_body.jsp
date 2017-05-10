<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<div class="container">
		<div class="row">
			<h1 class="text-center">
				Check In and Out
			</h1>
		</div>
		<div class="row">
			<div class="row center-block" id="custom-search-input">
				<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 input-group">
					<input type="text" class="form-control" placeholder="Search User">
					<span class="input-group-btn">
					<form action="FrontController" method="post">
					<input type="hidden" name="action" value="getBooking">
						<button type="submit" class="btn btn-info btn-lg" >
							<i class="glyphicon glyphicon-search"></i>
						</button>
						</form>
					</span>
				</div>
			</div>
		</div>
		<div class="row">
			<h3 class="text-center">
				User List
			</h3>

					<%@ page import="java.util.*, com.example.business.Booking" %>
					<table class="table table-responsive table-striped table-hover">
						<c:forEach items="${bookings}" var="booking">
						<form action="FrontController" method="post">
						<thead class="thead-inverse">
							<tr>
								<th>Name</th>
								<th>RoomNo</th>
								<th>Check In Date</th>
								<th>Check Out Date</th>
								<th>Status</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><c:out value="${booking.getuserId()}" /></td>
								<th><c:out value="${booking.roomNo()}" /></th>
								<td><c:out value="${booking.getarrDate()}" /></td>
								<td><c:out value="${booking.getdepDate()}" /></td>
								<td><c:out value="${booking.getStatus()}" /></td>
								<input type="hidden" name="refNo" value="${booking.getReferenceNo()}">
								<td><input type="hidden" name="action" value="checkIn""><button type="submit" class="btn btn-primary" name="checkIn" value="${booking.getReferenceNo()}">Check In</button></td>
								</form>
								<form action="FrontController" method="post">
								<input type="hidden" name="refNo" value="${booking.getReferenceNo()}">
								<td><input type="hidden" name="action" value="checkOut""><button type="submit" class="btn btn-primary" name="checkOut" value="${booking.getReferenceNo()}">Check Out</button></td>
								</form>
							</tr>
						</tbody>
						</c:forEach>
					</table>
			</div>
		</div>
	</div>
</body>
</html>
