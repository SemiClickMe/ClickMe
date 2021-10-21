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
	<%-- 메인 홈으로 가는 버튼 --%>
	<button
		onclick="location.href='${pageContext.servletContext.contextPath}'" name="backToHome">홈으로</button>
		
	<%-- Comment, Recomment 전체값 조회 테이블 --%>
 	<table id ="cmtlistTable" border="1" >
		<thead>
			<tr>
				<th width="150px">댓글코드</th>
				<th width="150px">게시물번호</th>
				<th width="150px">댓글내용</th>
				<th width="150px">댓글작성시간</th>
				<th width="150px">댓글 활성화 여부</th>
				<th width="150px">댓글 삭제하기</th>
				<th width="150px">대댓글 작성하기</th>
				<th width="150px">대댓글 내용</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cmt" items="${requestScope.cmtList}">
				<tr>
					<td>${cmt.code}</td>
					<td>${cmt.postCode}</td>
					<td>${cmt.content}</td>
					<td>${cmt.time}</td>
					<td>${cmt.yn}</td>
					<td><input type=submit id="${cmt.code}" value="버튼${cmt.code}" 
						onClick="location.href='${pageContext.servletContext.contextPath}/cmt/blind'"></td>
					
					<td><a href="#"><button
								onclick="location.href='${pageContext.servletContext.contextPath}/recomment/insert'"
								name="insertRecomment">대댓글작성하기</button></a></td>
				</tr>
			</c:forEach>
	</table>

</body>
</html>