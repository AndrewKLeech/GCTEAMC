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
	
	<!-- For Date Picker to check in and out  -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>	

</head>
<body>
	<div class="row">
		<h3 class="text-center">Invoice</h3>

		<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 border informationContainer">

			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default height">
						<div class="panel-heading">Personal information</div>
						<div class="panel-body">
							<!-- insert name here -->
							<strong>Lennard Bandol</strong><br>
							<!-- insert address here -->
							71 Pilgrim Avenue<br>
							Chevy Chase, MD 20815<br>
						</div>
					</div>
				</div>

				<div class="col-xs-12">
					<div class="panel panel-default height">
						<div class="panel-heading">Booking information</div>
						<div class="panel-body">
						
				<%@ page import="java.util.*, com.example.business.Room" %>
							<Strong>Room Number: </Strong><c:out value="${room.getRoomNo()}" /><br>
							<Strong>Room Type: </Strong><c:out value="${room.getRoomType()}" /><br>
							<Strong>Smoking: </Strong><c:out value="${room.getIsSmoking()}" /><br>
							<Strong>CheckIn Date: </Strong>2017/05/20<br>
							<Strong>CheckOut Date: </Strong>2017/05/25<br>
						</div>
					</div>
				</div>

				<div class="col-xs-12">
					<div class="panel panel-default height">
						<div class="panel-heading">Billing Details</div>
						<div class="panel-body">
							<form>
								<div class="dropdown reservationDropdown center-block">
									<div class="form-group">
										<label for="cardType">Card Type</label>
										<select class="form-control" id="cardType" name="cardType">
											<option value="debit">Visa Debit</option>
											<option value="credit">Visa Credit</option>
											<option value="mastercard">Master Card</option>
										</select>
									</div>
								</div>
								<div class="col-xs-6">
									<div class="form-group">
										<label for="cardNumber">Card Number</label>
										<input class="form-control" type="text" name="cardNumber">
									</div>
								</div>

								<div class="col-xs-6">
									<div class="form-group">
										<label for="securityCode">Security Code</label>
										<input class="form-control" type="text" name="cardNumber">
									</div>
								</div>

								<label for="expirationDate">Expiration Date</label>
								<div class="form-group">
									<div class="col-xs-6">
										<select class="form-control" id="month" name="expirymonth">
											<option value="01">January</option>
											<option value="02">February</option>
											<option value="03">March</option>
											<option value="04">April</option>
											<option value="05">May</option>
											<option value="06">June</option>
											<option value="07">July</option>
											<option value="08">August</option>
											<option value="09">September</option>
											<option value="10">October</option>
											<option value="11">November</option>
											<option value="12">December</option>
										</select>
									</div>
									<div class="col-xs-6">
										<select class="form-control" id="month" name="expirydate">
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
											<option value="2021">2021</option>
											<option value="2020">2020</option>
										</select>
									</div>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="row"><button class="btn btn-primary center-block" id="adminButton">Book Now</button></div>
		</form>

		<div class="container">
			<div class="row">
				<hr>
				<div class="col-lg-12">
					<div class="col-md-8">
						Terms of Service | Privacy     
					</div>
					<div class="col-md-4">
					<p class="muted pull-right">Â© 2017 Appy Days. All rights reserved</p>
					</div>
				</div>
			</div>
		</div>
</div>


</div>
</div>
</body>
</html>