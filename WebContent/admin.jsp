<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" %>

<!-- Admin panel page for admin -->
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
		response.sendRedirect("homepage_reception.jsp");
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
		<jsp:include page="navbar_admin.html"/>
	</nav>
		
	<div class="container">
		<div class="row">
			<h1 class="text-center">Admin Panel</h1>
		</div>

		<div class="row">
			<div class="col-xs-12  text-center">
				<a href="manageRoom.jsp" class="btn btn-md btn-primary" id="adminButton">Manage Room</a>
			</div>
			<div class="col-xs-12  text-center">
				<a href="manageUser.jsp" class="btn btn-md btn-primary" id="adminButton">Manage Users</a>
			</div>
			<div class="col-xs-12  text-center">
				<a href="manageReservation.jsp" class="btn btn-md btn-primary" id="adminButton">Manage Reservations</a>
			</div>

			<div class="col-xs-12  text-center">
				<a href="manageVoucher.jsp" class="btn btn-md btn-primary" id="adminButton">Manage Vouchers</a>
			</div>

		</div>
	</div>
</body>
</html>