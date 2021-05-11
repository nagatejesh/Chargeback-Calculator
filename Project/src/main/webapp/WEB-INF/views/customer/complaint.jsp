<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
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
<script type="text/javascript">
	$(document).ready(()=>{
		if ($("h4").text().includes("a")) {
			$("#popup").modal("show");
		}
		})
		
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="card col-lg-8">
		<h1>
			File your <i>Complaint</i> here
		</h1>
		<div>
			<f:form action="/registercomplaint" modelAttribute="complaint"
				method="post">
				<div class="form-group col-lg-8">
					<label>First Name</label>
					<f:input path="firstName" id="firstName" value="${user.firstName}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>Last Name</label>
					<f:input path="lastName" id="lastName" value="${user.lastName}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>Contact Number</label>
					<f:input path="contact" id="contact" value="${user.contact}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>Email</label>
					<f:input path="email" id="email" value="${user.email}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>Account Number</label>
					<f:input path="accountNumber" id="accountNumber"
						class="form-control" value="${user.accountNumber}" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>Bank Branch</label>
					<f:input path="branch" id="branch" value="${user.city}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>CustomerId</label>
					<f:input path="customerId" id="customerId" value="${user.userId}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>Chargeback Amount</label>
					<f:input path="chargebackAmount" id="chargebackAmount"
						class="form-control" cssErrorClass="error form-control" />
				</div>
				<div class="form-group col-lg-8">
					<label>Bill Id</label>
					<f:input path="transactionId" id="transactionId"
						class="form-control" cssErrorClass="form-control error" />
				</div>
				<div class="form-group col-lg-8">
					<label>Date of transaction</label>
					<f:input path="date" id="date" type="date" class="form-control"
						cssErrorClass="error form-control" />
				</div>
				<div class="form-group col-lg-8">
					<label>Reason</label>
					<f:textarea path="reason" id="reason" class="form-control"
						cssErrorClass="error form-control" />
				</div>
				<div class="form-group col-lg-8" id="btn">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</f:form>
		</div>
	</div>
	<div class="modal fade" id="popup">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4>${remarks}</h4>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					<a href="/goHome">Continue</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>