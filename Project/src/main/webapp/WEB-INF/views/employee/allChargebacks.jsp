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
			<c:if test="${not empty chargebacks}">
			<c:forEach items="${chargebacks}" var="complaint">
				<div class="card col-lg-12">
					<div class="card-body">
						<h4 class="card-title">Customer Name: ${complaint.firstName} ${complaint.lastName}</h4>
						<h6 class="card-subtitle">Account Number: ${complaint.accountNumber}</h6>
						<h6 class="card-text">Amount: ${complaint.chargebackAmount}</h6>
						<h6 class="card-text">Status: ${complaint.status}</h6>
						<h6 class="card-text">Date of Submission: ${complaint.startDate}</h6>
						<h6 class="card-text">Reason: ${complaint.reason}</h6>
						<c:if test="${not empty complaint.endDate}">
						<h6 class="card-text">Date Resolved: ${complaint.endDate}</h6>
						</c:if>
						<c:if test="${empty complaint.endDate}">
						<a href="/editChargeback/${complaint.id}"
							class="btn btn-dark stretched-link">Resolve</a>
						</c:if>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>
			<c:if test="${empty chargebacks}">
			<div class="card">
				<h3 class="text-muted" style="text-align: center;">No
					chargebacks available for now</h3>
			</div>
		</c:if>
	</div>
</body>
</html>