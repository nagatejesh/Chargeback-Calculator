<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ include file="userhomepage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Help Service</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
h2, h1 {
	text-align: center;
}
.error{
	border: thin solid red;
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

<script>
	$(document).ready(()=>{
		if($("h4").text().includes("Issue")){
			$("#popup").modal("show");
		}
		if($("#msg").text().includes("Please")){
			alert($("#msg").text());
		}
	})
 </script>
</head>
<body>

	<div class="container">
		<div class="col-sm-6 card">
			<h2>Help Service</h2>
			<f:form action="/registerhelp" method="post" modelAttribute="help">
				<div class="form-group col-lg-8">
					<label>Issue</label>
					<f:input path="issue" class="form-control" type="text"
						id="issue" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>Description</label>
					<f:textarea path="description" class="form-control" type="text"
						id="description" cssErrorClass="error form-control" />
				</div>
				<div class="form-group col-lg-8">
					<label>Date</label>
					<f:input path="startDate" class="form-control" value="${date}" id="startDate" readonly="true"/>
				</div>

				<div class="modal fade" id="popup">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4>${msg}</h4>
							</div>

						</div>
					</div>
				</div>
				<div>
					<label id="msg" style="display:none;">${msg}</label>
				</div>
				<div class="form-group col-lg-8" id="btn">
					<button type="submit" class="btn btn-success" id="submit">Submit</button>
				</div>
			</f:form>
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
