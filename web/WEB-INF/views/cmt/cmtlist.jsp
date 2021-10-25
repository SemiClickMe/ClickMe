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
<% String postCode=request.getParameter("code"); %>
 		<div align="center">
        <div style="border: 1px solid; width: 80%; padding: 5px" align="left">
		<input type="button" value="게시물조회하기" onClick="location.href='${pageContext.servletContext.contextPath}/post/list'">
		<br><br>
        <table id ="cmtlistTable" border="1" >
		<thead>
			<tr>
				<th width="200px">댓글코드</th>
				<th width="200px">게시물번호</th>
				<th width="200px">댓글내용</th>
				<th width="200px">댓글작성시간</th>
				<th width="200px">댓글 활성화 여부</th>
				<th width="200px">댓글 삭제하기</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="cmtList" items="${requestScope.cmtList}" varStatus="status">
				<tr>
					<td>${cmtList.code}</td>
					<td>${cmtList.postCode}</td>
					<td>${cmtList.content}</td>
					<td>${cmtList.time}</td>
					<td>${cmtList.yn}</td>
					<td><input type=submit name="cmtCode" id="${cmtList.code}" value="버튼${cmtList.code}" 
						onClick="location.href='${pageContext.servletContext.contextPath}/cmt/blind'"></td>

				</tr>
			</c:forEach>
	</table>
	<br><br><br>
	</div>
	</div>

</body>
</html>