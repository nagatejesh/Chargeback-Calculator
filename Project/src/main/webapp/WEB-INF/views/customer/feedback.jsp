<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<h3>Please submit your valuable feedback...Help us serve you better!!</h3>
		<div>
			<f:form action="/saveFeedback" modelAttribute="feedback"
				method="post">
				<c:forEach items="${feedback.quesNAns}" var="f">
				<div class="form-group col-lg-8">
					<label>${f.question}</label>
					<f:input path="quesNAns[${feedback.quesNAns.indexOf(f)}].answer" class="form-control"/>
				</div></c:forEach>
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