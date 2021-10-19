<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 테스트 페이지</title>
</head>
<body>
	<h1 align="center">댓글 조회</h1>
	<button
		onclick="location.href='${pageContext.servletContext.contextPath}'"
		name="backToHome">홈으로</button>
	<table align="center" border="1">
		<thead>
			<tr>
				<th width="150px">댓글코드</th>
				<th width="150px">게시물번호</th>
				<th width="150px">댓글내용</th>
				<th width="150px">댓글작성시간</th>
				<th width="150px">댓글 활성화 여부</th>
				<th width="150px">댓글 삭제하기</th>
				<th width="150px">대댓글 작성하기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cmt" items="${requestScope.cmtList}">
				<tr>
					<th>${cmt.code}</th>
					<th>${cmt.postCode}</th>
					<th>${cmt.content}</th>
					<th>${cmt.time}</th>
					<th>${cmt.yn}</th>
					<th><a href="#" onclick="blindcmt(${cmt.code})">블라인드하기</a></th>
					<th><a href="#"><button onclick="location.href='${pageContext.servletContext.contextPath}/recomment/insert'"	name="backToHome">
						대댓글작성하기</button></a></th>
				</tr>
			</c:forEach>
		</table>
		<br><br><br><br><br>
		
</body>
</html>

