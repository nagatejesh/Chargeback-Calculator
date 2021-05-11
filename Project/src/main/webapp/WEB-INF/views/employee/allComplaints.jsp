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
		<div class="">
			<c:if test="${not empty chargebacks}">
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th>Customer Name</th>
							<th>Account Number</th>
							<th>Amount</th>
							<th>Reason</th>
							<th>Date of Submission</th>
							<c:if test="${status==all}">
								<th>Status</th>
								<th>Resolved Date</th>
							</c:if>
							<c:if test="${status==all}">
								<th>Status</th>
								<th>Resolved Date</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${chargebacks}" var="complaint">
							<td>${complaint.firstName} ${complaint.lastName}</td>
							<td>${complaint.accountNumber}</td>
							<td>${complaint.chargebackAmount}</td>
							<td>${complaint.reason}</td>
							<td>${complaint.startDate}</td>
							<c:if test="${status==all}">
								<td>${complaint.status}</td>
							</c:if>
							<c:if test="${not empty complaint.endDate}">
								<td>${complaint.endDate}</td>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
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