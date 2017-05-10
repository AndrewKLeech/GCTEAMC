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
			<!-- Container for displaying User Details -->
			<div class="col-xs-12 col-sm-6 profileContainer">
				<h3 class="text-center">Profile Information</h3>

				<div class="row container">
					<label for="Name">Name:</label>
					<p>Insert Name Here</p>
				</div>
				<div class="row container">
					<label for="Name">Address:</label>
					<p>123 old Street</p>
					<p>Seoul</p>
					<p>South Korea</p>
				</div>
				<div class="row container">
					<label for="Name">Contact Number:</label>
					<p>+123456789</p>
				</div>
				<div class="row container">
					<label for="Name">Gender:</label>
					<p>Male</p>
				</div>
			</div>

			<!-- Buttons for changing Details -->
			<div class="col-xs-12 col-sm-6 edit ProfileContainer">

				<div class="panel-group" id="accordion">

					<h3 class="text-center">Change Profile Details</h3>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
									Change Password</a>
								</h4>
							</div>

							<div id="collapse1" class="panel-collapse collapse">

								<div class="panel-body">

									<div class="form-group">
										<label for="oldPassword">Old Password</label>
										<input type="password" class="form-control" id="oldPassword">
									</div>

									<div class="form-group">
										<label for="newPassword">New Password</label>
										<input type="password" class="form-control" id="newPassword">
									</div>

									<div class="form-group">
										<label for="confirmPassword">Confirm New Password</label>
										<input type="password" class="form-control" id="newPassword">
									</div>

									<div class="form-group">
										<button class="btn btn-default btn-md btn-danger">Submit Changes</button>
									</div>

								</div>

							</div>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
										Change Address</a>
									</h4>
								</div>
								<div id="collapse2" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="form-group">
											<label for="newAddress">Enter new address</label>
											<input type="text" class="form-control" id="oldPassword">
										</div>

										<div class="form-group">
											<label for="password">Enter password</label>
											<input type="password" class="form-control" id="password">
										</div>

										<div class="form-group">
											<button class="btn btn-default btn-md btn-danger">Submit Changes</button>
										</div>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
											Change Contact Number</a>
										</h4>
									</div>
									<div id="collapse3" class="panel-collapse collapse">
										<div class="panel-body">
											<div class="form-group">
												<label for="newNumber">Enter new contact Number</label>
												<input type="text" class="form-control" id="contactNumber">
											</div>

											<div class="form-group">
												<label for="password">Enter password</label>
												<input type="password" class="form-control" id="password">
											</div>

											<div class="form-group">
												<button class="btn btn-default btn-md btn-danger">Submit Changes</button>
											</div>
										</div>
									</div>

									<div id="collapse4" class="panel-collapse collapse">
										<div class="panel-body">
											<div class="form-group">
												<label for="newEmail">Enter new email Address</label>
												<input type="email" class="form-control" id="emailAddress">
											</div>

											<div class="form-group">
												<label for="password">Enter password</label>
												<input type="password" class="form-control" id="password">
											</div>

											<div class="form-group">
												<button class="btn btn-default btn-md btn-danger">Submit Changes</button>
											</div>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>

					<div class="row container">
					<form action="FrontController" method="post">
						<h2 class="text-center"><input type="hidden" name="action" value="getBookings""><button type="submit" class="btn btn-primary" name="getBooking">Show Your Bookings</button></h2>
						</form>
						<div class="col-xs-12" id="reservationContainer">
				<%@ page import="java.util.*, com.example.business.Booking" %>
					<table class="table table-responsive table-striped table-hover">
						<c:forEach items="${bookings}" var="booking">
						<form action="FrontController" method="post">
						<thead class="thead-inverse">
							<tr>
								<th>RoomNo</th>
								<th>Check In Date</th>
								<th>Check Out Date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><c:out value="${booking.roomNo()}" /></th>
								<td><c:out value="${booking.getarrDate()}" /></td>
								<td><c:out value="${booking.getdepDate()}" /></td>
								<input type="hidden" name="refNo" value="${booking.getReferenceNo()}">
								<td><input type="hidden" name="action" value="cancelBooking""><button type="submit" class="btn btn-primary" name="cancelBooking" value="${booking.getReferenceNo()}">CANCEL</button></td>
								</form>
							</tr>
						</tbody>
						</c:forEach>
					</table>
						</div>

					</div>
				</div>
			</body>
			
			<div class="container">
			<div class="row">
				<hr>
				<div class="col-lg-12">
					<div class="col-md-8">
						Terms of Service | Privacy     
					</div>
					<div class="col-md-4">
					<p class="muted pull-right">© 2017 Appy Days. All rights reserved</p>
					</div>
				</div>
			</div>
		</div>
</html> 



<!-- <div class=" col-sm-4 col-md-4 col-lg-4 border"></div> -->
