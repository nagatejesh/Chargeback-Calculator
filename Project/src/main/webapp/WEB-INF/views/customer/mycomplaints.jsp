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
			<c:if test="${not empty myComplaints}">
			<c:forEach items="${myComplaints}" var="complaint">
				<div class="card col-lg-12">
					<div class="card-body">
						<h4 class="card-title">Reason: ${complaint.reason}</h4>
						<h6 class="card-subtitle">Amount: ${complaint.chargebackAmount}</h6>
						<h6 class="card-text">Date of Submission: ${complaint.startDate}</h6>
						<h6 class="card-text">Status: ${complaint.status}</h6>
						<c:if test="${not empty complaint.endDate}">
						<h6 class="card-text">Date Resolved: ${complaint.endDate}</h6>
						</c:if>
					</div>
				</div>
			</c:forEach>
			</c:if>
			<c:if test="${empty myComplaints}">
				<h3 class="text-muted">You haven't raised any complaints</h3>
			</c:if>
		</div>
	</div>
</body>
</html>