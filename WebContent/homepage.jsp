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

	  	<div class="container">
	  		<!-- Navbar Header -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
		      </button>
		      <a class="navbar-brand" href="#">Appy Days</a>
		    </div>

		    <!-- Navbar contents -->
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		        <li class="dropdown">
		          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Offers <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="offers.html">Spa Discounts</a></li>
		            <li><a href="offers.html">Room Discounts</a></li>
		            <li><a href="offers.html">Voucher Codes</a></li>
		          </ul>
		        </li>
		        <li><a href="reservation.html">Reservation</a></li>
		        <li><a href="about.html">About</a></li>
		        <li><a href="account.html">My Account</a></li>
		        <li><a href="admin.html">Admin Panel</a></li>
		      </ul>

		      <!-- Right Nav Bar -->
		      <ul class="nav navbar-nav navbar-right">
		      <%!
		      
		      String someOutput() {
		    	     return "<li><a href=\"#\" data-toggle=\"modal\" data-target=\"#registerModal\"><span class=\"glyphicon glyphicon-user\"></span> Sign Up</a></li>";
		    	  }
		      %>
		      <%!
		      String someOutput2(){
		    	  return "<li><a href=\"#\" data-toggle=\"modal\" data-target=\"#loginModal\"><span class=\"glyphicon glyphicon-log-in\" ></span> Login</a></li>";
		      }
		      %>
		      
		      <%= someOutput() %>

		     		      
		        
		      </ul>
		    </div>
	  	</div>
	</nav>

	<!-- Banner -->
	<div class="container" id="bannerContainer">
		<div class="row">
			<div class="banner">
				<h1 class="text-center"></h1>
			</div>
		</div>
	</div>

	<!-- Search Box -->
	<div class="container" id="searchContainer">

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

		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 input-group">
				<div class="col-lg-6 col-md-4 col-sm-6 col-xs-6 dateBox">
					Insert Date Picker
				</div>
				<div class="col-lg-6 col-md-4 col-sm-6 col-xs-6 dateBox">
					Insert Date Picker 2
				</div>
				<div class="col-xs-12 roomTypeBox">
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="roomTypeButton">Room Type
						<span class="caret"></span></button>
						<ul class="dropdown-menu" id="roomType">
							<li><a href="#">Single Room</a></li>
							<li><a href="#">Double Room</a></li>
							<li><a href="#">Family Room</a></li>
						</ul>
					</div>
				</div>
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

	

	<!-- -->

	<!-- Register Modal -->
	<!-- Modal -->
  	<div class="modal fade" id="registerModal" role="dialog">
	    <div class="modal-dialog">
	      <!-- Modal content-->
	      <div class="modal-content">

	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Register</h4>
	        </div>

	        <div class="modal-body">
	        <form action="FrontController" method="post">
	          <div class="form-group">
	          	<label for="username">Username</label>
	          	<input type="text" class="form-control" placeholder="username" name="regUsername" id="registerUsername">
	          </div>
	          <div class="form-group">
	          	<label for="password">Password</label>
	          	<input type="password" class="form-control" placeholder="********" name="regPassword" id="registerPassword">
	          </div>
	          <div class="form-group">
	          	<label for="confirmPassword">Confirm Password</label>
	          	<input type="password" class="form-control" placeholder="********" name="regConfirmPassword" id="registerConfirmPassword">
	          </div>
	          <div class="form-group">
	          	<label for="email">Email</label>
	          	<input type="email" class="form-control" placeholder="" name="regEmail" id="registerEmail">
	          </div>
	          <div class="form-group">
      			<label>Date of Birth</label>
     			<input type="date" class="form-control" id="dateOfBirth" placeholder="Date of Birth" name="regDOB">
     		  </div>

	          <div class="form-group">
	          	<label for="Address">Address</label>
	          	<input type="text" class="form-control" placeholder="" name="regContactNumber" id="registerContactNumber">
	          </div>
	        </div>
	   
	        <div class="modal-footer">
	        	<!-- Added to connect to back end -->
	        	<input type="hidden" name="action" value="register">
		        <button class="btn btn-default btn-md">Register</button>
		    </form>
	        </div>
	      </div>
	    </div>
  	</div>
	

	<!-- Login Modal -->

	<!-- Modal -->
  	<div class="modal fade" id="loginModal" role="dialog">
	    <div class="modal-dialog">
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Login</h4>
	        </div>
	        <div class="modal-body">
	        <form action="FrontController" method="post">
	          <div class="form-group">
	          	<label for="username">Username</label>
	          	<input type="text" class="form-control" placeholder="username" name="username" id="loginUsername">
	          </div>
	          <div class="form-group">
	          	<label for="username">Password</label>
	          	<input type="password" class="form-control" placeholder="********" name="password" id="loginPassword">
	          </div>
				
	        <div class="modal-footer">
	        
		        <button type="button" class="btn btn-default btn-md" id="register_button" data-dismiss="modal" data-toggle="modal" data-target="#registerModal">Register</button>
		        <!-- Added to connect to back end -->
	        	<input type="hidden" name="action" value="login">
		        <button type="submit" class="btn btn-default btn-md">Login Now</button>
		    </form>
	        </div>
	      </div>
	    </div>
  	</div>

  	<!-- Footer -->

	<div class="" id="footer">
		<div class="container">
			<div class="row text-center">
				<h1>Footer</h1>
			</div>
		</div>
	</div>

</body>
</html> 



<!-- <div class=" col-sm-4 col-md-4 col-lg-4 border"></div> -->
