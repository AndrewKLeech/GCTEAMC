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

	<link rel="stylesheet" type="text/css" href="homestyle.css" /></head>
<body>
	<div class="container">
		<div class="row">
			<h1 class="text-center">Room Booking</h1>
		</div>
		<form action="FrontController" method="post">
		<div class="row">
			<div class="col-xs-12 col-sm-6">
				<div class="dropdown reservationDropdown center-block">
					<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="roomTypeButton">Number of People
					<span class="caret"></span></button>
					<ul class="dropdown-menu" id="">
						<li><input type="radio" name="numOfPeople" value="1" checked> 1</li>
  						<li><input type="radio" name="numOfPeople" value="2"> 2</li>
  						<li><input type="radio" name="numOfPeople" value="3"> 3</li>
						<li><input type="radio" name="numOfPeople" value="4"> 4</li>
						<li><input type="radio" name="numOfPeople" value="5"> 5</li>
						<li><input type="radio" name="numOfPeople" value="6"> 6</li>
						<li><input type="radio" name="numOfPeople" value="7"> 7</li>
						<li><input type="radio" name="numOfPeople" value="8"> 8</li>
						<li><input type="radio" name="numOfPeople" value="9"> 9</li>
					</ul>
				</div>
			</div>
			
			<div class="col-xs-12 col-sm-6">
				<div class="dropdown reservationDropdown center-block">
					<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="roomTypeButton">Room Type
					<span class="caret"></span></button>
					<ul class="dropdown-menu" id="">
						<li><input type="radio" name="bedType" value="single" checked> Single</li>
  						<li><input type="radio" name="bedType" value="double"> Double</li>
  						<li><input type="radio" name="bedType" value="queen"> Queen</li>
  						<li><input type="radio" name="bedType" value="king"> King</li>
					</ul>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6">
				<div class="text-center center-block" id="calendarContainer">
					Check In Date
				</div>
			</div>

			<div class="col-sm-6 col-xs-12">
				<div class="text-center center-block" id="calendarContainer">
					Check Out Date
				</div>
			</div>
			<input type="hidden" name="action" value="searchRoom">
			<button type="submit" class="btn btn-default btn-md" name="searchRoom">Search</button>
			</form>
	
			<div class="col-xs-12 col-sm-6">
				<div class="text-center center-block" id="searchResults">
					<h3>Rooms Available</h3>
					<div class="row">
					
					<%@ page import="java.util.*, com.example.business.Room" %>
					<table>
					  <c:forEach items="${rooms}" var="room">
					    <tr>
					      <td><c:out value="${room.getRoomNo()}" /></td>
					      <td><c:out value="${room.getRoomType()}" /></td>
					      <td><c:out value="${room.getIsSmoking()}" /></td>
					      <td><c:out value="${room.getprice()}" /></td>
					    </tr>
					  </c:forEach>
					</table>
					
					</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6">
				<div class="text-center center-block" id="searchResults">
					<h3>Room Details</h3>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6">
				<div class="center-block">
					<button class="center-block btn btn-primary bookButton">Select</button>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6">
				<div class="center-block">
					<button class="center-block btn btn-primary bookButton">Book this</button>
				</div>
			</div>

		</div>

	</div>
</body>
</html>