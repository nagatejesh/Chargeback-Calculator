<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../userhomepage.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="card-columns col-lg-12">
			<c:if test="${not empty customers}">
			<c:forEach items="${customers}" var="customer">
				<div class="card col-lg-12">
					<div class="card-body">
						<h4 class="card-title">Customer Id: ${customer}</h4>
						
						<a href="/getAllChargebacks/${customer}"
							class="btn btn-dark stretched-link">See all</a>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>
			<c:if test="${empty customers}">
			<div class="card">
				<h3 class="text-muted" style="text-align: center;">No Customer applied
					 for chargebacks</h3>
			</div>
		</c:if>
	</div>
</body>
</html>