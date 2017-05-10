<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<%
	if(session.getAttribute("priv")!=null)
	{
		String priv=(String)session.getAttribute("priv"); 
		if(priv.equals("admin")){
			response.sendRedirect("homepage_admin.jsp");
		}
		else if(priv.equals("receptionist")){
			response.sendRedirect("homepage_reception.jsp");
		}
		else if (priv.equals("user")){

		}
		else
		{
			response.sendRedirect("homepage_main.jsp");
		}
	}
	else{
		response.sendRedirect("homepage_main.jsp");
	}
	%>
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
		<!-- Navbar -->
		<jsp:include page="navbar_onlineuser.html"/>
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
				<h3 class="text-center" id="findHeading">Luxurious Accommodation and First-class Service</h3>
				<h1 class="text-center">The New Dublin Hilton Hotel</h1>
			</div>

			<div class="col-sm-4 col-md-4 text-center">
				<!--Empty Slot-->
			</div>

			<div class="col-sm-4 col-md-4 text-center">
				<div class="thumbnail">
					<button type="button" class="btn btn-primary" id="adminButton" onclick="location.href = 'reservation_nouser.jsp';" >Book Now</button>
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
				<h2 class="text-center" id="offersHeading">Special Offers</h2>
			</div>

			<div class="col-sm-4 col-md-4">
				<div class="thumbnail">
					<h4 class="text-center">
						ROOMS & SUITES
					</h4>
					<img src="images/room1.jpg">
					<p></p>
					<p class="text-justify">
						While our hotel has a standard set of room types, there’s absolutely nothing standard about them! Each single room, double or family room, each suite we offer is enhanced with a little extra of its own! The intricate and elegant, but at the same time comfortable interior and exterior of the hotel make your stay here a blast! Additionally, all the amenities that we have, hotel-wide WiFI & our incredible eat & drink venues will be a cherry on the top!
					</p>
					
				</div>
			</div>

			<div class="col-sm-4 col-md-4 text-center">
				<div class="thumbnail">
					<h4 class="text-center">
						DINING BAR
					</h4>
					<img src="images/bar.jpeg">

					<p class="text-justify">
						Only best meal, cooked by the professionals. Visiting our hotel, don’t forget about breakfast. We have an incredible variety of dishes. </p>

						<p class="text-justify">
							Try fresh meal from our menu, cooked by the professional chef from France. But don’t worry! If you want to try something from another part of Europe, Asia and more, Julien can do it. He has an amazing experience, cooking many years in different restaurants all over the world.
						</p>

					</div>
				</div>

				<div class="col-sm-4 col-md-4 text-center">
					<div class="thumbnail">
						<h4 class="text-center">
							PACKAGE & EVENT
						</h4>
						<img src="images/hall.jpg">

						<p class="text-justify">
							Enjoy our spa services with a wide range of bebefits from working with our massage specialists who work with attention to details.
						</p>
						<p class="text-justify">
							Get a professional massage to make your day full of joy and relaxation. Spa is the best way to forget about your every day problems and dedicate a few hours of your precious time to yourself. We have different types of massage. Choose yours now and click on the button below.
						</p>

					</div>
				</div>
			</div>
		</div>

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
</body>
</html>