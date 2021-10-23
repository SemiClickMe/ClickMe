<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>1:1문의 상세조회</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<h2 align="center">1:1문의 내용</h2>
	<div class="table-area">
		<table class="table table-striped table-dark" align="center">
			<tr>
				<td>문의제목 :</td>
				<td colspan="3"><p>
						<c:out value="${ requestScope.inquiry.inqTitle }" />
					</p></td>
			</tr>
			<tr>
				<td>작성자 :</td>
				<td><p>
						<c:out value="${ sessionScope.loginUser.id }" />
					</p></td>
				<td>작성일 :</td>
				<td><p>
						<c:out value="${ requestScope.inquiry.inqTime }" />
					</p></td>
			</tr>
			<tr>
				<td>문의내용 :</td>
				<td colspan="3"><textarea
						style="resize: none; width: 90%; height: 200px;" readonly><c:out
							value="${ requestScope.inquiry.inqContent }" /></textarea></td>
			</tr>
			<tr>
				<td>답변내용 :</td>
				<td colspan="3"><textarea name="ansContent"
						style="resize: none; width: 90%; height: 200px;" readonly><c:out
							value="${ requestScope.inquiry.ansContent }" /></textarea></td>
			</tr>
		</table>
		<button type="reset" class="btn btn-danger" onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/select/user'">취소하기</button>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>