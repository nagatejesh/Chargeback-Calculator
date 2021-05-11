<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../userhomepage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
.card {
	margin: auto;
}
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
<script type="text/javascript">
	$(document).ready(()=>{
		$(".toast").toast("show");
		$("#transaction").click(()=>{
			$("#myModal").modal("show")
		})
	})
</script>

</head>
<body>
	<div class="container-fluid">
		<a href="/bills">Pending Bills</a> <a href="/complaint">Lodge
			Complaint</a> <a href="/getMyComplaints">My Complaints</a>
	<c:if test="${not empty notify}">
		<div class="toast" id="transaction" data-autohide="false" style="position: absolute; top: 1rem; right: 1rem;">
			<div class="toast-header ">
				<strong class="mr-auto">Congratulations!</strong>
				<button type="button" style="margin: 0;" class=" close" data-dismiss="toast">&times;</button>
			</div>
			<div class="toast-body bg-light">
				<h6>Your complaint for the transaction id ${notify.transactionId} regarding the issue "${notify.reason}"
					has been approved.</h6><p>Click me to see full details</p>
			</div>
		</div>
		<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4>Complaint details</h4>
							</div>
							<div class="modal-body">
								<h6>Approved Amount: Rs.${notify.chargebackAmount}</h6>
								<h6>Date of Transaction: ${notify.date}</h6>
								<h6>Dispute Reason: ${notify.reason}</h6>
								<h6>Dispute Raised date: ${notify.startDate}</h6>
								<h6>Approved Date: ${notify.endDate}</h6>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
	</c:if>
	<c:if test="${not empty help}">
		<div class="toast" data-autohide="false" style="position: absolute;top: 1rem; right: 1rem;">
			<div class="toast-header ">
				<strong class="mr-auto">Congratulations!</strong>
				<button type="button" style="margin: 0;" class="close" data-dismiss="toast">&times;</button>
			</div>
			<div class="toast-body bg-light">
				<h6>Your request regarding the issue "${help.issue}"
					has been resolved and the solution provided is</h6><br>
				<i>${help.solution}</i>
			</div>
		</div></c:if>
	<c:if test="${not empty feedbacks}">
	<c:forEach items="${feedbacks}" var="feedback">
		<div class="toast" data-autohide="false" style="position: absolute;top: 1rem; right: 1rem;">
			<div class="toast-header ">
				<strong class="mr-auto">Feedback Request</strong>
				<button type="button" style="margin: 0;" class="close" data-dismiss="toast">&times;</button>
			</div>
			<div class="toast-body bg-light">
				<h6>Please submit your feedback and help us serve you better</h6><br>
				<a href="/editFeedback/${feedback.feedbackId}" style="margin-top: 0">Open</a>
			</div>
		</div></c:forEach></c:if>
		</div>
		<div class="card col-lg-8">
			<div class="row"></div>
			<h1>Welcome ${customer.firstName} ${customer.lastName}</h1>
			<h2>Your current balance is ${customer.balance}</h2>
		</div>
		<br>
		<div class="card col-lg-9">
			<div class="card-body">
				<h2 class="card-title">Recently Paid Bills are:</h2>
				<c:if test="${not empty transactions}">
					<table class="table table-hover">
						<thead class="thead-dark">
							<tr>
								<th>Bill Id</th>
								<th>Amount</th>
								<th>Payment date</th>
								<th>Due Date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${transactions}" var="transaction">
								<tr>
									<td>${transaction.transactionId}</td>
									<td>${transaction.debit}</td>
									<td>${transaction.paymentDate}</td>
									<td>${transaction.dueDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
				<c:if test="${empty transactions}">
					<h2 class="card-title">You are yet to make your first
						transaction</h2>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>