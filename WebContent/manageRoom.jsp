<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" %>

<!-- Manage Romm page for admin -->
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
				Manage Room
			</h1>
		</div>
		<div class="row">
			<div class="row center-block" id="custom-search-input">
				<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 input-group">
					<input type="text" class="form-control" placeholder="Search Rooms">
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
				Room Information
			</h3>

			<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 border informationContainer">
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sagittis dolor vitae pretium bibendum. Cras feugiat dolor id elit sodales tristique. Vestibulum scelerisque ipsum a nunc pellentesque semper. Quisque vitae aliquam ante, in volutpat dui. Fusce malesuada pharetra mauris in convallis. Praesent auctor eleifend nisi, nec gravida quam vehicula non. Vivamus congue lobortis tortor, vitae gravida felis condimentum eget. Cras eu ex rutrum, tincidunt dui et, volutpat leo. Aenean faucibus hendrerit odio. In efficitur ornare nunc, in malesuada mi ultrices nec.
				</p>
			</div>

			<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
				<div class="col-sm-3">
					<button class="center-block btn btn-default btn-info manageButton">Edit Selected</button>
				</div>

				<div class="col-sm-3">
					<button class="center-block btn btn-default btn-info manageButton">Delete Selected</button>
				</div>

				<div class="col-sm-3">
					<button class="center-block btn btn-default btn-info manageButton">Save Changes</button>
				</div>
				<div class="col-sm-3">
					<button class="center-block btn btn-default btn-info manageButton"><a href="#" data-toggle="modal" data-target="#addRoomModal">Add Room</a></button>
				</div>
			</div>
		</div>

	</div>

	<!-- Add Room Modal -->
  	<!-- Jenny Worked --> 
  	<!-- Modal -->
  	<div class="modal fade" id="addRoomModal" role="dialog">
  		<div class="modal-dialog">
  			<!-- Modal content-->
  			<div class="modal-content">
  				<div class="modal-header">
  					<button type="button" class="close" data-dismiss="modal">&times;</button>
  					<h4 class="modal-title">Add Room</h4>
  				</div>
  				<div class="modal-body">
  					<div class="form-group">
  						<label for="roomNumber">Room No.</label>
  						<input type="text" class="form-control" placeholder="roomNumber" name="addRoomNumber" id="addRoonNumber">
  					</div>
  					<div class="form-group">
  						<label for="bedType">Bed Type</label>
  						<input type="radio" class="form-control" name="bedType" value="single" id="addRoomBedType">Single
  						<input type="radio" class="form-control" name="bedType" value="double" id="addRoomBedType">Double
  						<input type="radio" class="form-control" name="bedType" value="twin" id="addRoomBedType">Twin
  						<input type="radio" class="form-control" name="bedType" value="king" id="addRoomBedType">King
  						<input type="radio" class="form-control" name="bedType" value="queen" id="addRoomBedType">Queen
  					</div>
  					<div class= "form-group">
	  					<label for="smoking">Available of Smoking</label>
	  					<div class = row>
	  						<div class= "col-sm-6">
	  							<input type="radio" class="form-control" name="smoking" value="Y" id="addRoomSmoking">Yes
	  						</div>
	  						<div class= "col-sm-6">
	  							<input type="radio" class="form-control" name="smoking" value="N" id="addRoomSmoking">No
	  						</div>
	  					</div>
  					</div>
  					<div class="form-group">
  						<label for="roomPrice">Room Price</label>
  						<input type="text" class="form-control" placeholder="roomPrice" name="addRoomPrice" id="addRoonPrice">
  					</div>
  				</div>
  				<div class="modal-footer">
  					<button class="btn btn-default btn-md"><a href="manageRoom.php"> Add</a></button>
  				</div>
  			</div>
  		</div>
  	</div>

</body>
</html>