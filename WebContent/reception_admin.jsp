<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" %>

<!-- Reception panel page for admin -->
<!DOCTYPE html>
<html>
<head>
	<%
if(session.getAttribute("priv")!=null)
{
	String priv=(String)session.getAttribute("priv"); 
	if(priv.equals("admin")){

	}
	else if(priv.equals("receptionist")){
		response.sendRedirect("reception_reception.jsp");
	}
	else if (priv.equals("user")){
		response.sendRedirect("homepage_onlineuser.jsp");
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
		<jsp:include page="navbar_admin.html"/>
	</nav>
	
	<!-- Contents about home page -->	
	<div class="container">
		<div class="row">
			<h1 class="text-center">Reception Panel</h1>
		</div>

		<div class="row">
			<div class="col-xs-12  text-center">
				<a href="checkInOut_admin.jsp" class="btn btn-md btn-primary" id="adminButton">Check In/Check Out</a>
			</div>
			<div class="col-xs-12  text-center">
				<a href="createReservation_admin.jsp" class="btn btn-md btn-primary" id="adminButton">Create Reservation</a>
			</div>
			<div class="col-xs-12  text-center">
				<a class="btn btn-md btn-primary" id="adminButton" data-dismiss="modal" data-toggle="modal" data-target="#registerModal">Create User</a>
			</div>

		</div>
	</div>
	
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
				<form action="FrontController" method="post">
					<div class="modal-body">
						<div class="form-group">
							<label for="username">UserID<span style="color: red;"> *</span></label>
							<input type="text" class="form-control" placeholder="UserID" name="regUsername" id="registerUsername">
						</div>
						<div class="form-group">
							<label for="password">Password<span style="color: red;"> *</span></label>
							<input type="password" class="form-control" placeholder="********" name="regPassword" id="registerPassword">
						</div>
						<div class="form-group">
							<label for="confirmPassword">Confirm Password<span style="color: red;"> *</span></label>
							<input type="password" class="form-control" placeholder="********" name="regConfirmPassword" id="registerConfirmPassword">
						</div>
						<div class="form-group">
							<label for="firstname">First Name<span style="color: red;"> *</span></label>
							<input type="text" class="form-control" placeholder="" name="regFirstName" id="regFirstName">
						</div>
						<div class="form-group">
							<label for="lastname">Last Name<span style="color: red;"> *</span></label>
							<input type="text" class="form-control" placeholder="" name="regLastName" id="regLastName">
						</div>
						<div class="form-group">
							<label for="gender">Gender<span style="color: red;"> *</span></label>
							<div class="row">
								<div class="col-sm-6">
									<input type="radio" class="form-control" name="regGender" value="male" id="registerGender">Male
								</div>
								<div class="col-sm-6">
									<input type="radio" class="form-control" name="regGender" value="female" id="regGender">Female
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="birthday">Date of Birth<span style="color: red;"> *</span></label>
							<input type="date" class="form-control" placeholder="DDMMYYYY" name="regBirth" id="registerDateOfBirth">
						</div>
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" class="form-control" placeholder="" name="regEmail" id="registerEmail">
						</div>
						<div class="form-group">
							<label for="Address">Address</label>
							<input type="text" class="form-control" placeholder="" name="regContactNumber" id="registerContactNumber">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default btn-md" name="register"><a href="reception_admin.jsp">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>