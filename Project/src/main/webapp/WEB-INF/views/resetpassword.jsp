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
<title>Password Reset</title>
</head>
<body>
	<div class="container ">
		<div class="col-sm-6 card ">
			<h2>Password Reset</h2>
			<f:form action="/passwordreseted" method="post" modelAttribute="user" ononinput='inp2.setCustomValidity(inp2.value != inp1.value ? "Passwords do not match." : "")'>
				<div class="col-lg-6">
					<label>New Password</label>
					<f:input class="form-control" path="password" type="text" id="inp1" />
				</div>
				<div class="col-lg-6">
					<label>Confirm Password</label>
					<input class="form-control" type="text" id="inp2"/>
				</div>
				<button type="submit">Confirm</button>
			</f:form>
			<label>${getmsg}</label>
		</div>
	</div>
</body>
</html>