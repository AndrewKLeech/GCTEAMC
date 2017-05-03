<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" %>

<!-- Reception panel page for receptionist -->
<!DOCTYPE html>
<html>
<head>
	<%
if(session.getAttribute("priv")!=null)
{
	String priv=(String)session.getAttribute("priv"); 
	if(priv.equals("admin")){
		response.sendRedirect("reception_admin.jsp");
	}
	else if(priv.equals("receptionist")){

	}
	else if (priv.equals("user")){
		response.sendRedirect("homepage_onlineuser.jsp");
	}
	else
	{
		response.sendRedirect("homepage_main.jsp");
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
	<link rel="stylesheet" type="text/css" href="homestyle.css" />
</head>
<body>
	<nav class="navbar navbar-inverse">
		<!-- Navbar -->
		<jsp:include page="navbar_reception.html"/>
	</nav>
	
	<div class="container">
		<div class="row">
			<h1 class="text-center">Reception Panel</h1>
		</div>

		<div class="row">
			<div class="col-xs-12  text-center">
				<a href="checkInOut_reception.jsp" class="btn btn-md btn-primary" id="adminButton">Check In/Check Out</a>
			</div>
			<div class="col-xs-12  text-center">
				<a href="createReservation_reception.jsp" class="btn btn-md btn-primary" id="adminButton">Create Reservation</a>
			</div>
			<div class="col-xs-12  text-center">
				<a href="createUser_reception.jsp" class="btn btn-md btn-primary" id="adminButton">Create User</a>
			</div>

		</div>
	</div>
</body>
</html>