<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ include file="homepage.jsp" %>
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
<style type="text/css">
h2, h1 {
	text-align: center;
}

.card{
	margin: auto;
}

button {
	position: relative;
	display: inline-block;
	padding: 5px 10px;
	color: #03e9f4;
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

body {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
	background: #141e30;
}
</style>
<title>Forgot Password</title>
</head>
<body>
	<div class="container ">
		<div class="col-sm-6 card ">
			<h2>Forgot Password</h2>
			<f:form action="/resetpassword" method="post" modelAttribute="user">
				<div class="col-lg-6">
					<label>User Id</label>
					<f:input class="form-control" path="userId" type="text" id="id" />
				</div>
				<div class="col-lg-6">
					<label>Select your Question:</label>
					<f:select class="form-control" path="question" items="${questions}">
					</f:select>
				</div>
				<div class="col-lg-6">
					<label>Answer</label>
					<f:input class="form-control" path="answer" type="text" id="answer" />
				</div>
				<div class="col-lg-6">
						<a href="/forgotuserID">Forgot UserID?</a>
				</div>
				<button type="submit">Reset Password</button>
			</f:form>
			<label>${getpassmsg}</label>
		</div>
	</div>
</body>
</html>