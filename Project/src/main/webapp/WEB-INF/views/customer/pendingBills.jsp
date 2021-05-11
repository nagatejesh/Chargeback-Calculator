<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="../userhomepage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(()=>{
	if ($("h4").text().includes("a")) {
		$("#popup").modal("show");
	}
	})
	
</script>
<style type="text/css">
h2, h1 {
	text-align: center;
}

.card {
	margin: auto;
}

.material-icons {
	vertical-align: middle;
}

button {
	position: relative;
	display: inline-block;
	padding: 10px 20px;
	color: #3227a3;
	font-size: 16px;
	text-decoration: none;
	text-transform: uppercase;
	overflow: hidden;
	transition: .5s;
	margin-top: 40px;
	letter-spacing: 4px
}

button:hover {
	background: #03e9f4;
	color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 5px #03e9f4, 0 0 25px #03e9f4, 0 0 50px #03e9f4, 0 0
		100px #03e9f4;
}

.btn:hover {
	cursor: pointer;
}

body {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
	background: #141e30;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="card-column col-lg-12 row">
		<c:if test="${not empty list}">
		<c:forEach items="${list}" var="item">
			<div class="card col-lg-3">
				<h3 class="card-title"> Bill Amount: ${item.debit}</h3>
				<h3 class="card-text"> Due Date: ${item.dueDate}</h3>
				<a href="/processmypay/${item.transactionId}" class="btn btn-success">Pay</a>
			</div>
		</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<div class="card col-lg-6">
				<h1>Congrats!! You have paid the bill</h1>
			</div>
		</c:if>
	</div>
	<div class="modal fade" id="popup">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4>${status}</h4>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					<a href="/bills">Continue</a>
				</div>
			</div>
		</div>
	</div>











	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
		type="text/javascript"></script>
</body>
</html>