<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ include file="../userhomepage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
.card {
	margin: auto;
	vertical-align: middle;
}

h2 {
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="card col-lg-9">
			<h2 class="card-title">Customer Details are:</h2>
			<div class="table-responsive">
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th>Customer Id</th>
							<th>Customer Name</th>
							<th>Account Number</th>
							<th>Bank Branch Name</th>
							<th>Bank Address</th>
							<th>Available Balance</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${customer.userId}</td>
							<td>${customer.firstName} ${customer.lastName}</td>
							<td>${customer.accountNumber}</td>
							<td>${customer.address}</td>
							<td>${customer.address}</td>
							<td>${customer.balance}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card col-lg-9">
			<div class="card-body">
				<h2 class="card-title">Recent Transactions are:</h2>
				<c:if test="${not empty transactions}">
					<table class="table table-hover">
						<thead class="thead-dark">
							<tr>
								<th>Bill/Transaction Id</th>
								<th>Amount Debited</th>
								<th>Amount Refunded</th>
								<th>Payment date</th>
								<th>Due Date</th>
								<th>Late Fee</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${transactions}" var="transaction">
								<tr>
									<td>${transaction.transactionId}</td>
									<td>${transaction.debit}</td>
									<td>${transaction.credit}</td>
									<td>${transaction.paymentDate}</td>
									<td>${transaction.dueDate}</td>
									<td data-toggle="popover-hover" title="Late Fee Calculation"
data-content="Late fee = Duedays* 1% of the bill amount">${transaction.lateFee}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
				<c:if test="${empty transactions}">
					<h2 class="card-title">Customer yet to make his first transaction</h2>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>