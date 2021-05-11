<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../userhomepage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
	background: #141e30;
}
.card {
	background-color: #c5d2de;
}
.material-icons {
	vertical-align: middle;
}
#btn {
	background: none;
	border: none;
	padding-left: 10px;
}
</style>

<title></title>
</head>
<body>
	
	<div class="container">
		<c:if test="${not empty requests}">
		<div class="card-columns col-lg-12">
			<c:forEach items="${requests}" var="request">
				<div class="card col-lg-12">
					<div class="card-body">
						<h3 class="card-title">${request.requestId}</h3>
						<a href="/getrequest/${request.requestId}"
							class="btn btn-dark stretched-link">Open</a>
					</div>
				</div>
			</c:forEach>
		</div>
		</c:if>
		<c:if test="${empty requests}">
			<h3 style="color:white;">No requests available</h3>
		</c:if>
	</div>
</body>
</html>
