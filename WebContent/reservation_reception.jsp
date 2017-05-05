<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" %>

<!-- Reservation page for resceptionist -->
<!DOCTYPE html>
<html>
<%
if(session.getAttribute("priv")!=null)
{
	String priv=(String)session.getAttribute("priv"); 
	if(priv.equals("admin")){
		response.sendRedirect("reservation_admin.jsp");
	}
	else if(priv.equals("receptionist")){

	}
	else if (priv.equals("user")){
		response.sendRedirect("reservation_onlineuser.jsp");
	}
	else
	{
		response.sendRedirect("reservation_nouser.jsp");
	}
}
	%>
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
	<script src="bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="homestyle.css" />
</head>
<body>
	<nav class="navbar navbar-inverse">
		<!-- Navbar -->
		<jsp:include page="navbar_reception.html"/>
	</nav>
	
	<!-- Contents about reservation -->	
	<div class="container">
		<jsp:include page="reservation_body.html"/>
	</div>
</body>
</html>