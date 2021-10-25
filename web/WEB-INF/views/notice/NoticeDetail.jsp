<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">공지사항 세부내용</h2>
		<div class="table-area">
			<table class="table table-striped table-dark" align="center">
			<tr>
				<td>공지사항 코드 :</td>
				<td colspan="3"><textarea name="code" style="resize: none;" readonly>
				<c:out value="${ requestScope.notice.code }" /></textarea></td>
			</tr>
			<tr>
				<td>공지사항 제목 :</td>
				<td colspan="3"><textarea name="title" style="resize: none; width: 90%; height: 200px;" readonly>
				<c:out value="${ requestScope.notice.title }" /></textarea></td>
			</tr>
			<tr>
				<td>공지사항 내용 :</td>
				<td colspan="3"><textarea name="content" style="resize: none; width: 90%; height: 200px;"readonly>
				<c:out value="${ requestScope.notice.content }" /></textarea></td>
			</tr>
		</table>
		<button class="btn btn-info"
			onclick="location.href='${pageContext.servletContext.contextPath}/notice/list/allNotice'">돌아가기</button>
		<button class="btn btn-info"
			onclick="location.href='${pageContext.servletContext.contextPath}/notice/delete'">삭제하기</button>
		<button class="btn btn-info"
			onclick="location.href='${pageContext.servletContext.contextPath}/notice/modify'">수정하기</button>
	</div>
</body>
</html>