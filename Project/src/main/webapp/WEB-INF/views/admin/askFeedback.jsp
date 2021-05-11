<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="../userhomepage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript">
	$(documnet).ready(()=>{

		if($("h3").text().includes('o')){
				$("#myModal").modal('show');
			}
		})
		
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="col-sm-6 card">
			<h2>Register</h2>
			<f:form action="/createQuestions" method="post" modelAttribute="feedback">
				<div class="form-group col-lg-8">
					<label>UserId</label>
					<f:input path="userId" class="form-control" type="text"
						id="userId" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>Question1</label>
					<f:input path="quesNAns[0].question" class="form-control" cssErrorClass="error form-control" />
				</div>
				<div class="form-group col-lg-8">
					<label>Question2</label>
					<f:input path="quesNAns[1].question" class="form-control" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>Question3</label>
					<f:input path="quesNAns[2].question" class="form-control" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>Question4</label>
					<f:input path="quesNAns[3].question" class="form-control" cssErrorClass="error form-control"/>
				</div>
				<button type="submit">Create</button>
				</f:form>
				</div>
				</div>
	<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
						<div>
							<h3>${remarks}</h3>
						</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
								<a href="/goHome" class="btn btn-success" id="submit">Continue</a>
							</div>
						</div>
					</div>
				</div>
</body>
</html>