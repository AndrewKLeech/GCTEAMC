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
	<link rel="stylesheet" type="text/css" href="homestyle.css" />
</head>
<body>
	<nav class="navbar navbar-inverse">
		<jsp:include page="navbar_admin.html"/>
	</nav>

	<div class="container">
		<div class="row">
			<h1 class="text-center">
				Manage User
			</h1>
		</div>
		<div class="row">
			<div class="row center-block" id="custom-search-input">
				<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 input-group">
					<input type="text" class="form-control" placeholder="Search Users">
					<span class="input-group-btn">
						<form action="FrontController" method="post">
					<input type="hidden" name="action" value="getAllUsers">
						<button type="submit" class="btn btn-info btn-lg" >
							<i class="glyphicon glyphicon-search"></i>
						</button>
						</form>
					</span>
				</div>
			</div>
		</div>

		<div class="row">
			<h3 class="text-center">
				User Information
			</h3>
			
			<%@ page import="java.util.*, com.example.business.User" %>
					<table class="table table-responsive table-striped table-hover">
						<c:forEach items="${userlist}" var="user">
						<form action="FrontController" method="post">
						<thead class="thead-inverse">
							<tr>
								<th>User Name</th>
								<th>Name</th>
								<th>Email</th>
								<th>Privilege</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><c:out value="${user.getuserId()}" /></td>
								<td><c:out value="${user.getName()}" /></td>
								<td><c:out value="${user.getEmail()}" /></td>
								<td><c:out value="${user.getPrivilege()}" /></td>
								<input type="hidden" name="uName" value="${user.getuserId()}">
								<td><input type="hidden" name="action" value="edit""><button type="submit" class="btn btn-primary" name="edit" value="${user.getuserId()}">Edit</button></td>
								</form>
								<form action="FrontController" method="post">
								<input type="hidden" name="uName" value="${user.getuserId()}">
								<td><input type="hidden" name="action" value="removeUser"><button type="submit" class="btn btn-primary" name="removeUser" value="${user.getuserId()}">Delete</button></td>
								</form>
							</tr>
						</tbody>
						</c:forEach>
					</table>
		</div>
	</div>

</body>
</html>
