<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../userhomepage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
	background: #141e30;
}

.card {
	background-color: #c5d2de;
	margin: auto;
}

.material-icons {
	vertical-align: middle;
}

#btn {
	background: none;
	border: none;
}
</style>
<script type="text/javascript">
	$(document).ready(()=>{
		$("#number").click(()={
			$("#form").css("display","flex");
			$("#byStatus").css("display","none");
		})
		$("#status").click(()={
			$("#byStatus").css("display","flex");
			$("#form").css("display","none");
		})
		$("#report").click(()={
			$("#dropdown").css("display","block");
		})
		$(".toast").show();
	})
		
</script>
<title>Employee Home Page</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid bg-secondary">
			<a href="/getAllCustomerChargebacks">Chargeback Details</a> <a href="#" id="report">Generate Report</a>
			<div class="float-right col-lg-6 row">
				<form method="get" action="/getAllDetails" class="form-group row">
					<input class="col-lg-12 form-control" id="id" type="text" name="id">
					<button type="submit" id="btn" class="float-right">
						<i class="material-icons float-right">search</i>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="container card" id="dropdown">
		<div class="row">
			<a href="#" id="number" style="margin-top: 0">No of Complaints<sup
				class="badge bagde-pill badge-danger">${noOfComplaints}</sup></a> <a href="#"
				id="status" style="margin-top: 0">Status of the
				Complaints</a>
		</div>
	</div>
	<div class="container card" id="byStatus">
		<div class="row">
			<a href="/newComplaints">New <sup
				class="badge bagde-pill badge-danger">${new}</sup></a> <a
				href="/approvedComplaints">Approved <sup
				class="badge bagde-pill badge-danger">${approved}</sup></a> <a
				href="/rejectedComplaints">Rejected <sup
				class="badge bagde-pill badge-danger">${rejected}</sup></a>
		</div>
	</div>

	<!-- style="display:none;" -->
	<div class="container card" id="form">
		<div class="row">
			<form action="/getAllComplaints" method="get"
				class="from-group col-lg-12">
				<label class="col-lg-2 ">From</label> <input type="date" id="from"
					name="from" class="col-lg-3" /> <label class="col-lg-1">To</label>
				<input type="date" id="to" name="to" class="col-lg-3" />
				<button type="submit" class="float-right btn btn-secondary">Get
					Complaints</button>
			</form>
		</div>
	</div>
	<br>
	<div class="container">
		<c:if test="${not empty customers}">
			<div class="card-columns col-lg-12">
				<c:forEach items="${customers}" var="customer">
					<div class="card col-lg-12">
						<div class="card-body">
							<h3 class="card-title">${customer.userId}</h3>
							<a href="/getDetails/${customer.userId}"
								class="btn btn-dark stretched-link">See Profile</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${empty customers}">
			<h3 style="color: white;">No customers available</h3>
		</c:if>
	</div>
	<c:if test="${not empty help}">
		<div class="toast">
			<div class="toast-header">
				<strong class="mr-auto">Congratulations!</strong>
			</div>
			<div class="toast-body">
				<h6>Your request for regarding the ${help.issue} has been
					resolved. Please check your Requests for full details</h6>
			</div>
		</div>
	</c:if>
	>









	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>