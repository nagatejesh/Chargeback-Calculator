<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../userhomepage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<c:if test="${not empty feedbacks}">
		<div class="card-columns col-lg-12">
			<c:forEach items="${feedbacks}" var="feedback">
				<div class="card col-lg-12">
					<div class="card-body">
						<h3 class="card-title">Submitted ${feedback.userId}</h3>
						<table class="table-hover col-lg-11">
							<thead class="thead-dark"><tr><th>Questions</th><th>Answers</th></tr></thead>
							<tbody>
								<c:forEach items="${feedback.quesNAns}" var="qna">
									<tr><td>${qna.question}</td>
										<td>${qna.answer}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:forEach>
		</div>
		</c:if>
		<c:if test="${empty feedbacks}">
			<h3 style="color:white;">No feedbacks available</h3>
		</c:if>
	</div>

</body>
</html>