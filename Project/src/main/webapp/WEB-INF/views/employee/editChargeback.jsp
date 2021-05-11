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
			<i>Chargeback</i> applied by ${chargeback.firstName} ${chargeback.lastName}
		</h1>
		<div>
			<f:form action="/saveChargeback" modelAttribute="complaint"
				method="post">
				<div class="form-group col-lg-8">
					<label>First Name</label>
					<f:input path="firstName" id="firstName" value="${chargeback.firstName}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>Last Name</label>
					<f:input path="lastName" id="lastName" value="${chargeback.lastName}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>Contact Number</label>
					<f:input path="contact" id="contact" value="${chargeback.contact}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>Email</label>
					<f:input path="email" id="email" value="${chargeback.email}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>Account Number</label>
					<f:input path="accountNumber" id="accountNumber"
						class="form-control" value="${chargeback.accountNumber}" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>Bank Branch</label>
					<f:input path="branch" id="branch" value="${chargeback.branch}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label>CustomerId</label>
					<f:input path="customerId" id="customerId" value="${chargeback.customerId}"
						class="form-control" readOnly="true" />
				</div>
				<div class="form-group col-lg-8">
					<label data-toggle="popover-hover" title="Details of this entry"
data-content="The entered amount will be refunded to the customer only if approved.">Chargeback Amount</label>
					<f:input path="chargebackAmount" id="chargebackAmount"
						class="form-control" value="${chargeback.chargebackAmount}" />
				</div>
				<div class="form-group col-lg-8">
					<label>Bill/Transaction Id</label>
					<f:input path="transactionId" id="transactionId" type="number" class="form-control" value="${chargeback.transactionId}" readOnly="true"/>
				</div>
				<div class="form-group col-lg-8">
					<label>Date of transaction</label>
					<f:input path="date" id="date" type="date" class="form-control" value="${chargeback.date}" readOnly="true"/>
				</div>
				<div class="form-group col-lg-8">
					<label>Date of Dispute</label>
					<f:input path="startDate" id="startDate" type="date" class="form-control" value="${chargeback.startDate}" readOnly="true"/>
				</div>
				<div class="form-group col-lg-8">
					<label>Reason</label>
					<f:input path="reason" id="reason" class="form-control" value="${chargeback.reason}" readOnly="true"/>
				</div>
				<div class="form-group col-lg-8">
					<label>Status</label><div class="col-lg-12">
					<!--<f:checkbox path="status" id="status" value="Resolved" /><label for="status">Resolved</label>-->
					<f:radiobutton path="status" value="Approved" name="status"/>Approved
					<f:radiobutton path="status" value="Rejected" name="status"/>Rejected
					</div>
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