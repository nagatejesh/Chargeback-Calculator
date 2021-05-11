<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ include file="homepage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Here...</title>
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
		$("#btn").click(()=>{
			console.log($("#category").val());
		});
		if($("h4").text().includes("New")){
			$("#popup").modal("show");
		}
		if($("#msg").text().includes("Please")){
			alert($("#msg").text());
		}
		if($("#span").text().includes("no")){
			$("#span").html("<i class=\"material-icons\">report_problem</i>UserId already taken.").css("color","red");
		}
		if($("#phone").text().includes("no")){
			$("#phone").html("<i class=\"material-icons\">report_problem</i>This number is already registered.").css("color","red");
		}
		if($("#email").text().includes("no")){
			$("#email").html("<i class=\"material-icons\">report_problem</i>This email is already registered.").css("color","red");
		}
		if($("#span").text().includes("yes")){
			$("#span").html("<i class=\"material-icons\">verified</i>UserId available.").css("color","green");
		}
	})
 </script>
</head>
<body>

	<div class="container">
		<div class="col-sm-6 card">
			<h2>Register</h2>
			<f:form action="/register" method="post" modelAttribute="user">
				<div class="form-group col-lg-8">
					<label>FirstName</label>
					<f:input path="firstName" class="form-control" type="text"
						id="firstname" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>LastName</label>
					<f:input path="lastName" class="form-control" type="text"
						id="lastname" cssErrorClass="error form-control" />
				</div>
				<div class="form-group col-lg-8">
					<label>Date of Birth</label>
					<f:input path="dob" class="form-control" type="date" id="dob" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>Gender</label>
					<f:select path="gender" class="form-control" name="gender">
						<f:option value="male">Male</f:option>
						<f:option value="female">Female</f:option>
						<f:option value="other">Other</f:option>
					</f:select>
				</div>
				<div class="form-group col-lg-8">
					<label>Contact Number</label>
					<f:input path="contact" class="form-control" type="text"
						id="contact" cssErrorClass="error form-control"/>
					<span id="phone"> ${phone}</span>
				</div>
				<div class="form-group col-lg-8">
					<label>Email</label>
					<f:input path="email" class="form-control" type="text" id="email" cssErrorClass="error form-control"/>
					<span id="email"> ${email}</span>
				</div>
				<div class="form-group col-lg-8">
					<label>Address</label>
					<f:input path="address" class="form-control" type="text"
						id="address" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>City</label>
					<f:input path="city" class="form-control" type="text" id="city" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>State</label>
					<f:input path="state" class="form-control" type="text" id="state" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>ZipCode</label>
					<f:input path="zipCode" class="form-control" type="text"
						id="zipcode" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>UserID</label>
					<f:input path="userId" class="form-control" type="text" id="userID" cssErrorClass="error form-control"/>
					<span id="span"> ${available}</span>
				</div>
				<div class="form-group col-lg-8">
					<label>Password</label>
					<f:input path="password" class="form-control" type="password"
						id="password" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>User Category</label>
					<f:input path="category" class="form-control" id="category" value="${category}" readOnly="true"/>
				</div>


				<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4>Additional security requirements</h4>
							</div>
							<div class="modal-body">
								<div id="ques" class="form-group col-lg-10">
									<div class="form-group col-lg-10">
										<label>Select a Question</label>
										<f:select path="question" class="form-control"
											items="${questions}">
										</f:select>
									</div>
									<div class="form-group col-lg-10">
										<label>Answer(Please enter a one word answer)</label>
										<f:input path="answer" class="form-control" type="text"
											id="answer" cssErrorClass="error form-control"/>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-success" id="submit">Submit</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="popup">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4>${msg}</h4>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
								<a href="/Login"><i class="material-icons">${sett}</i>
									${sett}</a>
							</div>
						</div>
					</div>
				</div>
				<div>
					<label id="msg" style="display:none;">${msg}</label>
				</div>
				<div class="form-group col-lg-8" id="btn">

					<a href="#" data-toggle="modal" data-target="#myModal"><input
						value="Continue" class="btn btn-primary form-control" disabled /></a>
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