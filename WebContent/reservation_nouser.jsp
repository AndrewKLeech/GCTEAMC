<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!DOCTYPE html>
<html>
<head>
<%
if(session.getAttribute("priv")!=null)
{
	String priv=(String)session.getAttribute("priv"); 
	if(priv.equals("admin")){
		response.sendRedirect("reservation_admin.jsp");
	}
	else if(priv.equals("receptionist")){
		response.sendRedirect("reservation_reception.jsp");
	}
	else if (priv.equals("user")){
		response.sendRedirect("reservation_onlineuser.jsp");
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

	<script type="text/javascript" src="hotel.js"></script>
	
	<!-- For Date Picker to check in and out  -->
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>	
	<script>
	//$.noConflict();
	jQuery(document).ready(function($){
		var getField = function(id) {
			var el = $('#'+id+'-select');
			return el.length ? el : null;
		};

		var pickerSetup = function(id, date) {
			var el = getField(id);
			if ( el ) {
				var checkin = id === 'checkin';
				el.datepicker({
					altField: el.get(0).form[id],
					altFormat: 'yy-mm-dd',
					dateFormat: 'dd/mm/yy',
					onSelect: function() {
						if ( checkin && getField('checkout') !== null ) {
							var constraint = new Date(el.datepicker('getDate'));
							constraint.setDate(constraint.getDate()+1);
							getField('checkout').datepicker("option", 'minDate', constraint);
						}
					},
					numberOfMonths: 2,
					mandatory: true,
					firstDay: 1,
					minDate: checkin ? 0 : 1,
					maxDate: '+2y'
					//changeMonth: true,
					//changeYear: true,
					//showOtherMonths: true,
					//selectOtherMonths: true
				});
				el.datepicker("setDate", date);
			}
		};
		pickerSetup("checkin", "+0");
		pickerSetup("checkout", "+1");
	});
	</script>

	<link rel="stylesheet" type="text/css" href="homestyle.css" />
</head>

<body>
	<nav class="navbar navbar-inverse">

		
			<!-- Navbar Header -->
			<jsp:include page="navbar_nouser.html"/>
		
	</nav>
	
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
		</div>
		<div class="row">
			<h1></h1>	
			<div class="col-xs-12 col-sm-6">
				<div class="form-group">
					<div class="text-center center-block">
						<input type="hidden" name="checkin">
						<label for="checkin-select">Check In Date</label>
						<input type="text" id="checkin-select" placeholder="dd/mm/yyyy" name="checkIn">	
					</div>
				</div>
			</div>

			<div class="col-sm-6 col-xs-12">
				<div class="form-group">
					<div class="text-center center-block">
            			<input type="hidden" name="checkout">
						<label for="checkout-select">Check Out Date</label>
						<input type="text" id="checkout-select" placeholder="dd/mm/yyyy" name="checkOut">
            		</div>
            	</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="text-center center-block">
					<input type="hidden" name="action" value="searchRoom">
					<button type="submit" class="btn btn-default btn-md" name="searchRoom">Search</button>
				</div>
			</div>				
		</div>
		</form>
		<div class="row">
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
