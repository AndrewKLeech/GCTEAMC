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
			response.sendRedirect("homepage_onlineuser.jsp");
		}
		else
		{
			
		}
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
				<h3 class="text-center" id="findHeading">Luxurious Accommodation and First-class Service</h3>
				<h1 class="text-center">The New Dublin Hilton Hotel</h1>
			</div>

			<div class="col-sm-4 col-md-4 text-center">
	            <!--Empty Slot-->
        	</div>

			<div class="col-sm-4 col-md-4 text-center">
	            <div class="thumbnail">
	                <button type="button" class="btn btn-primary" onclick="location.href = 'reservation_nouser.jsp';" >Book Now</button>
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
	                <p>
						Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
					</p>
					<p>
						<a class="btn" href="#">View details »></a>
					</p>
	            </div>
        	</div>

        	<div class="col-sm-4 col-md-4 text-center">
	            <div class="thumbnail">
	                <h4 class="text-center">
	                    SPA & GYM
	                </h4>
	                <img src="images/room2.jpg">
	                <p></p>
	                <p>
						Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
					</p>
					<p>
						<a class="btn" href="#">View details »</a>
					</p>
	            </div>
        	</div>

        	<div class="col-sm-4 col-md-4 text-center">
	            <div class="thumbnail">
	                <h4 class="text-center">
	                    PACKAGE & EVENT
	                </h4>
	                <img src="images/room3.jpg">
	                <p></p>
	                <p>
						Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
					</p>
					<p>
						<a class="btn" href="#">View details »</a>
					</p>	            
				</div>
        	</div>
        </div>
	</div>

</body>
</html> 



<!-- <div class=" col-sm-4 col-md-4 col-lg-4 border"></div> -->
