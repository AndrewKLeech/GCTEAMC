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

	<script type="text/javascript" src="hotel.js"></script>

	<link rel="stylesheet" type="text/css" href="homestyle.css" />

</head>
<body>

	<nav class="navbar navbar-inverse">
	  	<!-- Navbar -->
		<jsp:include page="navbar_nouser.html"/>
	</nav>

		<!-- Banner -->
	<div class="container" id="bannerContainer">
		<div class="row">
			<div class="banner">
				<h1 class="text-center"></h1>
			</div>
		</div>
	</div>

	<!-- Search Room Redirect-->
	<div class="container" id="redirectContainer">
		<div class ="row tex-center">
			<div class="row">
				<h2 class="text-center" id="findHeading">Find a Room</h2>
			</div>


			<div class="col-sm-4 col-md-4 text-center">
	            <!--Empty Slot-->
        	</div>

			<div class="col-sm-4 col-md-4 text-center">
	            <div class="thumbnail">
	                <button type="button" class="btn btn-primary" onclick="location.href = 'reservation_nouser.jsp';" >Find Room</button>
	            </div>
        	</div>

        	<div class="col-sm-4 col-md-4 text-center">
	            <!--Empty Slot-->
        	</div>

		</div>
	</div>

	<!-- Offers -->

	<div class="container" id="offerContainer">

		<div class="row text-center">

			<div class="row">
				<h2 class="text-center" id="offersHeading">Offers and Discounts</h2>
			</div>

			<div class="col-sm-4 col-md-4 text-center">
	            <div class="thumbnail">
	                <h4 class="text-center">
	                    Spa Offers
	                </h4>
	                <img src="images/room1.jpg">
	                <button type="button" class="btn btn-primary">View</button>
	            </div>
        	</div>

        	<div class="col-sm-4 col-md-4 text-center">
	            <div class="thumbnail">
	                <h4 class="text-center">
	                    Room Offers
	                </h4>
	                <img src="images/room2.jpg">
	                <button type="button" class="btn btn-primary">View</button>
	            </div>
        	</div>

        	<div class="col-sm-4 col-md-4 text-center">
	            <div class="thumbnail">
	                <h4 class="text-center">
	                    Other Promotions
	                </h4>
	                <img src="images/room3.jpg">
	                <button type="button" class="btn btn-primary">View</button>
	            </div>
        	</div>

        </div>
	</div>

</body>
</html> 



<!-- <div class=" col-sm-4 col-md-4 col-lg-4 border"></div> -->
